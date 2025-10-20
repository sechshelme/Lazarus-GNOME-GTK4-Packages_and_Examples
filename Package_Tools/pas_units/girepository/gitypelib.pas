unit gitypelib;

interface

uses
  fp_glib2, fp_girepository;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGITypelib = type Pointer;

function g_typelib_new_from_memory(memory: Pguint8; len: Tgsize; error: PPGError): PGITypelib; cdecl; external libgirepository;
function g_typelib_new_from_const_memory(memory: Pguint8; len: Tgsize; error: PPGError): PGITypelib; cdecl; external libgirepository;
function g_typelib_new_from_mapped_file(mfile: PGMappedFile; error: PPGError): PGITypelib; cdecl; external libgirepository;
procedure g_typelib_free(typelib: PGITypelib); cdecl; external libgirepository;
function g_typelib_symbol(typelib: PGITypelib; symbol_name: Pgchar; symbol: Pgpointer): Tgboolean; cdecl; external libgirepository;
function g_typelib_get_namespace(typelib: PGITypelib): Pgchar; cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:23 ===


implementation



end.
