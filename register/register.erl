-module(register).
-export([ping/1,pong/0,start/0,sleep/0]).


ping(0) ->
    pong ! finished,
    io:format("ping finished~n",[]);
ping(N) -> 
    pong ! {ping,self()},
    receive
        pong ->
            io:format("ping received ping~n",[])
    end,
    ping(N-1).

pong() ->
    receive
        finished ->
            io:format("pong finished~n",[]);
        {ping, Ping_PID} ->
            io:format("pong received ping~n",[]),
            Ping_PID ! pong,
            pong()
    end.


start() ->
    register(pong,spawn(register,pong,[])),  % pong 全局可用
    spawn(register,ping,[3]).


% 睡眠
sleep() ->
    receive
    after
        1000 ->
           io:format("sleep",[])
    end.



