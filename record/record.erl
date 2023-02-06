-module(record).

-export([add_thing/3,get_infer/1,start_thing/1]).

-include("head.hrl").  % 引入头文件

add_thing(Title,Start,Infer) ->
    #thing{title = Title,start = Start,infer = Infer}. % 相当于实例化一个结构体

get_infer(Rec)->
    Rec#thing.infer.  % 调用结构体实例的变量

start_thing(Rec) ->
    Rec#thing{start=ok}.
