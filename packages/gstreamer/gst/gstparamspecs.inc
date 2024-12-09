
{$IFDEF read_interface}

const
  GST_PARAM_CONTROLLABLE = 1 shl (G_PARAM_USER_SHIFT + 1);
  GST_PARAM_MUTABLE_READY = 1 shl (G_PARAM_USER_SHIFT + 2);
  GST_PARAM_MUTABLE_PAUSED = 1 shl (G_PARAM_USER_SHIFT + 3);
  GST_PARAM_MUTABLE_PLAYING = 1 shl (G_PARAM_USER_SHIFT + 4);
  GST_PARAM_DOC_SHOW_DEFAULT = 1 shl (G_PARAM_USER_SHIFT + 5);
  GST_PARAM_CONDITIONALLY_AVAILABLE = 1 shl (G_PARAM_USER_SHIFT + 6);
  GST_PARAM_USER_SHIFT = 1 shl (G_PARAM_USER_SHIFT + 8);

function gst_param_spec_fraction_get_type: TGType; cdecl; external libgstreamer;
function gst_param_spec_array_get_type: TGType; cdecl; external libgstreamer;

type
  TGstParamSpecFraction = record
    parent_instance: TGParamSpec;
    min_num: Tgint;
    min_den: Tgint;
    max_num: Tgint;
    max_den: Tgint;
    def_num: Tgint;
    def_den: Tgint;
  end;
  PGstParamSpecFraction = ^TGstParamSpecFraction;

  TGstParamSpecArray = record
    parent_instance: TGParamSpec;
    element_spec: PGParamSpec;
  end;
  PGstParamSpecArray = ^TGstParamSpecArray;

function gst_param_specfraction_(Name: Pgchar; nick: Pgchar; blurb: Pgchar; min_num: Tgint; min_denom: Tgint;
  max_num: Tgint; max_denom: Tgint; default_num: Tgint; default_denom: Tgint; flags: TGParamFlags): PGParamSpec; cdecl; external libgstreamer;
function gst_param_spec_array(Name: Pgchar; nick: Pgchar; blurb: Pgchar; element_spec: PGParamSpec; flags: TGParamFlags): PGParamSpec; cdecl; external libgstreamer;

function GST_TYPE_PARAM_ARRAY_LIST: TGType;
function GST_PARAM_SPEC_ARRAY_LIST(pspec: Pointer): PGstParamSpecArray;
function GST_IS_PARAM_SPEC_ARRAY_LIST(pspec: Pointer): Tgboolean;

// === Konventiert am: 16-9-24 17:57:21 ===

function GST_TYPE_PARAM_FRACTION: TGType;
function GST_PARAM_SPEC_FRACTION(pspec: Pointer): PGstParamSpecFraction;
function GST_IS_PARAM_SPEC_FRACTION(pspec: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PARAM_FRACTION: TGType;
begin
  GST_TYPE_PARAM_FRACTION := gst_param_spec_fraction_get_type;
end;

function GST_PARAM_SPEC_FRACTION(pspec: Pointer): PGstParamSpecFraction;
begin
  Result := PGstParamSpecFraction(g_type_check_instance_cast(pspec, GST_TYPE_PARAM_FRACTION));
end;

function GST_IS_PARAM_SPEC_FRACTION(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GST_TYPE_PARAM_FRACTION);
end;

// ====

function GST_TYPE_PARAM_ARRAY_LIST: TGType;
begin
  GST_TYPE_PARAM_ARRAY_LIST := gst_param_spec_array_get_type;
end;

function GST_PARAM_SPEC_ARRAY_LIST(pspec: Pointer): PGstParamSpecArray;
begin
  Result := PGstParamSpecArray(g_type_check_instance_cast(pspec, GST_TYPE_PARAM_ARRAY_LIST));
end;

function GST_IS_PARAM_SPEC_ARRAY_LIST(pspec: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(pspec, GST_TYPE_PARAM_ARRAY_LIST);
end;


{$ENDIF read_implementation}
