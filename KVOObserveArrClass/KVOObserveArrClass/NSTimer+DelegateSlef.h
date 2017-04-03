//
//  NSTimer+DelegateSlef.h
//  KVOObserveArrClass
//
//  Created by 马志超 on 2017/4/3.
//  Copyright © 2017年 ziqiang. All rights reserved.
//

#import <Foundation/Foundation.h>
//为防止controller和nstimer之间的循环引用，delegate指向当前单例，而不指向controller
@interface NSTimer (DelegateSlef)
+(NSTimer *)scheduledTimerWithTimeInterval:(int)timeInterval block:(void(^)())block repeats:(BOOL)yesOrNo;
@end
