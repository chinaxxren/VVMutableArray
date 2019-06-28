//
// Created by Tank on 2019-06-28.
// Copyright (c) 2019 Tank. All rights reserved.
//

#import "VVArrayTarget.h"
#import "NSArray+Weak.h"

@implementation VVArrayTarget

- (instancetype)init {
    self = [super init];
    if (self) {
        self.items = [NSArray new];
    }

    return self;
}

- (instancetype)initUsingWeakReference {
    self = [super init];
    if (self) {
        self.items = [NSArray arrayUsingWeakReferences];
    }

    return self;
}

@end
