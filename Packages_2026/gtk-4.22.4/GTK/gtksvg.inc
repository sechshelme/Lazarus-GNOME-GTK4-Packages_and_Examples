
  {$IFDEF read_struct}
type
  PGtkSvg = type Pointer;

  TGtkSvgClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSvgClass = ^TGtkSvgClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_svg_get_type: TGType; cdecl; external libgtk4;
function gtk_svg_new: PGtkSvg; cdecl; external libgtk4;
function gtk_svg_new_from_bytes(bytes: PGBytes): PGtkSvg; cdecl; external libgtk4;
function gtk_svg_new_from_resource(path: pchar): PGtkSvg; cdecl; external libgtk4;
procedure gtk_svg_load_from_bytes(self: PGtkSvg; bytes: PGBytes); cdecl; external libgtk4;
procedure gtk_svg_load_from_resource(self: PGtkSvg; path: pchar); cdecl; external libgtk4;
function gtk_svg_serialize(self: PGtkSvg): PGBytes; cdecl; external libgtk4;
function gtk_svg_write_to_file(self: PGtkSvg; filename: pchar; error: PPGError): Tgboolean; cdecl; external libgtk4;
procedure gtk_svg_set_weight(self: PGtkSvg; weight: double); cdecl; external libgtk4;
function gtk_svg_get_weight(self: PGtkSvg): double; cdecl; external libgtk4;
procedure gtk_svg_set_state(self: PGtkSvg; state: dword); cdecl; external libgtk4;
function gtk_svg_get_state(self: PGtkSvg): dword; cdecl; external libgtk4;
function gtk_svg_get_state_names(self: PGtkSvg; length: Pdword): PPchar; cdecl; external libgtk4;
procedure gtk_svg_set_frame_clock(self: PGtkSvg; clock: PGdkFrameClock); cdecl; external libgtk4;
procedure gtk_svg_play(self: PGtkSvg); cdecl; external libgtk4;
procedure gtk_svg_pause(self: PGtkSvg); cdecl; external libgtk4;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PGtkSvgFeatures = ^TGtkSvgFeatures;
  TGtkSvgFeatures = longint;
const
  GTK_SVG_ANIMATIONS = 1 shl 0;
  GTK_SVG_SYSTEM_RESOURCES = 1 shl 1;
  GTK_SVG_EXTERNAL_RESOURCES = 1 shl 2;
  GTK_SVG_EXTENSIONS = 1 shl 3;
  GTK_SVG_TRADITIONAL_SYMBOLIC = 1 shl 4;

  GTK_SVG_DEFAULT_FEATURES = GTK_SVG_ANIMATIONS or GTK_SVG_SYSTEM_RESOURCES or GTK_SVG_EXTERNAL_RESOURCES or GTK_SVG_EXTENSIONS;
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure gtk_svg_set_features(self: PGtkSvg; features: TGtkSvgFeatures); cdecl; external libgtk4;
function gtk_svg_get_features(self: PGtkSvg): TGtkSvgFeatures; cdecl; external libgtk4;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PGtkSvgError = ^TGtkSvgError;
  TGtkSvgError = longint;
const
  GTK_SVG_ERROR_INVALID_SYNTAX = 0;
  GTK_SVG_ERROR_INVALID_ELEMENT = 1;
  GTK_SVG_ERROR_INVALID_ATTRIBUTE = 2;
  GTK_SVG_ERROR_MISSING_ATTRIBUTE = 3;
  GTK_SVG_ERROR_INVALID_REFERENCE = 4;
  GTK_SVG_ERROR_FAILED_UPDATE = 5;
  GTK_SVG_ERROR_FAILED_RENDERING = 6;
  GTK_SVG_ERROR_IGNORED_ELEMENT = 7;
  GTK_SVG_ERROR_LIMITS_EXCEEDED = 8;
  GTK_SVG_ERROR_NOT_IMPLEMENTED = 9;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkSvgLocation = ^TGtkSvgLocation;
  TGtkSvgLocation = record
    bytes: Tsize_t;
    lines: Tsize_t;
    line_chars: Tsize_t;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_svg_error_quark: TGQuark; cdecl; external libgtk4;
function gtk_svg_error_get_element(error: PGError): pchar; cdecl; external libgtk4;
function gtk_svg_error_get_attribute(error: PGError): pchar; cdecl; external libgtk4;
function gtk_svg_error_get_start(error: PGError): PGtkSvgLocation; cdecl; external libgtk4;
function gtk_svg_error_get_end(error: PGError): PGtkSvgLocation; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:20:11 ===

function GTK_SVG_ERROR: TGQuark;

function GTK_TYPE_SVG: TGType;
function GTK_SVG(obj: Pointer): PGtkSvg;
function GTK_IS_SVG(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GTK_TYPE_SVG: TGType;
begin
  Result := gtk_svg_get_type;
end;

function GTK_SVG(obj: Pointer): PGtkSvg;
begin
  Result := PGtkSvg(g_type_check_instance_cast(obj, GTK_TYPE_SVG));
end;

function GTK_IS_SVG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_SVG);
end;


function GTK_SVG_ERROR: TGQuark;
begin
  GTK_SVG_ERROR := gtk_svg_error_quark;
end;

{$ENDIF read_implementation}
