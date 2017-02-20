//
//  N3SurveysCollection.m
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import "N3SurveysCollection.h"
#import "N3SurveyCollectionViewCell.h"
#import "N3SurveyDetailViewController.h"
#import <Toast/UIView+Toast.h>

#define DETAIL_SEGUE @"showSurvey"

@interface N3SurveysCollection ()<N3SurveyCollectionViewCellDelegate>

@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *surveys;
@property (atomic, assign) BOOL isLoading;
@property (nonatomic, assign) int pageNumber;
//@property (nonatomic, strong) UIRefreshControl * refreshControl;

@end

@implementation N3SurveysCollection

static NSString * const reuseIdentifier = @"SurveyCell";

-(IBAction)refreshCollections:(id)sender{
    __block typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        if (!weakSelf.isLoading) {
            weakSelf.isLoading = true;
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.view makeToast:@"Refreshing Feed.."];
            });
            [[N3FeedManager sharedManager] getNewFeed];
        }
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.pageControl.frame = CGRectMake(0,0,self.collectionView.frame.size.height,37);
    self.pageControl.center = CGPointMake(self.collectionView.frame.size.width - 14, self.collectionView.frame.size.height/2);
    self.pageControl.numberOfPages = 0;
    self.pageControl.currentPage = 0;
    self.pageControl.autoresizingMask = UIViewAutoresizingNone;
    [self.view addSubview:self.pageControl];
    
    
//    self.refreshControl = [[UIRefreshControl alloc] init];
//    self.refreshControl.tintColor = [UIColor grayColor];
//    [self.refreshControl addTarget:self action:@selector(refershControlAction) forControlEvents:UIControlEventValueChanged];
//    [self.collectionView addSubview:self.refreshControl];
//    self.collectionView.alwaysBounceVertical = YES;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newFeed:) name:kN3FeedRefreshKey object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatedFeed:) name:kN3FeedUpdateKey object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(failedFeedFetch:) name:kN3FeedFailedKey object:nil];
    self.pageNumber = 0;
    self.isLoading = true;
    self.surveys = [N3FeedManager getFeedItems];
}

-(IBAction)failedFeedFetch:(id)object{
    __block typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if(!weakSelf.surveys.count){
            [weakSelf.view makeToast:@"Feed fetch failed. Click refresh on top to retry.."];
        }else{
            [weakSelf.view makeToast:@"Feed update failed. Pull from bottom to retry.."];
        }
        weakSelf.isLoading = false;
        [weakSelf.collectionView reloadData];
    });
}

-(IBAction)newFeed:(id)object{
    
    __block typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.view makeToast:@"Feed refreshed.."];
        weakSelf.surveys = [N3FeedManager getFeedItems];
        weakSelf.pageNumber = 1;
        weakSelf.isLoading = false;
        [weakSelf.collectionView reloadData];
    });
}

-(IBAction)updatedFeed:(id)object{
    
    __block typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf.view makeToast:@"Updated Feed. Scroll to see more.."];
        weakSelf.surveys = [N3FeedManager getFeedItems];
        weakSelf.pageNumber += 1;
        weakSelf.isLoading = false;
        [weakSelf.collectionView reloadData];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:DETAIL_SEGUE]) {
        N3SurveyDetailViewController *targetVC = [segue destinationViewController];
        targetVC.surveyData = (N3Surveys*)sender;
    }
}

#pragma mark <N3SurveyCollectionViewCellDelegate>

-(void)surveyClicked:(N3Surveys *)survey{
    [self performSegueWithIdentifier:DETAIL_SEGUE sender:survey];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.pageControl.numberOfPages = self.surveys.count/(self.pageNumber?:1);
    return self.surveys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    N3SurveyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell configureForSurvey:[self.surveys objectAtIndex:indexPath.row]];
    cell.delegate = self;
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"loadingFooter" forIndexPath:indexPath];
    if(self.isLoading)
        return view;
    return nil;
}

#pragma mark <UICollectionViewDelegate>

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if (self.isLoading)
        return CGSizeMake(self.collectionView.frame.size.width,50);
    return CGSizeZero;
}


/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark <UIScrollViewDelegate> - for page control



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageHeight = self.collectionView.frame.size.height;
    float currentPage = self.collectionView.contentOffset.y / pageHeight;
    
    if (0.0f != fmodf(currentPage, 1.0f))
    {
        self.pageControl.currentPage = (currentPage + 1)/(self.pageNumber?:1);
    }
    else
    {
        self.pageControl.currentPage = currentPage/(self.pageNumber?:1);
    }
    
    float endScrolling = scrollView.contentOffset.y + scrollView.frame.size.height;
    if (endScrolling >= 100 && endScrolling >= scrollView.contentSize.height - scrollView.frame.size.height)
    {
        __block typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            if (!weakSelf.isLoading) {
                weakSelf.isLoading = true;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.view makeToast:@"Loading more..."];
                    [weakSelf.collectionView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 1)]];
                });
                [[N3FeedManager sharedManager] getMoreFeed:weakSelf.pageNumber+1];
            }
        });
    }
    
    NSLog(@"New Page Number : %ld", (long)currentPage);
}



-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
