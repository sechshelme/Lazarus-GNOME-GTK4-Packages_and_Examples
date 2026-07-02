{$IFDEF read_interface}


type
  PGITypelib = type Pointer;

function gi_typelib_get_type: TGType; cdecl; external libgirepository2;
function gi_typelib_new_from_bytes(bytes: PGBytes; error: PPGError): PGITypelib; cdecl; external libgirepository2;
function gi_typelib_ref(typelib: PGITypelib): PGITypelib; cdecl; external libgirepository2;
procedure gi_typelib_unref(typelib: PGITypelib); cdecl; external libgirepository2;
function gi_typelib_symbol(typelib: PGITypelib; symbol_name: pchar; symbol: Ppointer): Tgboolean; cdecl; external libgirepository2;
function gi_typelib_get_namespace(typelib: PGITypelib): pchar; cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:36:55 ===

function GI_TYPE_TYPELIB: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GI_TYPE_TYPELIB: TGType;
begin
  GI_TYPE_TYPELIB := gi_typelib_get_type;
end;



{$ENDIF read_implementation}
