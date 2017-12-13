//
//  InjectedClass.h
//  SampleDemo
//
//  Created by renwei.chen on 2017/12/12.
//  Copyright © 2017年 YY.inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InjectedClass : NSObject


-(id)getObj;
-(int)getInt;
-(void)recv2Obj:(id)obj1 otherObj:(id)ojb2;
-(void)recv2Int:(int)integer1 otherInt:(int)integer2;
-(void)recv5Argv:(id)sender selector:(SEL)cmd line:(int)line fileName:(const char*)fileName pointer:(void*)userData;
-(void)recv5Int:(int)integer1 int2:(int)integer2 int3:(int)integer3 int4:(int)integer4 int5:(int)integer5;

+(id)GetObj;
+(int)GetInt;
+(void)Recv2Obj:(id)obj1 otherObj:(id)ojb2;
+(void)Recv2Int:(int)integer1 otherInt:(int)integer2;
+(void)Recv5Argv:(id)sender selector:(SEL)cmd line:(int)line fileName:(const char*)fileName pointer:(void*)userData;
+(void)Recv5Int:(int)integer1 int2:(int)integer2 int3:(int)integer3 int4:(int)integer4 int5:(int)integer5;

@end
