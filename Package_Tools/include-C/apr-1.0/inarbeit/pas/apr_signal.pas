unit apr_signal;

interface

uses
  fp_apr;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_SIGNAL_H}
{$define APR_SIGNAL_H}
{*
 * @file apr_signal.h
 * @brief APR Signal Handling
  }
{*xxxxxxxxxxxx }
type

  Tapr_sigfunc_t = procedure (para1:longint);cdecl;
{*
 * Set the signal handler function for a given signal
 * @param signo The signal (eg... SIGWINCH)
 * @param func the function to get called
  }

function apr_signal(signo:longint; func:Papr_sigfunc_t):Papr_sigfunc_t;cdecl;external libapr;
{*
 * Get the description for a specific signal number
 * @param signum The signal number
 * @return The description of the signal
  }
function apr_signal_description_get(signum:longint):Pchar;cdecl;external libapr;
{*
 * APR-private function for initializing the signal package
 * @internal
 * @param pglobal The internal, global pool
  }
procedure apr_signal_init(pglobal:Papr_pool_t);cdecl;external libapr;
{*
 * Block the delivery of a particular signal
 * @param signum The signal number
 * @return status
  }
function apr_signal_block(signum:longint):Tapr_status_t;cdecl;external libapr;
{*
 * Enable the delivery of a particular signal
 * @param signum The signal number
 * @return status
  }
function apr_signal_unblock(signum:longint):Tapr_status_t;cdecl;external libapr;
{* @  }
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ APR_SIGNAL_H  }

// === Konventiert am: 10-9-26 16:47:15 ===


implementation



end.
