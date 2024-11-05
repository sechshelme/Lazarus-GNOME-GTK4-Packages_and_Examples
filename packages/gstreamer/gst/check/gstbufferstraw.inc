/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 02-10-2024   19:16                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


procedure gst_buffer_straw_start_pipeline(bin: PGstElement; pad: PGstPad); cdecl; external libgstcheck;
function gst_buffer_straw_get_buffer(bin: PGstElement; pad: PGstPad): PGstBuffer; cdecl; external libgstcheck;
procedure gst_buffer_straw_stop_pipeline(bin: PGstElement; pad: PGstPad); cdecl; external libgstcheck;

// === Konventiert am: 2-10-24 16:59:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
