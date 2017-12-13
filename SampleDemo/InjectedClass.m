//
//  InjectedClass.m
//  SampleDemo
//
//  Created by renwei.chen on 2017/12/12.
//  Copyright © 2017年 YY.inc. All rights reserved.
//

#import "InjectedClass.h"

#define LOG(fmt,...) [[NSNotificationCenter defaultCenter]postNotificationName:@"updateData" object:[NSString stringWithFormat:fmt,##__VA_ARGS__]];

@implementation InjectedClass
{
    NSDate *_date;
}

+(instancetype)sharedInstance{
    static InjectedClass *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[InjectedClass alloc]init];
    });
    return _instance;
}


+(id)GetObj
{
    id obj = [[[self class]sharedInstance]getObj];
    LOG(@"%@ %d %@",NSStringFromSelector(_cmd),__LINE__,obj);
    return obj;
}

+(int)GetInt
{
    int value = [[[self class]sharedInstance]getInt];
    LOG(@"%@ %d %d",NSStringFromSelector(_cmd),__LINE__,value);
    return value;
}

+(void)Recv2Obj:(id)obj1 otherObj:(id)obj2
{
    LOG(@"%@ %d %@ %@",NSStringFromSelector(_cmd),__LINE__,obj1,obj2);
    [[[self class]sharedInstance]recv2Obj:obj1 otherObj:obj2];
}

+(void)Recv2Int:(int)integer1 otherInt:(int)integer2
{
    LOG(@"%@ %d %d %d",NSStringFromSelector(_cmd),__LINE__,integer1,integer2);
    [[[self class]sharedInstance]recv2Int:integer1 otherInt:integer2];
}

+(void)Recv5Argv:(id)sender selector:(SEL)cmd line:(int)line fileName:(const char*)fileName pointer:(void*)userData
{
    LOG(@"%@ %d %@ %@ %d %s %p",NSStringFromSelector(_cmd),__LINE__,sender,NSStringFromSelector(cmd),line,fileName,userData);
    [[[self class]sharedInstance]recv5Argv:sender selector:cmd line:line fileName:fileName pointer:userData];
}

+(void)Recv5Int:(int)integer1 int2:(int)integer2 int3:(int)integer3 int4:(int)integer4 int5:(int)integer5{
    LOG(@"%d %d %d %d %d",integer1,integer2,integer3,integer4,integer5);
    [[[self class]sharedInstance]recv5Int:integer1 int2:integer2 int3:integer3 int4:integer4 int5:integer5];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _date = [NSDate date];
    }
    return self;
}

-(id)getObj{
    id obj = [NSString stringWithFormat:@"%@",_date];
    LOG(@"%@ %d %@",NSStringFromSelector(_cmd),__LINE__,obj);
    return obj;
}

-(int)getInt{
    int value = [_date timeIntervalSince1970];
    LOG(@"%@ %d %d",NSStringFromSelector(_cmd),__LINE__,value);
    return value;
}

-(void)recv2Obj:(id)obj1 otherObj:(id)obj2{
    LOG(@"%@  %@  %@",_date,obj1,obj2);
}

-(void)recv2Int:(int)integer1 otherInt:(int)integer2{
    LOG(@"%@ %d  %d",_date,integer1,integer2);
}

-(void)recv5Int:(int)integer1 int2:(int)integer2 int3:(int)integer3 int4:(int)integer4 int5:(int)integer5{
    LOG(@"%@ %d %d %d %d %d",_date,integer1,integer2,integer3,integer4,integer5);
}


-(void)recv5Argv:(id)sender selector:(SEL)cmd line:(int)line fileName:(const char*)fileName pointer:(void*)userData{
    
    LOG(@"%@  %@  %@ %d %s %p",_date,sender,NSStringFromSelector(cmd),line,fileName,userData);
}

@end
