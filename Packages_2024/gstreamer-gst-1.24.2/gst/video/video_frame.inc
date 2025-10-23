
{$IFDEF read_interface}

type
  PGstVideoFrameFlags = ^TGstVideoFrameFlags;
  TGstVideoFrameFlags =  Longint;
  Const
    GST_VIDEO_FRAME_FLAG_NONE = 0;
    GST_VIDEO_FRAME_FLAG_INTERLACED = 1 shl 0;
    GST_VIDEO_FRAME_FLAG_TFF = 1 shl 1;
    GST_VIDEO_FRAME_FLAG_RFF = 1 shl 2;
    GST_VIDEO_FRAME_FLAG_ONEFIELD = 1 shl 3;
    GST_VIDEO_FRAME_FLAG_MULTIPLE_VIEW = 1 shl 4;
    GST_VIDEO_FRAME_FLAG_FIRST_IN_BUNDLE = 1 shl 5;
    GST_VIDEO_FRAME_FLAG_TOP_FIELD = GST_VIDEO_FRAME_FLAG_TFF or GST_VIDEO_FRAME_FLAG_ONEFIELD;
    GST_VIDEO_FRAME_FLAG_BOTTOM_FIELD = GST_VIDEO_FRAME_FLAG_ONEFIELD;
type
  PGstVideoFrame = ^TGstVideoFrame;
  TGstVideoFrame = record
      info : TGstVideoInfo;
      flags : TGstVideoFrameFlags;
      buffer : PGstBuffer;
      meta : Tgpointer;
      id : Tgint;
      data : array[0..(GST_VIDEO_MAX_PLANES)-1] of Tgpointer;
      map : array[0..(GST_VIDEO_MAX_PLANES)-1] of TGstMapInfo;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

function gst_video_frame_map(frame:PGstVideoFrame; info:PGstVideoInfo; buffer:PGstBuffer; flags:TGstMapFlags):Tgboolean;cdecl;external libgstvideo;
function gst_video_frame_map_id(frame:PGstVideoFrame; info:PGstVideoInfo; buffer:PGstBuffer; id:Tgint; flags:TGstMapFlags):Tgboolean;cdecl;external libgstvideo;
procedure gst_video_frame_unmap(frame:PGstVideoFrame);cdecl;external libgstvideo;
function gst_video_frame_copy(dest:PGstVideoFrame; src:PGstVideoFrame):Tgboolean;cdecl;external libgstvideo;
function gst_video_frame_copy_plane(dest:PGstVideoFrame; src:PGstVideoFrame; plane:Tguint):Tgboolean;cdecl;external libgstvideo;

const
  _GST_VIDEO_FRAME_FLAG_FIELD_MASK = GST_VIDEO_FRAME_FLAG_TOP_FIELD;
type
  PGstVideoBufferFlags = ^TGstVideoBufferFlags;
  TGstVideoBufferFlags =  Longint;
  Const
    GST_VIDEO_BUFFER_FLAG_INTERLACED = GST_BUFFER_FLAG_LAST shl 0;
    GST_VIDEO_BUFFER_FLAG_TFF = GST_BUFFER_FLAG_LAST shl 1;
    GST_VIDEO_BUFFER_FLAG_RFF = GST_BUFFER_FLAG_LAST shl 2;
    GST_VIDEO_BUFFER_FLAG_ONEFIELD = GST_BUFFER_FLAG_LAST shl 3;
    GST_VIDEO_BUFFER_FLAG_MULTIPLE_VIEW = GST_BUFFER_FLAG_LAST shl 4;
    GST_VIDEO_BUFFER_FLAG_FIRST_IN_BUNDLE = GST_BUFFER_FLAG_LAST shl 5;
    GST_VIDEO_BUFFER_FLAG_TOP_FIELD = GST_VIDEO_BUFFER_FLAG_TFF or GST_VIDEO_BUFFER_FLAG_ONEFIELD;
    GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD = GST_VIDEO_BUFFER_FLAG_ONEFIELD;
    GST_VIDEO_BUFFER_FLAG_MARKER = GST_BUFFER_FLAG_MARKER;
    GST_VIDEO_BUFFER_FLAG_LAST = GST_BUFFER_FLAG_LAST shl 8;
    const
    _GST_VIDEO_BUFFER_FLAG_FIELD_MASK = GST_VIDEO_BUFFER_FLAG_TOP_FIELD;

type
  PGstVideoFrameMapFlags = ^TGstVideoFrameMapFlags;
  TGstVideoFrameMapFlags =  Longint;
  Const
    GST_VIDEO_FRAME_MAP_FLAG_NO_REF = GST_MAP_FLAG_LAST shl 0;
    GST_VIDEO_FRAME_MAP_FLAG_LAST = GST_MAP_FLAG_LAST shl 8;


