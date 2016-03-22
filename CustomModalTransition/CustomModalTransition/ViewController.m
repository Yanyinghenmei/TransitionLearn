//
//  ViewController.m
//  CustomModalTransition
//
//  Created by Daniel on 16/3/15.
//  Copyright © 2016年 Daniel. All rights reserved.
//

#import "ViewController.h"
#import "MyPresentTransitionDelegate.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *presentBtn;
@property (nonatomic, strong) MyPresentTransitionDelegate *transitionDelegate;
@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    _transitionDelegate = [MyPresentTransitionDelegate new];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UIViewController *next = segue.destinationViewController;
    // 黄色
    if ([next isKindOfClass:NSClassFromString(@"PresentedViewController")]) {
        next.transitioningDelegate = _transitionDelegate;
        
        next.modalPresentationStyle = UIModalPresentationCustom;
        
        [UIView animateWithDuration:0.3 animations:^{
            _presentBtn.bounds = CGRectMake(0, 0, 1, _presentBtn.frame.size.height);
        } completion:^(BOOL finished) {
            [super prepareForSegue:segue sender:sender];
        }];
    }
    
    //
    else {
        [super prepareForSegue:segue sender:sender];
    }
}

- (IBAction)unwindForSegue:(UIStoryboardSegue *)unwindSegue towardsViewController:(UIViewController *)subsequentVC {
    [super unwindForSegue:unwindSegue towardsViewController:subsequentVC];
    if ([unwindSegue.sourceViewController isKindOfClass:NSClassFromString(@"PresentedViewController")]) {
        
        [UIView animateWithDuration:0.3 animations:^{
            _presentBtn.bounds = CGRectMake(0, 0, 162, _presentBtn.frame.size.height);
        }];
    }
}
@end
