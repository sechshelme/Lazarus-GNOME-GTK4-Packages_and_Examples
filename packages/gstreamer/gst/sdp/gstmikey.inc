/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 05-10-2024   19:50                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function gst_mikey_message_get_type: TGType; cdecl; external libgstsdp;

const
  GST_MIKEY_VERSION = 1;

type
  PGstMIKEYType = ^TGstMIKEYType;
  TGstMIKEYType = longint;

const
  GST_MIKEY_TYPE_INVALID = -(1);
  GST_MIKEY_TYPE_PSK_INIT = 0;
  GST_MIKEY_TYPE_PSK_VERIFY = 1;
  GST_MIKEY_TYPE_PK_INIT = 2;
  GST_MIKEY_TYPE_PK_VERIFY = 3;
  GST_MIKEY_TYPE_DH_INIT = 4;
  GST_MIKEY_TYPE_DH_RESP = 5;
  GST_MIKEY_TYPE_ERROR = 6;

type
  PGstMIKEYPayloadType = ^TGstMIKEYPayloadType;
  TGstMIKEYPayloadType = longint;

const
  GST_MIKEY_PT_LAST = 0;
  GST_MIKEY_PT_KEMAC = 1;
  GST_MIKEY_PT_PKE = 2;
  GST_MIKEY_PT_DH = 3;
  GST_MIKEY_PT_SIGN = 4;
  GST_MIKEY_PT_T = 5;
  GST_MIKEY_PT_ID = 6;
  GST_MIKEY_PT_CERT = 7;
  GST_MIKEY_PT_CHASH = 8;
  GST_MIKEY_PT_V = 9;
  GST_MIKEY_PT_SP = 10;
  GST_MIKEY_PT_RAND = 11;
  GST_MIKEY_PT_ERR = 12;
  GST_MIKEY_PT_KEY_DATA = 20;
  GST_MIKEY_PT_GEN_EXT = 21;

type
  PGstMIKEYPRFFunc = ^TGstMIKEYPRFFunc;
  TGstMIKEYPRFFunc = longint;

const
  GST_MIKEY_PRF_MIKEY_1 = 0;

type
  PGstMIKEYMapType = ^TGstMIKEYMapType;
  TGstMIKEYMapType = longint;

const
  GST_MIKEY_MAP_TYPE_SRTP = 0;

type
  PGstMIKEYMapSRTP = ^TGstMIKEYMapSRTP;

  TGstMIKEYMapSRTP = record
    policy: Tguint8;
    ssrc: Tguint32;
    roc: Tguint32;
  end;

function gst_mikey_payload_get_type: TGType; cdecl; external libgstsdp;

type
  TGstMIKEYPayload = record
    mini_object: TGstMiniObject;
    _type: TGstMIKEYPayloadType;
    len: Tguint;
  end;
  PGstMIKEYPayload = ^TGstMIKEYPayload;


function gst_mikey_payload_new(_type: TGstMIKEYPayloadType): PGstMIKEYPayload; cdecl; external libgstsdp;

type
  PGstMIKEYEncAlg = ^TGstMIKEYEncAlg;
  TGstMIKEYEncAlg = longint;

const
  GST_MIKEY_ENC_NULL = 0;
  GST_MIKEY_ENC_AES_CM_128 = 1;
  GST_MIKEY_ENC_AES_KW_128 = 2;
  GST_MIKEY_ENC_AES_GCM_128 = 6;

type
  PGstMIKEYMacAlg = ^TGstMIKEYMacAlg;
  TGstMIKEYMacAlg = longint;

const
  GST_MIKEY_MAC_NULL = 0;
  GST_MIKEY_MAC_HMAC_SHA_1_160 = 1;

type
  PGstMIKEYPayloadKEMAC = ^TGstMIKEYPayloadKEMAC;

  TGstMIKEYPayloadKEMAC = record
    pt: TGstMIKEYPayload;
    enc_alg: TGstMIKEYEncAlg;
    mac_alg: TGstMIKEYMacAlg;
    subpayloads: PGArray;
  end;

function gst_mikey_payload_kemac_set(payload: PGstMIKEYPayload; enc_alg: TGstMIKEYEncAlg; mac_alg: TGstMIKEYMacAlg): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_payload_kemac_get_n_sub(payload: PGstMIKEYPayload): Tguint; cdecl; external libgstsdp;
function gst_mikey_payload_kemac_get_sub(payload: PGstMIKEYPayload; idx: Tguint): PGstMIKEYPayload; cdecl; external libgstsdp;
function gst_mikey_payload_kemac_remove_sub(payload: PGstMIKEYPayload; idx: Tguint): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_payload_kemac_add_sub(payload: PGstMIKEYPayload; newpay: PGstMIKEYPayload): Tgboolean; cdecl; external libgstsdp;