function GST_VIDEO_FRAME_FORMAT(f :PGstVideoFrame) : longint;
function GST_VIDEO_FRAME_WIDTH(f :PGstVideoFrame) : longint;
function GST_VIDEO_FRAME_HEIGHT(f :PGstVideoFrame) : longint;
function GST_VIDEO_FRAME_SIZE(f :PGstVideoFrame) : longint;
function GST_VIDEO_FRAME_FLAGS(f :PGstVideoFrame) : longint;
function GST_VIDEO_FRAME_FLAG_IS_SET(f :PGstVideoFrame;fl : longint) : Tgboolean;
function GST_VIDEO_FRAME_IS_INTERLACED(f :PGstVideoFrame) : Tgboolean;
function GST_VIDEO_FRAME_IS_TFF(f :PGstVideoFrame) : Tgboolean;
function GST_VIDEO_FRAME_IS_RFF(f :PGstVideoFrame) : Tgboolean;
function GST_VIDEO_FRAME_IS_ONEFIELD(f :PGstVideoFrame) : Tgboolean;
function GST_VIDEO_FRAME_IS_TOP_FIELD(f :PGstVideoFrame) : Tgboolean;
function GST_VIDEO_FRAME_IS_BOTTOM_FIELD(f :PGstVideoFrame) : Tgboolean;
function GST_VIDEO_FRAME_N_PLANES(f :PGstVideoFrame) : Tguint;
function GST_VIDEO_FRAME_PLANE_DATA(f :PGstVideoFrame;p : longint) : Tgpointer;
function GST_VIDEO_FRAME_PLANE_OFFSET(f :PGstVideoFrame;p : longint) : Tgsize;
function GST_VIDEO_FRAME_PLANE_STRIDE(f :PGstVideoFrame;p : longint) : Tgint;
function GST_VIDEO_FRAME_N_COMPONENTS(f :PGstVideoFrame) : Tguint;
function GST_VIDEO_FRAME_COMP_DEPTH(f :PGstVideoFrame;c : longint) : Tguint;
function GST_VIDEO_FRAME_COMP_WIDTH(f :PGstVideoFrame;c : longint) : Tguint;
function GST_VIDEO_FRAME_COMP_HEIGHT(f :PGstVideoFrame;c : longint) : Tguint;
function GST_VIDEO_FRAME_COMP_PLANE(f :PGstVideoFrame;c : longint) : Tguint;
function GST_VIDEO_FRAME_COMP_PSTRIDE(f :PGstVideoFrame;c : longint) : Tguint;
function GST_VIDEO_FRAME_COMP_POFFSET(f :PGstVideoFrame;c : longint) : Tguint;

function GST_VIDEO_BUFFER_IS_TOP_FIELD(buf : Pointer) : Tgboolean;
function GST_VIDEO_BUFFER_IS_BOTTOM_FIELD(buf : Pointer) : Tgboolean;



// === Konventiert am: 29-9-24 16:20:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_VIDEO_FRAME_FORMAT(f :PGstVideoFrame) : longint;
begin
  GST_VIDEO_FRAME_FORMAT:=GST_VIDEO_INFO_FORMAT(@(f^.info));
end;
function GST_VIDEO_FRAME_WIDTH(f :PGstVideoFrame) : longint;
begin
  GST_VIDEO_FRAME_WIDTH:=GST_VIDEO_INFO_WIDTH(@(f^.info));
end;
function GST_VIDEO_FRAME_HEIGHT(f :PGstVideoFrame) : longint;
begin
  GST_VIDEO_FRAME_HEIGHT:=GST_VIDEO_INFO_HEIGHT(@(f^.info));
end;
function GST_VIDEO_FRAME_SIZE(f :PGstVideoFrame) : longint;
begin
  GST_VIDEO_FRAME_SIZE:=GST_VIDEO_INFO_SIZE(@(f^.info));
end;
function GST_VIDEO_FRAME_FLAGS(f :PGstVideoFrame) : longint;
begin
  GST_VIDEO_FRAME_FLAGS:=f^.flags;
end;
function GST_VIDEO_FRAME_FLAG_IS_SET(f: PGstVideoFrame; fl: longint): Tgboolean;
begin
  GST_VIDEO_FRAME_FLAG_IS_SET:=((GST_VIDEO_FRAME_FLAGS(f)) and fl)=fl;
end;
function GST_VIDEO_FRAME_IS_INTERLACED(f: PGstVideoFrame): Tgboolean;
begin
  GST_VIDEO_FRAME_IS_INTERLACED:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_INTERLACED);
end;
function GST_VIDEO_FRAME_IS_TFF(f: PGstVideoFrame): Tgboolean;
begin
  GST_VIDEO_FRAME_IS_TFF:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_TFF);
end;
function GST_VIDEO_FRAME_IS_RFF(f: PGstVideoFrame): Tgboolean;
begin
  GST_VIDEO_FRAME_IS_RFF:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_RFF);
