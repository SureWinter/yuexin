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

@end

@implementation WASProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerOrLoginAction:(id)sender {
    XXLog(@"registerOrLoginAction");
    WASLoginViewController *login = [[WASLoginViewController alloc] initWithNibName:@"WASLoginViewController" bundle:nil];
    [self.navigationController pushViewController:login animated:YES];
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
                cell.textLabel.text = @"qita";

            }
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
