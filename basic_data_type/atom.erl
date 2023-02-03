-module(atom).
-export([print_atom/0, convert_length/2]).
 
print_atom() ->
    student. 

% centimeter是个原子，就是一个标识
convert_length(centimeter,X) ->
    X / 2.54.