-module(cache).
-export([start/0,appendIP/2,getIP/1,removeHost/1,cacheHost/1]).

start() ->
    Pid=spawn(cache,cacheHost,[#{}]),
    register(cache,Pid).

appendIP(Host,IP) ->
    PID=whereis(cache),
    PID ! {append,Host,IP,self()},
    receive
        Response -> Response
    end.

getIP(Host) ->
    PID=whereis(cache),
    PID ! {get,Host,self()},
    receive
        Response -> Response
    end.

removeHost(Host) ->
    PID=whereis(cache),
    PID ! {remove,Host,self()},
    receive
        Response -> Response
    end.

% 服务端
cacheHost(Map) ->
    receive
        {append,Host,IP,Client} ->
            M2=maps:put(Host,IP,Map),
            Client ! appendSuc,  % 发送回去
            cacheHost(M2);
        {get,Host,Client} ->
            try maps:get(Host,Map) of
                IP -> 
                    Client ! IP  
            catch
                _:R ->
                    Client ! R
            end,
            cacheHost(Map);
        {remove,Host,Client} ->
            M2=maps:remove(Host,Map),
            Client ! removeSuc,
            cacheHost(M2);
        _Any->
            argErr
    end.