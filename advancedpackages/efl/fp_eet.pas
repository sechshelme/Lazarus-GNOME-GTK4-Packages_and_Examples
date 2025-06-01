unit fp_eet;

interface

uses
  efl, fp_eina, fp_emile;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EET_VERSION_MAJOR = EFL_VERSION_MAJOR;
  EET_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEet_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEet_Version = ^TEet_Version;

var
  eet_version: PEet_Version; cvar;external libeet;

type
  PEet_Error = ^TEet_Error;
  TEet_Error = longint;

const
  EET_ERROR_NONE = 0;
  EET_ERROR_BAD_OBJECT = 1;
  EET_ERROR_EMPTY = 2;
  EET_ERROR_NOT_WRITABLE = 3;
  EET_ERROR_OUT_OF_MEMORY = 4;
  EET_ERROR_WRITE_ERROR = 5;
  EET_ERROR_WRITE_ERROR_FILE_TOO_BIG = 6;
  EET_ERROR_WRITE_ERROR_IO_ERROR = 7;
  EET_ERROR_WRITE_ERROR_OUT_OF_SPACE = 8;
  EET_ERROR_WRITE_ERROR_FILE_CLOSED = 9;
  EET_ERROR_MMAP_FAILED = 10;
  EET_ERROR_X509_ENCODING_FAILED = 11;
  EET_ERROR_SIGNATURE_FAILED = 12;
  EET_ERROR_INVALID_SIGNATURE = 13;
  EET_ERROR_NOT_SIGNED = 14;
  EET_ERROR_NOT_IMPLEMENTED = 15;
  EET_ERROR_PRNG_NOT_SEEDED = 16;
  EET_ERROR_ENCRYPT_FAILED = 17;
  EET_ERROR_DECRYPT_FAILED = 18;

type
  PEet_Compression = ^TEet_Compression;
  TEet_Compression = longint;

const
  EET_COMPRESSION_NONE = 0;
  EET_COMPRESSION_DEFAULT = 1;
  EET_COMPRESSION_LOW = 2;
  EET_COMPRESSION_MED = 6;
  EET_COMPRESSION_HI = 9;
  EET_COMPRESSION_VERYFAST = 10;
  EET_COMPRESSION_SUPERFAST = 11;
  EET_COMPRESSION_LOW2 = 3;
  EET_COMPRESSION_MED1 = 4;
  EET_COMPRESSION_MED2 = 5;
  EET_COMPRESSION_HI1 = 7;
  EET_COMPRESSION_HI2 = 8;

function eet_init: longint; cdecl; external libeet;
function eet_shutdown: longint; cdecl; external libeet;
procedure eet_clearcache; cdecl; external libeet;

type
  PEet_File_Mode = ^TEet_File_Mode;
  TEet_File_Mode = longint;

const
  EET_FILE_MODE_INVALID = -(1);
  EET_FILE_MODE_READ = (-(1)) + 1;
  EET_FILE_MODE_WRITE = (-(1)) + 2;
  EET_FILE_MODE_READ_WRITE = (-(1)) + 3;

type
  PEet_Image_Encoding = ^TEet_Image_Encoding;
  TEet_Image_Encoding = TEmile_Image_Encoding;

const
  EET_IMAGE_LOSSLESS = EMILE_IMAGE_LOSSLESS;
  EET_IMAGE_JPEG = EMILE_IMAGE_JPEG;
  EET_IMAGE_ETC1 = EMILE_IMAGE_ETC1;
  EET_IMAGE_ETC2_RGB = EMILE_IMAGE_ETC2_RGB;
  EET_IMAGE_ETC2_RGBA = EMILE_IMAGE_ETC2_RGBA;
  EET_IMAGE_ETC1_ALPHA = EMILE_IMAGE_ETC1_ALPHA;

type
  PPEet_Colorspace = ^PEet_Colorspace;
  PEet_Colorspace = ^TEet_Colorspace;
  TEet_Colorspace = TEmile_Colorspace;

