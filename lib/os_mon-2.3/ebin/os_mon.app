%%
%% %CopyrightBegin%
%% 
%% Copyright Ericsson AB 1996-2009. All Rights Reserved.
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

{application, os_mon,
   [{description, "CPO  CXC 138 46"},
    {vsn, "2.3"},
    {modules, [os_mon, os_mon_mib, os_sup,
               disksup, memsup, cpu_sup, os_mon_sysinfo, nteventlog]},
    {registered, [os_mon_sup, os_mon_sysinfo, disksup, memsup, cpu_sup, 
                  os_sup_server]},
    {applications, [kernel, stdlib, sasl]},
    {env, [{start_cpu_sup, true},
	   {start_disksup, true},
	   {start_memsup, true},
	   {start_os_sup, false}]},
    {mod, {os_mon, []}},
    {runtime_dependencies, ["stdlib-2.0","snmp-4.25.1","sasl-2.4",
			    "otp_mibs-1.0.9","mnesia-4.12","kernel-3.0",
			    "erts-6.0"]}]}.
