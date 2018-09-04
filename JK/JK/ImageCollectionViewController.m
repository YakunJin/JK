//
//  ImageCollectionViewController.m
//  JK
//
//  Created by JK on 2018/9/3.
//  Copyright © 2018 JK. All rights reserved.
//

#import "ImageCollectionViewController.h"
#import "PhotoViewCell.h"

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

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * CellIdentifier = @"ImageViewCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    NSDictionary *cellDict = self.imageList[row];
    
    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.jpeg", cellDict[@"name"]];
    
    ((UIImageView *)cell.backgroundView).image = [self originImageScaleToSize:[UIImage imageNamed:imagePath] withScaleSize:CGSizeMake(300, 300)];

    return cell;
}

- (UIImage*)originImageScaleToSize:(UIImage *)originImage  withScaleSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);// 创建一个bitmap的context，并把它设置成为当前正在使用的context
    [originImage drawInRect:CGRectMake(0, 0, size.width, size.height)];// 绘制改变大小的图片，self指的是原图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();// 从当前context中创建一个改变大小后的图片
    UIGraphicsEndImageContext();// 使当前的context出堆栈
    return scaledImage;// 返回新的改变大小后的图片
}


@end
