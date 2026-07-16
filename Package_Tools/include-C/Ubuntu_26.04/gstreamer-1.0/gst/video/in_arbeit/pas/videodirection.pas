unit videodirection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstVideoDirection = type Pointer;

  PGstVideoDirectionInterface = ^TGstVideoDirectionInterface;
  TGstVideoDirectionInterface = record
    iface: TGTypeInterface;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_direction_get_type: TGType; cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:29:25 ===

function GST_TYPE_VIDEO_DIRECTION: TGType;
function GST_VIDEO_DIRECTION(obj: Pointer): PGstVideoDirection;
function GST_IS_VIDEO_DIRECTION(obj: Pointer): Tgboolean;
function GST_VIDEO_DIRECTION_GET_INTERFACE(obj: Pointer): PGstVideoDirectionInterface;
{$ENDIF read_function}

implementation

function GST_TYPE_VIDEO_DIRECTION: TGType;
begin
  GST_TYPE_VIDEO_DIRECTION := gst_video_direction_get_type;
end;

function GST_VIDEO_DIRECTION(obj: Pointer): PGstVideoDirection;
begin
  Result := PGstVideoDirection(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_DIRECTION));
end;

function GST_IS_VIDEO_DIRECTION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_DIRECTION);
end;

function GST_VIDEO_DIRECTION_GET_INTERFACE(obj: Pointer): PGstVideoDirectionInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_VIDEO_DIRECTION);
end;



end.
