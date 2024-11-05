/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-10-2024   12:06                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstRTSPMsgType = ^TGstRTSPMsgType;
  TGstRTSPMsgType = longint;

const
  GST_RTSP_MESSAGE_INVALID = 0;
  GST_RTSP_MESSAGE_REQUEST = 1;
  GST_RTSP_MESSAGE_RESPONSE = 2;
  GST_RTSP_MESSAGE_HTTP_REQUEST = 3;
  GST_RTSP_MESSAGE_HTTP_RESPONSE = 4;
  GST_RTSP_MESSAGE_DATA = 5;

type
  TGstRTSPMessage = record
    _type: TGstRTSPMsgType;
    type_data: record
      case longint of
        0: (request: record
            method: TGstRTSPMethod;
            uri: Pgchar;
            version: TGstRTSPVersion;
            end);
        1: (response: record
            code: TGstRTSPStatusCode;
            reason: Pgchar;
            version: TGstRTSPVersion;
            end);
        2: (Data: record
            channel: Tguint8;
            end);
      end;
    hdr_fields: PGArray;
    body: Pguint8;
    body_size: Tguint;
    body_buffer: PGstBuffer;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  PGstRTSPMessage = ^TGstRTSPMessage;
  PPGstRTSPMessage = ^PGstRTSPMessage;

function gst_rtsp_msg_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_message_new(msg: PPGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_init(msg: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_unset(msg: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_free(msg: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_copy(msg: PGstRTSPMessage; copy: PPGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_get_type(msg: PGstRTSPMessage): TGstRTSPMsgType; cdecl; external libgstrtsp;
function gst_rtsp_message_new_request(msg: PPGstRTSPMessage; method: TGstRTSPMethod; uri: Pgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_init_request(msg: PGstRTSPMessage; method: TGstRTSPMethod; uri: Pgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_parse_request(msg: PGstRTSPMessage; method: PGstRTSPMethod; uri: PPgchar; version: PGstRTSPVersion): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_new_response(msg: PPGstRTSPMessage; code: TGstRTSPStatusCode; reason: Pgchar; request: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_init_response(msg: PGstRTSPMessage; code: TGstRTSPStatusCode; reason: Pgchar; request: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_parse_response(msg: PGstRTSPMessage; code: PGstRTSPStatusCode; reason: PPgchar; version: PGstRTSPVersion): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_new_data(msg: PPGstRTSPMessage; channel: Tguint8): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_init_data(msg: PGstRTSPMessage; channel: Tguint8): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_parse_data(msg: PGstRTSPMessage; channel: Pguint8): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_add_header(msg: PGstRTSPMessage; field: TGstRTSPHeaderField; Value: Pgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_take_header(msg: PGstRTSPMessage; field: TGstRTSPHeaderField; Value: Pgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_remove_header(msg: PGstRTSPMessage; field: TGstRTSPHeaderField; indx: Tgint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_get_header(msg: PGstRTSPMessage; field: TGstRTSPHeaderField; Value: PPgchar; indx: Tgint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_add_header_by_name(msg: PGstRTSPMessage; header: Pgchar; Value: Pgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_take_header_by_name(msg: PGstRTSPMessage; header: Pgchar; Value: Pgchar): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_remove_header_by_name(msg: PGstRTSPMessage; header: Pgchar; index: Tgint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_get_header_by_name(msg: PGstRTSPMessage; header: Pgchar; Value: PPgchar; index: Tgint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_append_headers(msg: PGstRTSPMessage; str: PGString): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_set_body(msg: PGstRTSPMessage; Data: Pguint8; size: Tguint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_take_body(msg: PGstRTSPMessage; Data: Pguint8; size: Tguint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_get_body(msg: PGstRTSPMessage; Data: PPguint8; size: Pguint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_steal_body(msg: PGstRTSPMessage; Data: PPguint8; size: Pguint): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_set_body_buffer(msg: PGstRTSPMessage; buffer: PGstBuffer): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_take_body_buffer(msg: PGstRTSPMessage; buffer: PGstBuffer): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_get_body_buffer(msg: PGstRTSPMessage; buffer: PPGstBuffer): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_steal_body_buffer(msg: PGstRTSPMessage; buffer: PPGstBuffer): TGstRTSPResult; cdecl; external libgstrtsp;
function gst_rtsp_message_has_body_buffer(msg: PGstRTSPMessage): Tgboolean; cdecl; external libgstrtsp;

type
  TGstRTSPAuthCredential = record
    scheme: TGstRTSPAuthMethod;
    params: ^PGstRTSPAuthParam;
    authorization: Pgchar;
  end;
  PGstRTSPAuthCredential = ^TGstRTSPAuthCredential;
  PPGstRTSPAuthCredential = ^PGstRTSPAuthCredential;

  TGstRTSPAuthParam = record
    Name: Pgchar;
    Value: Pgchar;
  end;
  PGstRTSPAuthParam = ^TGstRTSPAuthParam;

function gst_rtsp_auth_param_copy(param: PGstRTSPAuthParam): PGstRTSPAuthParam; cdecl; external libgstrtsp;
procedure gst_rtsp_auth_param_free(param: PGstRTSPAuthParam); cdecl; external libgstrtsp;
function gst_rtsp_message_parse_auth_credentials(msg: PGstRTSPMessage; field: TGstRTSPHeaderField): PPGstRTSPAuthCredential; cdecl; external libgstrtsp;
procedure gst_rtsp_auth_credentials_free(credentials: PPGstRTSPAuthCredential); cdecl; external libgstrtsp;
function gst_rtsp_auth_credential_get_type: TGType; cdecl; external libgstrtsp;

function gst_rtsp_auth_param_get_type: TGType; cdecl; external libgstrtsp;
function gst_rtsp_message_dump(msg: PGstRTSPMessage): TGstRTSPResult; cdecl; external libgstrtsp;

function GST_RTSP_MESSAGE(obj: Pointer): PGstRTSPMessage;
function GST_RTSP_MESSAGE_CAST(obj: Pointer): PGstRTSPMessage;
function GST_TYPE_RTSP_AUTH_CREDENTIAL: TGType;
function GST_TYPE_RTSP_AUTH_PARAM: TGType;

// === Konventiert am: 8-10-24 11:22:36 ===

function GST_TYPE_RTSP_MESSAGE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTSP_MESSAGE: TGType;
begin
  GST_TYPE_RTSP_MESSAGE := gst_rtsp_msg_get_type;
end;

function GST_RTSP_MESSAGE(obj: Pointer): PGstRTSPMessage;
begin
  GST_RTSP_MESSAGE := GST_RTSP_MESSAGE_CAST(obj);
end;

function GST_RTSP_MESSAGE_CAST(obj: Pointer): PGstRTSPMessage;
begin
  GST_RTSP_MESSAGE_CAST := PGstRTSPMessage(obj);
end;

function GST_TYPE_RTSP_AUTH_CREDENTIAL: TGType;
begin
  GST_TYPE_RTSP_AUTH_CREDENTIAL := gst_rtsp_auth_credential_get_type;
end;

function GST_TYPE_RTSP_AUTH_PARAM: TGType;
begin
  GST_TYPE_RTSP_AUTH_PARAM := gst_rtsp_auth_param_get_type;
end;


{$ENDIF read_implementation}
