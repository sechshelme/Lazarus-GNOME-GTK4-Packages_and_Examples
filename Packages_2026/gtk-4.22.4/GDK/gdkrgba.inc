{$IFDEF read_interface}


type
  PGdkRGBA = ^TGdkRGBA;
  TGdkRGBA = record
    red: single;
    green: single;
    blue: single;
    alpha: single;
  end;

function gdk_rgba_get_type: TGType; cdecl; external libgtk4;
function gdk_rgba_copy(rgba: PGdkRGBA): PGdkRGBA; cdecl; external libgtk4;
procedure gdk_rgba_free(rgba: PGdkRGBA); cdecl; external libgtk4;
function gdk_rgba_is_clear(rgba: PGdkRGBA): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_is_opaque(rgba: PGdkRGBA): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_hash(p: Tgconstpointer): Tguint; cdecl; external libgtk4;
function gdk_rgba_equal(p1: Tgconstpointer; p2: Tgconstpointer): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_parse(rgba: PGdkRGBA; spec: pchar): Tgboolean; cdecl; external libgtk4;
function gdk_rgba_to_string(rgba: PGdkRGBA): pchar; cdecl; external libgtk4;
function gdk_rgba_print(rgba: PGdkRGBA; _string: PGString): PGString; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 19:26:33 ===

function GDK_TYPE_RGBA: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GDK_TYPE_RGBA: TGType;
begin
  GDK_TYPE_RGBA := gdk_rgba_get_type;
end;



{$ENDIF read_implementation}
