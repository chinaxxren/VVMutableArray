//
// Created by Tank on 2019-06-28.
// Copyright (c) 2019 Tank. All rights reserved.
//

#import "NSArray+Weak.h"


@implementation NSArray (Weak)

+ (id)arrayUsingWeakReferences {
    return [self arrayUsingWeakReferencesWithCapacity:0];
}

+ (id)arrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity {
    CFArrayCallBacks callbacks = {0, NULL, NULL, CFCopyDescription, CFEqual};
    // Cast of C pointer type 'CFMutableArrayRef' (aka 'struct __CFArray *') to Objective-C pointer type 'id' requires a bridged cast
    return (id) CFBridgingRelease(CFArrayCreateMutable(0, capacity, &callbacks));
    // return (id)(CFArrayCreateMutable(0, capacity, &callbacks));
}

@end