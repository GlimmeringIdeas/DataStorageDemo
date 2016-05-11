//
//  ViewController.m
//  (3)NSKeyedArchiver对象归档(NSCoding)
//
//  Created by Emo_Lin on 14/12/31.
//  Copyright © 2014年 Emo Lin. All rights reserved.
//

#import "NSCodingViewController.h"
#import "Contact.h"
@interface NSCodingViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation NSCodingViewController

// NSKeyedArchiver 归档用来保存数据
// NSKeyedUnarchiver 解档用来读取数据

- (IBAction)saveDictionaryToNSCodingBtn:(UIButton *)sender {
    [self saveDictionaryToNSCoding];
}
- (IBAction)saveArrayToNSCodingBtn:(UIButton *)sender {
     [self saveArrayToNSCoding];
}
- (IBAction)saveObjectToNSCodingBtn:(UIButton *)sender {
     [self saveObjectToNSCoding];
}
- (IBAction)readDictionaryFromNSCodingBtn:(UIButton *)sender {
    [self readDictionaryFromNSCoding];
}
- (IBAction)readObjectFromNSCodingBtn:(UIButton *)sender {
    [self readObjectFromNSCoding];
}
- (IBAction)readArrayFromNSCodingBtn:(UIButton *)sender {
    [self readArrayFromNSCoding];
}

// 通过 NSCoding 存储数组
-(void)saveArrayToNSCoding {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",doc);
    self.label.text = [NSString stringWithFormat:@"%@",doc];
    NSString *plistPath = [[NSString alloc] init];
    plistPath = [doc stringByAppendingPathComponent:@"arrayCoding.plist"];
    
    // 使用归档方法保存数据，archiveRootObject...toFile... 把一个对象写到文件里面
    NSArray *array = @[@"123",@"456"];
    // 直接把对象保存到沙盒中
    [NSKeyedArchiver archiveRootObject:array toFile:plistPath];
}

// 通过 NSCoding 读取字典
-(void)readArrayFromNSCoding {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *plistPath = [[NSString alloc] init];
    plistPath = [doc stringByAppendingPathComponent:@"arrayCoding.plist"];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:plistPath];
    NSLog(@"%@" ,dict);
    self.label.text = [NSString stringWithFormat:@"%@",dict];
}

// 通过 NSCoding 存储字典
-(void)saveDictionaryToNSCoding {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",doc);
    self.label.text = [NSString stringWithFormat:@"%@",doc];
    NSString *plistPath = [[NSString alloc] init];
    plistPath = [doc stringByAppendingPathComponent:@"dictionaryCoding.plist"];
    NSDictionary *dictionary = @{@"acount":@"123",@"passeword":@"456"};
    // 直接把对象保存到沙盒中
    [NSKeyedArchiver archiveRootObject:dictionary toFile:plistPath];
}

// 通过 NSCoding 读取字典
-(void)readDictionaryFromNSCoding {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *plistPath = [[NSString alloc] init];
    plistPath = [doc stringByAppendingPathComponent:@"dictionaryCoding.plist"];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithFile:plistPath];
    NSLog(@"%@" ,dict);
    self.label.text = [NSString stringWithFormat:@"%@",dict];
}

// 通过 NSCoding 存储对象
// 通过NSKeyedArchiver保存对象，自己创建的对象归档后是一个 plist 文件。需要告诉他对象中属性的保存 key。所以归档对象需要实现 encodeWithCoder 的方法
-(void)saveObjectToNSCoding {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@",doc);
    self.label.text = [NSString stringWithFormat:@"%@",doc];
    NSString *plistPath = [[NSString alloc] init];
    plistPath = [doc stringByAppendingPathComponent:@"objectCoding.plist"];
    Contact *c = [[Contact alloc] init];
    c.account = @"emo";
    c.password = @"123";
    c.gender = 1;
    c.age = 25;
    [NSKeyedArchiver archiveRootObject:c toFile:plistPath];
}

// 通过 NSCoding 读取对象
-(void)readObjectFromNSCoding {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *plistPath = [[NSString alloc] init];
    plistPath = [doc stringByAppendingPathComponent:@"objectCoding.plist"];
   Contact * c = [NSKeyedUnarchiver unarchiveObjectWithFile:plistPath];
    NSLog(@"%@,%@,%d, %ld",c.account,c.password ,c.gender , (long)c.age );
    self.label.text = [NSString stringWithFormat:@"%@,%@,%d, %ld",c.account,c.password ,c.gender , (long)c.age ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

@end
