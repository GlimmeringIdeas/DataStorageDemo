//
//  Contact.m
//  (3)NSKeyedArchiver对象归档(NSCoding)
//
//  Created by Emo_Lin on 14/12/31.
//  Copyright © 2014年 Emo Lin. All rights reserved.
//

#import "Contact.h"

@implementation Contact
-(void)encodeWithCoder:(NSCoder *)aCoder {
    // 重写父类方法，不然父类的内容会不见
    [super encodeWithCoder:aCoder];
    // 添加自己属性的存储
    [aCoder encodeBool:self.gender forKey:@"gender"];
}

-(id) initWithCoder:(NSCoder *)aDecoder {
    // 子类实现 InitWithCoder 方法时，self 不要写 self = [super init]，因为父类方法不是 super
     if (self = [super initWithCoder:aDecoder]) {
        self.gender = [aDecoder decodeBoolForKey:@"gender"];
    }
    return self;
}
@end
