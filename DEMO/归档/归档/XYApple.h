//
//  XYApple.h
//  归档
//
//  Created by 杜昕宇 on 16/11/22.
//  Copyright © 2016年 peter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYApple : NSObject<NSCoding>

@property (nonatomic, copy) NSString *color;
@property (nonatomic, assign) float weight;
@property (nonatomic, assign) int size;

- (instancetype)initWithColor:(NSString *)color weight:(float)weight size:(int)size;

@end
