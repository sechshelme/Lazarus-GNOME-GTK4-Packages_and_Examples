
unit apr_env;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_env.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_env.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Papr_pool_t  = ^apr_pool_t;
Pchar  = ^char;
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
{$ifndef APR_ENV_H}
{$define APR_ENV_H}
{*
 * @file apr_env.h
 * @brief APR Environment functions
  }
{$include "apr_errno.h"}
{$include "apr_pools.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_env Functions for manipulating the environment
 * @ingroup APR 
 * @
  }
{*
 * Get the value of an environment variable
 * @param value the returned value, allocated from @a pool
 * @param envvar the name of the environment variable
 * @param pool where to allocate @a value and any temporary storage from
  }
(* Const before type ignored *)

function apr_env_get(value:PPchar; envvar:Pchar; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Set the value of an environment variable
 * @param envvar the name of the environment variable
 * @param value the value to set
 * @param pool where to allocate temporary storage from
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_env_set(envvar:Pchar; value:Pchar; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Delete a variable from the environment
 * @param envvar the name of the environment variable
 * @param pool where to allocate temporary storage from
  }
(* Const before type ignored *)
function apr_env_delete(envvar:Pchar; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_ENV_H  }

implementation


end.
