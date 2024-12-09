
{$IFDEF read_interface}

type
  TGstPreset = record
  end;
  PGstPreset = ^TGstPreset;

  TGstPresetInterface = record
    parent: TGTypeInterface;
    get_preset_names: function(preset: PGstPreset): PPgchar; cdecl;
    get_property_names: function(preset: PGstPreset): PPgchar; cdecl;
    load_preset: function(preset: PGstPreset; Name: Pgchar): Tgboolean; cdecl;
    save_preset: function(preset: PGstPreset; Name: Pgchar): Tgboolean; cdecl;
    rename_preset: function(preset: PGstPreset; old_name: Pgchar; new_name: Pgchar): Tgboolean; cdecl;
    delete_preset: function(preset: PGstPreset; Name: Pgchar): Tgboolean; cdecl;
    set_meta: function(preset: PGstPreset; Name: Pgchar; tag: Pgchar; Value: Pgchar): Tgboolean; cdecl;
    get_meta: function(preset: PGstPreset; Name: Pgchar; tag: Pgchar; Value: PPgchar): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstPresetInterface = ^TGstPresetInterface;


function gst_preset_get_type: TGType; cdecl; external libgstreamer;
function gst_preset_get_preset_names(preset: PGstPreset): PPgchar; cdecl; external libgstreamer;
function gst_preset_get_property_names(preset: PGstPreset): PPgchar; cdecl; external libgstreamer;
function gst_preset_load_preset(preset: PGstPreset; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_preset_save_preset(preset: PGstPreset; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_preset_rename_preset(preset: PGstPreset; old_name: Pgchar; new_name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_preset_delete_preset(preset: PGstPreset; Name: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_preset_set_meta(preset: PGstPreset; Name: Pgchar; tag: Pgchar; Value: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_preset_get_meta(preset: PGstPreset; Name: Pgchar; tag: Pgchar; Value: PPgchar): Tgboolean; cdecl; external libgstreamer;
function gst_preset_set_app_dir(app_dir: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_preset_get_app_dir: Pgchar; cdecl; external libgstreamer;
function gst_preset_is_editable(preset: PGstPreset): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 17-9-24 15:42:59 ===

function GST_TYPE_PRESET: TGType;
function GST_PRESET(obj: Pointer): PGstPreset;
function GST_IS_PRESET(obj: Pointer): Tgboolean;
function GST_PRESET_GET_INTERFACE(obj: Pointer): PGstPresetInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_PRESET: TGType;
begin
  GST_TYPE_PRESET := gst_preset_get_type;
end;

function GST_PRESET(obj: Pointer): PGstPreset;
begin
  Result := PGstPreset(g_type_check_instance_cast(obj, GST_TYPE_PRESET));
end;

function GST_IS_PRESET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PRESET);
end;

function GST_PRESET_GET_INTERFACE(obj: Pointer): PGstPresetInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_PRESET);
end;



{$ENDIF read_implementation}
