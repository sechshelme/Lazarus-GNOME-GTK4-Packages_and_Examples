{$IFDEF read_interface}


type
  PGstWlOutput = type Pointer;

  TGstWlOutputClass = record
    parent_class: TGObjectClass;
  end;
  PGstWlOutputClass = ^TGstWlOutputClass;

function gst_wl_output_get_type: TGType; cdecl; external libgstwayland;
function gst_wl_output_get_wl_output(self: PGstWlOutput): Pwl_output; cdecl; external libgstwayland;
function gst_wl_output_get_id(self: PGstWlOutput): Tguint32; cdecl; external libgstwayland;
function gst_wl_output_get_name(self: PGstWlOutput): Pgchar; cdecl; external libgstwayland;
procedure gst_wl_output_info(self: PGstWlOutput); cdecl; external libgstwayland;
function gst_wl_output_get_decscription(self: PGstWlOutput): Pgchar; cdecl; external libgstwayland;
function gst_wl_output_get_make(self: PGstWlOutput): Pgchar; cdecl; external libgstwayland;
function gst_wl_output_get_model(self: PGstWlOutput): Pgchar; cdecl; external libgstwayland;
function gst_wl_output_get_scale(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;
function gst_wl_output_get_x(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;
function gst_wl_output_get_y(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;
function gst_wl_output_get_physical_width(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;
function gst_wl_output_get_physical_height(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;
function gst_wl_output_get_subpixel(self: PGstWlOutput): Twl_output_subpixel; cdecl; external libgstwayland;
function gst_wl_output_get_transform(self: PGstWlOutput): Twl_output_transform; cdecl; external libgstwayland;
function gst_wl_output_get_mode_flags(self: PGstWlOutput): Tguint; cdecl; external libgstwayland;
function gst_wl_output_get_width(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;
function gst_wl_output_get_height(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;
function gst_wl_output_get_refresh(self: PGstWlOutput): Tgint; cdecl; external libgstwayland;

// === Konventiert am: 23-7-26 19:12:57 ===

function GST_TYPE_WL_OUTPUT: TGType;
function GST_WL_OUTPUT(obj: Pointer): PGstWlOutput;
function GST_IS_WL_OUTPUT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_WL_OUTPUT: TGType;
begin
  Result := gst_wl_output_get_type;
end;

function GST_WL_OUTPUT(obj: Pointer): PGstWlOutput;
begin
  Result := PGstWlOutput(g_type_check_instance_cast(obj, GST_TYPE_WL_OUTPUT));
end;

function GST_IS_WL_OUTPUT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_WL_OUTPUT);
end;

{$ENDIF read_implementation}
