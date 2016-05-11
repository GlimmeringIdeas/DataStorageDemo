//
//  ViewController.m
//  (1)属性列表plist文件
//
//  Created by Emo_Lin on 14/12/31.
//  Copyright © 2014年 Emo Lin. All rights reserved.
//

#import "PlistViewController.h"
#import "OneContact.h"
@interface PlistViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation PlistViewController

- (IBAction)writeDictionaryToPlistBtn:(UIButton *)sender {
     [self writeDictionaryToPlist];
}
- (IBAction)readDictionaryFromPlistBtn:(UIButton *)sender {
    [self readDictionaryFromPlist];
}
- (IBAction)writeArrayToPlistBtn:(UIButton *)sender {
    [self writeArrayToPlist];
}
- (IBAction)readArrayFromPlistBtn:(UIButton *)sender {
    [self readArrayFromPlist];
}
- (IBAction)writeStringToPlistBtn:(UIButton *)sender {
    [self writeStringToPlist];
}
- (IBAction)readStringFromPlistBtn:(UIButton *)sender {
    [self readStringFromPlist];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void) readArrayFromPlist {
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *plistPath =[doc stringByAppendingPathComponent:@"arrayData.plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:plistPath];
    self.label.text = [NSString stringWithFormat:@"%@",array];
    NSLog(@"%@",array);
}


- (void) writeArrayToPlist {
    
    // 点击之后保存到沙盒的一个 plist 文件里面
    NSArray *data = @[@"abc" , @"def",@"hij",@"klm"];
    
    // 获取 document目录，在NSSearchPathForDirectoriesInDomains方法中
    // @params NSSearchPathDirectory directory 沙盒的目录
    // @params NSSearchPathDomainMask domainMask 每一个app的主目录
    // @params BOOL expandTilde YES
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 打印目录的位置
    NSLog(@"%@" , doc);   // /Users/Maxee/Library/Developer/CoreSimulator/Devices/C0488599-E357-4C1B-9258-EC8FF4872000/data/Containers/Data/Application/4505D886-26BC-41FF-A816-1D68BF2C7173/Library/Documentation
    self.label.text = [NSString stringWithFormat:@"%@",doc];
    // 构造文件路径
    NSString *plistPath =[doc stringByAppendingPathComponent:@"arrayData.plist"];
    
    // 将内容写进plist文件
    [data writeToFile:plistPath atomically:YES];
    
    // 打开写入的内容
    //    <?xml version="1.0" encoding="UTF-8"?>
    //    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    //    <plist version="1.0">
    //    <array>
    //    <string>abc</string>
    //    <string>def</string>
    //    </array>
    //    </plist>
    
}

- (void) writeDictionaryToPlist {
    NSDictionary *data = @{@"name":@"合众嘉创" , @"content":@"iOS开发工程师" , @"times":@68};
    // 保存在Library目录下面
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@" , doc);
    self.label.text = [NSString stringWithFormat:@"%@",doc];
    NSString *plistPath =[doc stringByAppendingPathComponent:@"dictionaryData.plist"];
    [data writeToFile:plistPath atomically:YES];
}

-(void) readDictionaryFromPlist {
    // 读取在Library目录
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
    NSString *plistPath =[doc stringByAppendingPathComponent:@"dictionaryData.plist"];
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSLog(@"%@",dictionary);
    self.label.text = [NSString stringWithFormat:@"%@",dictionary];
}

- (void ) writeStringToPlist {
    NSString *data = @"abc";
    // 保存在Library/Caches目录下面
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"%@" , doc);
    self.label.text = [NSString stringWithFormat:@"%@",doc];
    NSString *plistPath =[doc stringByAppendingPathComponent:@"stringData.plist"];
    // 字符串写入文件有专门的方法
    [data writeToFile:plistPath atomically: YES encoding:NSUTF8StringEncoding error:nil];
}

- (void ) readStringFromPlist {
    
    // 读取在Library/Caches目录
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *plistPath =[doc stringByAppendingPathComponent:@"stringData.plist"];
    NSString *string = [NSString stringWithContentsOfFile:plistPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",string);
    self.label.text = [NSString stringWithFormat:@"%@",string];
}

// 尝试失败！
//-(void)writeModelToPlist {
//    Contact *contact = [[Contact alloc] init];
//    contact.name = @"linweida";
//    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//    
//    NSLog(@"%@" , doc);
//    
//    NSString *plistPath =[doc stringByAppendingPathComponent:@"contactData.plist"];
//    
//    // 字符串写入文件有专门的方法
//    [contact writeToFile:plistPath atomically: YES encoding:NSUTF8StringEncoding error:nil];
//    // 不是所有对象都可以使用 write 方法，需要继承自 NSCoding才可以
//}
@end
