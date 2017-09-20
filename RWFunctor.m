//
//  RWFunctor.m
//  RWFunctor
//
//  Created by deput on 2017/9/20.
//  Copyright © 2017年 deput. All rights reserved.
//

#import "RWFunctor.h"

@implementation Functor

- (id) initWithVal:(id)val
{
    self = [super init];
    _val = val;
    return self;
}

+ (Functor*) of:(id)val
{
    Functor* functor = [[Functor alloc] initWithVal:val];
    return functor;
}

- (Functor*)map:(func)f
{
    return [Functor of:f(self.val)];
}

@end


@implementation Maybe

- (Functor*)map:(func)f
{
    return [Functor of:self.val?f(self.val):nil] ;
}

@end


@implementation Either

+ (Functor*) of:(id)left :(id)right
{
    Either* e = [[Either alloc] init];
    e.left = left;
    e.right = right;
    return e;
}

- (Functor*)map:(func)f
{
    return self.right ?
    [Either of:self.left :f(self.right)] : [Either of:f(self.left) :self.right];
}

@end


@implementation Ap

//- (func) f
//{
//    return (func)self.val;
//}

+ (Ap*) of:(id)val
{
    Ap* ap = [[Ap alloc] initWithVal:val];
    return ap;
}

- (Functor*) ap:(Functor*)f
{
    return [Ap of:((func)self.val)(f.val)];
}
@end


@implementation Monad

+ (Monad*) of:(id)val
{
    Monad* functor = [[Monad alloc] initWithVal:val];
    return functor;
}

- (id) join
{
    return self.val;
}

- (id) flatMap:(func)f
{
    return [(Monad*)[self map:f] join];
}

- (Monad*)map:(func)f
{
    return [Monad of:f(self.val)];
}

@end

