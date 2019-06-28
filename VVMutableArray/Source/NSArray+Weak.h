//
// Created by Tank on 2019-06-28.
// Copyright (c) 2019 Tank. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Weak)

+ (id)arrayUsingWeakReferences;

+ (id)arrayUsingWeakReferencesWithCapacity:(NSUInteger)capacity;

@end