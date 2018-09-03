//
//  ImageCollectionViewController.m
//  JK
//
//  Created by JK on 2018/9/3.
//  Copyright © 2018 JK. All rights reserved.
//

#import "ImageCollectionViewController.h"

@interface ImageCollectionViewController ()

@property (nonatomic, strong) NSArray *imageList;
@property (nonatomic, assign) NSInteger imageCount;
@property int screenWidth;
@property int screenHeight;
@end

@implementation ImageCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *plistPath = [[NSBundle mainBundle] pathForResource: @"ImageList" ofType:@"plist"];
    self.imageList = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    CGRect screenFrame = [UIScreen mainScreen].bounds;
    self.screenWidth = screenFrame.size.width;
    self.screenHeight = screenFrame.size.height;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.imageCount = [self.imageList count];
    return self.imageCount;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//定义每个UICollectionView 的大小
-(CGSize)collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath {
    return CGSizeMake((self.screenWidth - 1*(self.imageCount+1))/self.imageCount, (self.screenWidth - 1*(self.imageCount+1))/self.imageCount );
}

//定义每个UICollectionView 的边距
- (UIEdgeInsets)collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section {
    return UIEdgeInsetsMake ( 2 , 2 , 2 , 2 );
}

//设置水平间距 (同一行的cell的左右间距）
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

//垂直间距 (同一列cell上下间距)
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"ImageViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    NSDictionary *cellDict = self.imageList[row];
    
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.jpeg", cellDict[@"name"]];

    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:imagePath]];
    imageView.hidden = NO;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    imageView.clipsToBounds  = YES;
    [imageView sizeToFit];
    
    cell.autoresizesSubviews = YES;
    cell.hidden = NO;
    cell.contentMode = UIViewContentModeScaleAspectFill;
    cell.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    cell.clipsToBounds  = YES;
    [cell sizeToFit];
    [cell.contentView addSubview:imageView];
   
    return cell;
}

@end
