//
//  IVPhoneViewTests.m
//  IVPhoneViewTests
//
//  Created by Thijs Scheepers on 05/08/14.
//  Copyright (c) 2014 Label305 B.V. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IVPhoneView.h"

@interface IVPhoneViewTests : XCTestCase

@end

@implementation IVPhoneViewTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test
{
    IVPhoneView *phoneView = [[IVPhoneView alloc] initWithFrame:CGRectMake(80, 120, 160, 335)];
    XCTAssertNotNil(phoneView, @"Phone view should not be nil");
}

@end
