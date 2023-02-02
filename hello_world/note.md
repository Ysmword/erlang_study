认识：erlang适合做高并发

1、下载
直接到官网下载即可：https://www.erlang.org/

2、配置环境变量，以方便命令行调用

3、编写hello world程序
```erlang
-module(test).
-author("administrator").

-export([hello/0]).

hello()->
    helloWord.
```

4、运行hello_world程序
- cd hello_world目录
- erl
- c(test).
- test:(hello).
