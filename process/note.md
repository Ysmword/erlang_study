有意思的点：进程被用于没有共享数据的执行线程场景。而线程则被用于共享数据的场景下，由于erlang各执行线程之间不共享数据，所以我们一般将其称为进程。

创建进程方式：
spawn(Mudule,Export_Function,List of Arguments)

进程间消息传递：
发送： Pid ! 消息
接受：
receive
    处理函数
end.