//
//  N3SurveysCollection.m
//  Surveys
//
//  Created by Vishal Dhiman on 12/02/17.
//  Copyright © 2017 Vishal Dhiman. All rights reserved.
//

#import "N3SurveysCollection.h"
#import "N3SurveyCollectionViewCell.h"

@interface N3SurveysCollection ()<N3SurveyCollectionViewCellDelegate>

@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *surveys;

@end

@implementation N3SurveysCollection

static NSString * const reuseIdentifier = @"SurveyCell";

-(IBAction)refreshCollections:(id)sender{
    [[N3FeedManager sharedManager] getNewFeed];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.pageControl.frame = CGRectMake(0,0,self.collectionView.frame.size.height,37);
    self.pageControl.center = CGPointMake(self.collectionView.frame.size.width - 14, self.collectionView.frame.size.height/2);
    self.pageControl.numberOfPages = 4;//set here pages which you want..
    self.pageControl.currentPage = 0;
    self.pageControl.autoresizingMask = UIViewAutoresizingNone;
    [self.view addSubview:self.pageControl];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newFeed:) name:kN3FeedRefreshKey object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updatedFeed:) name:kN3FeedUpdateKey object:nil];
    self.surveys = [N3FeedManager getFeedItems];
}

-(IBAction)newFeed:(id)object{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.surveys = [N3FeedManager getFeedItems];
        [self.collectionView reloadData];
    });
}

-(IBAction)updatedFeed:(id)object{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.pageControl.numberOfPages = self.surveys.count;
    return self.surveys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    N3SurveyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    [cell configureForSurvey:[self.surveys objectAtIndex:indexPath.row]];
    cell.delegate = self;
    return cell;
}

#pragma mark <UICollectionViewDelegate>

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.collectionView.frame.size.width, self.collectionView.frame.size.height);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
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
#pragma mark <N3SurveyCollectionViewCellDelegate>

-(void)surveyClicked:(N3Surveys *)survey{
    [self performSegueWithIdentifier:@"showSurvey" sender:self];
}

#pragma mark <UIScrollViewDelegate> - for page control

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageHeight = self.collectionView.frame.size.height;
    float currentPage = self.collectionView.contentOffset.y / pageHeight;
    
    if (0.0f != fmodf(currentPage, 1.0f))
    {
        self.pageControl.currentPage = currentPage + 1;
    }
    else
    {
        self.pageControl.currentPage = currentPage;
    }
    
    NSLog(@"New Page Number : %ld", (long)self.pageControl.currentPage);
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