end;
function GST_VIDEO_FRAME_IS_ONEFIELD(f: PGstVideoFrame): Tgboolean;
begin
  GST_VIDEO_FRAME_IS_ONEFIELD:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_ONEFIELD);
end;
function GST_VIDEO_FRAME_IS_TOP_FIELD(f: PGstVideoFrame): Tgboolean;
begin
  GST_VIDEO_FRAME_IS_TOP_FIELD:=GST_VIDEO_FRAME_FLAG_IS_SET(f,GST_VIDEO_FRAME_FLAG_TOP_FIELD);
end;
function GST_VIDEO_FRAME_IS_BOTTOM_FIELD(f: PGstVideoFrame): Tgboolean;
begin
  GST_VIDEO_FRAME_IS_BOTTOM_FIELD:=((f^.flags) and _GST_VIDEO_FRAME_FLAG_FIELD_MASK)=GST_VIDEO_FRAME_FLAG_BOTTOM_FIELD;
end;
function GST_VIDEO_FRAME_N_PLANES(f: PGstVideoFrame): Tguint;
begin
  GST_VIDEO_FRAME_N_PLANES:=GST_VIDEO_INFO_N_PLANES(@(f^.info));
end;
function GST_VIDEO_FRAME_PLANE_DATA(f: PGstVideoFrame; p: longint): Tgpointer;
begin
  GST_VIDEO_FRAME_PLANE_DATA:=f^.data[p];
end;
function GST_VIDEO_FRAME_PLANE_OFFSET(f: PGstVideoFrame; p: longint): Tgsize;
begin
  GST_VIDEO_FRAME_PLANE_OFFSET:=GST_VIDEO_INFO_PLANE_OFFSET(@(f^.info),p);
end;
function GST_VIDEO_FRAME_PLANE_STRIDE(f: PGstVideoFrame; p: longint): Tgint;
begin
  GST_VIDEO_FRAME_PLANE_STRIDE:=GST_VIDEO_INFO_PLANE_STRIDE(@(f^.info),p);
end;
function GST_VIDEO_FRAME_N_COMPONENTS(f: PGstVideoFrame): Tguint;
begin
  GST_VIDEO_FRAME_N_COMPONENTS:=GST_VIDEO_INFO_N_COMPONENTS(@(f^.info));
end;
function GST_VIDEO_FRAME_COMP_DEPTH(f: PGstVideoFrame; c: longint): Tguint;
begin
  GST_VIDEO_FRAME_COMP_DEPTH:=GST_VIDEO_INFO_COMP_DEPTH(@(f^.info),c);
end;
function GST_VIDEO_FRAME_COMP_WIDTH(f: PGstVideoFrame; c: longint): Tguint;
begin
  GST_VIDEO_FRAME_COMP_WIDTH:=GST_VIDEO_INFO_COMP_WIDTH(@(f^.info),c);
end;
function GST_VIDEO_FRAME_COMP_HEIGHT(f: PGstVideoFrame; c: longint): Tguint;
begin
  GST_VIDEO_FRAME_COMP_HEIGHT:=GST_VIDEO_INFO_COMP_HEIGHT(@(f^.info),c);
end;
function GST_VIDEO_FRAME_COMP_PLANE(f: PGstVideoFrame; c: longint): Tguint;
begin
  GST_VIDEO_FRAME_COMP_PLANE:=GST_VIDEO_INFO_COMP_PLANE(@(f^.info),c);
end;
function GST_VIDEO_FRAME_COMP_PSTRIDE(f: PGstVideoFrame; c: longint): Tguint;
begin
  GST_VIDEO_FRAME_COMP_PSTRIDE:=GST_VIDEO_INFO_COMP_PSTRIDE(@(f^.info),c);
end;
function GST_VIDEO_FRAME_COMP_POFFSET(f: PGstVideoFrame; c: longint): Tguint;
begin
  GST_VIDEO_FRAME_COMP_POFFSET:=GST_VIDEO_INFO_COMP_POFFSET(@(f^.info),c);
end;
function GST_VIDEO_BUFFER_IS_TOP_FIELD(buf: Pointer): Tgboolean;
begin
  GST_VIDEO_BUFFER_IS_TOP_FIELD:=((GST_BUFFER_FLAGS(buf)) and _GST_VIDEO_BUFFER_FLAG_FIELD_MASK)=GST_VIDEO_BUFFER_FLAG_TOP_FIELD;
end;
function GST_VIDEO_BUFFER_IS_BOTTOM_FIELD(buf: Pointer): Tgboolean;
begin
  GST_VIDEO_BUFFER_IS_BOTTOM_FIELD:=((GST_BUFFER_FLAGS(buf)) and _GST_VIDEO_BUFFER_FLAG_FIELD_MASK)=GST_VIDEO_BUFFER_FLAG_BOTTOM_FIELD;
end;


{$ENDIF read_implementation}
