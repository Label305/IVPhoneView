//
//  IVPhoneView.m
//
//  Created by Thijs Scheepers on 05/08/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import "IVPhoneView.h"
#import <QuartzCore/QuartzCore.h>

#define radians(degrees) (degrees * M_PI/180)


@implementation IVPhoneView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor clearColor];
        _buttonColor = [UIColor colorWithRed: 0.643 green: 0.643 blue: 0.643 alpha: 1];
        _phoneColor = [UIColor blackColor];

        _sideBezzel = 10;
        _topBezzel = 45;
        _cameraDimentions = 7;

        _orientation = IVPhoneViewOrientationPortrait;

    }
    return self;
}



#pragma mark - Setters and Getters

- (void)setPhoneColor:(UIColor *)phoneColor
{
    _phoneColor = phoneColor;

    [self setNeedsDisplay];
}

- (void)setButtonColor:(UIColor *)buttonColor
{
    _buttonColor = buttonColor;

    [self setNeedsDisplay];
}


- (void)setViewInPhone:(UIView *)viewInPhone
{
    if(_viewInPhone == viewInPhone) {
        return;
    }

    [_viewInPhone removeFromSuperview];

    [self addSubview:viewInPhone];

    _viewInPhone = viewInPhone;

    [self setNeedsLayout];
}



#pragma mark - Layouting

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.viewInPhone.frame = CGRectMake(self.sideBezzel * 1.25,
                                        self.topBezzel + self.sideBezzel * 0.25,
                                        self.bounds.size.width - self.sideBezzel * 2.25,
                                        self.bounds.size.height - self.sideBezzel * 0.25 - self.topBezzel * 2);
    [self.viewInPhone setNeedsLayout];
    [self setNeedsDisplay];
}



#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    if (self.orientation == IVPhoneViewOrientationLandscape) {
        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextRotateCTM( context, radians(90));
        CGContextTranslateCTM( context, 0, -rect.size.width );

        [self drawPhoneWithScreenWidth:rect.size.height - self.sideBezzel * 2.25
                          screenHeight:rect.size.width - self.sideBezzel * 0.25 - self.topBezzel * 2
                            sideBezzel:self.sideBezzel topBezzel:self.topBezzel cameraDimention:self.cameraDimentions];
    } else {
        [self drawPhoneWithScreenWidth:rect.size.width - self.sideBezzel * 2.25
                          screenHeight:rect.size.height - self.sideBezzel * 0.25 - self.topBezzel * 2
                            sideBezzel:self.sideBezzel topBezzel:self.topBezzel cameraDimention:self.cameraDimentions];
    }
}