const
  EET_COLORSPACE_ARGB8888 = EMILE_COLORSPACE_ARGB8888;
  EET_COLORSPACE_GRY8 = EMILE_COLORSPACE_GRY8;
  EET_COLORSPACE_AGRY88 = EMILE_COLORSPACE_AGRY88;
  EET_COLORSPACE_ETC1 = EMILE_COLORSPACE_ETC1;
  EET_COLORSPACE_RGB8_ETC2 = EMILE_COLORSPACE_RGB8_ETC2;
  EET_COLORSPACE_RGBA8_ETC2_EAC = EMILE_COLORSPACE_RGBA8_ETC2_EAC;
  EET_COLORSPACE_ETC1_ALPHA = EMILE_COLORSPACE_ETC1_ALPHA;

type
  TEet_File = record
  end;
  PEet_File = ^TEet_File;

  TEet_Dictionary = record
  end;
  PEet_Dictionary = ^TEet_Dictionary;

  TEet_Entry = record
    name: pchar;
    offset: longint;
    size: longint;
    data_size: longint;
    compression: TEina_Bool;
    ciphered: TEina_Bool;
    alias: TEina_Bool;
  end;
  PEet_Entry = ^TEet_Entry;

function eet_open(file_: pchar; mode: TEet_File_Mode): PEet_File; cdecl; external libeet;
function eet_mmap(file_: PEina_File): PEet_File; cdecl; external libeet;
function eet_memopen_read(data: pointer; size: Tsize_t): PEet_File; cdecl; external libeet;
function eet_mode_get(ef: PEet_File): TEet_File_Mode; cdecl; external libeet;
function eet_close(ef: PEet_File): TEet_Error; cdecl; external libeet;
function eet_sync(ef: PEet_File): TEet_Error; cdecl; external libeet;
function eet_sync_sync(ef: PEet_File): TEet_Error; cdecl; external libeet;
function eet_dictionary_get(ef: PEet_File): PEet_Dictionary; cdecl; external libeet;
function eet_dictionary_string_check(ed: PEet_Dictionary; _string: pchar): longint; cdecl; external libeet;
function eet_dictionary_count(ed: PEet_Dictionary): longint; cdecl; external libeet;
function eet_read(ef: PEet_File; name: pchar; size_ret: Plongint): pointer; cdecl; external libeet;
function eet_read_direct(ef: PEet_File; name: pchar; size_ret: Plongint): pointer; cdecl; external libeet;
function eet_write(ef: PEet_File; name: pchar; data: pointer; size: longint; compress: longint): longint; cdecl; external libeet;
function eet_delete(ef: PEet_File; name: pchar): longint; cdecl; external libeet;
function eet_alias(ef: PEet_File; name: pchar; destination: pchar; compress: longint): TEina_Bool; cdecl; external libeet;
function eet_file_get(ef: PEet_File): pchar; cdecl; external libeet;
function eet_alias_get(ef: PEet_File; name: pchar): pchar; cdecl; external libeet;
function eet_list(ef: PEet_File; glob: pchar; count_ret: Plongint): PPchar; cdecl; external libeet;
function eet_list_entries(ef: PEet_File): PEina_Iterator; cdecl; external libeet;
function eet_num_entries(ef: PEet_File): longint; cdecl; external libeet;
function eet_read_cipher(ef: PEet_File; name: pchar; size_ret: Plongint; cipher_key: pchar): pointer; cdecl; external libeet;
function eet_write_cipher(ef: PEet_File; name: pchar; data: pointer; size: longint; compress: longint;
  cipher_key: pchar): longint; cdecl; external libeet;
