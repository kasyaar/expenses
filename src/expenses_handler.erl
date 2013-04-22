-module(expenses_handler).


-compile(export_all).


-behaviour(cowboy_http_handler).

-compile({parse_transform, do}).
-compile({parse_transform, gaucho}).



-webmethod({"/expenses/header", [get], "text/plain", auto, [
    {'user-agent', header},
    {'some-header', header}
]}).
-spec header/2 :: (binary(), option_m:monad(binary())) -> error_m:monad(string()).
header(UA, SH) ->
    {ok, xl_string:format("UA: ~p, Other: ~p~n", [UA, SH])}.

-webmethod({
    "/expenses/uri",
    [get],
    "text/plain",
    auto,
    [{uri, request_uri}]
}).
-spec uri/1 :: (option_m:monad(binary())) -> error_m:monad(any()).
uri(Uri) ->
    io:format("Request URI: ~p~n", [Uri]),
    ok.

-webmethod({
    "/expenses/cookie",
    [get],
    "text/plain",
    auto,
    [{id, cookie}, {name, cookie}]
}).
-spec cookie/2 :: (binary(), binary()) -> error_m:monad(any()).
cookie(Id, Name) ->
    io:format("Cookie string: {id: ~p, name: ~p}~n", [Id, Name]),
    ok.

