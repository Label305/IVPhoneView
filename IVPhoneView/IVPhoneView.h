//
//  IVPhoneView.h
//
//  Created by Thijs Scheepers on 05/08/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, IVPhoneViewOrientation) {
    IVPhoneViewOrientationPortrait = 0,
    IVPhoneViewOrientationLandscape = 1
};

/**
 * View with a nice iPhone container. Use it to display something within an iPhone graphic.
 */
@interface IVPhoneView : UIView

/**
 * Orientation of the phone view, landscape or portrait
 */
@property (readwrite, nonatomic) IVPhoneViewOrientation orientation;

/**
 * Set this property to display a view within the phone
 * Setting will also add to subviews
 */
@property (readwrite, nonatomic) UIView *viewInPhone;

/**
 * Set the color for the buttons used on the phone.
 * Defaults to a gray color
 */
@property (readwrite, nonatomic) UIColor *buttonColor;

/**
 * Set the color for the phone itself.
 * Defaults to black
 */
@property (readwrite, nonatomic) UIColor *phoneColor;

/**
 * The bezzel of the phone, defaults to 10
 */
@property (readwrite, nonatomic) CGFloat sideBezzel;

/**
 * The top and bottom bezzel of the phone, defaults to 45
 */
@property (readwrite, nonatomic) CGFloat topBezzel;

/**
 * The camera dimentions of the phone, defaults to 7
 */
@property (readwrite, nonatomic) CGFloat cameraDimentions;


@end
