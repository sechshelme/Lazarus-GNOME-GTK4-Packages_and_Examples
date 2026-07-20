

  {$IFDEF read_struct}
type
  PGstRTSPToken = ^TGstRTSPToken;
  TGstRTSPToken = record
    mini_object: TGstMiniObject;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_rtsp_token_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_token_new_empty: PGstRTSPToken; cdecl; external libgstrtsp;
function gst_rtsp_token_new(firstfield: Pgchar): PGstRTSPToken; cdecl; varargs; external libgstrtsp;
function gst_rtsp_token_new_valist(firstfield: Pgchar; var_args: Tva_list): PGstRTSPToken; cdecl; external libgstrtsp;
function gst_rtsp_token_get_structure(token: PGstRTSPToken): PGstStructure; cdecl; external libgstrtsp;
function gst_rtsp_token_writable_structure(token: PGstRTSPToken): PGstStructure; cdecl; external libgstrtsp;
procedure gst_rtsp_token_set_string(token: PGstRTSPToken; field: Pgchar; string_value: Pgchar); cdecl; external libgstrtsp;
function gst_rtsp_token_get_string(token: PGstRTSPToken; field: Pgchar): Pgchar; cdecl; external libgstrtsp;
procedure gst_rtsp_token_set_bool(token: PGstRTSPToken; field: Pgchar; bool_value: Tgboolean); cdecl; external libgstrtsp;
function gst_rtsp_token_is_allowed(token: PGstRTSPToken; field: Pgchar): Tgboolean; cdecl; external libgstrtsp;

// === Konventiert am: 20-7-26 13:42:07 ===

function GST_TYPE_RTSP_TOKEN: TGType;
function GST_IS_RTSP_TOKEN(obj: Pointer): Tgboolean;
function GST_RTSP_TOKEN_CAST(obj: Pointer): PGstRTSPToken;
function GST_RTSP_TOKEN(obj: Pointer): PGstRTSPToken;

function gst_rtsp_token_ref(token: PGstRTSPToken): PGstRTSPToken;
procedure gst_rtsp_token_unref(token: PGstRTSPToken);
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_TOKEN: TGType;
begin
  Result := gst_rtsp_token_get_type;
end;

function GST_IS_RTSP_TOKEN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_RTSP_TOKEN);
end;

function GST_RTSP_TOKEN_CAST(obj: Pointer): PGstRTSPToken;
begin
  Result := PGstRTSPToken(obj);
end;

function GST_RTSP_TOKEN(obj: Pointer): PGstRTSPToken;
begin
  Result := PGstRTSPToken(obj);
end;

function gst_rtsp_token_ref(token: PGstRTSPToken): PGstRTSPToken;
begin
  Result := PGstRTSPToken(gst_mini_object_ref(PGstMiniObject(token)));
end;

procedure gst_rtsp_token_unref(token: PGstRTSPToken);
begin
  if token <> nil then begin
    gst_mini_object_unref(PGstMiniObject(token));
  end;
end;

{$ENDIF read_implementation}
