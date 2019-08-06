
#import "VVMutableArray.h"

#import "VVArrayTarget.h"

#pragma mark -

static void *VVArrayKeyPathContext = &VVArrayKeyPathContext;

@interface VVMutableArray ()

@property(nonatomic, strong) VVArrayTarget *target;

@property(nonatomic, copy) NSString *keyPath;

@property(nonatomic, strong) NSMutableArray *items;

@end

@implementation VVMutableArray

- (void)dealloc {
    [self unregisterKVO];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.target = [[VVArrayTarget alloc] init];
        self.keyPath = @"items";
        
        [self registerKVO];
    }

    return self;
}

- (instancetype)initUsingWeakReference {
    self = [self init];
    if (self) {
        self.target = [[VVArrayTarget alloc] initUsingWeakReference];
        self.keyPath = @"items";

        [self registerKVO];
    }

    return self;
}


- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained _Nullable[_Nonnull])buffer count:(NSUInteger)len {
    return [self.items countByEnumeratingWithState:state objects:buffer count:len];
}

- (NSUInteger)count {
    return [self.items count];
}

- (id)firstObject {
    if (0 < [self.items count]) {
        return [self.items firstObject];
    }

    return nil;
}

- (id)lastObject {
    if (0 < [self.items count]) {
        return [self.items lastObject];
    }

    return nil;
}

- (void)addObject:(id)obj {
    if (!obj) {
        return;
    }

    [self.items addObject:obj];
}

- (id)objectAtIndex:(NSUInteger)index {
    if (index < [self.items count]) {
        return self.items[index];
    } else {
        NSLog(@"index is beyond bounds ");
    }
    return nil;
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    if (index < [self.items count]) {
        return self.items[index];
    } else {
        NSLog(@"index is beyond bounds ");
    }
    return nil;
}

- (void)insertObject:(id)obj atIndex:(NSUInteger)index {
    if (index > [self.items count]) {
        NSLog(@"index is beyond bounds ");
    } else if (obj) {
        [self.items insertObject:obj atIndex:index];
    } else {
        NSLog(@"obj is nil");
    }
}

- (void)addObjectsFromArray:(NSArray<id> *)otherArray {
    if (!otherArray) {
        return;
    }

    [self.items addObjectsFromArray:otherArray];
}

- (void)removeLastObject {
    NSUInteger count = [self.items count];
    if (count == 0) {
        NSLog(@"index is beyond bounds ");
    } else {
        [self.items removeObjectAtIndex:count - 1];
    }
}

- (void)removeObjectAtIndex:(NSUInteger)index {
    if (index > [self.items count]) {
        NSLog(@"index is beyond bounds ");
    } else {
        [self.items removeObjectAtIndex:index];
    }
}

- (void)removeAllObjects {
    return [self.items removeAllObjects];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)obj {
    if (index < [self.items count]) {
        if (obj) {
            [self replaceObjectAtIndex:index withObject:obj];
        } else {
            NSLog(@"obj is nil");
        }
    } else {
        NSLog(@"index is beyond bounds ");
    }
}

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2 {
    if (idx1 < [self.items count] && idx2 < [self.items count]) {
        [self.items exchangeObjectAtIndex:idx1 withObjectAtIndex:idx2];
    } else {
        NSLog(@"index is beyond bounds ");
    }
}

#pragma mark - Internal mutable items

- (NSMutableArray *)items {
    if (!_items) {
        _items = [self.target mutableArrayValueForKey:self.keyPath];
    }

    return _items;
}

#pragma mark Key-value observing

- (void)registerKVO {
    [self.target addObserver:self
                  forKeyPath:self.keyPath
                     options:NSKeyValueObservingOptionInitial
                     context:&VVArrayKeyPathContext];
}

- (void)unregisterKVO {
    [self.target removeObserver:self
                     forKeyPath:self.keyPath
                        context:&VVArrayKeyPathContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == VVArrayKeyPathContext && [keyPath isEqualToString:self.keyPath]) {
        NSKeyValueChange keyValueChange = (NSKeyValueChange) [change[NSKeyValueChangeKindKey] unsignedIntegerValue];
        if (self.kvoCallback) {
            self.kvoCallback(keyValueChange, object);
        } else {
            switch (keyValueChange) {
                case NSKeyValueChangeInsertion:
                    break;
                case NSKeyValueChangeRemoval:
                    break;
                case NSKeyValueChangeReplacement:
                    break;
                case NSKeyValueChangeSetting:
                    break;
                default:
                    break;
            }
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

@end
