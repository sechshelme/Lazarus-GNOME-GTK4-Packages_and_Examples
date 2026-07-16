unit video_hdr;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstVideoMasteringDisplayInfoCoordinates = ^TGstVideoMasteringDisplayInfoCoordinates;
  TGstVideoMasteringDisplayInfoCoordinates = record
    x: Tguint16;
    y: Tguint16;
  end;

  PGstVideoMasteringDisplayInfo = ^TGstVideoMasteringDisplayInfo;
  TGstVideoMasteringDisplayInfo = record
    display_primaries: array[0..2] of TGstVideoMasteringDisplayInfoCoordinates;
    white_point: TGstVideoMasteringDisplayInfoCoordinates;
    max_display_mastering_luminance: Tguint32;
    min_display_mastering_luminance: Tguint32;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstVideoContentLightLevel = ^TGstVideoContentLightLevel;
  TGstVideoContentLightLevel = record
    max_content_light_level: Tguint16;
    max_frame_average_light_level: Tguint16;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure gst_video_mastering_display_info_init(minfo: PGstVideoMasteringDisplayInfo); cdecl; external libgstvideo;
function gst_video_mastering_display_info_from_string(minfo: PGstVideoMasteringDisplayInfo; mastering: Pgchar): Tgboolean; cdecl; external libgstvideo;
function gst_video_mastering_display_info_to_string(minfo: PGstVideoMasteringDisplayInfo): Pgchar; cdecl; external libgstvideo;
function gst_video_mastering_display_info_is_equal(minfo: PGstVideoMasteringDisplayInfo; other: PGstVideoMasteringDisplayInfo): Tgboolean; cdecl; external libgstvideo;
function gst_video_mastering_display_info_from_caps(minfo: PGstVideoMasteringDisplayInfo; caps: PGstCaps): Tgboolean; cdecl; external libgstvideo;
function gst_video_mastering_display_info_add_to_caps(minfo: PGstVideoMasteringDisplayInfo; caps: PGstCaps): Tgboolean; cdecl; external libgstvideo;

procedure gst_video_content_light_level_init(linfo: PGstVideoContentLightLevel); cdecl; external libgstvideo;
function gst_video_content_light_level_from_string(linfo: PGstVideoContentLightLevel; level: Pgchar): Tgboolean; cdecl; external libgstvideo;
function gst_video_content_light_level_to_string(linfo: PGstVideoContentLightLevel): Pgchar; cdecl; external libgstvideo;
function gst_video_content_light_level_is_equal(linfo: PGstVideoContentLightLevel; other: PGstVideoContentLightLevel): Tgboolean; cdecl; external libgstvideo;
function gst_video_content_light_level_from_caps(linfo: PGstVideoContentLightLevel; caps: PGstCaps): Tgboolean; cdecl; external libgstvideo;
function gst_video_content_light_level_add_to_caps(linfo: PGstVideoContentLightLevel; caps: PGstCaps): Tgboolean; cdecl; external libgstvideo;
{$ENDIF read_function}

// === Konventiert am: 15-7-26 13:35:46 ===


implementation



end.
