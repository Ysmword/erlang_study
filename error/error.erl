-module(error).
-export([test/0,test1/0,test2/0,test3/0]).

% 捕捉任意类型错误
test()->
    try 
        1/0
    catch
        _:R:Stack -> {err,R,Stack}
    end.

% 捕捉指定类型错误
test1() ->
    try
        throw("just throw a error")
    catch
        throw:Throw -> {throw,Throw}
    end.

% after运用, 只能先catch后after
test2() ->
    try
        exit("just raise a exit")
    catch
        throw:Throw -> {throw,Throw}
    after
        io:format("~p~n",["this is a print"])
    end.

% of运营
test3() ->
    try 
        1-1
    of
        0 -> ok;
        1 -> error
    after 
      io:format("~p~n",["this is a print"])
    end.  