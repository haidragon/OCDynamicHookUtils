# [OCDynamicHookUtils](https://publish.aprefix.com/renwei.chen/OCDynamicHookUtils)



###1. 介绍

利用 InjectDylib [https://github.com/Tyilo/insert_dylib] 加载 dylib 库

添加基本Hook函数:

### 2.使用方式:

比如微信防撤回:

```objective-c

@implementation WX_Hooker

+(void)load{
    NSString *className = @"MessageService";
    NSString *selName = @"onRevokeMsg:";
    BOOL hook = [OCDynamicHookUtils AddHookInstanceMethodImp:^id(id self, ...) {
        NSLog(@"防止撤回...");
        return nil;
    } toClassName:className toReplaceSelectorName:selName];
    NSLog(@"Hook !!! 防止撤回 %@\n\n",hook?@"YES":@"NO");
}

@end

```

原参数使用:

```c
va_list ap;
va_start(ap , op);
int _1  = va_arg(ap, int);
int _2 = va_arg(ap , int);
int _3  = va_arg(ap, int);
int _4 = va_arg(ap , int);
int _5  = va_arg(ap, int);
va_end(ap);

```


### 使用方式
编译 INSERT_DYLIB 生成命令行工具 
```shell
INSERT_DYLIB --weak   xxx.dylib  AAA.app/Contents/MacOS/AAA
mv AAA.app/Contents/MacOS/AAA => AAA.app/Contents/MacOS/AAA.bak
mv AAA.app/Contents/MacOS/AAA_patched => AAA.app/Contents/MacOS/AAA
```


