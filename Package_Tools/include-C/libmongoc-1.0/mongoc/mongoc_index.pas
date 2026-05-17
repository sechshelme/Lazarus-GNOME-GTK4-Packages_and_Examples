unit mongoc_index;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Tmongoc_index_opt_geo_t = record
    twod_sphere_version: Tuint8_t;
    twod_bits_precision: Tuint8_t;
    twod_location_min: double;
    twod_location_max: double;
    haystack_bucket_size: double;
    padding: array[0..31] of Puint8_t;
  end;
  Pmongoc_index_opt_geo_t = ^Tmongoc_index_opt_geo_t;

  Tmongoc_index_opt_storage_t = record
    _type: longint;
  end;
  Pmongoc_index_opt_storage_t = ^Tmongoc_index_opt_storage_t;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  Pmongoc_index_storage_opt_type_t = ^Tmongoc_index_storage_opt_type_t;
  Tmongoc_index_storage_opt_type_t = longint;

const
  MONGOC_INDEX_STORAGE_OPT_MMAPV1 = 0;
  MONGOC_INDEX_STORAGE_OPT_WIREDTIGER = 1;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Tmongoc_index_opt_wt_t = record
    base: Tmongoc_index_opt_storage_t;
    config_str: pchar;
    padding: array[0..7] of pointer;
  end;
  Pmongoc_index_opt_wt_t = ^Tmongoc_index_opt_wt_t;

  Tmongoc_index_opt_t = record
    is_initialized: Boolean;
    background: Boolean;
    unique: Boolean;
    name: pchar;
    drop_dups: Boolean;
    sparse: Boolean;
    expire_after_seconds: Tint32_t;
    v: Tint32_t;
    weights: Pbson_t;
    default_language: pchar;
    language_override: pchar;
    geo_options: Pmongoc_index_opt_geo_t;
    storage_options: Pmongoc_index_opt_storage_t;
    partial_filter_expression: Pbson_t;
    collation: Pbson_t;
    padding: array[0..3] of pointer;
  end;
  Pmongoc_index_opt_t = ^Tmongoc_index_opt_t;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_index_opt_get_default: Pmongoc_index_opt_t; cdecl; external libmongoc;
function mongoc_index_opt_geo_get_default: Pmongoc_index_opt_geo_t; cdecl; external libmongoc;
function mongoc_index_opt_wt_get_default: Pmongoc_index_opt_wt_t; cdecl; external libmongoc;
procedure mongoc_index_opt_init(opt: Pmongoc_index_opt_t); cdecl; external libmongoc;
procedure mongoc_index_opt_geo_init(opt: Pmongoc_index_opt_geo_t); cdecl; external libmongoc;
procedure mongoc_index_opt_wt_init(opt: Pmongoc_index_opt_wt_t); cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:33 ===


implementation



end.
