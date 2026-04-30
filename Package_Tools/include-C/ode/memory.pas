unit memory;

interface

uses
  fp_ode;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{ this comes from the `reuse' library. copy any changes back to the source  }
{$ifndef _ODE_MEMORY_H_}
{$define _ODE_MEMORY_H_}
{$include <ode/odeconfig.h>}
{ C++ extern C conditionnal removed }
{ function types to allocate and free memory  }
type
  PdAllocFunction = ^TdAllocFunction;
  TdAllocFunction = function (size:Tdsizeint):pointer;cdecl;

  PdReallocFunction = ^TdReallocFunction;
  TdReallocFunction = function (ptr:pointer; oldsize:Tdsizeint; newsize:Tdsizeint):pointer;cdecl;

  TdFreeFunction = procedure (ptr:pointer; size:Tdsizeint);cdecl;
{ set new memory management functions. if fn is 0, the default handlers are
 * used.  }

procedure dSetAllocHandler(fn:PdAllocFunction);cdecl;external libodes;
procedure dSetReallocHandler(fn:PdReallocFunction);cdecl;external libodes;
procedure dSetFreeHandler(fn:PdFreeFunction);cdecl;external libodes;
{ get current memory management functions  }
function dGetAllocHandler:PdAllocFunction;cdecl;external libodes;
function dGetReallocHandler:PdReallocFunction;cdecl;external libodes;
function dGetFreeHandler:PdFreeFunction;cdecl;external libodes;
{ allocate and free memory.  }
function dAlloc(size:Tdsizeint):pointer;cdecl;external libodes;
function dRealloc(ptr:pointer; oldsize:Tdsizeint; newsize:Tdsizeint):pointer;cdecl;external libodes;
procedure dFree(ptr:pointer; size:Tdsizeint);cdecl;external libodes;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 30-4-26 17:09:36 ===


implementation



end.
