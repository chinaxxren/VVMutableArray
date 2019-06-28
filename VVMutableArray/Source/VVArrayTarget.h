//
// Created by Tank on 2019-06-28.
// Copyright (c) 2019 Tank. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface VVArrayTarget : NSObject

@property(nonatomic, copy) NSArray *items;

- (instancetype)initUsingWeakReference;

@end
