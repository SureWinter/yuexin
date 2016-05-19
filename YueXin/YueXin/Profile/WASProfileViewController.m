//
//  WASProfileViewController.m
//  YueXin
//
//  Created by wangshuo on 15/12/23.
//  Copyright © 2015年 wangshuo. All rights reserved.
//

#import "WASProfileViewController.h"
#import "WASLoginViewController.h"
#import "WASBaseService.h"

@interface WASProfileViewController ()<UITabBarDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *loginOutButton;



@end

@implementation WASProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)initUI
{
    _loginOutButton.layer.cornerRadius = 8;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerOrLoginAction:(id)sender {
    XXLog(@"registerOrLoginAction");
    WASLoginViewController *login = [[WASLoginViewController alloc] initWithNibName:@"WASLoginViewController" bundle:nil];
//    [self.navigationController pushViewController:login animated:YES];
    [self.navigationController presentViewController:login animated:YES completion:^{
        
    }];
}

- (IBAction)loginOutButtonClick:(id)sender {
    
    XXLog(@"longinOutClick");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"确认退出?"
                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction* loginOutAction = [UIAlertAction actionWithTitle:@"确认"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * action) {
                                                              [self loginOutRequest];
                                                          }];
    [alert addAction:loginOutAction];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"取消"
                                                            style:UIAlertActionStyleCancel
                                                          handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
    [self.navigationController presentViewController:alert animated:YES completion:^{}];
    

}

- (void)loginOutRequest
{
    XXLog(@"退出");
}


#pragma mark - tableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? 88:44;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section == 0 ? 1:5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
    /**
     UITableViewCellAccessoryNone,                                                      // don't show any accessory view
     UITableViewCellAccessoryDisclosureIndicator,                                       // regular chevron. doesn't track
     UITableViewCellAccessoryDetailDisclosureButton __TVOS_PROHIBITED,                 // info button w/ chevron. tracks
     UITableViewCellAccessoryCheckmark,                                                 // checkmark. doesn't track
     UITableViewCellAccessoryDetailButton NS_ENUM_AVAILABLE_IOS(7_0)  __TVOS_PROHIBITED // info button. tracks
     */
    cell.accessoryType =  UITableViewCellAccessoryDisclosureIndicator;

    switch (indexPath.row) {
        case 0:
        {
            if (indexPath.section == 0) {
                cell.imageView.image = [UIImage imageNamed:@"usericon"];
                cell.textLabel.text = @"用户名";
                if ([[WASBaseService shareService] isUserLogin]) {
                    cell.textLabel.text =[[[EaseMob sharedInstance].chatManager loginInfo] objectForKey:@"username"];
                }
            }
            else
            {
                cell.textLabel.text = @"我的收藏";

            }
        }
            break;
            
        case 1:
        {
            cell.textLabel.text = @"黑名单";
            
        }
            
            break;
        case 2:
        {
            cell.textLabel.text = @"我的钱包";
            
        }
            
            break;
        case 3:
        {
            cell.textLabel.text = @"邀请好友";
            
        }
            
            break;
            
            case 4:
        {
            cell.textLabel.text = @"设置";

        }
            
            break;
            
        default:
        {
            cell.textLabel.text = @"qita";
        }
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
