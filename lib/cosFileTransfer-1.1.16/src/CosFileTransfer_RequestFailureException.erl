%%  coding: latin-1
%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosFileTransfer_RequestFailureException
%% Source: /home/vagrant/build-dir_14-10-22_14-39-46/otp-support/lib/cosFileTransfer/src/CosFileTransfer.idl
%% IC vsn: 4.3.6
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosFileTransfer_RequestFailureException').
-ic_compiled("4_3_6").


-include("CosFileTransfer.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_except,"IDL:omg.org/CosFileTransfer/RequestFailureException:1.0",
                   "RequestFailureException",
                   [{"reason",{tk_string,0}}]}.

%% returns id
id() -> "IDL:omg.org/CosFileTransfer/RequestFailureException:1.0".

%% returns name
name() -> "CosFileTransfer_RequestFailureException".



