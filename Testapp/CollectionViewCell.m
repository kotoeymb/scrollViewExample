//
//  CollectionViewCell.m
//  pickervieweg
//
//  Created by Revo Tech on 5/31/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell

@synthesize item_img = _item_img;
-(void)awakeFromNib {
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
    self.backgroundView = bgView;
    self.backgroundView.backgroundColor = [UIColor whiteColor];
    //  self.backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blue"]];
    
    UIView *selectedVeiw = [[UIView alloc] initWithFrame:self.bounds];
    self.selectedBackgroundView = selectedVeiw;
     self.selectedBackgroundView.backgroundColor = [UIColor clearColor];
     self.selectedBackgroundView.layer.borderWidth = 2;
    self.selectedBackgroundView.layer.borderColor = [UIColor colorWithRed:(123.0 / 255.0f)
                                             green:(102.0/ 255.0f)
                                              blue:(167.0/ 255.0f)
                                             alpha:1.0f].CGColor;
    // self.selectedBackgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"red"]];
   
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _item_img = [[UIImageView alloc] initWithFrame:frame];
        [self.contentView addSubview:_item_img];
    }
    return self;
}



@end
