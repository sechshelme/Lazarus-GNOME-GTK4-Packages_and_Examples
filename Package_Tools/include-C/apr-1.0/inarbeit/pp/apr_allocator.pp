
unit apr_allocator;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_allocator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_allocator.h
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
Papr_allocator_t  = ^apr_allocator_t;
Papr_memnode_t  = ^apr_memnode_t;
Papr_pool_t  = ^apr_pool_t;
Papr_thread_mutex_t  = ^apr_thread_mutex_t;
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
{$ifndef APR_ALLOCATOR_H}
{$define APR_ALLOCATOR_H}
{*
 * @file apr_allocator.h
 * @brief APR Internal Memory Allocation
  }
{$include "apr.h"}
{$include "apr_errno.h"}
{*< For no good reason?  }
{$define APR_WANT_MEMFUNC}
{$include "apr_want.h"}
{ C++ extern C conditionnal removed }
{*
 * @defgroup apr_allocator Internal Memory Allocation
 * @ingroup APR 
 * @
  }
{* the allocator structure  }
type
{* the structure which holds information about the allocation  }
{* basic memory node structure
 * @note The next, ref and first_avail fields are available for use by the
 *       caller of apr_allocator_alloc(), the remaining fields are read-only.
 *       The next field has to be used with caution and sensibly set when the
 *       memnode is passed back to apr_allocator_free().  See apr_allocator_free()
 *       for details.  
 *       The ref and first_avail fields will be properly restored by
 *       apr_allocator_free().
  }
{*< next memnode  }
{*< reference to self  }
{*< size  }
{*< how much free  }
{*< pointer to first free memory  }
{*< pointer to end of free memory  }
  Papr_memnode_t = ^Tapr_memnode_t;
  Tapr_memnode_t = record
      next : Papr_memnode_t;
      ref : ^Papr_memnode_t;
      index : Tapr_uint32_t;
      free_index : Tapr_uint32_t;
      first_avail : Pchar;
      endp : Pchar;
    end;

{* The base size of a memory node - aligned.   }

{ was #define dname def_expr }
function APR_MEMNODE_T_SIZE : longint; { return type might be wrong }

{* Symbolic constants  }
const
  APR_ALLOCATOR_MAX_FREE_UNLIMITED = 0;  

function apr_allocator_create(allocator:PPapr_allocator_t):Tapr_status_t;cdecl;external;
procedure apr_allocator_destroy(allocator:Papr_allocator_t);cdecl;external;
function apr_allocator_alloc(allocator:Papr_allocator_t; para2:Tapr_size_tsize):Papr_memnode_t;cdecl;external;
{*
 * Free a list of blocks of mem, giving them back to the allocator.
 * The list is typically terminated by a memnode with its next field
 * set to NULL.
 * @param allocator The allocator to give the mem back to
 * @param memnode The memory node to return
  }
procedure apr_allocator_free(allocator:Papr_allocator_t; memnode:Papr_memnode_t);cdecl;external;
{*
 * Get the true size that would be allocated for the given size (including
 * the header and alignment).
 * @param allocator The allocator from which to the memory would be allocated
 * @param size The size to align
 * @return The aligned size (or zero on apr_size_t overflow)
  }
function apr_allocator_align(allocator:Papr_allocator_t; size:Tapr_size_t):Tapr_size_t;cdecl;external;
{$include "apr_pools.h"}
{*
 * Set the owner of the allocator
 * @param allocator The allocator to set the owner for
 * @param pool The pool that is to own the allocator
 * @remark Typically pool is the highest level pool using the allocator
  }
{
 * XXX: see if we can come up with something a bit better.  Currently
 * you can make a pool an owner, but if the pool doesn't use the allocator
 * the allocator will never be destroyed.
  }

procedure apr_allocator_owner_set(allocator:Papr_allocator_t; pool:Papr_pool_t);cdecl;external;
{*
 * Get the current owner of the allocator
 * @param allocator The allocator to get the owner from
  }
function apr_allocator_owner_get(allocator:Papr_allocator_t):Papr_pool_t;cdecl;external;
{*
 * Set the current threshold at which the allocator should start
 * giving blocks back to the system.
 * @param allocator The allocator to set the threshold on
 * @param size The threshold.  0 == unlimited.
  }
procedure apr_allocator_max_free_set(allocator:Papr_allocator_t; size:Tapr_size_t);cdecl;external;
{$include "apr_thread_mutex.h"}
{$if APR_HAS_THREADS}
{*
 * Set a mutex for the allocator to use
 * @param allocator The allocator to set the mutex for
 * @param mutex The mutex
  }

procedure apr_allocator_mutex_set(allocator:Papr_allocator_t; mutex:Papr_thread_mutex_t);cdecl;external;
{*
 * Get the mutex currently set for the allocator
 * @param allocator The allocator
  }
function apr_allocator_mutex_get(allocator:Papr_allocator_t):Papr_thread_mutex_t;cdecl;external;
{$endif}
{ APR_HAS_THREADS  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ !APR_ALLOCATOR_H  }

implementation

{ was #define dname def_expr }
function APR_MEMNODE_T_SIZE : longint; { return type might be wrong }
  begin
    APR_MEMNODE_T_SIZE:=APR_ALIGN_DEFAULT(sizeof(apr_memnode_t));
  end;


end.
