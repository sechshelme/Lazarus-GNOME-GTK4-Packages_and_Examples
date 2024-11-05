/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 03-10-2024   17:46                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  PGstMseSrcReadyState = ^TGstMseSrcReadyState;
  TGstMseSrcReadyState = longint;

const
  GST_MSE_SRC_READY_STATE_HAVE_NOTHING = 0;
  GST_MSE_SRC_READY_STATE_HAVE_METADATA = 1;
  GST_MSE_SRC_READY_STATE_HAVE_CURRENT_DATA = 2;
  GST_MSE_SRC_READY_STATE_HAVE_FUTURE_DATA = 3;
  GST_MSE_SRC_READY_STATE_HAVE_ENOUGH_DATA = 4;


  {G_DECLARE_FINAL_TYPE (GstMseSrc, gst_mse_src, GST, MSE_SRC, GstElement); }
type
  TGstMseSrc = record
  end;
  PGstMseSrc = ^TGstMseSrc;

  TGstMseSrcClass = record
    parent_class: TGstElementClass;
  end;
  PGstMseSrcClass = ^TGstMseSrcClass;

function gst_mse_src_get_type: TGType; cdecl; external libgstmse;

{G_DECLARE_FINAL_TYPE (GstMseSrcPad, gst_mse_src_pad, GST, MSE_SRC_PAD, GstPad); }
type
  TGstMseSrcPad = record
  end;
  PGstMseSrcPad = ^TGstMseSrcPad;

  TGstMseSrcPadClass = record
    parent_class: TGstPadClass;
  end;
  PGstMseSrcPadClass = ^TGstMseSrcPadClass;

function gst_mse_src_pad_get_type: TGType; cdecl; external libgstmse;
function gst_mse_src_get_position(self: PGstMseSrc): TGstClockTime; cdecl; external libgstmse;
function gst_mse_src_get_duration(self: PGstMseSrc): TGstClockTime; cdecl; external libgstmse;
function gst_mse_src_get_ready_state(self: PGstMseSrc): TGstMseSrcReadyState; cdecl; external libgstmse;
function gst_mse_src_get_n_audio(self: PGstMseSrc): Tguint; cdecl; external libgstmse;
function gst_mse_src_get_n_text(self: PGstMseSrc): Tguint; cdecl; external libgstmse;
function gst_mse_src_get_n_video(self: PGstMseSrc): Tguint; cdecl; external libgstmse;

// === Konventiert am: 3-10-24 17:28:57 ===

function GST_TYPE_MSE_SRC: TGType;
function GST_MSE_SRC(obj: Pointer): PGstMseSrc;
function GST_IS_MSE_SRC(obj: Pointer): Tgboolean;

function GST_TYPE_MSE_SRC_PAD: TGType;
function GST_MSE_SRC_PAD(obj: Pointer): PGstMseSrcPad;
function GST_IS_MSE_SRC_PAD(obj: Pointer): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_MSE_SRC: TGType;
begin
  Result := gst_mse_src_get_type;
end;

function GST_MSE_SRC(obj: Pointer): PGstMseSrc;
begin
  Result := PGstMseSrc(g_type_check_instance_cast(obj, GST_TYPE_MSE_SRC));
end;

function GST_IS_MSE_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_MSE_SRC);
end;

// ====

function GST_TYPE_MSE_SRC_PAD: TGType;
begin
  Result := gst_mse_src_pad_get_type;
end;

function GST_MSE_SRC_PAD(obj: Pointer): PGstMseSrcPad;
begin
  Result := PGstMseSrcPad(g_type_check_instance_cast(obj, GST_TYPE_MSE_SRC_PAD));
end;

function GST_IS_MSE_SRC_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_MSE_SRC_PAD);
end;


{$ENDIF read_implementation}
