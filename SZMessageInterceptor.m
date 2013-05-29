//
//  SZMessageInterceptor.m
//  Lilybbs
//
//  Created by Zongxuan Su on 13-1-31.
//  Copyright (c) 2013年 Nemoworks. All rights reserved.
//

#import "SZMessageInterceptor.h"

@implementation SZMessageInterceptor

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    if ([_proxy respondsToSelector:aSelector]) {
        return _proxy;
    }
    if ([_receiver respondsToSelector:aSelector]) {
        return _receiver;
    }
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector
{
    //Tweak for UITextView in iOS5
    if ([[_proxy superclass] instancesRespondToSelector:aSelector]) {
        return NO;
    }
    if ([_proxy respondsToSelector:aSelector]) {
        return YES;
    }
    if ([_receiver respondsToSelector:aSelector]) {
        return YES;
    }
    return [super respondsToSelector:aSelector];
}

@end
