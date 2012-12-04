//
//  UINavigationController+TLDropDownMenu.h
//  TLDropDownMenu
//
//  Created by Sergey Egorov on 04.12.12.
//  Copyright (c) 2012 TryLogic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UINavigationController (TLDropDownMenu)

-(void)tlDropMenu:(UIView *)menu animated:(BOOL)animated;

-(void)tlHideDroppedMenuAnimated:(BOOL)animated;

@end
