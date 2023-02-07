-module(process).

-export([say_something/2,start/0,test/0,ping/2,pong/0,start_pro/0,go/0,loop/0]).

say_something(What,0) ->
    done;
say_something(What,Times)->
    io:format("~p~p~n",[What,Times]),
    say_something(What,Times-1).

% 创建进程
start() ->
    spawn(process,say_something,[hello,3]),
    spawn(process,say_something,[goodbye,4]).  % 会自动等待进程执行完成，或者退出

test() ->
    start(),
    stop.

% 进程间消息传递
ping(0,Pong_PID) ->
    Pong_PID ! finished,
    io:format("ping finished~n",[]);
ping(N,Pong_PID)->
    Pong_PID ! {ping,self()},  % 传递{ping,pid信息}给Pong_PID进程
    receive % 阻塞等待消息
        pong ->
            io:format("~p Ping received pong~n",[N])
    end,
    ping(N-1,Pong_PID).

pong() ->
    receive  % 接受消息
        finished ->
            io:format("Pong finished~n",[]);
        {ping,Ping_PID} ->
            io:format("Pong received ping~n",[]),
            Ping_PID ! pong,
            pong()
    end.

start_pro() ->
    Pong_PID = spawn(process,pong,[]),
    spawn(process,ping,[3,Pong_PID]).

go() ->
    Server=spawn(process,loop,[]),
    Server ! {self(),helloword},
    receive
        {Pid,Msg} ->
            io:format("[Go]receive ~p from ~p~n",[Msg,Pid])
    end,
    Server ! {self(),stop},
    true.

% 综合使用
loop() ->
    receive
        {Pid,Msg} ->
            case Msg of
                stop -> true;
                _->
                    io:format("[loop]~p~n",[Msg]),
                    Pid ! {self(),Msg},
                    loop()
            end
    end.
    



