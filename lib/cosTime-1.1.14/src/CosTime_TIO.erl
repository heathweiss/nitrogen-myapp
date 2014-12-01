%%  coding: latin-1
%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosTime_TIO
%% Source: /home/vagrant/build-dir_14-10-22_14-39-46/otp-support/lib/cosTime/src/CosTime.idl
%% IC vsn: 4.3.6
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosTime_TIO').
-ic_compiled("4_3_6").


%% Interface functions
-export(['_get_time_interval'/1, '_get_time_interval'/2, spans/2]).
-export([spans/3, overlaps/2, overlaps/3]).
-export([time/1, time/2]).

%% Type identification function
-export([typeID/0]).

%% Used to start server
-export([oe_create/0, oe_create_link/0, oe_create/1]).
-export([oe_create_link/1, oe_create/2, oe_create_link/2]).

%% TypeCode Functions and inheritance
-export([oe_tc/1, oe_is_a/1, oe_get_interface/0]).

%% gen server export stuff
-behaviour(gen_server).
-export([init/1, terminate/2, handle_call/3]).
-export([handle_cast/2, handle_info/2, code_change/3]).

-include_lib("orber/include/corba.hrl").


%%------------------------------------------------------------
%%
%% Object interface functions.
%%
%%------------------------------------------------------------



%%%% Operation: '_get_time_interval'
%% 
%%   Returns: RetVal
%%
'_get_time_interval'(OE_THIS) ->
    corba:call(OE_THIS, '_get_time_interval', [], ?MODULE).

'_get_time_interval'(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, '_get_time_interval', [], ?MODULE, OE_Options).

%%%% Operation: spans
%% 
%%   Returns: RetVal, Overlap
%%
spans(OE_THIS, Time) ->
    corba:call(OE_THIS, spans, [Time], ?MODULE).

spans(OE_THIS, OE_Options, Time) ->
    corba:call(OE_THIS, spans, [Time], ?MODULE, OE_Options).

%%%% Operation: overlaps
%% 
%%   Returns: RetVal, Overlap
%%
overlaps(OE_THIS, Interval) ->
    corba:call(OE_THIS, overlaps, [Interval], ?MODULE).

overlaps(OE_THIS, OE_Options, Interval) ->
    corba:call(OE_THIS, overlaps, [Interval], ?MODULE, OE_Options).

%%%% Operation: time
%% 
%%   Returns: RetVal
%%
time(OE_THIS) ->
    corba:call(OE_THIS, time, [], ?MODULE).

time(OE_THIS, OE_Options) ->
    corba:call(OE_THIS, time, [], ?MODULE, OE_Options).

%%------------------------------------------------------------
%%
%% Inherited Interfaces
%%
%%------------------------------------------------------------
oe_is_a("IDL:omg.org/CosTime/TIO:1.0") -> true;
oe_is_a(_) -> false.

%%------------------------------------------------------------
%%
%% Interface TypeCode
%%
%%------------------------------------------------------------
oe_tc('_get_time_interval') -> 
	{{tk_struct,"IDL:omg.org/TimeBase/IntervalT:1.0","IntervalT",
                    [{"lower_bound",tk_ulonglong},
                     {"upper_bound",tk_ulonglong}]},
         [],[]};
oe_tc(spans) -> 
	{{tk_enum,"IDL:omg.org/CosTime/OverlapType:1.0","OverlapType",
                  ["OTContainer","OTContained","OTOverlap","OTNoOverlap"]},
         [{tk_objref,"IDL:omg.org/CosTime/UTO:1.0","UTO"}],
         [{tk_objref,"IDL:omg.org/CosTime/TIO:1.0","TIO"}]};
oe_tc(overlaps) -> 
	{{tk_enum,"IDL:omg.org/CosTime/OverlapType:1.0","OverlapType",
                  ["OTContainer","OTContained","OTOverlap","OTNoOverlap"]},
         [{tk_objref,"IDL:omg.org/CosTime/TIO:1.0","TIO"}],
         [{tk_objref,"IDL:omg.org/CosTime/TIO:1.0","TIO"}]};
