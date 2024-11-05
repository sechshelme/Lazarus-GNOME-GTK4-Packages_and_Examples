/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 12-10-2024   19:09                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_app_stream_type_get_type: TGType; cdecl; external libgstapp;
function GST_TYPE_APP_STREAM_TYPE: TGType;

function gst_app_leaky_type_get_type: TGType; cdecl; external libgstapp;
function GST_TYPE_APP_LEAKY_TYPE: TGType;


// === Konventiert am: 12-10-24 15:02:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_APP_STREAM_TYPE: TGType;
begin
  GST_TYPE_APP_STREAM_TYPE := gst_app_stream_type_get_type;
end;

function GST_TYPE_APP_LEAKY_TYPE: TGType;
begin
  GST_TYPE_APP_LEAKY_TYPE := gst_app_leaky_type_get_type;
end;


{$ENDIF read_implementation}
