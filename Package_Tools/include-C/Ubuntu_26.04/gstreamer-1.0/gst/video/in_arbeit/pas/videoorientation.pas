unit videoorientation;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGstVideoOrientation = type Pointer;

  PGstVideoOrientationInterface = ^TGstVideoOrientationInterface;
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
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_orientation_get_type: TGType; cdecl; external libgstvideo;
function gst_video_orientation_get_hflip(video_orientation: PGstVideoOrientation; flip: Pgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_get_vflip(video_orientation: PGstVideoOrientation; flip: Pgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_get_hcenter(video_orientation: PGstVideoOrientation; center: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_get_vcenter(video_orientation: PGstVideoOrientation; center: Pgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_hflip(video_orientation: PGstVideoOrientation; flip: Tgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_vflip(video_orientation: PGstVideoOrientation; flip: Tgboolean): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_hcenter(video_orientation: PGstVideoOrientation; center: Tgint): Tgboolean; cdecl; external libgstvideo;
function gst_video_orientation_set_vcenter(video_orientation: PGstVideoOrientation; center: Tgint): Tgboolean; cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:39:27 ===

function GST_TYPE_VIDEO_ORIENTATION: TGType;
function GST_VIDEO_ORIENTATION(obj: Pointer): PGstVideoOrientation;
function GST_IS_VIDEO_ORIENTATION(obj: Pointer): Tgboolean;
function GST_VIDEO_ORIENTATION_GET_INTERFACE(obj: Pointer): PGstVideoOrientationInterface;
{$ENDIF read_function}

implementation

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



end.
