/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 02-10-2024   19:16                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstStreamConsistency = record
  end;
  PGstStreamConsistency = ^TGstStreamConsistency;

function gst_consistency_checker_new(pad: PGstPad): PGstStreamConsistency; cdecl; external libgstcheck;
function gst_consistency_checker_add_pad(consist: PGstStreamConsistency; pad: PGstPad): Tgboolean; cdecl; external libgstcheck;
procedure gst_consistency_checker_reset(consist: PGstStreamConsistency); cdecl; external libgstcheck;
procedure gst_consistency_checker_free(consist: PGstStreamConsistency); cdecl; external libgstcheck;

// === Konventiert am: 2-10-24 16:59:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
