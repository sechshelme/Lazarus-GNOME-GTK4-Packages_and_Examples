unit gdkcicpparams;

interface

uses
  fp_glib2, fp_gtk4, gdktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGdkCicpParamsClass = type Pointer;

function gdk_cicp_params_get_type: TGType; cdecl; external libgtk4;
function gdk_cicp_params_new: PGdkCicpParams; cdecl; external libgtk4;
function gdk_cicp_params_get_color_primaries(self: PGdkCicpParams): Tguint; cdecl; external libgtk4;
procedure gdk_cicp_params_set_color_primaries(self: PGdkCicpParams; color_primaries: Tguint); cdecl; external libgtk4;
function gdk_cicp_params_get_transfer_function(self: PGdkCicpParams): Tguint; cdecl; external libgtk4;
procedure gdk_cicp_params_set_transfer_function(self: PGdkCicpParams; transfer_function: Tguint); cdecl; external libgtk4;
function gdk_cicp_params_get_matrix_coefficients(self: PGdkCicpParams): Tguint; cdecl; external libgtk4;
procedure gdk_cicp_params_set_matrix_coefficients(self: PGdkCicpParams; matrix_coefficients: Tguint); cdecl; external libgtk4;

type
  PGdkCicpRange = ^TGdkCicpRange;
  TGdkCicpRange = longint;
const
  GDK_CICP_RANGE_NARROW = 0;
  GDK_CICP_RANGE_FULL = 1;

function gdk_cicp_params_get_range(self: PGdkCicpParams): TGdkCicpRange; cdecl; external libgtk4;
procedure gdk_cicp_params_set_range(self: PGdkCicpParams; range: TGdkCicpRange); cdecl; external libgtk4;
function gdk_cicp_params_build_color_state(self: PGdkCicpParams; error: PPGError): PGdkColorState; cdecl; external libgtk4;

// === Konventiert am: 2-7-26 17:35:22 ===

function GDK_TYPE_CICP_PARAMS: TGType;
function GDK_CICP_PARAMS(obj: Pointer): PGdkCicpParams;
function GDK_IS_CICP_PARAMS(obj: Pointer): Tgboolean;
function GDK_CICP_PARAMS_CLASS(klass: Pointer): PGdkCicpParamsClass;
function GDK_IS_CICP_PARAMS_CLASS(klass: Pointer): Tgboolean;
function GDK_CICP_PARAMS_GET_CLASS(obj: Pointer): PGdkCicpParamsClass;

implementation

function GDK_TYPE_CICP_PARAMS: TGType;
begin
  Result := gdk_cicp_params_get_type;
end;

function GDK_CICP_PARAMS(obj: Pointer): PGdkCicpParams;
begin
  Result := PGdkCicpParams(g_type_check_instance_cast(obj, GDK_TYPE_CICP_PARAMS));
end;

function GDK_IS_CICP_PARAMS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GDK_TYPE_CICP_PARAMS);
end;

function GDK_CICP_PARAMS_CLASS(klass: Pointer): PGdkCicpParamsClass;
begin
  Result := PGdkCicpParamsClass(g_type_check_class_cast(klass, GDK_TYPE_CICP_PARAMS));
end;

function GDK_IS_CICP_PARAMS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GDK_TYPE_CICP_PARAMS);
end;

function GDK_CICP_PARAMS_GET_CLASS(obj: Pointer): PGdkCicpParamsClass;
begin
  Result := PGdkCicpParamsClass(PGTypeInstance(obj)^.g_class);
end;


end.
