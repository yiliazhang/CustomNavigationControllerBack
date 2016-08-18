//
//  UIViewController+Back.m
//  TestNavigationController
//
//  Created by apple on 16/8/12.
//  Copyright © 2016年 Datang. All rights reserved.
//

#import "UIViewController+Back.h"
#import <objc/objc.h>
#import <objc/runtime.h>

@implementation UIViewController (Back)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
    //      swizzleMethod(class, @selector(viewDidLoad), @selector(app_viewDidLoad));
    //        swizzleMethod(class, @selector(viewDidAppear:), @selector(app_viewDidAppear:));
    //      swizzleMethod(class, @selector(viewDidDisappear:), @selector(app_viewDidDisappear:));
        swizzleMethod(class, @selector(viewWillAppear:), @selector(app_viewWillAppear:));
//        swizzleMethod(class, @selector(viewWillDisappear:), @selector(app_viewWillDisappear:));
    });
}

void swizzleMethod(Class class,SEL originalSelector,SEL swizzledSelector){
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

- (void)app_viewWillAppear:(BOOL)animated {
    [self app_viewWillAppear:animated];
    [self setAppearance];
}

- (void)app_viewWillDisappear:(BOOL)animated {
    [self app_viewWillDisappear:animated];
    [self setAppearance];
}

-(void)app_viewDidAppear:(BOOL)animated {
    [self app_viewDidAppear:animated];
}

- (void)app_viewDidDisappear:(BOOL)animated{
    [self app_viewDidDisappear:animated];
    [self setAppearance];
}

- (void)setAppearance {
//    if (self.navigationController.navigationBar.backItem) {
        UIImage *backButtonBackgroundImage = [UIImage imageNamed:@"back"];
        backButtonBackgroundImage = [backButtonBackgroundImage resizableImageWithCapInsets:UIEdgeInsetsMake(0, backButtonBackgroundImage.size.width - 1, 0, 0)];
        
        id appearance = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UINavigationController class]]];
        [appearance setBackButtonBackgroundImage:backButtonBackgroundImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        UIBarButtonItem *backBarButton = [[UIBarButtonItem alloc] initWithTitle:self.title style:UIBarButtonItemStylePlain target:nil action:NULL];
        self.navigationItem.backBarButtonItem = backBarButton;
        NSLog(@"------%@----",NSStringFromClass(self.class));
//    }
}





- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}
@end