// From PaintCode
- (void)drawPhoneWithScreenWidth: (CGFloat)screenWidth screenHeight: (CGFloat)screenHeight sideBezzel: (CGFloat)sideBezzel topBezzel: (CGFloat)topBezzel cameraDimention: (CGFloat)cameraDimention;
{
    //// Color Declarations
    UIColor* screenColor = [UIColor colorWithRed: 0.528 green: 0.528 blue: 0.528 alpha: 1];
    UIColor* phoneColor = self.phoneColor;
    UIColor* buttonColor = self.buttonColor;
    UIColor* onPhoneControlColor = [buttonColor colorWithAlphaComponent: 0.2];
    UIColor* innerHomeColor = [buttonColor colorWithAlphaComponent: 0.6];

    //// Variable Declarations
    CGFloat phoneWidth = screenWidth + 2 * sideBezzel;
    CGFloat phoneRadius = 2 * sideBezzel;
    CGFloat sideButtonWidth = sideBezzel / 4.0;
    CGFloat largeSideButtonHeight = sideButtonWidth * 5;
    CGFloat smallSideButtonHeight = sideButtonWidth * 3;
    CGFloat lockScreenWidth = sideButtonWidth * 12;
    CGFloat lockScreenX = sideButtonWidth + phoneWidth - lockScreenWidth - 2 * sideBezzel;
    CGFloat screenX = sideBezzel + sideButtonWidth;
    CGFloat innerHomeButtonX = sideButtonWidth + sideBezzel + (screenWidth - sideBezzel) / 2.0;
    CGFloat homeButtonDimention = sideBezzel * 3;
    CGFloat homeButtonRadius = homeButtonDimention / 2.0;
    CGFloat homeButtonX = innerHomeButtonX - sideBezzel;
    CGFloat phoneHeight = screenHeight + 2 * topBezzel;
    CGFloat volumeUpY = topBezzel + largeSideButtonHeight + 6 * sideButtonWidth + sideButtonWidth;
    CGFloat volumeDownY = topBezzel + largeSideButtonHeight + 12 * sideButtonWidth + smallSideButtonHeight + sideButtonWidth;
    CGFloat silenceY = topBezzel + sideButtonWidth;
    CGFloat screenY = topBezzel + sideButtonWidth;
    CGFloat innerHomeButtonY = sideButtonWidth + topBezzel + screenHeight + (topBezzel - sideBezzel) / 2.0;
    CGFloat homeButtonY = innerHomeButtonY - sideBezzel;
    CGFloat cameraRadius = cameraDimention / 2.0;
    CGFloat speakerWidth = cameraDimention * 4;
    CGFloat speakerX = sideButtonWidth + sideBezzel + (screenWidth - speakerWidth) / 2.0;
    CGFloat cameraX = sideButtonWidth + sideBezzel + (screenWidth - cameraDimention) / 2.0;
    CGFloat cameraY = sideButtonWidth + 2 * (topBezzel - cameraDimention * 2) / 5.0;
    CGFloat speakerY = sideButtonWidth + 3 * (topBezzel - cameraDimention * 2) / 5.0 + cameraDimention;

    //// PhoneBody Drawing
    UIBezierPath* phoneBodyPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(sideButtonWidth, sideButtonWidth, phoneWidth, phoneHeight) cornerRadius: phoneRadius];
    [phoneColor setFill];
    [phoneBodyPath fill];


    //// VolumeUp Drawing
    UIBezierPath* volumeUpPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, volumeUpY, sideButtonWidth, smallSideButtonHeight) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: CGSizeMake(2, 2)];
    [volumeUpPath closePath];
    [buttonColor setFill];
    [volumeUpPath fill];


    //// VolumeDown Drawing
    UIBezierPath* volumeDownPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, volumeDownY, sideButtonWidth, smallSideButtonHeight) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: CGSizeMake(2, 2)];
    [volumeDownPath closePath];
    [buttonColor setFill];
    [volumeDownPath fill];


    //// SilentButton Drawing
    UIBezierPath* silentButtonPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(0, silenceY, sideButtonWidth, largeSideButtonHeight) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii: CGSizeMake(2, 2)];
    [silentButtonPath closePath];
    [buttonColor setFill];
    [silentButtonPath fill];


    //// LockButton Drawing
    UIBezierPath* lockButtonPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(lockScreenX, 0, lockScreenWidth, sideButtonWidth) byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii: CGSizeMake(2, 2)];
    [lockButtonPath closePath];
    [buttonColor setFill];
    [lockButtonPath fill];


    //// Screen Drawing
    UIBezierPath* screenPath = [UIBezierPath bezierPathWithRect: CGRectMake(screenX, screenY, screenWidth, screenHeight)];
    [screenColor setFill];
    [screenPath fill];


    //// Speaker Drawing
    UIBezierPath* speakerPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(speakerX, speakerY, speakerWidth, cameraDimention) cornerRadius: cameraRadius];
    [onPhoneControlColor setFill];
    [speakerPath fill];


    //// Cemera Drawing
    UIBezierPath* cemeraPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(cameraX, cameraY, cameraDimention, cameraDimention) cornerRadius: cameraRadius];
    [onPhoneControlColor setFill];
    [cemeraPath fill];


    //// HomeButton Drawing
    UIBezierPath* homeButtonPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(homeButtonX, homeButtonY, homeButtonDimention, homeButtonDimention) cornerRadius: homeButtonRadius];
    [onPhoneControlColor setFill];
    [homeButtonPath fill];


    //// InnerHomeButton Drawing
    UIBezierPath* innerHomeButtonPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(innerHomeButtonX, innerHomeButtonY, sideBezzel, sideBezzel) cornerRadius: 3];
    [innerHomeColor setStroke];
    innerHomeButtonPath.lineWidth = 2;
    [innerHomeButtonPath stroke];
}


@end
