//
//  ViewController.m
//  SJGesturePasswordDemo
//
//  Created by sino on 2019/2/14.
//  Copyright © 2019年 sino. All rights reserved.
//

#import "ViewController.h"
#import "SJGestureInfoView.h"
#import "SJGesturePassword.h"
#import "SetGesturePasswordTitleView.h"
@interface ViewController ()
@property(nonatomic, strong)UILabel *tipLabel;
@property(nonatomic, strong)SJGesturePassword *passWord;
@property(nonatomic, strong)SJGestureInfoView *infoView;
@property(nonatomic, copy)NSString *firstLockPath;
@property (nonatomic,strong) SetGesturePasswordTitleView *titleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置新手势密码";
    self.view.backgroundColor = [UIColor whiteColor];
    [self promptInfoView];
    [self SetupSubviews];
    [self createTimmyLa];
}

- (void)promptInfoView {
    
    _titleView = [[SetGesturePasswordTitleView alloc] initWithFrame:CGRectMake(0, 40, MainWidth, 50)];
    [self.view addSubview:_titleView];
    
    //密码提示
    _infoView = [[SJGestureInfoView alloc] init];
    _infoView.itemBackGoundColor = RGBOF(0x4A94FF);
    _infoView.bounds = CGRectMake(0, 0, 80, 80);
    _infoView.center = CGPointMake(self.view.center.x,130);
    [self.view addSubview:_infoView];
}

#pragma mark --- 手势 ---
- (void)SetupSubviews{
    
    //密码输入
    _passWord = [[SJGesturePassword alloc] init];
    _passWord.bounds = CGRectMake(0, 0, MainWidth, 350);
    _passWord.center = CGPointMake(self.view.center.x,375);
    [self.view addSubview:_passWord];
    __weak typeof (self)weekSelf = self;
    [_passWord addPasswordBlock:^(NSString *password) {
        [weekSelf showPassword:password];
    }];
    
}
// Timmy
- (void)createTimmyLa {
    self.tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 190, MainWidth, 20)];
    [self.tipLabel lableText:@"请绘制解锁图案" color:0x333333 font:18 textAlignment:1];
    [self.view addSubview:self.tipLabel];
}

- (void)showPassword:(NSString *)path {
    if (self.firstLockPath.length) {
        if ([path isEqualToString:self.firstLockPath]) {
            self.tipLabel.textColor = RGBOF(0x333333);
            self.tipLabel.text = @"手势密码设置成功";
            
            
            UIAlertController *alc = [UIAlertController alertControllerWithTitle:nil message:@"Password successfully" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ac = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
                //                ChangePasswordViewController *changePassVC = [[ChangePasswordViewController alloc] init];
                //                [self.navigationController pushViewController:changePassVC animated:YES];
            }];
            
            [alc addAction:ac];
            
            [self presentViewController:alc animated:YES completion:nil];
            
            [self SaveLockPath:path];
            [NSThread sleepForTimeInterval:1.2f];
            
        }else{
            self.tipLabel.textColor = RGBOF(0xD0021B);
            self.tipLabel.text = @"两次设置不一致，请重新设置!";
            [_infoView refresh];
            self.firstLockPath = nil;
        }
    }else{
        
        if (path.length < 4) {
            self.tipLabel.textColor = RGBOF(0xD0021B);
            self.tipLabel.text = @"请至少连接4个点!";
            return ;
        }
        
        _infoView.passWord = path;
        self.firstLockPath = [path copy];
        self.tipLabel.textColor = RGBOF(0x333333);
        self.tipLabel.text = @"请再次绘制解锁图案";
        
        //        self.lockViewShotView.image  = shotImage;
    }
}

- (void)SaveLockPath:(NSString *)path{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setObject:path forKey:@"LockPath"];
    [userDef synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
