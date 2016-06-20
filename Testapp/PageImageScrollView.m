//
//  PageImageScrollView.m
//  GesturesDemo
//
//  Created by Revo Tech on 6/15/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "PageImageScrollView.h"

@interface PageImageScrollView() <UIScrollViewDelegate>

@property(nonatomic) BOOL pageControlIsChangingPage;

@end


@implementation PageImageScrollView

#define PAGECONTROL_DOT_WIDTH 20
#define PAGECONTROL_HEIGHT 20
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.scrollView = [[UIScrollView alloc] initWithFrame:frame];
        self.pageControl = [[UIPageControl alloc] init];
        [self setDefaults];
        [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:self.scrollView];
        [self addSubview:self.pageControl];
        self.scrollView.delegate = self;
    }
    return self;
}


- (void)setPageControlPos:(enum PageControlPosition)pageControlPos
{
    CGFloat width = PAGECONTROL_DOT_WIDTH * self.pageControl.numberOfPages;
    _pageControlPos = pageControlPos;
    if (pageControlPos == PageControlPositionRightCorner)
    {
        self.pageControl.frame = CGRectMake(self.scrollView.frame.size.width - width, self.scrollView.frame.size.height - PAGECONTROL_HEIGHT, width, PAGECONTROL_HEIGHT);
    }else if (pageControlPos == PageControlPositionCenterBottom)
    {
        self.pageControl.frame = CGRectMake((self.scrollView.frame.size.width- width) / 2, self.scrollView.frame.size.height - PAGECONTROL_HEIGHT, width, PAGECONTROL_HEIGHT);
    }
    else if (pageControlPos == PageControlPositionLeftCorner)
    {
        self.pageControl.frame = CGRectMake(0, self.scrollView.frame.size.height - PAGECONTROL_HEIGHT, width, PAGECONTROL_HEIGHT);
    }
}

- (void)setDefaults
{
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:(123.0 / 255.0f)
                                                                     green:(102.0/ 255.0f)
                                                                      blue:(167.0/ 255.0f)
                                                                     alpha:1.0f];
    self.pageControl.pageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.hidesForSinglePage = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.pageControlPos = PageControlPositionCenterBottom;
}


- (void)setScrollViewContents: (NSArray *)images
{
    //remove original subviews first.
    for (UIView *subview in [self.scrollView subviews]) {
        [subview removeFromSuperview];
    }
    if (images.count <= 0) {
        self.pageControl.numberOfPages = 0;
        return;
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * images.count, self.scrollView.frame.size.height);
    for (int i = 0; i < images.count; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.scrollView.frame.size.width * i, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [imageView setImage:images[i]];
        [self.scrollView addSubview:imageView];
    }
    self.pageControl.numberOfPages = images.count;
    //call pagecontrolpos setter.
    self.pageControlPos = self.pageControlPos;
}

- (void)changePage:(UIPageControl *)sender
{
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    self.pageControlIsChangingPage = YES;
}

#pragma scrollviewdelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.pageControlIsChangingPage) {
        return;
    }
    CGFloat pageWidth = scrollView.frame.size.width;
    //switch page at 50% across
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.pageControlIsChangingPage = NO;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    self.pageControlIsChangingPage = NO;
}

@end
