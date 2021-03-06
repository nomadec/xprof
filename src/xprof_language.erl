%%%
%%% @doc Callback functions that need to be implemented
%%% for a language-specific behvaiour
%%%
-module(xprof_language).

%% Function for start monitoring

-callback parse_query(Query :: string()) ->
    Result :: {mfa, xprof:mfa_id()}
            | {clauses, module(), atom(), [erl_parse:abstract_clause()]}.

%% Functions for autocomplete

%% Return whether a function should be excluded from the autocomplete list
-callback hidden_function(Fun :: atom()) ->
    boolean().

%% Formatter functions according to the specific language

-callback fmt_mfa(Mod :: module(), Fun :: atom(), Arity :: integer()) ->
    Formatted :: binary().

-callback fmt_mod_and_delim(Mod :: module()) ->
    Formatted :: binary().

-callback fmt_mod(Mod :: module()) ->
    Formatted :: binary().

-callback fmt_fun_and_arity(Fun :: atom(), Arity :: integer()) ->
    Formatted :: binary().

-callback fmt_fun(Fun :: atom()) ->
    Formatted :: binary().

-callback fmt_exception(Class :: throw | error | exit, Reason :: term()) ->
    Formatted :: binary().

-callback fmt_term(Term :: term()) ->
    Formatted :: binary().
