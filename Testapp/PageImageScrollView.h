//
//  PageImageScrollView.h
//  GesturesDemo
//
//  Created by Revo Tech on 6/15/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageImageScrollView : UIView

enum PageControlPosition {
    PageControlPositionRightCorner = 0,
    PageControlPositionCenterBottom = 1,
    PageControlPositionLeftCorner = 2,
};

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, assign) enum PageControlPosition pageControlPos; //default is PageControlPositionRightCorner

- (void)setScrollViewContents: (NSArray *)images;

@end
