unit app_enumtypes;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gst_app_stream_type_get_type: TGType; cdecl; external libgstapp;
function gst_app_leaky_type_get_type: TGType; cdecl; external libgstapp;

// === Konventiert am: 26-7-26 20:05:44 ===

function GST_TYPE_APP_STREAM_TYPE: TGType;
function GST_TYPE_APP_LEAKY_TYPE: TGType;

implementation

function GST_TYPE_APP_STREAM_TYPE: TGType;
begin
  GST_TYPE_APP_STREAM_TYPE := gst_app_stream_type_get_type;
end;

function GST_TYPE_APP_LEAKY_TYPE: TGType;
begin
  GST_TYPE_APP_LEAKY_TYPE := gst_app_leaky_type_get_type;
end;

end.
