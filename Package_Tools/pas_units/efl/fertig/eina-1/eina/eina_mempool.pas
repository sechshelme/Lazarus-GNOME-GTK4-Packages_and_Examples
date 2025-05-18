unit eina_mempool;

interface

uses
  ctypes, efl, eina_types, eina_error;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Mempool_Repack_Cb = procedure(dst: pointer; src: pointer; data: pointer); cdecl;

  TEina_Mempool = record
  end;
  PEina_Mempool = ^TEina_Mempool;

  TEina_Mempool_Backend = record
  end;
  PEina_Mempool_Backend = ^TEina_Mempool_Backend;

var
  EINA_ERROR_NOT_MEMPOOL_MODULE: TEina_Error; cvar;external libeina;

function eina_mempool_add(name: pchar; context: pchar; options: pchar; args: array of const): PEina_Mempool; cdecl; external libeina;
function eina_mempool_add(name: pchar; context: pchar; options: pchar): PEina_Mempool; cdecl; external libeina;
procedure eina_mempool_del(mp: PEina_Mempool); cdecl; external libeina;
procedure eina_mempool_repack(mp: PEina_Mempool; cb: TEina_Mempool_Repack_Cb; data: pointer); cdecl; external libeina;
procedure eina_mempool_gc(mp: PEina_Mempool); cdecl; external libeina;
procedure eina_mempool_statistics(mp: PEina_Mempool); cdecl; external libeina;
function eina_mempool_register(be: PEina_Mempool_Backend): TEina_Bool; cdecl; external libeina;
procedure eina_mempool_unregister(be: PEina_Mempool_Backend); cdecl; external libeina;

// === Konventiert am: 17-5-25 15:25:47 ===


implementation



end.
