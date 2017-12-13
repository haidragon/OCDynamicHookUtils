//
//  InjectDylib.m
//  InjectDylib
//
//  Created by renwei.chen on 2017/12/12.
//  Copyright © 2017年 YY.inc. All rights reserved.
//

#import "InjectDylib.h"
#import "OCDynamicHookUtils.h"
#import <Cocoa/Cocoa.h>

#define LL() NSLog(@"%s %d",__FUNCTION__,__LINE__);
@implementation InjectDylib
+(void)load{
    [OCDynamicHookUtils AddHookClassMethodImp:^id(void* op, ...) {
        NSLog(@"%s %d",__FUNCTION__,__LINE__);
        return @"My Name Is Hook";
    } toClassName:@"InjectedClass" toReplaceSelectorName:@"GetObj"];

    [OCDynamicHookUtils AddHookClassMethodImp:^id(void* op, ...) {
        LL();
        va_list ap;
        va_start(ap , op);
        LL();
        void* sender = va_arg(ap, void*);
        LL();
        SEL sel = va_arg(ap , SEL);
        LL();
        int line = va_arg(ap , int);
        LL();
        const char* fileName = va_arg(ap , const char*);
        LL();
        void* userData = va_arg(ap , void*);
        LL();
        va_end(ap);
        LL();
        NSLog(@"%s %d",__FUNCTION__,__LINE__);
        NSString *string = [NSString stringWithFormat:@"Hooker==>\nsender=>%p<  \nselector=>%@< \nline=>%d<  \nfile=>%s< \nuserinfo=>%p<",sender,NSStringFromSelector(sel),line,fileName,userData];
        NSLog(@"%s %d",__FUNCTION__,__LINE__);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"updateData" object:string];
        NSLog(@"%s %d",__FUNCTION__,__LINE__);
        return nil;
    } toClassName:@"InjectedClass" toReplaceSelectorName:@"Recv5Argv:selector:line:fileName:pointer:"];

    [OCDynamicHookUtils AddHookInstanceMethodImp:^id(void* op, ...) {
        LL();
        va_list ap;
        va_start(ap , op);
        LL();
        int _1  = va_arg(ap, int);
        int _2 = va_arg(ap , int);
        int _3  = va_arg(ap, int);
        int _4 = va_arg(ap , int);
        int _5  = va_arg(ap, int);
        LL();
        va_end(ap);
        LL();
        NSLog(@"%s %d",__FUNCTION__,__LINE__);
        NSString *string = [NSString stringWithFormat:@"Hooker==>>>   %d %d %d %d %d <<",_1,_2,_3,_4,_5];
        NSLog(@"%s %d",__FUNCTION__,__LINE__);
        [[NSNotificationCenter defaultCenter]postNotificationName:@"updateData" object:string];
        NSLog(@"%s %d",__FUNCTION__,__LINE__);
        return nil;
    } toClassName:@"InjectedClass" toReplaceSelectorName:@"recv5Int:int2:int3:int4:int5:"];

}
@end
