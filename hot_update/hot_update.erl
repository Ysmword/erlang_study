-module(hot_update).

-export([start/1,loop/1]).

% 热更新 会同时存在新旧两个版本
% 旧版本开一个进程
% 主进程热更新修改代码之后，旧的进程不会改变
% 会同时存在新旧两个版本 2

start(Version) ->
    spawn(hot_update,loop,[Version]).

sleep() ->
    receive
    after
        2000 -> ok
    end.

loop(Version) ->
    sleep(),
    Val = test:test(),
    io:format("Version3 ~p value is ~p~n",[Version,Val]),
    loop(Version).