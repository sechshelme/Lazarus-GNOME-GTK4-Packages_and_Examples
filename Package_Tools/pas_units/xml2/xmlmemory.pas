unit xmlmemory;

interface

uses
  ctypes, xml2_common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PxmlFreeFunc=^TxmlFreeFunc;
  TxmlFreeFunc = procedure (mem:pointer);cdecl;

  PxmlMallocFunc = ^TxmlMallocFunc;
  TxmlMallocFunc = function (size:Tsize_t):pointer;cdecl;

  PxmlReallocFunc = ^TxmlReallocFunc;
  TxmlReallocFunc = function (mem:pointer; size:Tsize_t):pointer;cdecl;

  PxmlStrdupFunc = ^TxmlStrdupFunc;
  TxmlStrdupFunc = function (str:Pchar):Pchar;cdecl;

function xmlMemSetup(freeFunc:TxmlFreeFunc; mallocFunc:TxmlMallocFunc; reallocFunc:TxmlReallocFunc; strdupFunc:TxmlStrdupFunc):longint;cdecl;external libxml2;
function xmlMemGet(freeFunc:PxmlFreeFunc; mallocFunc:PxmlMallocFunc; reallocFunc:PxmlReallocFunc; strdupFunc:PxmlStrdupFunc):longint;cdecl;external libxml2;
function xmlGcMemSetup(freeFunc:TxmlFreeFunc; mallocFunc:TxmlMallocFunc; mallocAtomicFunc:TxmlMallocFunc; reallocFunc:TxmlReallocFunc; strdupFunc:TxmlStrdupFunc):longint;cdecl;external libxml2;
function xmlGcMemGet(freeFunc:PxmlFreeFunc; mallocFunc:PxmlMallocFunc; mallocAtomicFunc:PxmlMallocFunc; reallocFunc:PxmlReallocFunc; strdupFunc:PxmlStrdupFunc):longint;cdecl;external libxml2;

function xmlInitMemory:longint;cdecl;external libxml2;
procedure xmlCleanupMemory;cdecl;external libxml2;

function xmlMemUsed:longint;cdecl;external libxml2;
function xmlMemBlocks:longint;cdecl;external libxml2;
procedure xmlMemDisplay(fp:PFILE);cdecl;external libxml2;
procedure xmlMemDisplayLast(fp:PFILE; nbBytes:longint);cdecl;external libxml2;
procedure xmlMemShow(fp:PFILE; nr:longint);cdecl;external libxml2;
procedure xmlMemoryDump;cdecl;external libxml2;
function xmlMemMalloc(size:Tsize_t):pointer;cdecl;external libxml2;
function xmlMemRealloc(ptr:pointer; size:Tsize_t):pointer;cdecl;external libxml2;
procedure xmlMemFree(ptr:pointer);cdecl;external libxml2;
function xmlMemoryStrdup(str:Pchar):Pchar;cdecl;external libxml2;
function xmlMallocLoc(size:Tsize_t; file_:Pchar; line:longint):pointer;cdecl;external libxml2;
function xmlReallocLoc(ptr:pointer; size:Tsize_t; file_:Pchar; line:longint):pointer;cdecl;external libxml2;
function xmlMallocAtomicLoc(size:Tsize_t; file_:Pchar; line:longint):pointer;cdecl;external libxml2;
function xmlMemStrdupLoc(str:Pchar; file_:Pchar; line:longint):Pchar;cdecl;external libxml2;


// === Konventiert am: 28-2-25 17:57:35 ===


implementation


end.
