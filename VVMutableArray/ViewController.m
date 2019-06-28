//
//  ViewController.m
//  VVMutableArray
//
//  Created by Tank on 2019/6/28.
//  Copyright © 2019 Tank. All rights reserved.
//

#import "ViewController.h"
#import "VVMutableArray.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    VVMutableArray *array = [VVMutableArray new];

    [array addObject:@"1"];
    [array addObject:@"2"];
    [array addObject:@"3"];

    for (NSString *text in array) {
        NSLog(@"%@", text);
    }

    NSLog(@"%@", array[1]);
}


@end
