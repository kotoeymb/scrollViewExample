//
//  TestViewController.m
//  GesturesDemo
//
//  Created by Revo Tech on 6/20/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "TestViewController.h"
#import "CollectionViewCell.h"

#import "PageImageScrollView.h"

@interface TestViewController ()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
//@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *itemImages;
@end

@implementation TestViewController
NSInteger selectedindex;
NSArray *imgArray;
UIColor *city_mart_color;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _itemImages = [@[@"item.jpeg",
                     @"car.png",
                     @"item1.jpeg",
                     @"item.jpeg",
                     @"item1.jpeg",
                     @"item.jpeg",
                     @"item1.jpeg",
                     @"item.jpeg",
                     @"item1.jpeg",
                     @"item.jpeg"] mutableCopy];
 self.collectionView.backgroundColor = [UIColor whiteColor];
   
    
    city_mart_color =  [UIColor colorWithRed:(123.0 / 255.0f)
                                       green:(102.0/ 255.0f)
                                        blue:(167.0/ 255.0f)
                                       alpha:1.0f].CGColor;
    self.btn_minus.layer.borderWidth = 1;
    self.btn_minus.layer.cornerRadius = 2;
    self.btn_minus.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
    self.add_btn.layer.borderWidth = 1;
    self.add_btn.layer.cornerRadius = 2;
    self.add_btn.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
    self.label.layer.borderWidth = 1;
    
    self.label.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
   

    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    _scrollview.contentSize = CGSizeMake(400, 800);
    
    self.scrollview.pagingEnabled = YES;
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.showsHorizontalScrollIndicator = NO;
    // self.pageControlPos = PageControlPositionRightCorner;
    
    
    
    PageImageScrollView *pageScrollView = [[PageImageScrollView alloc] initWithFrame:CGRectMake(0, -10, 420, 220)];
    [pageScrollView setScrollViewContents:@[[UIImage imageNamed:@"nature_pic_1"], [UIImage imageNamed:@"nature_pic_2"], [UIImage imageNamed:@"nature_pic_3"], [UIImage imageNamed:@"nature_pic_4"]]];
    //easily setting pagecontrol pos, see PageControlPosition defination in PagedImageScrollView.h
    //   pageScrollView.pageControlPos = PageControlPositionCenterBottom;
    [self.scrollview addSubview:pageScrollView];

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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    // cell.backgroundColor = [UIColor magentaColor];
    //   selectedindex = indexPath.item;
    [cell setSelected:YES];
    //  [collectionView reloadData];
    
    
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//   float cellwidth = self.collview.frame.size.width/4;
//   return CGSizeMake(cellwidth, 56.f);
//}
//


//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 2;
//
//}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
   //  NSLog(@"Setting size for cell at index %d",indexPath.row);
     CGSize mSize = CGSizeMake(120, 140);
    return mSize;
}

//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//
//    return 2.0;
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    return 2.0;
//}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(3, 3, 3, 3);
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // #warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // #warning Incomplete implementation, return the number of items
    return [_itemImages count];
   //  return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    // cell.backgroundColor=[UIColor orangeColor];
    
    //  NSLog(@"paymentcell : %ld",(long)indexPath.row);
    //    cell.backgroundColor = [UIColor whiteColor];
    //    cell.layer.borderColor = (__bridge CGColorRef _Nullable)(city_mart_color);
    //    //  Configure the cell
    //       cell.lbl_time.text = self.timeArray[indexPath.row];
    cell.name_lbl.text = [NSString stringWithFormat:@"item%li", (long)indexPath.row +1 ];
    //  cell.item_img.image = [UIImage imageNamed:@"item1"];
    //    imgArray = [[NSArray alloc]init];
   //  imgArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"car"],[UIImage imageNamed:@"item1"],
    //                [UIImage imageNamed:@"item"],
    //                [UIImage imageNamed:@"item1"],
    //                [UIImage imageNamed:@"item"],
    //               //  [UIImage imageNamed:@"nature_pic_2"],
    //                [UIImage imageNamed:@"car"],nil
    //                ];
   cell.item_img.image = [UIImage imageNamed:[_itemImages objectAtIndex:indexPath.row]];
    
    //  UIImageView * catagoryImage = [[UIImageView alloc] initWithFrame:CGRectMake((cell.frame.origin.x),(cell.frame.origin.y), cell.frame.size.width, cell.frame.size.height)];
    
    //  cell.item_img.image =[UIImage imageNamed:[imgArray indexPath.row+1]];
    //   [cell.item_img setImage:[UIImage imageNamed:[imgArray objectAtIndex:indexPath.row+1]]];
    
    
    
    // [cell addSubview:catagoryImage];
    
    
    // cell.clipsToBounds = NO;
    
    // return cell;
    
    //   cell.item_img.image = [self.imgArray objectAtIndex:(long)indexPath.row+1];
    
    //
    //    cell.item_img.image = [NSArray alloc]init;
    
    //    if (selectedindex == indexPath.item) {
    //      //   cell.backgroundColor = [UIColor cyanColor];
    //        cell.backgroundColor = [UIColor clearColor];
    //        cell.name_lbl.text = [NSString stringWithFormat:@"item %li",(long)indexPath.row+1];
    //    }
    //    else {
    //        cell.backgroundColor = [UIColor whiteColor];
    //        cell.name_lbl.textColor = [UIColor lightGrayColor];
    //    }
    //    //   return cell;
    
    
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    //   cell.backgroundColor = [UIColor cyanColor];
    [cell setSelected:YES];
}


@end
