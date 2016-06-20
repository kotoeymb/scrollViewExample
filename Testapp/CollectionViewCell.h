//
//  CollectionViewCell.h
//  pickervieweg
//
//  Created by Revo Tech on 5/31/16.
//  Copyright © 2016 Revo Tech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewCell : UICollectionViewCell

//@property (weak, nonatomic) IBOutlet UILabel *name_lbl;
//@property (weak, nonatomic) IBOutlet UILabel *price_lbl;
//
//@property (strong, nonatomic) IBOutlet UIImageView *item_img;
//
@property (strong, nonatomic) IBOutlet UIImageView *item_img;
@property (weak, nonatomic) IBOutlet UILabel *price_lbl;
@property (weak, nonatomic) IBOutlet UILabel *name_lbl;

@end
