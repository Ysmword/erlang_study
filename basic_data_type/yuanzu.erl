-module(yuanzu).
-export([convert_length/1,convert_length1/1]).

% {inch,Y}: 表示一个元祖，可以说是Y英寸
convert_length({inch,Y}) ->
    {inch, Y * 5}.

% {Y,X}: 表示一个元祖
convert_length1({Y,X}) ->
    Y * X.