unit memory_;

interface

uses
  fp_magiccore;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.

  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at

    https://imagemagick.org/script/license.php

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore memory methods.
 }
{$ifndef MAGICKCORE_MEMORY_H}
{$define MAGICKCORE_MEMORY_H}
{$include <errno.h>}
type

  PAcquireMemoryHandler = ^TAcquireMemoryHandler;
  TAcquireMemoryHandler = function (para1:Tsize_t):pointer;cdecl;

  TDestroyMemoryHandler = procedure (para1:pointer);cdecl;

  PResizeMemoryHandler = ^TResizeMemoryHandler;
  TResizeMemoryHandler = function (para1:pointer; para2:Tsize_t):pointer;cdecl;

  PAcquireAlignedMemoryHandler = ^TAcquireAlignedMemoryHandler;
  TAcquireAlignedMemoryHandler = function (para1:Tsize_t; para2:Tsize_t):pointer;cdecl;

  TRelinquishAlignedMemoryHandler = procedure (para1:pointer);cdecl;

function AcquireVirtualMemory(para1:Tsize_t; para2:Tsize_t):PMemoryInfo;cdecl;external libmagiccore;
function RelinquishVirtualMemory(para1:PMemoryInfo):PMemoryInfo;cdecl;external libmagiccore;
function GetMaxMemoryRequest:Tsize_t;cdecl;external libmagiccore;
function AcquireAlignedMemory(para1:Tsize_t; para2:Tsize_t):pointer;cdecl;external libmagiccore;
function AcquireMagickMemory(para1:Tsize_t):pointer;cdecl;external libmagiccore;
function AcquireCriticalMemory(para1:Tsize_t):pointer;cdecl;external libmagiccore;
function AcquireQuantumMemory(para1:Tsize_t; para2:Tsize_t):pointer;cdecl;external libmagiccore;
function CopyMagickMemory(magick_restrict:pointer; magick_restrict:pointer; para3:Tsize_t):pointer;cdecl;external libmagiccore;
procedure DestroyMagickMemory;cdecl;external libmagiccore;
procedure GetMagickMemoryMethods(para1:PAcquireMemoryHandler; para2:PResizeMemoryHandler; para3:PDestroyMemoryHandler);cdecl;external libmagiccore;
function GetVirtualMemoryBlob(para1:PMemoryInfo):pointer;cdecl;external libmagiccore;
function RelinquishAlignedMemory(para1:pointer):pointer;cdecl;external libmagiccore;
function RelinquishMagickMemory(para1:pointer):pointer;cdecl;external libmagiccore;
function ResetMagickMemory(para1:pointer; para2:longint; para3:Tsize_t):pointer;cdecl;external libmagiccore;
function ResizeMagickMemory(para1:pointer; para2:Tsize_t):pointer;cdecl;external libmagiccore;
function ResizeQuantumMemory(para1:pointer; para2:Tsize_t; para3:Tsize_t):pointer;cdecl;external libmagiccore;
procedure SetMagickAlignedMemoryMethods(para1:TAcquireAlignedMemoryHandler; para2:TRelinquishAlignedMemoryHandler);cdecl;external libmagiccore;
procedure SetMagickMemoryMethods(para1:TAcquireMemoryHandler; para2:TResizeMemoryHandler; para3:TDestroyMemoryHandler);cdecl;external libmagiccore;
{xxxxxxxxxxxxxxxx
static inline MagickBooleanType HeapOverflowSanityCheck(
  const size_t count,const size_t quantum)

  if ((count == 0) || (quantum == 0))
    return(MagickTrue);
  if (quantum != ((count*quantum)/count))
    
      errno=ENOMEM;
      return(MagickTrue);
    
  return(MagickFalse);


static inline MagickBooleanType HeapOverflowSanityCheckGetSize(
  const size_t count,const size_t quantum,size_t *const extent)

  size_t
    length;

  if ((count == 0) || (quantum == 0))
    return(MagickTrue);
  length=count*quantum;
  if (quantum != (length/count))
    
      errno=ENOMEM;
      return(MagickTrue);
    
  if (extent != (size_t *) NULL)
    *extent=length;
  return(MagickFalse);

 }

// === Konventiert am: 6-1-26 15:03:26 ===


implementation



end.
