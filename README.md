# BLMultiColorLoader
Simple, easy to use, multi coloured and customisable loading indicator (loader) for iOS applications.

## Screenshots

![Demo](./Screens/loader_screenshot.gif "Demo View")

## Usage

### Basic usage

Add BLMultiColorLoader class into your project.

```objective-c
#import <UIKit/UIKit.h>
#import "BLMultiColorLoader.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet BLMultiColorLoader *multiColorLoader;

@end
```

```objective-c
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Customize the line width
    _multiColorLoader.lineWidth = 2.0;
    
    // Pass the custom colors array
    _multiColorLoader.colorArray = [NSArray arrayWithObjects:[UIColor redColor],
                                    [UIColor purpleColor],
                                    [UIColor greenColor],
                                    [UIColor blueColor], nil];
    [_multiColorLoader startAnimation];
    
}

- (void)doSomething
{    
    [_multiColorLoader startAnimation];
    [XYZService fetchSomeData:^(){
        [_multiColorLoader stopAnimation];
    }];
}
```

## Requirements

- iOS 7 or higher
- Automatic Reference Counting (ARC)

## Author

- [Babulal Poonia](https://github.com/BLPoonia) ([@_iambabu](https://twitter.com/_iambabu))

## License

BLMultiColorLoader is released under the MIT license. See the LICENSE file for more info.
