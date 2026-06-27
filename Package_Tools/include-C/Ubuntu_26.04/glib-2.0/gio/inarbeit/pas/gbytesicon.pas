unit gbytesicon;

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_bytes_icon_get_type: TGType; cdecl; external libgio2;
function g_bytes_icon_new(bytes: PGBytes): PGIcon; cdecl; external libgio2;
function g_bytes_icon_get_bytes(icon: PGBytesIcon): PGBytes; cdecl; external libgio2;

// === Konventiert am: 26-6-26 16:36:32 ===

function G_TYPE_BYTES_ICON: TGType;
function G_BYTES_ICON(obj: Pointer): PGBytesIcon;
function G_IS_BYTES_ICON(obj: Pointer): Tgboolean;

implementation

function G_TYPE_BYTES_ICON: TGType;
begin
  G_TYPE_BYTES_ICON := g_bytes_icon_get_type;
end;

function G_BYTES_ICON(obj: Pointer): PGBytesIcon;
begin
  Result := PGBytesIcon(g_type_check_instance_cast(obj, G_TYPE_BYTES_ICON));
end;

function G_IS_BYTES_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_BYTES_ICON);
end;



end.