type
  PGstMIKEYCacheType = ^TGstMIKEYCacheType;
  TGstMIKEYCacheType = longint;

const
  GST_MIKEY_CACHE_NONE = 0;
  GST_MIKEY_CACHE_ALWAYS = 1;
  GST_MIKEY_CACHE_FOR_CSB = 2;

type
  PGstMIKEYPayloadPKE = ^TGstMIKEYPayloadPKE;

  TGstMIKEYPayloadPKE = record
    pt: TGstMIKEYPayload;
    C: TGstMIKEYCacheType;
    data_len: Tguint16;
    Data: Pguint8;
  end;

function gst_mikey_payload_pke_set(payload: PGstMIKEYPayload; C: TGstMIKEYCacheType; data_len: Tguint16; Data: Pguint8): Tgboolean; cdecl; external libgstsdp;

type
  PGstMIKEYTSType = ^TGstMIKEYTSType;
  TGstMIKEYTSType = longint;

const
  GST_MIKEY_TS_TYPE_NTP_UTC = 0;
  GST_MIKEY_TS_TYPE_NTP = 1;
  GST_MIKEY_TS_TYPE_COUNTER = 2;

type
  PGstMIKEYPayloadT = ^TGstMIKEYPayloadT;

  TGstMIKEYPayloadT = record
    pt: TGstMIKEYPayload;
    _type: TGstMIKEYTSType;
    ts_value: Pguint8;
  end;

function gst_mikey_payload_t_set(payload: PGstMIKEYPayload; _type: TGstMIKEYTSType; ts_value: Pguint8): Tgboolean; cdecl; external libgstsdp;

type
  PGstMIKEYPayloadSPParam = ^TGstMIKEYPayloadSPParam;

  TGstMIKEYPayloadSPParam = record
    _type: Tguint8;
    len: Tguint8;
    val: Pguint8;
  end;

  PGstMIKEYSecProto = ^TGstMIKEYSecProto;
  TGstMIKEYSecProto = longint;

const
  GST_MIKEY_SEC_PROTO_SRTP = 0;

type
  PGstMIKEYSecSRTP = ^TGstMIKEYSecSRTP;
  TGstMIKEYSecSRTP = longint;

const
  GST_MIKEY_SP_SRTP_ENC_ALG = 0;
  GST_MIKEY_SP_SRTP_ENC_KEY_LEN = 1;
  GST_MIKEY_SP_SRTP_AUTH_ALG = 2;
  GST_MIKEY_SP_SRTP_AUTH_KEY_LEN = 3;
  GST_MIKEY_SP_SRTP_SALT_KEY_LEN = 4;
  GST_MIKEY_SP_SRTP_PRF = 5;
  GST_MIKEY_SP_SRTP_KEY_DERIV_RATE = 6;
  GST_MIKEY_SP_SRTP_SRTP_ENC = 7;
  GST_MIKEY_SP_SRTP_SRTCP_ENC = 8;
  GST_MIKEY_SP_SRTP_FEC_ORDER = 9;
  GST_MIKEY_SP_SRTP_SRTP_AUTH = 10;
  GST_MIKEY_SP_SRTP_AUTH_TAG_LEN = 11;
  GST_MIKEY_SP_SRTP_SRTP_PREFIX_LEN = 12;
  GST_MIKEY_SP_SRTP_AEAD_AUTH_TAG_LEN = 20;

type
  PGstMIKEYPayloadSP = ^TGstMIKEYPayloadSP;

  TGstMIKEYPayloadSP = record
    pt: TGstMIKEYPayload;
    policy: Tguint;
    proto: TGstMIKEYSecProto;
    params: PGArray;
  end;

function gst_mikey_payload_sp_set(payload: PGstMIKEYPayload; policy: Tguint; proto: TGstMIKEYSecProto): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_payload_sp_get_n_params(payload: PGstMIKEYPayload): Tguint; cdecl; external libgstsdp;
function gst_mikey_payload_sp_get_param(payload: PGstMIKEYPayload; idx: Tguint): PGstMIKEYPayloadSPParam; cdecl; external libgstsdp;
function gst_mikey_payload_sp_remove_param(payload: PGstMIKEYPayload; idx: Tguint): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_payload_sp_add_param(payload: PGstMIKEYPayload; _type: Tguint8; len: Tguint8; val: Pguint8): Tgboolean; cdecl; external libgstsdp;