oe_tc(time) -> 
	{{tk_objref,"IDL:omg.org/CosTime/UTO:1.0","UTO"},[],[]};
oe_tc(_) -> undefined.

oe_get_interface() -> 
	[{"time", oe_tc(time)},
	{"overlaps", oe_tc(overlaps)},
	{"spans", oe_tc(spans)},
	{"_get_time_interval", oe_tc('_get_time_interval')}].




%%------------------------------------------------------------
%%
%% Object server implementation.
%%
%%------------------------------------------------------------


%%------------------------------------------------------------
%%
%% Function for fetching the interface type ID.
%%
%%------------------------------------------------------------

typeID() ->
    "IDL:omg.org/CosTime/TIO:1.0".


%%------------------------------------------------------------
%%
%% Object creation functions.
%%
%%------------------------------------------------------------

oe_create() ->
    corba:create(?MODULE, "IDL:omg.org/CosTime/TIO:1.0").

oe_create_link() ->
    corba:create_link(?MODULE, "IDL:omg.org/CosTime/TIO:1.0").

oe_create(Env) ->
    corba:create(?MODULE, "IDL:omg.org/CosTime/TIO:1.0", Env).

oe_create_link(Env) ->
    corba:create_link(?MODULE, "IDL:omg.org/CosTime/TIO:1.0", Env).

oe_create(Env, RegName) ->
    corba:create(?MODULE, "IDL:omg.org/CosTime/TIO:1.0", Env, RegName).

oe_create_link(Env, RegName) ->
    corba:create_link(?MODULE, "IDL:omg.org/CosTime/TIO:1.0", Env, RegName).

%%------------------------------------------------------------
%%
%% Init & terminate functions.
%%
%%------------------------------------------------------------

init(Env) ->
%% Call to implementation init
    corba:handle_init('CosTime_TIO_impl', Env).

terminate(Reason, State) ->
    corba:handle_terminate('CosTime_TIO_impl', Reason, State).


%%%% Operation: '_get_time_interval'
%% 
%%   Returns: RetVal
%%
handle_call({OE_THIS, OE_Context, '_get_time_interval', []}, _, OE_State) ->
  corba:handle_call('CosTime_TIO_impl', '_get_time_interval', [], OE_State, OE_Context, OE_THIS, false);

%%%% Operation: spans
%% 
%%   Returns: RetVal, Overlap
%%
handle_call({OE_THIS, OE_Context, spans, [Time]}, _, OE_State) ->
  corba:handle_call('CosTime_TIO_impl', spans, [Time], OE_State, OE_Context, OE_THIS, false);

%%%% Operation: overlaps
%% 
%%   Returns: RetVal, Overlap
%%
handle_call({OE_THIS, OE_Context, overlaps, [Interval]}, _, OE_State) ->
  corba:handle_call('CosTime_TIO_impl', overlaps, [Interval], OE_State, OE_Context, OE_THIS, false);

%%%% Operation: time
%% 
%%   Returns: RetVal
%%
handle_call({OE_THIS, OE_Context, time, []}, _, OE_State) ->
  corba:handle_call('CosTime_TIO_impl', time, [], OE_State, OE_Context, OE_THIS, false);



%%%% Standard gen_server call handle
%%
handle_call(stop, _, State) ->
    {stop, normal, ok, State};

handle_call(_, _, State) ->
    {reply, catch corba:raise(#'BAD_OPERATION'{minor=1163001857, completion_status='COMPLETED_NO'}), State}.


%%%% Standard gen_server cast handle
%%
handle_cast(stop, State) ->
    {stop, normal, State};

handle_cast(_, State) ->
    {noreply, State}.


%%%% Standard gen_server handles
%%
handle_info(Info, State) ->
    corba:handle_info('CosTime_TIO_impl', Info, State).


code_change(OldVsn, State, Extra) ->
    corba:handle_code_change('CosTime_TIO_impl', OldVsn, State, Extra).

