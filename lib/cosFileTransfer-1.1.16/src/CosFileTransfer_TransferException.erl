%%  coding: latin-1
%%------------------------------------------------------------
%%
%% Implementation stub file
%% 
%% Target: CosFileTransfer_TransferException
%% Source: /home/vagrant/build-dir_14-10-22_14-39-46/otp-support/lib/cosFileTransfer/src/CosFileTransfer.idl
%% IC vsn: 4.3.6
%% 
%% This file is automatically generated. DO NOT EDIT IT.
%%
%%------------------------------------------------------------

-module('CosFileTransfer_TransferException').
-ic_compiled("4_3_6").


-include("CosFileTransfer.hrl").

-export([tc/0,id/0,name/0]).



%% returns type code
tc() -> {tk_except,"IDL:omg.org/CosFileTransfer/TransferException:1.0",
                   "TransferException",
                   [{"reason",{tk_string,0}}]}.

%% returns id
id() -> "IDL:omg.org/CosFileTransfer/TransferException:1.0".

%% returns name
name() -> "CosFileTransfer_TransferException".