type
  PGstMIKEYPayloadRAND = ^TGstMIKEYPayloadRAND;

  TGstMIKEYPayloadRAND = record
    pt: TGstMIKEYPayload;
    len: Tguint8;
    rand: Pguint8;
  end;

function gst_mikey_payload_rand_set(payload: PGstMIKEYPayload; len: Tguint8; rand: Pguint8): Tgboolean; cdecl; external libgstsdp;

type
  PGstMIKEYKeyDataType = ^TGstMIKEYKeyDataType;
  TGstMIKEYKeyDataType = longint;

const
  GST_MIKEY_KD_TGK = 0;
  GST_MIKEY_KD_TEK = 2;

type
  PGstMIKEYKVType = ^TGstMIKEYKVType;
  TGstMIKEYKVType = longint;

const
  GST_MIKEY_KV_NULL = 0;
  GST_MIKEY_KV_SPI = 1;
  GST_MIKEY_KV_INTERVAL = 2;

type
  TGstMIKEYPayloadKeyData = record
    pt: TGstMIKEYPayload;
    key_type: TGstMIKEYKeyDataType;
    key_len: Tguint16;
    key_data: Pguint8;
    salt_len: Tguint16;
    salt_data: Pguint8;
    kv_type: TGstMIKEYKVType;
    kv_len: array[0..1] of Tguint8;
    kv_data: array[0..1] of Pguint8;
  end;
  PGstMIKEYPayloadKeyData = ^TGstMIKEYPayloadKeyData;

function gst_mikey_payload_key_data_set_key(payload: PGstMIKEYPayload; key_type: TGstMIKEYKeyDataType; key_len: Tguint16; key_data: Pguint8): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_payload_key_data_set_salt(payload: PGstMIKEYPayload; salt_len: Tguint16; salt_data: Pguint8): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_payload_key_data_set_spi(payload: PGstMIKEYPayload; spi_len: Tguint8; spi_data: Pguint8): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_payload_key_data_set_interval(payload: PGstMIKEYPayload; vf_len: Tguint8; vf_data: Pguint8; vt_len: Tguint8; vt_data: Pguint8): Tgboolean; cdecl; external libgstsdp;

type
  TGstMIKEYMessage = record
    mini_object: TGstMiniObject;
    version: Tguint8;
    _type: TGstMIKEYType;
    V: Tgboolean;
    prf_func: TGstMIKEYPRFFunc;
    CSB_id: Tguint32;
    map_type: TGstMIKEYMapType;
    map_info: PGArray;
    payloads: PGArray;
  end;
  PGstMIKEYMessage = ^TGstMIKEYMessage;
  PPGstMIKEYMessage = ^PGstMIKEYMessage;

  TGstMIKEYDecryptInfo = record
  end;
  PGstMIKEYDecryptInfo = ^TGstMIKEYDecryptInfo;

  TGstMIKEYEncryptInfo = record
  end;
  PGstMIKEYEncryptInfo = ^TGstMIKEYEncryptInfo;

function gst_mikey_message_new: PGstMIKEYMessage; cdecl; external libgstsdp;
function gst_mikey_message_new_from_data(Data: Tgconstpointer; size: Tgsize; info: PGstMIKEYDecryptInfo; error: PPGError): PGstMIKEYMessage; cdecl; external libgstsdp;
function gst_mikey_message_new_from_bytes(bytes: PGBytes; info: PGstMIKEYDecryptInfo; error: PPGError): PGstMIKEYMessage; cdecl; external libgstsdp;
function gst_mikey_message_to_bytes(msg: PGstMIKEYMessage; info: PGstMIKEYEncryptInfo; error: PPGError): PGBytes; cdecl; external libgstsdp;
function gst_mikey_message_new_from_caps(caps: PGstCaps): PGstMIKEYMessage; cdecl; external libgstsdp;
function gst_mikey_message_to_caps(msg: PGstMIKEYMessage; caps: PGstCaps): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_base64_encode(msg: PGstMIKEYMessage): Pgchar; cdecl; external libgstsdp;
function gst_mikey_message_set_info(msg: PGstMIKEYMessage; version: Tguint8; _type: TGstMIKEYType; V: Tgboolean; prf_func: TGstMIKEYPRFFunc;
  CSB_id: Tguint32; map_type: TGstMIKEYMapType): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_get_n_cs(msg: PGstMIKEYMessage): Tguint; cdecl; external libgstsdp;
