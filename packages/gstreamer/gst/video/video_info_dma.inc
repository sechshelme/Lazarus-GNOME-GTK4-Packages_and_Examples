/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstVideoInfoDmaDrm = record
    vinfo: TGstVideoInfo;
    drm_fourcc: Tguint32;
    drm_modifier: Tguint64;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tguint32;
  end;
  PGstVideoInfoDmaDrm = ^TGstVideoInfoDmaDrm;

function gst_video_info_dma_drm_get_type: TGType; cdecl; external libgstvideo;
procedure gst_video_info_dma_drm_free(drm_info: PGstVideoInfoDmaDrm); cdecl; external libgstvideo;
procedure gst_video_info_dma_drm_init(drm_info: PGstVideoInfoDmaDrm); cdecl; external libgstvideo;
function gst_video_info_dma_drm_new: PGstVideoInfoDmaDrm; cdecl; external libgstvideo;
function gst_video_info_dma_drm_to_caps(drm_info: PGstVideoInfoDmaDrm): PGstCaps; cdecl; external libgstvideo;
function gst_video_info_dma_drm_from_caps(drm_info: PGstVideoInfoDmaDrm; caps: PGstCaps): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_dma_drm_from_video_info(drm_info: PGstVideoInfoDmaDrm; info: PGstVideoInfo; modifier: Tguint64): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_dma_drm_to_video_info(drm_info: PGstVideoInfoDmaDrm; info: PGstVideoInfo): Tgboolean; cdecl; external libgstvideo;
function gst_video_info_dma_drm_new_from_caps(caps: PGstCaps): PGstVideoInfoDmaDrm; cdecl; external libgstvideo;
function gst_video_is_dma_drm_caps(caps: PGstCaps): Tgboolean; cdecl; external libgstvideo;
function gst_video_dma_drm_fourcc_from_string(format_str: Pgchar; modifier: Pguint64): Tguint32; cdecl; external libgstvideo;
function gst_video_dma_drm_fourcc_to_string(fourcc: Tguint32; modifier: Tguint64): Pgchar; cdecl; external libgstvideo;
function gst_video_dma_drm_fourcc_from_format(format: TGstVideoFormat): Tguint32; cdecl; external libgstvideo;
function gst_video_dma_drm_fourcc_to_format(fourcc: Tguint32): TGstVideoFormat; cdecl; external libgstvideo;

function GST_TYPE_VIDEO_INFO_DMA_DRM: TGType;

// === Konventiert am: 30-9-24 17:31:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_INFO_DMA_DRM: TGType;
begin
  GST_TYPE_VIDEO_INFO_DMA_DRM := gst_video_info_dma_drm_get_type;
end;


{$ENDIF read_implementation}
