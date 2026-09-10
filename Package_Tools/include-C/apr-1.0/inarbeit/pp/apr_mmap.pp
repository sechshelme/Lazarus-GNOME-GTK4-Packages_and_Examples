
unit apr_mmap;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_mmap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_mmap.h
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
Papr_file_t  = ^apr_file_t;
Papr_mmap_t  = ^apr_mmap_t;
Papr_pool_t  = ^apr_pool_t;
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
{$ifndef APR_MMAP_H}
{$define APR_MMAP_H}
{*
 * @file apr_mmap.h
 * @brief APR MMAP routines
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_errno.h"}
{$include "apr_ring.h"}
{$include "apr_file_io.h"        /* for apr_file_t */}
{$ifdef BEOS}
{$include <kernel/OS.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_mmap MMAP (Memory Map) Routines
 * @ingroup APR 
 * @
  }
{* MMap opened for reading  }

const
  APR_MMAP_READ = 1;  
{* MMap opened for writing  }
  APR_MMAP_WRITE = 2;  
{* @see apr_mmap_t  }
type
{*
 * @remark
 * As far as I can tell the only really sane way to store an MMAP is as a
 * void * and a length.  BeOS requires this area_id, but that's just a little
 * something extra.  I am exposing this type, because it doesn't make much
 * sense to keep it private, and opening it up makes some stuff easier in
 * Apache.
  }
{* The MMAP structure  }
  Papr_mmap_t = ^Tapr_mmap_t;
  Tapr_mmap_t = record
      xxxxxxxxxxxxxxxxxxxx : longint;
    end;

{$if APR_HAS_MMAP || defined(DOXYGEN)}
{* @def APR_MMAP_THRESHOLD 
 * Files have to be at least this big before they're mmap()d.  This is to deal
 * with systems where the expense of doing an mmap() and an munmap() outweighs
 * the benefit for small files.  It shouldn't be set lower than 1.
  }
{$ifdef MMAP_THRESHOLD}

const
  APR_MMAP_THRESHOLD = MMAP_THRESHOLD;  
{$else}
{$ifdef SUNOS4}

const
  APR_MMAP_THRESHOLD = 8*1024;  
{$else}

const
  APR_MMAP_THRESHOLD = 1;  
{$endif}
{ SUNOS4  }
{$endif}
{ MMAP_THRESHOLD  }
{* @def APR_MMAP_LIMIT
 * Maximum size of MMap region
  }
{$ifdef MMAP_LIMIT}

const
  APR_MMAP_LIMIT = MMAP_LIMIT;  
{$else}

const
  APR_MMAP_LIMIT = (4*1024)*1024;  
{$endif}
{ MMAP_LIMIT  }
{* Can this file be MMaped  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function APR_MMAP_CANDIDATE(filelength : longint) : longint;

{   Function definitions  }
{* 
 * Create a new mmap'ed file out of an existing APR file.
 * @param newmmap The newly created mmap'ed file.
 * @param file The file to turn into an mmap.
 * @param offset The offset into the file to start the data pointer at.
 * @param size The size of the file
 * @param flag bit-wise or of:
 * <PRE>
 *          APR_MMAP_READ       MMap opened for reading
 *          APR_MMAP_WRITE      MMap opened for writing
 * </PRE>
 * @param cntxt The pool to use when creating the mmap.
  }
function apr_mmap_create(newmmap:PPapr_mmap_t; file:Papr_file_t; offset:Tapr_off_t; size:Tapr_size_t; flag:Tapr_int32_t; 
           cntxt:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Duplicate the specified MMAP.
 * @param new_mmap The structure to duplicate into. 
 * @param old_mmap The mmap to duplicate.
 * @param p The pool to use for new_mmap.
  }function apr_mmap_dup(new_mmap:PPapr_mmap_t; old_mmap:Papr_mmap_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Remove a mmap'ed.
 * @param mm The mmap'ed file.
  }
function apr_mmap_delete(mm:Papr_mmap_t):Tapr_status_t;cdecl;external;
{* 
 * Move the pointer into the mmap'ed file to the specified offset.
 * @param addr The pointer to the offset specified.
 * @param mm The mmap'ed file.
 * @param offset The offset to move to.
  }
function apr_mmap_offset(addr:Ppointer; mm:Papr_mmap_t; offset:Tapr_off_t):Tapr_status_t;cdecl;external;
{$endif}
{ APR_HAS_MMAP  }
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_MMAP_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function APR_MMAP_CANDIDATE(filelength : longint) : longint;
begin
  APR_MMAP_CANDIDATE:=(filelength>=APR_MMAP_THRESHOLD) and (@(filelength<APR_MMAP_LIMIT));
end;


end.
