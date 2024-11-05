/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 30-09-2024   15:21                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstFlowCombiner = record
  end;
  PGstFlowCombiner = ^tGstFlowCombiner;

function gst_flow_combiner_new: PGstFlowCombiner; cdecl; external libgstbase;
function gst_flow_combiner_ref(combiner: PGstFlowCombiner): PGstFlowCombiner; cdecl; external libgstbase;
procedure gst_flow_combiner_unref(combiner: PGstFlowCombiner); cdecl; external libgstbase;
procedure gst_flow_combiner_free(combiner: PGstFlowCombiner); cdecl; external libgstbase;
function gst_flow_combiner_update_flow(combiner: PGstFlowCombiner; fret: TGstFlowReturn): TGstFlowReturn; cdecl; external libgstbase;
function gst_flow_combiner_update_pad_flow(combiner: PGstFlowCombiner; pad: PGstPad; fret: TGstFlowReturn): TGstFlowReturn; cdecl; external libgstbase;
procedure gst_flow_combiner_add_pad(combiner: PGstFlowCombiner; pad: PGstPad); cdecl; external libgstbase;
procedure gst_flow_combiner_remove_pad(combiner: PGstFlowCombiner; pad: PGstPad); cdecl; external libgstbase;
procedure gst_flow_combiner_clear(combiner: PGstFlowCombiner); cdecl; external libgstbase;
procedure gst_flow_combiner_reset(combiner: PGstFlowCombiner); cdecl; external libgstbase;
function gst_flow_combiner_get_type: TGType; cdecl; external libgstbase;

// === Konventiert am: 28-9-24 14:56:16 ===

function GST_TYPE_FLOW_COMBINER: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_FLOW_COMBINER: TGType;
begin
  GST_TYPE_FLOW_COMBINER := gst_flow_combiner_get_type;
end;



{$ENDIF read_implementation}
