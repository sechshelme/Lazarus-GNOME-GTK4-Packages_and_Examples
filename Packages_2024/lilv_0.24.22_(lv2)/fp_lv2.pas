unit fp_lv2;

interface

const
  {$IFDEF linux}
  liblv2 = 'lilv-0';     // ????
  {$ENDIF}

  {$IFDEF windows}
  liblv2 = 'lv2.dll'; // ????
  {$ENDIF}


type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

// /usr/include/lv2/core/lv2.h
// Es wurde nur das nötigste übersetzt

type
  PLV2_Handle = ^TLV2_Handle;
  TLV2_Handle = pointer;

  TLV2_Feature = record
    URI: pchar;
    data: pointer;
  end;
  PLV2_Feature = ^TLV2_Feature;
  PPLV2_Feature = ^PLV2_Feature;

  PLV2_Descriptor = ^TLV2_Descriptor;

  TLV2_Descriptor = record
    URI: pchar;
    instantiate: function(descriptor: PLV2_Descriptor; sample_rate: double; bundle_path: pchar; features: PPLV2_Feature): TLV2_Handle; cdecl;
    connect_port: procedure(instance: TLV2_Handle; port: Tuint32_t; data_location: pointer); cdecl;
    activate: procedure(instance: TLV2_Handle); cdecl;
    run: procedure(instance: TLV2_Handle; sample_count: Tuint32_t); cdecl;
    deactivate: procedure(instance: TLV2_Handle); cdecl;
    cleanup: procedure(instance: TLV2_Handle); cdecl;
    extension_data: function(uri: pchar): pointer; cdecl;
  end;

function lv2_descriptor(index: Tuint32_t): PLV2_Descriptor; cdecl; external liblv2;

type
  TLV2_Descriptor_Function = function(index: Tuint32_t): PLV2_Descriptor; cdecl;

  PLV2_Lib_Handle = ^TLV2_Lib_Handle;
  TLV2_Lib_Handle = pointer;

  PLV2_Lib_Descriptor = ^TLV2_Lib_Descriptor;

  TLV2_Lib_Descriptor = record
    handle: TLV2_Lib_Handle;
    size: Tuint32_t;
    cleanup: procedure(handle: TLV2_Lib_Handle); cdecl;
    get_plugin: function(handle: TLV2_Lib_Handle; index: Tuint32_t): PLV2_Descriptor; cdecl;
  end;

function lv2_lib_descriptor(bundle_path: pchar; features: PPLV2_Feature): PLV2_Lib_Descriptor; cdecl; external liblv2;

type
  TLV2_Lib_Descriptor_Function = function(bundle_path: pchar; features: PPLV2_Feature): PLV2_Lib_Descriptor; cdecl;


implementation

end.

