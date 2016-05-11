//
//  Person.m
//  (3)NSKeyedArchiver对象归档(NSCoding)
//
//  Created by Emo_Lin on 14/12/31.
//  Copyright © 2014年 Emo Lin. All rights reserved.
//

#import "Person.h"

@implementation Person
-(void)encodeWithCoder:(NSCoder *)aCoder {
    //指定每一个属性怎么存储
    [aCoder encodeObject:self.account forKey:@"account"];
    [aCoder encodeObject:self.password forKey:@"password"];
    [aCoder encodeInteger:self.age forKey:@"age"];

}

-(id) initWithCoder:(NSCoder *)aDecoder {
    // 读取数据 设置每个属性
    if (self = [super init]) {
        self.account = [aDecoder decodeObjectForKey:@"account"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
    }
    return self;
}
@end