function gst_mikey_message_get_cs_srtp(msg: PGstMIKEYMessage; idx: Tguint): PGstMIKEYMapSRTP; cdecl; external libgstsdp;
function gst_mikey_message_insert_cs_srtp(msg: PGstMIKEYMessage; idx: Tgint; map: PGstMIKEYMapSRTP): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_replace_cs_srtp(msg: PGstMIKEYMessage; idx: Tgint; map: PGstMIKEYMapSRTP): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_remove_cs_srtp(msg: PGstMIKEYMessage; idx: Tgint): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_add_cs_srtp(msg: PGstMIKEYMessage; policy: Tguint8; ssrc: Tguint32; roc: Tguint32): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_get_n_payloads(msg: PGstMIKEYMessage): Tguint; cdecl; external libgstsdp;
function gst_mikey_message_get_payload(msg: PGstMIKEYMessage; idx: Tguint): PGstMIKEYPayload; cdecl; external libgstsdp;
function gst_mikey_message_find_payload(msg: PGstMIKEYMessage; _type: TGstMIKEYPayloadType; nth: Tguint): PGstMIKEYPayload; cdecl; external libgstsdp;
function gst_mikey_message_remove_payload(msg: PGstMIKEYMessage; idx: Tguint): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_insert_payload(msg: PGstMIKEYMessage; idx: Tguint; payload: PGstMIKEYPayload): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_add_payload(msg: PGstMIKEYMessage; payload: PGstMIKEYPayload): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_replace_payload(msg: PGstMIKEYMessage; idx: Tguint; payload: PGstMIKEYPayload): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_add_pke(msg: PGstMIKEYMessage; C: TGstMIKEYCacheType; data_len: Tguint16; Data: Pguint8): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_add_t(msg: PGstMIKEYMessage; _type: TGstMIKEYTSType; ts_value: Pguint8): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_add_t_now_ntp_utc(msg: PGstMIKEYMessage): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_add_rand(msg: PGstMIKEYMessage; len: Tguint8; rand: Pguint8): Tgboolean; cdecl; external libgstsdp;
function gst_mikey_message_add_rand_len(msg: PGstMIKEYMessage; len: Tguint8): Tgboolean; cdecl; external libgstsdp;


function gst_mikey_payload_ref(payload: PGstMIKEYPayload): PGstMIKEYPayload;
procedure gst_mikey_payload_unref(payload: PGstMIKEYPayload);
function gst_mikey_payload_copy(payload: PGstMIKEYPayload): PGstMIKEYPayload;

function gst_mikey_message_ref(payload: PGstMIKEYMessage): PGstMIKEYMessage;
procedure gst_mikey_message_unref(payload: PGstMIKEYMessage);
function gst_mikey_message_copy(payload: PGstMIKEYMessage): PGstMIKEYMessage;


// === Konventiert am: 5-10-24 17:59:40 ===

function GST_TYPE_MIKEY_MESSAGE: TGType;
function GST_TYPE_MIKEY_PAYLOAD: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function gst_mikey_payload_ref(payload: PGstMIKEYPayload): PGstMIKEYPayload;
begin
  Result := PGstMIKEYPayload(gst_mini_object_ref(GST_MINI_OBJECT_CAST(payload)));
end;

procedure gst_mikey_payload_unref(payload: PGstMIKEYPayload);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(payload));
end;

function gst_mikey_payload_copy(payload: PGstMIKEYPayload): PGstMIKEYPayload;
begin
  Result := PGstMIKEYPayload(gst_mini_object_copy(GST_MINI_OBJECT_CONST_CAST(payload)));
end;

// ====

function gst_mikey_message_ref(payload: PGstMIKEYMessage): PGstMIKEYMessage;
begin
  Result := PGstMIKEYMessage(gst_mini_object_ref(GST_MINI_OBJECT_CAST(payload)));
end;

procedure gst_mikey_message_unref(payload: PGstMIKEYMessage);
begin
  gst_mini_object_unref(GST_MINI_OBJECT_CAST(payload));
end;

function gst_mikey_message_copy(payload: PGstMIKEYMessage): PGstMIKEYMessage;
begin
  Result := PGstMIKEYMessage(gst_mini_object_copy(GST_MINI_OBJECT_CONST_CAST(payload)));
end;

// ====

function GST_TYPE_MIKEY_MESSAGE: TGType;
begin
  GST_TYPE_MIKEY_MESSAGE := gst_mikey_message_get_type;
end;

function GST_TYPE_MIKEY_PAYLOAD: TGType;
begin
  GST_TYPE_MIKEY_PAYLOAD := gst_mikey_payload_get_type;
end;


{$ENDIF read_implementation}
