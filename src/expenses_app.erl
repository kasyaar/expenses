-module(expenses_app).


-compile({parse_transform, do}).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
    do([error_m ||
        Dispatch <- application:get_env(expenses, dispatch),
        Listeners <- application:get_env(expenses, listeners),
        gaucho:start(Dispatch, Listeners),
        expenses_sup:start_link()
    ]).

stop(_State) ->
    ok.
