unit shumate_scale;

interface

uses
  fp_GTK4, fp_glib2, fp_shumate, shumate_viewport;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PShumateUnit = ^TShumateUnit;
  TShumateUnit = longint;

const
  SHUMATE_UNIT_BOTH = 0;
  SHUMATE_UNIT_METRIC = 1;
  SHUMATE_UNIT_IMPERIAL = 2;

type
  TShumateScale = record
  end;
  PShumateScale = ^TShumateScale;

  TShumateScaleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PShumateScaleClass = ^TShumateScaleClass;

function shumate_scale_get_type: TGType; cdecl; external libshumate;
function shumate_scale_new(viewport: PShumateViewport): PShumateScale; cdecl; external libshumate;
function shumate_scale_get_max_width(scale: PShumateScale): Tguint; cdecl; external libshumate;
procedure shumate_scale_set_max_width(scale: PShumateScale; value: Tguint); cdecl; external libshumate;
function shumate_scale_get_unit(scale: PShumateScale): TShumateUnit; cdecl; external libshumate;
procedure shumate_scale_set_unit(scale: PShumateScale; unit_: TShumateUnit); cdecl; external libshumate;
function shumate_scale_get_viewport(scale: PShumateScale): PShumateViewport; cdecl; external libshumate;
procedure shumate_scale_set_viewport(scale: PShumateScale; viewport: PShumateViewport); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:43 ===

function SHUMATE_TYPE_SCALE: TGType;
function SHUMATE_SCALE(obj: Pointer): PShumateScale;
function SHUMATE_IS_SCALE(obj: Pointer): Tgboolean;

implementation

function SHUMATE_TYPE_SCALE: TGType;
begin
  Result := shumate_scale_get_type;
end;

function SHUMATE_SCALE(obj: Pointer): PShumateScale;
begin
  Result := PShumateScale(g_type_check_instance_cast(obj, SHUMATE_TYPE_SCALE));
end;

function SHUMATE_IS_SCALE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_SCALE);
end;


end.
