IVPhoneView [![Build Status](https://travis-ci.org/Label305/IVPhoneView.svg)](https://travis-ci.org/Label305/IVPhoneView)
===========

View with a nice iPhone container. Use it to display something within an iPhone graphic. Can be used for onboarding experiences. The view is strechable in the correct way so you can create an iPhone 4, iPhone 5 with a single view.

![screen shot 2014-08-05 at 14 56 31](https://cloud.githubusercontent.com/assets/44893/3811487/f8ae6f10-1c9f-11e4-93cc-1045fe84ea2f.png)

CocoaPods
---------

Add the following lines to your Podfile:

```ruby
pod 'IVPhoneView', '~> 0.1'
```

Usage
---------

```objective-c
IVPhoneView *phoneView = [[IVPhoneView alloc] initWithFrame:CGRectMake(80, 120, 160, 335)];
[phoneView setViewInPhone:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"myScreenshot"]]];

phoneView.phoneColor = [UIColor whiteColor]; // For a white iPhone
```

You can set the color and the bezzel of the iPhone graphic. [See the header file.](https://github.com/Label305/IVPhoneView/blob/master/IVPhoneView/IVPhoneView.h)

License
---------
Copyright 2014 Label305 B.V.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
