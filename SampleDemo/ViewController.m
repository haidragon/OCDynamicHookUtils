//
//  ViewController.m
//  SampleDemo
//
//  Created by renwei.chen on 2017/12/12.
//  Copyright © 2017年 YY.inc. All rights reserved.
//

#import "ViewController.h"
#import "InjectedClass.h"

#define LOGCALL [self appendNext:NSStringFromSelector(_cmd)];

@implementation ViewController
{
    IBOutlet NSTextView *_textView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak ViewController*wself = self;
    [[NSNotificationCenter defaultCenter]addObserverForName:@"updateData" object:nil  queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        [wself appendText:note.object];
    }];

    // Do any additional setup after loading the view.
}

-(void)appendText:(NSString*)text{
    [_textView.textStorage appendAttributedString:[[NSAttributedString alloc]initWithString:[text stringByAppendingString:@"\n"] attributes:nil]];
}

-(void)appendNext:(NSString*)sel{
    [self appendText:[NSString stringWithFormat:@"\n-------%@------------",sel]];
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

-(IBAction)onActionRetInt:(id)sender{
    LOGCALL
    [self appendText:[NSString stringWithFormat:@"%@",@([InjectedClass GetInt])]];
}

-(IBAction)onActionRetOBJ:(id)sender{
    LOGCALL
    [self appendText:[NSString stringWithFormat:@"%@",[InjectedClass GetObj]]];
}

-(IBAction)onActionRecv2Int:(id)sender{
    LOGCALL
    [InjectedClass Recv2Int:__LINE__ otherInt:100];
}

-(IBAction)onActionRecv2Obj:(id)sender{
    LOGCALL
    [InjectedClass Recv2Obj:@(__LINE__)  otherObj:@(rand())];
}

-(IBAction)onActionRecv5Argv:(id)sender{
    LOGCALL
    [InjectedClass Recv5Argv:sender selector:_cmd line:__LINE__ fileName:__FILE__ pointer:__FUNCTION__];
    [InjectedClass Recv5Int:1 int2:2 int3:3 int4:4 int5:5];
}



@end
