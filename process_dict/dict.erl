-module(dict).
-export([start/0,loop/1]).

start() ->
    put(xjb, "xjb"),
    spawn(dict, loop, [5]),
    get(xjb).

sleep() ->
    receive
    after
        2000 -> ok
    end.

loop(Version) ->
    sleep(),
    case get(xjb) of
        undefined ->
            io:format("undef~n",[]),
        loop(Version)
    end,
    io:format("Ver ~p, xjb is ~p~n", [Version,get(xjb)]),
    loop(Version).