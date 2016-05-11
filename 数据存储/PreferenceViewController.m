//
//  ViewController.m
//  (2)Preference用户偏好设置
//
//  Created by Emo_Lin on 14/12/31.
//  Copyright © 2014年 Emo Lin. All rights reserved.
//

#import "PreferenceViewController.h"

@interface PreferenceViewController ()
@property (weak, nonatomic) IBOutlet UITextField *StringText;
@property (weak, nonatomic) IBOutlet UITextField *IntegerText;
@property (weak, nonatomic) IBOutlet UISwitch *Switch;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation PreferenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// 写入用户偏好设置数据
-(IBAction) writeDataToPreference{
    // 使用偏好设置保存数据
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.StringText.text forKey:@"String"];
    [defaults setInteger:[self.IntegerText.text intValue] forKey:@"Integer"];
    [defaults setBool:self.Switch.on forKey:@"switchBtn"];
    //使用同步方法，把文件立即保存到沙盒文件
    [defaults synchronize];
    //文件会写入Library\Preferences
}

// 读取用户偏好设置数据
-(IBAction) readDataFromPreference{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *String = [defaults objectForKey:@"String"];
    NSInteger Integer = [defaults integerForKey:@"Integer"];
    BOOL switchBtn = [defaults boolForKey:@"switchBtn"];
    NSLog(@"%@,%ld,%d,",String,(long)Integer,switchBtn);
    self.label.text = [NSString stringWithFormat:@"%@,%ld,%d,",String,(long)Integer,switchBtn];
}

//删除用户偏好设置数据
-(IBAction)deleteDataWithPreference {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"Integer"];
    // 删除之后也要调用同步方法，就是运行内存数据与沙盒数据一样。
    [defaults synchronize];
}

// 修改用户偏好设置数据
-(IBAction)modifyDataInPreference {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"8888888" forKey:@"String"];
    //使用同步方法，把文件立即保存到沙盒文件
    [defaults synchronize];
    
}

@end
