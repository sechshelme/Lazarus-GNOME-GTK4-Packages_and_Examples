/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   15:12                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_WL_DISPLAY_HANDLE_CONTEXT_TYPE = 'GstWlDisplayHandleContextType';

function gst_is_wl_display_handle_need_context_message(msg: PGstMessage): Tgboolean; cdecl; external libgstwayland;
function gst_wl_display_handle_context_new(display: Pwl_display): PGstContext; cdecl; external libgstwayland;
function gst_wl_display_handle_context_get_handle(context: PGstContext): Pwl_display; cdecl; external libgstwayland;

// === Konventiert am: 8-10-24 14:15:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
