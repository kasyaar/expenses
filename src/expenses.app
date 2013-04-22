{application, expenses, [
    {description, "StrikeAd RTB/Coordinator"},
    {modules, []},
    {registered, []},
    {applications, [
        kernel,
        stdlib,
        crypto,
        public_key,
        ranch,
        cowboy,
        gaucho
    ]},
    {mod, {expenses_app, []}},
    {env, [
        {dispatch, [
            {'_', [
                {"/expenses/[...]", expenses_handler, []}
            ]}
        ]},
		{listeners, [
			{http, 100, [{port, 8080}]}]}
    ]}
]}.
