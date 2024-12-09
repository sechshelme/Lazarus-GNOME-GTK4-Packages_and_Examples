
{$IFDEF read_interface}

function gst_riff_read_chunk(element: PGstElement; pad: PGstPad; offset: Pguint64; tag: Pguint32; chunk_data: PPGstBuffer): TGstFlowReturn; cdecl; external libgstriff;
function gst_riff_parse_chunk(element: PGstElement; buf: PGstBuffer; offset: Pguint; fourcc: Pguint32; chunk_data: PPGstBuffer): Tgboolean; cdecl; external libgstriff;
function gst_riff_parse_file_header(element: PGstElement; buf: PGstBuffer; doctype: Pguint32): Tgboolean; cdecl; external libgstriff;
function gst_riff_parse_strh(element: PGstElement; buf: PGstBuffer; strh: PPgst_riff_strh): Tgboolean; cdecl; external libgstriff;
function gst_riff_parse_strf_vids(element: PGstElement; buf: PGstBuffer; strf: PPgst_riff_strf_vids; Data: PPGstBuffer): Tgboolean; cdecl; external libgstriff;
function gst_riff_parse_strf_auds(element: PGstElement; buf: PGstBuffer; strf: PPgst_riff_strf_auds; Data: PPGstBuffer): Tgboolean; cdecl; external libgstriff;
function gst_riff_parse_strf_iavs(element: PGstElement; buf: PGstBuffer; strf: PPgst_riff_strf_iavs; Data: PPGstBuffer): Tgboolean; cdecl; external libgstriff;
procedure gst_riff_parse_info(element: PGstElement; buf: PGstBuffer; taglist: PPGstTagList); cdecl; external libgstriff;
procedure gst_riff_init; cdecl; external libgstriff;

// === Konventiert am: 12-10-24 15:21:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
