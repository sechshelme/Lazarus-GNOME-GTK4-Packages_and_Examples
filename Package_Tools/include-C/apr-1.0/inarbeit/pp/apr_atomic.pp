
unit apr_atomic;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_atomic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_atomic.h
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
Papr_uint32_t  = ^apr_uint32_t;
Papr_uint64_t  = ^apr_uint64_t;
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
{$ifndef APR_ATOMIC_H}
{$define APR_ATOMIC_H}
{*
 * @file apr_atomic.h
 * @brief APR Atomic Operations
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{ C++ extern C conditionnal removed }
{*
 * @defgroup apr_atomic Atomic Operations
 * @ingroup APR 
 * @
  }
{*
 * this function is required on some platforms to initialize the
 * atomic operation's internal structures
 * @param p pool
 * @return APR_SUCCESS on successful completion
 * @remark Programs do NOT need to call this directly. APR will call this
 *         automatically from apr_initialize().
 * @internal
  }

function apr_atomic_init(p:Papr_pool_t):Tapr_status_t;cdecl;external;
{
 * Atomic operations on 32-bit values
 * Note: Each of these functions internally implements a memory barrier
 * on platforms that require it
  }
{*
 * atomically read an apr_uint32_t from memory
 * @param mem the pointer
  }
function apr_atomic_read32(mem:Papr_uint32_t):Tapr_uint32_t;cdecl;external;
{*
 * atomically set an apr_uint32_t in memory
 * @param mem pointer to the object
 * @param val value that the object will assume
  }
procedure apr_atomic_set32(mem:Papr_uint32_t; val:Tapr_uint32_t);cdecl;external;
{*
 * atomically add 'val' to an apr_uint32_t
 * @param mem pointer to the object
 * @param val amount to add
 * @return old value pointed to by mem
  }
function apr_atomic_add32(mem:Papr_uint32_t; val:Tapr_uint32_t):Tapr_uint32_t;cdecl;external;
{*
 * atomically subtract 'val' from an apr_uint32_t
 * @param mem pointer to the object
 * @param val amount to subtract
  }
procedure apr_atomic_sub32(mem:Papr_uint32_t; val:Tapr_uint32_t);cdecl;external;
{*
 * atomically increment an apr_uint32_t by 1
 * @param mem pointer to the object
 * @return old value pointed to by mem
  }
function apr_atomic_inc32(mem:Papr_uint32_t):Tapr_uint32_t;cdecl;external;
{*
 * atomically decrement an apr_uint32_t by 1
 * @param mem pointer to the atomic value
 * @return zero if the value becomes zero on decrement, otherwise non-zero
  }
function apr_atomic_dec32(mem:Papr_uint32_t):longint;cdecl;external;
{*
 * compare an apr_uint32_t's value with 'cmp'.
 * If they are the same swap the value with 'with'
 * @param mem pointer to the value
 * @param with what to swap it with
 * @param cmp the value to compare it to
 * @return the old value of *mem
  }
function apr_atomic_cas32(mem:Papr_uint32_t; with:Tapr_uint32_t; cmp:Tapr_uint32_t):Tapr_uint32_t;cdecl;external;
{*
 * exchange an apr_uint32_t's value with 'val'.
 * @param mem pointer to the value
 * @param val what to swap it with
 * @return the old value of *mem
  }
function apr_atomic_xchg32(mem:Papr_uint32_t; val:Tapr_uint32_t):Tapr_uint32_t;cdecl;external;
{
 * Atomic operations on 64-bit values
 * Note: Each of these functions internally implements a memory barrier
 * on platforms that require it
  }
{*
 * atomically read an apr_uint64_t from memory
 * @param mem the pointer
  }
function apr_atomic_read64(mem:Papr_uint64_t):Tapr_uint64_t;cdecl;external;
{*
 * atomically set an apr_uint64_t in memory
 * @param mem pointer to the object
 * @param val value that the object will assume
  }
procedure apr_atomic_set64(mem:Papr_uint64_t; val:Tapr_uint64_t);cdecl;external;
{*
 * atomically add 'val' to an apr_uint64_t
 * @param mem pointer to the object
 * @param val amount to add
 * @return old value pointed to by mem
  }
function apr_atomic_add64(mem:Papr_uint64_t; val:Tapr_uint64_t):Tapr_uint64_t;cdecl;external;
{*
 * atomically subtract 'val' from an apr_uint64_t
 * @param mem pointer to the object
 * @param val amount to subtract
  }
procedure apr_atomic_sub64(mem:Papr_uint64_t; val:Tapr_uint64_t);cdecl;external;
{*
 * atomically increment an apr_uint64_t by 1
 * @param mem pointer to the object
 * @return old value pointed to by mem
  }
function apr_atomic_inc64(mem:Papr_uint64_t):Tapr_uint64_t;cdecl;external;
{*
 * atomically decrement an apr_uint64_t by 1
 * @param mem pointer to the atomic value
 * @return zero if the value becomes zero on decrement, otherwise non-zero
  }
function apr_atomic_dec64(mem:Papr_uint64_t):longint;cdecl;external;
{*
 * compare an apr_uint64_t's value with 'cmp'.
 * If they are the same swap the value with 'with'
 * @param mem pointer to the value
 * @param with what to swap it with
 * @param cmp the value to compare it to
 * @return the old value of *mem
  }
function apr_atomic_cas64(mem:Papr_uint64_t; with:Tapr_uint64_t; cmp:Tapr_uint64_t):Tapr_uint64_t;cdecl;external;
{*
 * exchange an apr_uint64_t's value with 'val'.
 * @param mem pointer to the value
 * @param val what to swap it with
 * @return the old value of *mem
  }
function apr_atomic_xchg64(mem:Papr_uint64_t; val:Tapr_uint64_t):Tapr_uint64_t;cdecl;external;
{*
 * compare the pointer's value with cmp.
 * If they are the same swap the value with 'with'
 * @param mem pointer to the pointer
 * @param with what to swap it with
 * @param cmp the value to compare it to
 * @return the old value of the pointer
  }
(* Const before type ignored *)
function apr_atomic_casptr(mem:Ppointer; with:pointer; cmp:pointer):pointer;cdecl;external;
{*
 * exchange a pair of pointer values
 * @param mem pointer to the pointer
 * @param with what to swap it with
 * @return the old value of the pointer
  }
function apr_atomic_xchgptr(mem:Ppointer; with:pointer):pointer;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ !APR_ATOMIC_H  }

implementation


end.
