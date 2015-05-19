//
//  TYFDetailsContentView.h
//  TYFJiaXue
//
//  Created by 田雨飞 on 15/5/16.
//  Copyright (c) 2015年 TianYuFei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYFDetailsContentView;
@protocol TYFDetailsContentViewDelegate <NSObject>

- (void)contentView:(TYFDetailsContentView *)tyfDetailsContentView andItemIndex:(int)andItemIndex andModel:(id)model;

@end
@interface TYFDetailsContentView : UIView
@property(nonatomic,assign)id<TYFDetailsContentViewDelegate> delegate;
@property(nonatomic,copy)NSString *collectionUrl;
/**创建一个contentView对象*/
+(id)contentView;
@end
