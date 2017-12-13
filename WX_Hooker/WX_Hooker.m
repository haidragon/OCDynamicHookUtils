//
//  WX_Hooker.m
//  WX_Hooker
//
//  Created by renwei.chen on 2017/12/12.
//  Copyright © 2017年 YY.inc. All rights reserved.
//

#import "WX_Hooker.h"
#import "OCDynamicHookUtils.h"
#import <Cocoa/Cocoa.h>

@implementation WX_Hooker

+(void)load{
    NSString *className = @"MessageService";
    NSString *selName = @"onRevokeMsg:";
    BOOL hook = [OCDynamicHookUtils AddHookInstanceMethodImp:^id(void *args, ...) {
        NSLog(@"防止撤回...");
//        NSAlert *alert = [[NSAlert alloc]init];
//        [alert addButtonWithTitle:@"防止撤回"];
//        [alert setMessageText:@"!---😅---!"];
        return nil;
    } toClassName:className toReplaceSelectorName:selName];
    NSLog(@"Hook !!! 防止撤回 %@\n\n",hook?@"YES":@"NO");
    if(!hook){
        Class aClass = NSClassFromString(className);
        Method method = class_getInstanceMethod(aClass, NSSelectorFromString(selName));
        NSLog(@"class=%p method=%p\n",aClass,method);
    }
}

@end
