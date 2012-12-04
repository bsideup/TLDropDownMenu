//
//  UINavigationController+TLDropDownMenu.m
//  TLDropDownMenu
//
//  Created by Sergey Egorov on 04.12.12.
//  Copyright (c) 2012 TryLogic. All rights reserved.
//

#import "UINavigationController+TLDropDownMenu.h"
#import <objc/runtime.h>

static char tlNavigationControllerDroppedMenu;

@implementation UINavigationController (TLDropDownMenu)

- ( void ) tlDropMenu:(UIView *)menu
			 animated:(BOOL)animated
{
	[self tlHideDroppedMenuAnimated:NO];
    
	__block CGRect frame;
	UIView *droppedMenu = [[UIView alloc] initWithFrame:self.topViewController.view.frame];
    
	objc_setAssociatedObject( self, &tlNavigationControllerDroppedMenu, droppedMenu, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
    
	droppedMenu.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    
	[droppedMenu addSubview:menu];
    
	[self.topViewController.view addSubview:droppedMenu];
    
	frame = menu.frame;
    
	void (^animations) ( void ) = ^
	{
		droppedMenu.alpha = 1.0;
		frame.origin.y = 0;
		menu.frame = frame;
	};
    
	if ( animated )
	{
		droppedMenu.alpha = 0.0;
		frame.origin.y = -frame.size.height;
		menu.frame = frame;
		[UIView animateWithDuration:0.3 delay:0.0 options:0 animations:animations completion:nil];
	}
	else
	{
		animations();
	}
}

- ( void ) tlHideDroppedMenuAnimated:(BOOL)animated
{
	UIView *droppedMenu = objc_getAssociatedObject( self, &tlNavigationControllerDroppedMenu );
	UIView *content = droppedMenu.subviews[0];
    
	void (^animations) ( void ) = ^
	{
		CGRect frame = content.frame;
		droppedMenu.alpha = 0.0;
		frame.origin.y = -frame.size.height;
		content.frame = frame;
	};
    
	void (^completion) ( BOOL ) = ^( BOOL completed )
	{
		[[droppedMenu subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
		[droppedMenu removeFromSuperview];
		objc_setAssociatedObject( self, &tlNavigationControllerDroppedMenu, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
	};
    
	if ( animated )
	{
		[UIView animateWithDuration:0.3 delay:0.0 options:0 animations:animations completion:completion];
	}
	else
	{
		animations();
		completion( YES );
	}
}

@end
