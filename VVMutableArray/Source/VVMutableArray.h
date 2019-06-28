
#import <UIKit/UIKit.h>

typedef void (^KVOCallback)(NSKeyValueChange keyValueChange, id object);

@interface VVMutableArray : NSObject <NSFastEnumeration>

@property(nonatomic, copy) KVOCallback kvoCallback;

- (instancetype)init;

// 采用弱引用对象
- (instancetype)initUsingWeakReference;

- (NSUInteger)count;

- (id)objectAtIndex:(NSUInteger)index;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

- (id)firstObject;

- (id)lastObject;

- (void)addObject:(id)obj;

- (void)addObjectsFromArray:(NSArray<id> *)otherArray;

- (void)insertObject:(id)obj atIndex:(NSUInteger)index;

- (void)removeLastObject;

- (void)removeObjectAtIndex:(NSUInteger)index;

- (void)removeAllObjects;

- (void)replaceObjectAtIndex:(NSUInteger)index withObject:(id)obj;

- (void)exchangeObjectAtIndex:(NSUInteger)idx1 withObjectAtIndex:(NSUInteger)idx2;

@end
