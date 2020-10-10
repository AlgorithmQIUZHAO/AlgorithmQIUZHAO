//
//  ViewController.m
//  test
//
//  Created by youxiaolong on 2020/6/13.
//  Copyright © 2020 游小龙. All rights reserved.
//

#import "ViewController.h"
 #import <objc/message.h>
@interface ViewController ()
@property(nonatomic,copy) NSString *myNameStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateAction)];
    //[displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
  // displayLink.preferredFramesPerSecond = 2;//设置为60 就是没一秒触发一次 30每秒触发两次 超过60无效
    //[self updateAction];
  //  moveZeroes(<#int *nums#>, <#int numsSize#>);
    
    [self twoSum];
}


//第一题 删除排序数组中的重复项（Facebook、字节跳动、微软在半年内面试中考过）
/**
 1 解题思路 题目给定的是有序列数组  那么有想相同的肯定相邻
 array[i] = array[i+1]
 
 2 用集合解题
 */
-(void)removeduplicate{
    NSArray *array = @[@"1",@"1",@"2"];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];
    for (int i = 0; i < arr.count-1; i ++) {
        if ([arr[i] integerValue] == [arr[i+1] integerValue]) {
            [arr removeObjectAtIndex:i];
            --i;
        }
    }
    NSLog(@"%@",arr);
}

//第二题 移动零（Facebook、亚马逊、苹果在半年内面试中考过）
/**
 */
-(void)moveZero{
    NSArray *array =@[@"0",@"1",@"0",@"3",@"12"];
    NSMutableArray *nums = [NSMutableArray arrayWithArray:array];
    int j = 0;
    for (int i = 0; i < nums.count; ++i) {
        if ([nums[i] integerValue] != 0) {
            [nums replaceObjectAtIndex:j withObject:nums[i]];
            NSLog(@"i = %d j = %d",i,j);
            if (i !=j) {
                [nums replaceObjectAtIndex:i withObject:@"0"];
                NSLog(@"%@",nums);
            }
            j++;
        }
    }
    NSLog(@"%@",nums);
}


// 第三题 两数之和

-(void)twoSum{
    NSArray *array =@[@"2",@"7",@"11",@"15"];
    NSMutableArray *returnArray =[NSMutableArray new];
    for (int i = 0; i < array.count; i ++) {
        if ([self hashFUN:9 - [array[i] integerValue] and:i]!=-1) {
            [returnArray addObject:[NSString stringWithFormat:@"%d",i]];
            [returnArray addObject:[NSString stringWithFormat:@"%d",[self hashFUN:9 - [array[i] integerValue] and:i]]];

        }
    }
    NSLog(@"%@",returnArray);

    
}

/**
 构造hash函数
 */
-(int)hashFUN:(int)num and:(int)j{
    NSArray *array =@[@"2",@"7",@"11",@"15"];
    for (int i = j; i < array.count; i ++) {
        if ([array[i] integerValue] ==num) {
            return i;
        }
    }
    return -1;
}




@end
