-module(function).
% export all function
-compile(export_all).

% ;

% 奇了个怪，X,Y不是元组里面的东西吗？可以直接使用
calc({add, X, Y}) -> X + Y;
calc({sub, X, Y}) -> X - Y;
calc({_, _, _}) -> nothing.

calc(add, X, Y) -> X + Y;
calc(sub, X, Y) -> X - Y;
calc(_, _, _) -> nothing.

calc1({X, Y, Z}) ->
    case X of
        add -> Y + Z;
        sub -> Y - Z;
        _ -> nothing
    end.


% [H|T] = [{apple,5},{banana,10},{peach,11}].  H={apple,5}, T=[{banana,10},{peach,11}]

% 购物例子:苹果5块钱一斤，香蕉6块钱一斤，梨子7块钱一斤，我买5斤苹果，6斤香蕉，7斤梨子多少钱
cost(apple) -> 5;
cost(banana) -> 6;
cost(peach) -> 7.
% erlang没有循环概念，但是可以使用递归实现该例子
shop([])->0;
shop([{Name,Num}|T])->
    cost(Name)*Num+shop(T).


% 匿名函数
% Three=func(X) -> 3*X end.  // 这个在脚本文件中的使用得注意点

