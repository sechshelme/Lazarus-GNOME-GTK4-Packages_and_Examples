/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstVideoOverlayFormatFlags = ^TGstVideoOverlayFormatFlags;
  TGstVideoOverlayFormatFlags = longint;

const
  GST_VIDEO_OVERLAY_FORMAT_FLAG_NONE = 0;
  GST_VIDEO_OVERLAY_FORMAT_FLAG_PREMULTIPLIED_ALPHA = 1 shl 0;
  GST_VIDEO_OVERLAY_FORMAT_FLAG_GLOBAL_ALPHA = 1 shl 1;

const
  GST_CAPS_FEATURE_META_GST_VIDEO_OVERLAY_COMPOSITION = 'meta:GstVideoOverlayComposition';

const
  GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_RGB = GST_VIDEO_FORMAT_BGRA;
  GST_VIDEO_OVERLAY_COMPOSITION_FORMAT_YUV = GST_VIDEO_FORMAT_AYUV;
  //  GST_VIDEO_OVERLAY_COMPOSITION_BLEND_FORMATS = GST_VIDEO_FORMATS_ALL;

type
  TGstVideoOverlayRectangle = record
  end;
  PGstVideoOverlayRectangle = ^TGstVideoOverlayRectangle;

function gst_video_overlay_rectangle_get_type: TGType; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_new_raw(pixels: PGstBuffer; render_x: Tgint; render_y: Tgint; render_width: Tguint; render_height: Tguint;
  flags: TGstVideoOverlayFormatFlags): PGstVideoOverlayRectangle; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_copy(rectangle: PGstVideoOverlayRectangle): PGstVideoOverlayRectangle; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_seqnum(rectangle: PGstVideoOverlayRectangle): Tguint; cdecl; external libgstvideo;
procedure gst_video_overlay_rectangle_set_render_rectangle(rectangle: PGstVideoOverlayRectangle; render_x: Tgint; render_y: Tgint; render_width: Tguint; render_height: Tguint); cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_render_rectangle(rectangle: PGstVideoOverlayRectangle; render_x: Pgint; render_y: Pgint; render_width: Pguint; render_height: Pguint): Tgboolean; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_raw(rectangle: PGstVideoOverlayRectangle; flags: TGstVideoOverlayFormatFlags): PGstBuffer; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_argb(rectangle: PGstVideoOverlayRectangle; flags: TGstVideoOverlayFormatFlags): PGstBuffer; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_ayuv(rectangle: PGstVideoOverlayRectangle; flags: TGstVideoOverlayFormatFlags): PGstBuffer; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_unscaled_raw(rectangle: PGstVideoOverlayRectangle; flags: TGstVideoOverlayFormatFlags): PGstBuffer; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_unscaled_argb(rectangle: PGstVideoOverlayRectangle; flags: TGstVideoOverlayFormatFlags): PGstBuffer; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_pixels_unscaled_ayuv(rectangle: PGstVideoOverlayRectangle; flags: TGstVideoOverlayFormatFlags): PGstBuffer; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_flags(rectangle: PGstVideoOverlayRectangle): TGstVideoOverlayFormatFlags; cdecl; external libgstvideo;
function gst_video_overlay_rectangle_get_global_alpha(rectangle: PGstVideoOverlayRectangle): Tgfloat; cdecl; external libgstvideo;
procedure gst_video_overlay_rectangle_set_global_alpha(rectangle: PGstVideoOverlayRectangle; global_alpha: Tgfloat); cdecl; external libgstvideo;

type
  TGstVideoOverlayComposition = record
  end;
  PGstVideoOverlayComposition = ^TGstVideoOverlayComposition;

function gst_video_overlay_composition_get_type: TGType; cdecl; external libgstvideo;
function gst_video_overlay_composition_copy(comp: PGstVideoOverlayComposition): PGstVideoOverlayComposition; cdecl; external libgstvideo;
function gst_video_overlay_composition_make_writable(comp: PGstVideoOverlayComposition): PGstVideoOverlayComposition; cdecl; external libgstvideo;
function gst_video_overlay_composition_new(rectangle: PGstVideoOverlayRectangle): PGstVideoOverlayComposition; cdecl; external libgstvideo;
procedure gst_video_overlay_composition_add_rectangle(comp: PGstVideoOverlayComposition; rectangle: PGstVideoOverlayRectangle); cdecl; external libgstvideo;
function gst_video_overlay_composition_n_rectangles(comp: PGstVideoOverlayComposition): Tguint; cdecl; external libgstvideo;
function gst_video_overlay_composition_get_rectangle(comp: PGstVideoOverlayComposition; n: Tguint): PGstVideoOverlayRectangle; cdecl; external libgstvideo;
function gst_video_overlay_composition_get_seqnum(comp: PGstVideoOverlayComposition): Tguint; cdecl; external libgstvideo;
function gst_video_overlay_composition_blend(comp: PGstVideoOverlayComposition; video_buf: PGstVideoFrame): Tgboolean; cdecl; external libgstvideo;

type
  PGstVideoOverlayCompositionMeta = ^TGstVideoOverlayCompositionMeta;

  TGstVideoOverlayCompositionMeta = record
    meta: TGstMeta;
    overlay: PGstVideoOverlayComposition;
  end;


function gst_video_overlay_composition_meta_api_get_type: TGType; cdecl; external libgstvideo;
function gst_video_overlay_composition_meta_get_info: PGstMetaInfo; cdecl; external libgstvideo;
function gst_buffer_add_video_overlay_composition_meta(buf: PGstBuffer; comp: PGstVideoOverlayComposition): PGstVideoOverlayCompositionMeta; cdecl; external libgstvideo;

