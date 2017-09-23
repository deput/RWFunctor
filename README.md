# RWFunctor
Objective-C samples for Functional Programing

- samples

```objc
[[Functor of:@1] map:^id(id x) {
    return @([x integerValue] + 1);
}];//Functor(@2)

[[Functor of:@"abcd"] map:^id(id x) {
    return [x uppercaseString];
}];//Functor(@"ABCD")


[[Maybe of:nil] map:^id(id x) {
  return @([x integerValue] + 1);
}];//Functor(nil)

[[Either of:@1 :nil] map:^id(id x) {
    return @([x integerValue] + 1);
}];//Functor(2,nil)

func f = ^id(id x) {
  return @([x integerValue] + 1);
};
[[Ap of:f] ap:[Functor of:@1]];//Functor(2)


```



