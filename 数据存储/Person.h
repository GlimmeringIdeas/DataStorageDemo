//
//  Person.h
//  (3)NSKeyedArchiver对象归档(NSCoding)
//
//  Created by Emo_Lin on 14/12/31.
//  Copyright © 2014年 Emo Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
@property (nonatomic , copy) NSString *account;
@property (nonatomic , copy) NSString *password;
@property (nonatomic ,assign) NSInteger age;
@end
