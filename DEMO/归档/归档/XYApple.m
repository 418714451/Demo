//
//  XYApple.m
//  归档
//
//  Created by 杜昕宇 on 16/11/22.
//  Copyright © 2016年 peter. All rights reserved.
//

#import "XYApple.h"

@implementation XYApple

- (instancetype)initWithColor:(NSString *)color weight:(float)weight size:(int)size {
    if ([super init]) {

        self.color = color;
        self.weight = weight;
        self.size = size;
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"<XYApple [_color=%@, _weight=%.f, _size=%d]>", self.color, self.weight, self.size];// 返回一个字符串
}

// 该方法负责归档对象
- (void)encodeWithCoder:(NSCoder *)aCoder{
    // 调用 NSCoder 的方法归档该对象的每个成员变量
    [aCoder encodeObject:_color forKey:@"color"];
    [aCoder encodeFloat:_weight forKey:@"weight"];
    [aCoder encodeInt:_size forKey:@"size"];
}

// 该方法负责恢复对象
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    // 使用 NSCoder 依次回复 color/weight/size 这三个 key 所对应的 value, 并将恢复的 value 赋给当前对象的3哥成员变量
    _color = [aDecoder decodeObjectForKey:@"color"];
    _weight = [aDecoder decodeFloatForKey:@"weight"];
    _size = [aDecoder decodeIntForKey:@"size"];
    return self;
}

@end
