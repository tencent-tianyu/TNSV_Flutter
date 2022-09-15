//
//  NSNumber+DinsvCategory.m
//
//  Created by wanglijun on 2020/2/4.
//

#import "NSNumber+DinsvCategory.h"

@implementation NSNumber (DinsvCategory)
-(instancetype)dinsvNegative{
    if (![self isKindOfClass:NSNumber.class]) {
        return nil;
    }
    return [NSNumber numberWithFloat:-self.floatValue];
}
@end
