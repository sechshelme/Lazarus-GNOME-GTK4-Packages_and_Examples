{$IFDEF read_interface}


type
  Pcbor_data = ^Tcbor_data;
  Tcbor_data = pbyte;

  Pcbor_mutable_data = ^Tcbor_mutable_data;
  Tcbor_mutable_data = pbyte;

type
  Pcbor_type = ^Tcbor_type;
  Tcbor_type = longint;

const
  CBOR_TYPE_UINT = 0;
  CBOR_TYPE_NEGINT = 1;
  CBOR_TYPE_BYTESTRING = 2;
  CBOR_TYPE_STRING = 3;
  CBOR_TYPE_ARRAY = 4;
  CBOR_TYPE_MAP = 5;
  CBOR_TYPE_TAG = 6;
  CBOR_TYPE_FLOAT_CTRL = 7;

type
  Pcbor_error_code = ^Tcbor_error_code;
  Tcbor_error_code = longint;

const
  CBOR_ERR_NONE = 0;
  CBOR_ERR_NOTENOUGHDATA = 1;
  CBOR_ERR_NODATA = 2;
  CBOR_ERR_MALFORMATED = 3;
  CBOR_ERR_MEMERROR = 4;
  CBOR_ERR_SYNTAXERROR = 5;

type
  Pcbor_int_width = ^Tcbor_int_width;
  Tcbor_int_width = longint;

const
  CBOR_INT_8 = 0;
  CBOR_INT_16 = 1;
  CBOR_INT_32 = 2;
  CBOR_INT_64 = 3;

type
  Pcbor_float_width = ^Tcbor_float_width;
  Tcbor_float_width = longint;

const
  CBOR_FLOAT_0 = 0;
  CBOR_FLOAT_16 = 1;
  CBOR_FLOAT_32 = 2;
  CBOR_FLOAT_64 = 3;

type
  Pcbor_dst_metadata = ^Tcbor_dst_metadata;
  Tcbor_dst_metadata = longint;

const
  _CBOR_METADATA_DEFINITE = 0;
  _CBOR_METADATA_INDEFINITE = 1;

type
  Pcbor_ctrl = ^Tcbor_ctrl;
  Tcbor_ctrl = longint;

const
  CBOR_CTRL_NONE = 0;
  CBOR_CTRL_FALSE = 20;
  CBOR_CTRL_TRUE = 21;
  CBOR_CTRL_NULL = 22;
  CBOR_CTRL_UNDEF = 23;

type
  Tcbor_int_metadata = record
    width: Tcbor_int_width;
  end;
  Pcbor_int_metadata = ^Tcbor_int_metadata;

  Tcbor_bytestring_metadata = record
    length: Tsize_t;
    _type: Tcbor_dst_metadata;
  end;
  Pcbor_bytestring_metadata = ^Tcbor_bytestring_metadata;

  Tcbor_string_metadata = record
    length: Tsize_t;
    codepoint_count: Tsize_t;
    _type: Tcbor_dst_metadata;
  end;
  Pcbor_string_metadata = ^Tcbor_string_metadata;

  Tcbor_array_metadata = record
    allocated: Tsize_t;
    end_ptr: Tsize_t;
    _type: Tcbor_dst_metadata;
  end;
  Pcbor_array_metadata = ^Tcbor_array_metadata;

  Tcbor_map_metadata = record
    allocated: Tsize_t;
    end_ptr: Tsize_t;
    _type: Tcbor_dst_metadata;
  end;
  Pcbor_map_metadata = ^Tcbor_map_metadata;

  Pcbor_item_t = ^Tcbor_item_t;
  PPcbor_item_t=^Pcbor_item_t;

  Tcbor_tag_metadata = record
    tagged_item: Pcbor_item_t;
    value: Tuint64_t;
  end;
  Pcbor_tag_metadata = ^Tcbor_tag_metadata;

  Tcbor_float_ctrl_metadata = record
    width: Tcbor_float_width;
    ctrl: Tuint8_t;
  end;
  Pcbor_float_ctrl_metadata = ^Tcbor_float_ctrl_metadata;

  Tcbor_float_helper = record
    case longint of
      0: (as_float: single);
      1: (as_uint: Tuint32_t);
  end;
  Pcbor_float_helper = ^Tcbor_float_helper;

  Tcbor_double_helper = record
    case longint of
      0: (as_double: double);
      1: (as_uint: Tuint64_t);
  end;
  Pcbor_double_helper = ^Tcbor_double_helper;

  Tcbor_item_metadata = record
    case longint of
      0: (int_metadata: Tcbor_int_metadata);
      1: (bytestring_metadata: Tcbor_bytestring_metadata);
      2: (string_metadata: Tcbor_string_metadata);
      3: (array_metadata: Tcbor_array_metadata);
      4: (map_metadata: Tcbor_map_metadata);
      5: (tag_metadata: Tcbor_tag_metadata);
      6: (float_ctrl_metadata: Tcbor_float_ctrl_metadata);
  end;
  Pcbor_item_metadata = ^Tcbor_item_metadata;

  Tcbor_item_t = record
    metadata: Tcbor_item_metadata;
    refcount: Tsize_t;
    _type: Tcbor_type;
    data: pbyte;
  end;

  Tcbor_indefinite_string_data = record
    chunk_count: Tsize_t;
    chunk_capacity: Tsize_t;
    chunks: ^Pcbor_item_t;
  end;
  Pcbor_indefinite_string_data = ^Tcbor_indefinite_string_data;

  Tcbor_error = record
    position: Tsize_t;
    code: Tcbor_error_code;
  end;
  Pcbor_error = ^Tcbor_error;

  Tcbor_pair = record
    key: Pcbor_item_t;
    value: Pcbor_item_t;
  end;
  Pcbor_pair = ^Tcbor_pair;

  Tcbor_load_result = record
    error: Tcbor_error;
    read: Tsize_t;
  end;
  Pcbor_load_result = ^Tcbor_load_result;

type
  Tcbor_decoder_status = longint;

const
  CBOR_DECODER_FINISHED = 0;
  CBOR_DECODER_NEDATA = 1;
  CBOR_DECODER_ERROR = 2;

type
  Tcbor_decoder_result = record
    read: Tsize_t;
    status: Tcbor_decoder_status;
    required: Tsize_t;
  end;
  Pcbor_decoder_result = ^Tcbor_decoder_result;

  // === Konventiert am: 9-4-26 17:15:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