function eet_data_image_header_read(ef: PEet_File; name: pchar; w: Pdword; h: Pdword; alpha: Plongint;
  compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_read(ef: PEet_File; name: pchar; w: Pdword; h: Pdword; alpha: Plongint;
  compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): pointer; cdecl; external libeet;
function eet_data_image_read_to_surface(ef: PEet_File; name: pchar; src_x: dword; src_y: dword; d: Pdword;
  w: dword; h: dword; row_stride: dword; alpha: Plongint; compress: Plongint;
  quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_write(ef: PEet_File; name: pchar; data: pointer; w: dword; h: dword;
  alpha: longint; compress: longint; quality: longint; lossy: TEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_header_decode(data: pointer; size: longint; w: Pdword; h: Pdword; alpha: Plongint;
  compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_decode(data: pointer; size: longint; w: Pdword; h: Pdword; alpha: Plongint;
  compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): pointer; cdecl; external libeet;
function eet_data_image_decode_to_surface(data: pointer; size: longint; src_x: dword; src_y: dword; d: Pdword;
  w: dword; h: dword; row_stride: dword; alpha: Plongint; compress: Plongint;
  quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_encode(data: pointer; size_ret: Plongint; w: dword; h: dword; alpha: longint;
  compress: longint; quality: longint; lossy: TEet_Image_Encoding): pointer; cdecl; external libeet;
function eet_data_image_header_read_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; w: Pdword; h: Pdword;
  alpha: Plongint; compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_colorspace_get(ef: PEet_File; name: pchar; cipher_key: pchar; cspaces: PPEet_Colorspace): longint; cdecl; external libeet;
function eet_data_image_read_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; w: Pdword; h: Pdword;
  alpha: Plongint; compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): pointer; cdecl; external libeet;
function eet_data_image_read_to_surface_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; src_x: dword; src_y: dword;
  d: Pdword; w: dword; h: dword; row_stride: dword; alpha: Plongint;
  compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_read_to_cspace_surface_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; src_x: dword; src_y: dword;
  d: Pdword; w: dword; h: dword; row_stride: dword; cspace: TEet_Colorspace;
  alpha: Plongint; comp: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_decode_to_cspace_surface_cipher(data: pointer; cipher_key: pchar; size: longint; src_x: dword; src_y: dword;
  d: Pdword; w: dword; h: dword; row_stride: dword; cspace: TEet_Colorspace;
  alpha: Plongint; comp: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_write_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; data: pointer; w: dword;
  h: dword; alpha: longint; compress: longint; quality: longint; lossy: TEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_header_decode_cipher(data: pointer; cipher_key: pchar; size: longint; w: Pdword; h: Pdword;
  alpha: Plongint; compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_decode_cipher(data: pointer; cipher_key: pchar; size: longint; w: Pdword; h: Pdword;
  alpha: Plongint; compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): pointer; cdecl; external libeet;
function eet_data_image_decode_to_surface_cipher(data: pointer; cipher_key: pchar; size: longint; src_x: dword; src_y: dword;
  d: Pdword; w: dword; h: dword; row_stride: dword; alpha: Plongint;
  compress: Plongint; quality: Plongint; lossy: PEet_Image_Encoding): longint; cdecl; external libeet;
function eet_data_image_encode_cipher(data: pointer; cipher_key: pchar; w: dword; h: dword; alpha: longint;
  compress: longint; quality: longint; lossy: TEet_Image_Encoding; size_ret: Plongint): pointer; cdecl; external libeet;

type
  TEet_Key = record
  end;
  PEet_Key = ^TEet_Key;

  TEet_Key_Password_Callback = function(buffer: pchar; size: longint; rwflag: longint; data: pointer): longint; cdecl;

function eet_identity_open(certificate_file: pchar; private_key_file: pchar; cb: TEet_Key_Password_Callback): PEet_Key; cdecl; external libeet;
procedure eet_identity_close(key: PEet_Key); cdecl; external libeet;
function eet_identity_set(ef: PEet_File; key: PEet_Key): TEet_Error; cdecl; external libeet;
procedure eet_identity_print(key: PEet_Key; out_: PFILE); cdecl; external libeet;
function eet_identity_verify(ef: PEet_File; certificate_file: pchar): TEina_Bool; cdecl; external libeet;
function eet_identity_x509(ef: PEet_File; der_length: Plongint): pointer; cdecl; external libeet;
function eet_identity_signature(ef: PEet_File; signature_length: Plongint): pointer; cdecl; external libeet;
function eet_identity_sha1(ef: PEet_File; sha1_length: Plongint): pointer; cdecl; external libeet;
procedure eet_identity_certificate_print(certificate: pbyte; der_length: longint; out_: PFILE); cdecl; external libeet;

const
  EET_T_UNKNOW = 0;
  EET_T_CHAR = 1;
  EET_T_SHORT = 2;
  EET_T_INT = 3;
  EET_T_LONG_LONG = 4;
  EET_T_FLOAT = 5;
  EET_T_DOUBLE = 6;
  EET_T_UCHAR = 7;
  EET_T_USHORT = 8;
  EET_T_UINT = 9;
  EET_T_ULONG_LONG = 10;
  EET_T_STRING = 11;
  EET_T_INLINED_STRING = 12;
  EET_T_NULL = 13;
  EET_T_F32P32 = 14;
  EET_T_F16P16 = 15;
  EET_T_F8P24 = 16;
  EET_T_VALUE = 17;
  EET_T_LAST = 18;
  EET_G_UNKNOWN = 100;
  EET_G_ARRAY = 101;
  EET_G_VAR_ARRAY = 102;
  EET_G_LIST = 103;
  EET_G_HASH = 104;
  EET_G_UNION = 105;
  EET_G_VARIANT = 106;
  EET_G_UNKNOWN_NESTED = 107;
  EET_G_LAST = 108;
  EET_I_LIMIT = 128;

type
  TEet_Data_Descriptor = record
  end;
  PEet_Data_Descriptor = ^TEet_Data_Descriptor;

const
  EET_DATA_DESCRIPTOR_CLASS_VERSION = 4;

type
  TEet_Descriptor_Hash_Foreach_Callback_Callback = function(h: pointer; k: pchar; dt: pointer; fdt: pointer): longint; cdecl;

  PEet_Descriptor_Mem_Alloc_Callback = ^TEet_Descriptor_Mem_Alloc_Callback;
  TEet_Descriptor_Mem_Alloc_Callback = function(size: Tsize_t): pointer; cdecl;

  TEet_Descriptor_Mem_Free_Callback = procedure(mem: pointer); cdecl;

  PEet_Descriptor_Str_Alloc_Callback = ^TEet_Descriptor_Str_Alloc_Callback;
  TEet_Descriptor_Str_Alloc_Callback = function(str: pchar): pchar; cdecl;

  TEet_Descriptor_Str_Free_Callback = procedure(str: pchar); cdecl;

  PEet_Descriptor_List_Next_Callback = ^TEet_Descriptor_List_Next_Callback;
  TEet_Descriptor_List_Next_Callback = function(l: pointer): pointer; cdecl;

  PEet_Descriptor_List_Append_Callback = ^TEet_Descriptor_List_Append_Callback;
  TEet_Descriptor_List_Append_Callback = function(l: pointer; d: pointer): pointer; cdecl;

  PEet_Descriptor_List_Data_Callback = ^TEet_Descriptor_List_Data_Callback;
  TEet_Descriptor_List_Data_Callback = function(l: pointer): pointer; cdecl;

  PEet_Descriptor_List_Free_Callback = ^TEet_Descriptor_List_Free_Callback;
  TEet_Descriptor_List_Free_Callback = function(l: pointer): pointer; cdecl;

  TEet_Descriptor_Hash_Foreach_Callback = procedure(h: pointer; func: TEet_Descriptor_Hash_Foreach_Callback_Callback; fdt: pointer); cdecl;

  PEet_Descriptor_Hash_Add_Callback = ^TEet_Descriptor_Hash_Add_Callback;
  TEet_Descriptor_Hash_Add_Callback = function(h: pointer; k: pchar; d: pointer): pointer; cdecl;

  TEet_Descriptor_Hash_Free_Callback = procedure(h: pointer); cdecl;

  PEet_Descriptor_Str_Direct_Alloc_Callback = ^TEet_Descriptor_Str_Direct_Alloc_Callback;
  TEet_Descriptor_Str_Direct_Alloc_Callback = function(str: pchar): pchar; cdecl;

  TEet_Descriptor_Str_Direct_Free_Callback = procedure(str: pchar); cdecl;

  PEet_Descriptor_Type_Get_Callback = ^TEet_Descriptor_Type_Get_Callback;
  TEet_Descriptor_Type_Get_Callback = function(data: pointer; unknow: PEina_Bool): pchar; cdecl;

  TEet_Descriptor_Type_Set_Callback = function(_type: pchar; data: pointer; unknow: TEina_Bool): TEina_Bool; cdecl;

  PEet_Descriptor_Array_Alloc_Callback = ^TEet_Descriptor_Array_Alloc_Callback;
  TEet_Descriptor_Array_Alloc_Callback = function(size: Tsize_t): pointer; cdecl;

  TEet_Descriptor_Array_Free_Callback = procedure(mem: pointer); cdecl;

  TEet_Data_Descriptor_Class = record
    version: longint;
    name: pchar;
    size: longint;
    func: record
      mem_alloc: TEet_Descriptor_Mem_Alloc_Callback;
      mem_free: TEet_Descriptor_Mem_Free_Callback;
      str_alloc: TEet_Descriptor_Str_Alloc_Callback;
      str_free: TEet_Descriptor_Str_Free_Callback;
      list_next: TEet_Descriptor_List_Next_Callback;
      list_append: TEet_Descriptor_List_Append_Callback;
      list_data: TEet_Descriptor_List_Data_Callback;
      list_free: TEet_Descriptor_List_Free_Callback;
      hash_foreach: TEet_Descriptor_Hash_Foreach_Callback;
      hash_add: TEet_Descriptor_Hash_Add_Callback;
      hash_free: TEet_Descriptor_Hash_Free_Callback;
      str_direct_alloc: TEet_Descriptor_Str_Direct_Alloc_Callback;
      str_direct_free: TEet_Descriptor_Str_Direct_Free_Callback;
      type_get: TEet_Descriptor_Type_Get_Callback;
      type_set: TEet_Descriptor_Type_Set_Callback;
      array_alloc: TEet_Descriptor_Array_Alloc_Callback;
      array_free: TEet_Descriptor_Array_Free_Callback;
      end;
  end;
  PEet_Data_Descriptor_Class = ^TEet_Data_Descriptor_Class;

function eet_data_descriptor_new(name: pchar; size: longint; func_list_next: TEet_Descriptor_List_Next_Callback; func_list_append: TEet_Descriptor_List_Append_Callback; func_list_data: TEet_Descriptor_List_Data_Callback;
  func_list_free: TEet_Descriptor_List_Free_Callback; func_hash_foreach: TEet_Descriptor_Hash_Foreach_Callback; func_hash_add: TEet_Descriptor_Hash_Add_Callback; func_hash_free: TEet_Descriptor_Hash_Free_Callback): PEet_Data_Descriptor; cdecl; external libeet; deprecated;
function eet_data_descriptor2_new(eddc: PEet_Data_Descriptor_Class): PEet_Data_Descriptor; cdecl; external libeet; deprecated;
function eet_data_descriptor3_new(eddc: PEet_Data_Descriptor_Class): PEet_Data_Descriptor; cdecl; external libeet; deprecated;
function eet_data_descriptor_stream_new(eddc: PEet_Data_Descriptor_Class): PEet_Data_Descriptor; cdecl; external libeet;
function eet_data_descriptor_file_new(eddc: PEet_Data_Descriptor_Class): PEet_Data_Descriptor; cdecl; external libeet;
function eet_eina_stream_data_descriptor_class_set(eddc: PEet_Data_Descriptor_Class; eddc_size: dword; name: pchar; size: longint): TEina_Bool; cdecl; external libeet;
function eet_eina_file_data_descriptor_class_set(eddc: PEet_Data_Descriptor_Class; eddc_size: dword; name: pchar; size: longint): TEina_Bool; cdecl; external libeet;
procedure eet_data_descriptor_free(edd: PEet_Data_Descriptor); cdecl; external libeet;
function eet_data_descriptor_name_get(edd: PEet_Data_Descriptor): pchar; cdecl; external libeet;
procedure eet_data_descriptor_element_add(edd: PEet_Data_Descriptor; name: pchar; _type: longint; group_type: longint; offset: longint;
  count: longint; counter_name: pchar; subtype: PEet_Data_Descriptor); cdecl; external libeet;
function eet_data_read(ef: PEet_File; edd: PEet_Data_Descriptor; name: pchar): pointer; cdecl; external libeet;
function eet_data_write(ef: PEet_File; edd: PEet_Data_Descriptor; name: pchar; data: pointer; compress: longint): longint; cdecl; external libeet;

type
  TEet_Dump_Callback = procedure(data: pointer; str: pchar); cdecl;

function eet_data_text_dump(data_in: pointer; size_in: longint; dumpfunc: TEet_Dump_Callback; dumpdata: pointer): longint; cdecl; external libeet;
function eet_data_text_undump(text: pchar; textlen: longint; size_ret: Plongint): pointer; cdecl; external libeet;
function eet_data_dump(ef: PEet_File; name: pchar; dumpfunc: TEet_Dump_Callback; dumpdata: pointer): longint; cdecl; external libeet;
function eet_data_undump(ef: PEet_File; name: pchar; text: pchar; textlen: longint; compress: longint): longint; cdecl; external libeet;
function eet_data_descriptor_decode(edd: PEet_Data_Descriptor; data_in: pointer; size_in: longint): pointer; cdecl; external libeet;
function eet_data_descriptor_encode(edd: PEet_Data_Descriptor; data_in: pointer; size_ret: Plongint): pointer; cdecl; external libeet;
function eet_data_read_cipher(ef: PEet_File; edd: PEet_Data_Descriptor; name: pchar; cipher_key: pchar): pointer; cdecl; external libeet;
function eet_data_read_cipher_buffer(ef: PEet_File; edd: PEet_Data_Descriptor; name: pchar; cipher_key: pchar; buffer: pchar;
  buffer_size: longint): pointer; cdecl; external libeet;
function eet_data_xattr_cipher_get(filename: pchar; attribute: pchar; edd: PEet_Data_Descriptor; cipher_key: pchar): pointer; cdecl; external libeet;
function eet_data_write_cipher(ef: PEet_File; edd: PEet_Data_Descriptor; name: pchar; cipher_key: pchar; data: pointer;
  compress: longint): longint; cdecl; external libeet;
function eet_data_xattr_cipher_set(filename: pchar; attribute: pchar; edd: PEet_Data_Descriptor; cipher_key: pchar; data: pointer;
  flags: TEina_Xattr_Flags): TEina_Bool; cdecl; external libeet;
function eet_data_text_dump_cipher(data_in: pointer; cipher_key: pchar; size_in: longint; dumpfunc: TEet_Dump_Callback; dumpdata: pointer): longint; cdecl; external libeet;
function eet_data_text_undump_cipher(text: pchar; cipher_key: pchar; textlen: longint; size_ret: Plongint): pointer; cdecl; external libeet;
function eet_data_dump_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; dumpfunc: TEet_Dump_Callback; dumpdata: pointer): longint; cdecl; external libeet;
function eet_data_undump_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; text: pchar; textlen: longint;
  compress: longint): longint; cdecl; external libeet;
function eet_data_descriptor_decode_cipher(edd: PEet_Data_Descriptor; data_in: pointer; cipher_key: pchar; size_in: longint): pointer; cdecl; external libeet;
function eet_data_descriptor_encode_cipher(edd: PEet_Data_Descriptor; data_in: pointer; cipher_key: pchar; size_ret: Plongint): pointer; cdecl; external libeet;

type
  TEet_Node = record
  end;
  PEet_Node = ^TEet_Node;

  TEet_Node_Data = record
    value: record
      case longint of
        0: (c: char);
        1: (s: smallint);
        2: (i: longint);
        3: (l: int64);
        4: (f: single);
        5: (d: double);
        6: (uc: byte);
        7: (us: word);
        8: (ui: dword);
        9: (ul: qword);
        10: (str: pchar);
      end;
  end;
  PEet_Node_Data = ^TEet_Node_Data;

function eet_node_char_new(name: pchar; c: char): PEet_Node; cdecl; external libeet;
function eet_node_short_new(name: pchar; s: smallint): PEet_Node; cdecl; external libeet;
function eet_node_int_new(name: pchar; i: longint): PEet_Node; cdecl; external libeet;
function eet_node_long_long_new(name: pchar; l: int64): PEet_Node; cdecl; external libeet;
function eet_node_float_new(name: pchar; f: single): PEet_Node; cdecl; external libeet;
function eet_node_double_new(name: pchar; d: double): PEet_Node; cdecl; external libeet;
function eet_node_unsigned_char_new(name: pchar; uc: byte): PEet_Node; cdecl; external libeet;
function eet_node_unsigned_short_new(name: pchar; us: word): PEet_Node; cdecl; external libeet;
function eet_node_unsigned_int_new(name: pchar; ui: dword): PEet_Node; cdecl; external libeet;
function eet_node_unsigned_long_long_new(name: pchar; l: qword): PEet_Node; cdecl; external libeet;
function eet_node_string_new(name: pchar; str: pchar): PEet_Node; cdecl; external libeet;
function eet_node_inlined_string_new(name: pchar; str: pchar): PEet_Node; cdecl; external libeet;
function eet_node_null_new(name: pchar): PEet_Node; cdecl; external libeet;
function eet_node_list_new(name: pchar; nodes: PEina_List): PEet_Node; cdecl; external libeet;
function eet_node_array_new(name: pchar; count: longint; nodes: PEina_List): PEet_Node; cdecl; external libeet;
function eet_node_var_array_new(name: pchar; nodes: PEina_List): PEet_Node; cdecl; external libeet;
function eet_node_hash_new(name: pchar; key: pchar; node: PEet_Node): PEet_Node; cdecl; external libeet;
function eet_node_struct_new(name: pchar; nodes: PEina_List): PEet_Node; cdecl; external libeet;
function eet_node_struct_child_new(parent: pchar; child: PEet_Node): PEet_Node; cdecl; external libeet;
function eet_node_children_get(node: PEet_Node): PEet_Node; cdecl; external libeet;
function eet_node_next_get(node: PEet_Node): PEet_Node; cdecl; external libeet;
function eet_node_parent_get(node: PEet_Node): PEet_Node; cdecl; external libeet;
procedure eet_node_list_append(parent: PEet_Node; name: pchar; child: PEet_Node); cdecl; external libeet;
procedure eet_node_struct_append(parent: PEet_Node; name: pchar; child: PEet_Node); cdecl; external libeet;
procedure eet_node_hash_add(parent: PEet_Node; name: pchar; key: pchar; child: PEet_Node); cdecl; external libeet;
procedure eet_node_dump(n: PEet_Node; dumplevel: longint; dumpfunc: TEet_Dump_Callback; dumpdata: pointer); cdecl; external libeet;
function eet_node_type_get(node: PEet_Node): longint; cdecl; external libeet;
function eet_node_value_get(node: PEet_Node): PEet_Node_Data; cdecl; external libeet;
procedure eet_node_del(n: PEet_Node); cdecl; external libeet;
function eet_data_node_encode_cipher(node: PEet_Node; cipher_key: pchar; size_ret: Plongint): pointer; cdecl; external libeet;
function eet_data_node_decode_cipher(data_in: pointer; cipher_key: pchar; size_in: longint): PEet_Node; cdecl; external libeet;
function eet_data_node_read_cipher(ef: PEet_File; name: pchar; cipher_key: pchar): PEet_Node; cdecl; external libeet;
function eet_data_node_write_cipher(ef: PEet_File; name: pchar; cipher_key: pchar; node: PEet_Node; compress: longint): longint; cdecl; external libeet;

type
  PEet_Node_Walk_Struct_Alloc_Callback = ^TEet_Node_Walk_Struct_Alloc_Callback;
  TEet_Node_Walk_Struct_Alloc_Callback = function(_type: pchar; user_data: pointer): pointer; cdecl;

  TEet_Node_Walk_Struct_Add_Callback = procedure(parent: pointer; name: pchar; child: pointer; user_data: pointer); cdecl;

  PEet_Node_Walk_Array_Callback = ^TEet_Node_Walk_Array_Callback;
  TEet_Node_Walk_Array_Callback = function(variable: TEina_Bool; name: pchar; count: longint; user_data: pointer): pointer; cdecl;

  TEet_Node_Walk_Insert_Callback = procedure(arr: pointer; index: longint; child: pointer; user_data: pointer); cdecl;

  PEet_Node_Walk_List_Callback = ^TEet_Node_Walk_List_Callback;
  TEet_Node_Walk_List_Callback = function(name: pchar; user_data: pointer): pointer; cdecl;

  TEet_Node_Walk_Append_Callback = procedure(list: pointer; child: pointer; user_data: pointer); cdecl;

  PEet_Node_Walk_Hash_Callback = ^TEet_Node_Walk_Hash_Callback;
  TEet_Node_Walk_Hash_Callback = function(parent: pointer; name: pchar; key: pchar; value: pointer; user_data: pointer): pointer; cdecl;

  PEet_Node_Walk_Simple_Callback = ^TEet_Node_Walk_Simple_Callback;
  TEet_Node_Walk_Simple_Callback = function(_type: longint; data: PEet_Node_Data; user_data: pointer): pointer; cdecl;

  TEet_Node_Walk = record
    struct_alloc: TEet_Node_Walk_Struct_Alloc_Callback;
    struct_add: TEet_Node_Walk_Struct_Add_Callback;
    arr: TEet_Node_Walk_Array_Callback;
    insert: TEet_Node_Walk_Insert_Callback;
    list: TEet_Node_Walk_List_Callback;
    append: TEet_Node_Walk_Append_Callback;
    hash: TEet_Node_Walk_Hash_Callback;
    simple: TEet_Node_Walk_Simple_Callback;
  end;
  PEet_Node_Walk = ^TEet_Node_Walk;

function eet_node_walk(parent: pointer; name: pchar; root: PEet_Node; cb: PEet_Node_Walk; user_data: pointer): pointer; cdecl; external libeet;

type
  TEet_Connection = record
  end;
  PEet_Connection = ^TEet_Connection;

  TEet_Read_Cb = function(eet_data: pointer; size: Tsize_t; user_data: pointer): TEina_Bool; cdecl;
  TEet_Write_Cb = function(data: pointer; size: Tsize_t; user_data: pointer): TEina_Bool; cdecl;

function eet_connection_new(eet_read_cb: TEet_Read_Cb; eet_write_cb: TEet_Write_Cb; user_data: pointer): PEet_Connection; cdecl; external libeet;
function eet_connection_received(conn: PEet_Connection; data: pointer; size: Tsize_t): longint; cdecl; external libeet;
function eet_connection_empty(conn: PEet_Connection): TEina_Bool; cdecl; external libeet;
function eet_connection_send(conn: PEet_Connection; edd: PEet_Data_Descriptor; data_in: pointer; cipher_key: pchar): TEina_Bool; cdecl; external libeet;
function eet_connection_node_send(conn: PEet_Connection; node: PEet_Node; cipher_key: pchar): TEina_Bool; cdecl; external libeet;
function eet_connection_close(conn: PEet_Connection; on_going: PEina_Bool): pointer; cdecl; external libeet;

// === Konventiert am: 28-5-25 13:03:02 ===


implementation



end.
