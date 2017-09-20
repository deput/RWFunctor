//
//  RWFunctor.h
//  RWFunctor
//
//  Created by deput on 2017/9/20.
//  Copyright © 2017年 deput. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id(^func)(id x);

@interface Functor : NSObject
@property (nonatomic) id val;
+ (Functor*) of:(id)val;
- (Functor*) map:(func)f;
@end

@interface Maybe: Functor
@end

@interface Either:Functor
+ (Functor*) of:(id)left :(id)right;
@property (nonatomic) id left;
@property (nonatomic) id right;
@end

@interface Ap:Functor
+ (Ap*) of:(id)val;
- (Functor*) ap:(Functor*)f;
@end

@interface Monad:Functor
- (id) join;
- (id) flatMap:(func)f;
+ (Monad*) of:(id)val;
@end
