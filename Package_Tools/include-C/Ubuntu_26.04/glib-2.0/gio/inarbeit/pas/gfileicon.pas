unit gfileicon;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, giotypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGFileIconClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_file_icon_get_type: TGType; cdecl; external libgio2;
function g_file_icon_new(file_: PGFile): PGIcon; cdecl; external libgio2;
function g_file_icon_get_file(icon: PGFileIcon): PGFile; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:22:07 ===

function G_TYPE_FILE_ICON: TGType;
function G_FILE_ICON(obj: Pointer): PGFileIcon;
function G_FILE_ICON_CLASS(klass: Pointer): PGFileIconClass;
function G_IS_FILE_ICON(obj: Pointer): Tgboolean;
function G_IS_FILE_ICON_CLASS(klass: Pointer): Tgboolean;
function G_FILE_ICON_GET_CLASS(obj: Pointer): PGFileIconClass;
{$ENDIF read_function}

implementation

function G_TYPE_FILE_ICON: TGType;
begin
  G_TYPE_FILE_ICON := g_file_icon_get_type;
end;

function G_FILE_ICON(obj: Pointer): PGFileIcon;
begin
  Result := PGFileIcon(g_type_check_instance_cast(obj, G_TYPE_FILE_ICON));
end;

function G_FILE_ICON_CLASS(klass: Pointer): PGFileIconClass;
begin
  Result := PGFileIconClass(g_type_check_class_cast(klass, G_TYPE_FILE_ICON));
end;

function G_IS_FILE_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_ICON);
end;

function G_IS_FILE_ICON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_ICON);
end;

function G_FILE_ICON_GET_CLASS(obj: Pointer): PGFileIconClass;
begin
  Result := PGFileIconClass(PGTypeInstance(obj)^.g_class);
end;



end.
