%%
%% %CopyrightBegin%
%%
%% Copyright Ericsson AB 2010-2014. All Rights Reserved.
%%
%% The contents of this file are subject to the Erlang Public License,
%% Version 1.1, (the "License"); you may not use this file except in
%% compliance with the License. You should have received a copy of the
%% Erlang Public License along with this software. If not, it can be
%% retrieved online at http://www.erlang.org/.
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and limitations
%% under the License.
%%
%% %CopyrightEnd%
%%

%%
%% The diameter application callback module configured by server.erl.
%%

-module(server_cb).

-include_lib("diameter/include/diameter.hrl").
-include_lib("diameter/include/diameter_gen_base_rfc3588.hrl").

%% diameter callbacks
-export([peer_up/3,
         peer_down/3,
         pick_peer/4,
         prepare_request/3,
         prepare_retransmit/3,
         handle_answer/4,
         handle_error/4,
         handle_request/3]).

-define(UNEXPECTED, erlang:error({unexpected, ?MODULE, ?LINE})).

peer_up(_SvcName, _Peer, State) ->
    State.

peer_down(_SvcName, _Peer, State) ->
    State.

pick_peer(_, _, _SvcName, _State) ->
    ?UNEXPECTED.

prepare_request(_, _SvcName, _Peer) ->
    ?UNEXPECTED.

prepare_retransmit(_Packet, _SvcName, _Peer) ->
    ?UNEXPECTED.

handle_answer(_Packet, _Request, _SvcName, _Peer) ->
    ?UNEXPECTED.

handle_error(_Reason, _Request, _SvcName, _Peer) ->
    ?UNEXPECTED.

%% A request whose decode was successful ...
handle_request(#diameter_packet{msg = Req, errors = []}, _SvcName, {_, Caps})
  when is_record(Req, diameter_base_RAR) ->
    #diameter_caps{origin_host = {OH,_},
                   origin_realm = {OR,_}}
        = Caps,
    #diameter_base_RAR{'Session-Id' = Id,
                       'Re-Auth-Request-Type' = Type}
        = Req,

    {reply, #diameter_base_RAA{'Result-Code' = rc(Type),
                               'Origin-Host' = OH,
                               'Origin-Realm' = OR,
                               'Session-Id' = Id}};

%% ... or one that wasn't. 3xxx errors are answered by diameter itself
%% but these are 5xxx errors for which we must contruct a reply.
%% diameter will set Result-Code and Failed-AVP's.
handle_request(#diameter_packet{msg = Req}, _SvcName, {_, Caps})
  when is_record(Req, diameter_base_RAR) ->
    #diameter_caps{origin_host = {OH,_},
                   origin_realm = {OR,_}}
        = Caps,
    #diameter_base_RAR{'Session-Id' = Id}
        = Req,

    {reply, #diameter_base_RAA{'Origin-Host' = OH,
                               'Origin-Realm' = OR,
                               'Session-Id' = Id}};

%% Answer that any other message is unsupported.
handle_request(#diameter_packet{}, _SvcName, _) ->
    {answer_message, 3001}.  %% DIAMETER_COMMAND_UNSUPPORTED

%% Map Re-Auth-Request-Type to Result-Code just for the purpose of
%% generating different answers.

rc(0) ->
    2001;  %% DIAMETER_SUCCESS
rc(_) ->
    5012.  %% DIAMETER_UNABLE_TO_COMPLY
