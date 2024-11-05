/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstVideoOrientation = record
  end;
  PGstVideoOrientation = ^TGstVideoOrientation;

  TGstVideoOrientationInterface = record
    iface: TGTypeInterface;
    get_hflip: function(video_orientation: PGstVideoOrientation; flip: Pgboolean): Tgboolean; cdecl;
    get_vflip: function(video_orientation: PGstVideoOrientation; flip: Pgboolean): Tgboolean; cdecl;
    get_hcenter: function(video_orientation: PGstVideoOrientation; center: Pgint): Tgboolean; cdecl;
    get_vcenter: function(video_orientation: PGstVideoOrientation; center: Pgint): Tgboolean; cdecl;
    set_hflip: function(video_orientation: PGstVideoOrientation; flip: Tgboolean): Tgboolean; cdecl;
    set_vflip: function(video_orientation: PGstVideoOrientation; flip: Tgboolean): Tgboolean; cdecl;
    set_hcenter: function(video_orientation: PGstVideoOrientation; center: Tgint): Tgboolean; cdecl;
    set_vcenter: function(video_orientation: PGstVideoOrientation; center: Tgint): Tgboolean; cdecl;
  end;
  PGstVideoOrientationInterface = ^TGstVideoOrientationInterface;

function gst_video_orientation_get_type: TGType; cdecl; external libgstvideo;
function gst_video_orientation_get_hflip(video_orientation: PGstVideoOrientation; flip: Pgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_get_vflip(video_orientation: PGstVideoOrientation; flip: Pgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_get_hcenter(video_orientation: PGstVideoOrientation; center: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_get_vcenter(video_orientation: PGstVideoOrientation; center: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_hflip(video_orientation: PGstVideoOrientation; flip: Tgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_vflip(video_orientation: PGstVideoOrientation; flip: Tgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_hcenter(video_orientation: PGstVideoOrientation; center: Tgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_vcenter(video_orientation: PGstVideoOrientation; center: Tgint): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 30-9-24 17:49:34 ===

function GST_TYPE_VIDEO_ORIENTATION: TGType;
function GST_VIDEO_ORIENTATION(obj: Pointer): PGstVideoOrientation;
function GST_IS_VIDEO_ORIENTATION(obj: Pointer): Tgboolean;
function GST_VIDEO_ORIENTATION_GET_INTERFACE(obj: Pointer): PGstVideoOrientationInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_ORIENTATION: TGType;
begin
  GST_TYPE_VIDEO_ORIENTATION := gst_video_orientation_get_type;
end;

function GST_VIDEO_ORIENTATION(obj: Pointer): PGstVideoOrientation;
begin
  Result := PGstVideoOrientation(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_ORIENTATION));
end;

function GST_IS_VIDEO_ORIENTATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_ORIENTATION);
end;

function GST_VIDEO_ORIENTATION_GET_INTERFACE(obj: Pointer): PGstVideoOrientationInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_VIDEO_ORIENTATION);
end;



{$ENDIF read_implementation}