function GST_TYPE_VIDEO_OVERLAY_RECTANGLE: TGType;
function GST_VIDEO_OVERLAY_RECTANGLE(obj: Pointer): PGstVideoOverlayRectangle;
function GST_IS_VIDEO_OVERLAY_RECTANGLE(obj: Pointer): Tgboolean;
function GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj: Pointer): PGstVideoOverlayRectangle;

function GST_TYPE_VIDEO_OVERLAY_COMPOSITION: TGType;
function GST_VIDEO_OVERLAY_COMPOSITION(obj: Pointer): PGstVideoOverlayComposition;
function GST_IS_VIDEO_OVERLAY_COMPOSITION(obj: Pointer): Tgboolean;
function GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj: Pointer): PGstVideoOverlayComposition;

function GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE: TGType;
function GST_VIDEO_OVERLAY_COMPOSITION_META_INFO: PGstMetaInfo;

function gst_buffer_get_video_overlay_composition_meta(b: PGstBuffer): PGstVideoOverlayCompositionMeta;
function gst_buffer_remove_video_overlay_composition_meta(b: PGstBuffer; m: Pointer): Tgboolean;


// === Konventiert am: 30-9-24 17:08:38 ===

function gst_video_overlay_rectangle_ref(comp: PGstVideoOverlayRectangle): PGstVideoOverlayRectangle;
procedure gst_video_overlay_rectangle_unref(comp: PGstVideoOverlayRectangle);

function gst_video_overlay_composition_ref(comp: PGstVideoOverlayComposition): PGstVideoOverlayComposition;
procedure gst_video_overlay_composition_unref(comp: PGstVideoOverlayComposition);


{$ENDIF read_interface}


{$IFDEF read_implementation}


function gst_video_overlay_rectangle_ref(comp: PGstVideoOverlayRectangle): PGstVideoOverlayRectangle;
begin
  Result := PGstVideoOverlayRectangle(gst_mini_object_ref(GST_MINI_OBJECT_CAST(comp)));
end;

procedure gst_video_overlay_rectangle_unref(comp: PGstVideoOverlayRectangle);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(comp));
end;

function gst_video_overlay_composition_ref(comp: PGstVideoOverlayComposition): PGstVideoOverlayComposition;
begin
  Result := PGstVideoOverlayComposition(gst_mini_object_ref(GST_MINI_OBJECT_CAST(comp)));
end;

procedure gst_video_overlay_composition_unref(comp: PGstVideoOverlayComposition);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(comp));
end;


function GST_TYPE_VIDEO_OVERLAY_RECTANGLE: TGType;
begin
  GST_TYPE_VIDEO_OVERLAY_RECTANGLE := gst_video_overlay_rectangle_get_type;
end;

function GST_VIDEO_OVERLAY_RECTANGLE(obj: Pointer): PGstVideoOverlayRectangle;
begin
  GST_VIDEO_OVERLAY_RECTANGLE := GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj);
end;

function GST_IS_VIDEO_OVERLAY_RECTANGLE(obj: Pointer): Tgboolean;
begin
  GST_IS_VIDEO_OVERLAY_RECTANGLE := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_VIDEO_OVERLAY_RECTANGLE);
end;

function GST_VIDEO_OVERLAY_RECTANGLE_CAST(obj: Pointer): PGstVideoOverlayRectangle;
begin
  GST_VIDEO_OVERLAY_RECTANGLE_CAST := PGstVideoOverlayRectangle(obj);
end;

function GST_TYPE_VIDEO_OVERLAY_COMPOSITION: TGType;
begin
  GST_TYPE_VIDEO_OVERLAY_COMPOSITION := gst_video_overlay_composition_get_type;
end;

function GST_VIDEO_OVERLAY_COMPOSITION(obj: Pointer): PGstVideoOverlayComposition;
begin
  GST_VIDEO_OVERLAY_COMPOSITION := GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj);
end;

function GST_IS_VIDEO_OVERLAY_COMPOSITION(obj: Pointer): Tgboolean;
begin
  GST_IS_VIDEO_OVERLAY_COMPOSITION := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_VIDEO_OVERLAY_COMPOSITION);
end;

function GST_VIDEO_OVERLAY_COMPOSITION_CAST(obj: Pointer): PGstVideoOverlayComposition;
begin
  GST_VIDEO_OVERLAY_COMPOSITION_CAST := PGstVideoOverlayComposition(obj);
end;

function GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE: TGType;
begin
  GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE := gst_video_overlay_composition_meta_api_get_type;
end;

function GST_VIDEO_OVERLAY_COMPOSITION_META_INFO: PGstMetaInfo;
begin
  GST_VIDEO_OVERLAY_COMPOSITION_META_INFO := gst_video_overlay_composition_meta_get_info;
end;

function gst_buffer_get_video_overlay_composition_meta(b: PGstBuffer): PGstVideoOverlayCompositionMeta;
begin
  gst_buffer_get_video_overlay_composition_meta := PGstVideoOverlayCompositionMeta(gst_buffer_get_meta(b, GST_VIDEO_OVERLAY_COMPOSITION_META_API_TYPE));
end;

function gst_buffer_remove_video_overlay_composition_meta(b: PGstBuffer; m: Pointer): Tgboolean;
begin
  gst_buffer_remove_video_overlay_composition_meta := gst_buffer_remove_meta(b, PGstMeta(m));
end;



{$ENDIF read_implementation}
