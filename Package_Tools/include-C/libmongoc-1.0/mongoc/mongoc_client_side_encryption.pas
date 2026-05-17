unit mongoc_client_side_encryption;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  Pmongoc_client_t = type Pointer;
  Pmongoc_client_pool_t = type Pointer;
  Pmongoc_cursor_t = type Pointer;
  Pmongoc_collection_t = type Pointer;
  Pmongoc_database_t = type Pointer;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  MONGOC_AEAD_AES_256_CBC_HMAC_SHA_512_RANDOM = 'AEAD_AES_256_CBC_HMAC_SHA_512-Random';
  MONGOC_AEAD_AES_256_CBC_HMAC_SHA_512_DETERMINISTIC = 'AEAD_AES_256_CBC_HMAC_SHA_512-Deterministic';
  MONGOC_ENCRYPT_ALGORITHM_INDEXED = 'Indexed';
  MONGOC_ENCRYPT_ALGORITHM_UNINDEXED = 'Unindexed';
  MONGOC_ENCRYPT_ALGORITHM_RANGEPREVIEW = 'RangePreview';
  MONGOC_ENCRYPT_QUERY_TYPE_EQUALITY = 'equality';
  MONGOC_ENCRYPT_QUERY_TYPE_RANGEPREVIEW = 'rangePreview';
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  Pmongoc_auto_encryption_opts_t = type Pointer;
  Tmongoc_kms_credentials_provider_callback_fn = function(userdata: pointer; params: Pbson_t; out_: Pbson_t; error: Pbson_error_t): Boolean; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_auto_encryption_opts_new: Pmongoc_auto_encryption_opts_t; cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_destroy(opts: Pmongoc_auto_encryption_opts_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_keyvault_client(opts: Pmongoc_auto_encryption_opts_t; client: Pmongoc_client_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_keyvault_client_pool(opts: Pmongoc_auto_encryption_opts_t; pool: Pmongoc_client_pool_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_keyvault_namespace(opts: Pmongoc_auto_encryption_opts_t; db: pchar; coll: pchar); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_kms_providers(opts: Pmongoc_auto_encryption_opts_t; kms_providers: Pbson_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_tls_opts(opts: Pmongoc_auto_encryption_opts_t; tls_opts: Pbson_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_schema_map(opts: Pmongoc_auto_encryption_opts_t; schema_map: Pbson_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_encrypted_fields_map(opts: Pmongoc_auto_encryption_opts_t; encrypted_fields_map: Pbson_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_bypass_auto_encryption(opts: Pmongoc_auto_encryption_opts_t; bypass_auto_encryption: Boolean); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_bypass_query_analysis(opts: Pmongoc_auto_encryption_opts_t; bypass_query_analysis: Boolean); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_extra(opts: Pmongoc_auto_encryption_opts_t; extra: Pbson_t); cdecl; external libmongoc;
procedure mongoc_auto_encryption_opts_set_kms_credential_provider_callback(opts: Pmongoc_auto_encryption_opts_t; fn: Tmongoc_kms_credentials_provider_callback_fn; userdata: pointer); cdecl; external libmongoc;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  Pmongoc_client_encryption_opts_t = type Pointer;
  Pmongoc_client_encryption_t = type Pointer;
  Pmongoc_client_encryption_encrypt_range_opts_t = type Pointer;
  Pmongoc_client_encryption_encrypt_opts_t = type Pointer;
  Pmongoc_client_encryption_datakey_opts_t = type Pointer;
  Pmongoc_client_encryption_rewrap_many_datakey_result_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_client_encryption_opts_new: Pmongoc_client_encryption_opts_t; cdecl; external libmongoc;
procedure mongoc_client_encryption_opts_destroy(opts: Pmongoc_client_encryption_opts_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_opts_set_keyvault_client(opts: Pmongoc_client_encryption_opts_t; keyvault_client: Pmongoc_client_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_opts_set_keyvault_namespace(opts: Pmongoc_client_encryption_opts_t; db: pchar; coll: pchar); cdecl; external libmongoc;
procedure mongoc_client_encryption_opts_set_kms_providers(opts: Pmongoc_client_encryption_opts_t; kms_providers: Pbson_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_opts_set_tls_opts(opts: Pmongoc_client_encryption_opts_t; tls_opts: Pbson_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_opts_set_kms_credential_provider_callback(opts: Pmongoc_client_encryption_opts_t; fn: Tmongoc_kms_credentials_provider_callback_fn; userdata: pointer); cdecl; external libmongoc;
function mongoc_client_encryption_rewrap_many_datakey_result_new: Pmongoc_client_encryption_rewrap_many_datakey_result_t; cdecl; external libmongoc;
procedure mongoc_client_encryption_rewrap_many_datakey_result_destroy(result: Pmongoc_client_encryption_rewrap_many_datakey_result_t); cdecl; external libmongoc;
function mongoc_client_encryption_rewrap_many_datakey_result_get_bulk_write_result(result: Pmongoc_client_encryption_rewrap_many_datakey_result_t): Pbson_t; cdecl; external libmongoc;
function mongoc_client_encryption_new(opts: Pmongoc_client_encryption_opts_t; error: Pbson_error_t): Pmongoc_client_encryption_t; cdecl; external libmongoc;
procedure mongoc_client_encryption_destroy(client_encryption: Pmongoc_client_encryption_t); cdecl; external libmongoc;
function mongoc_client_encryption_create_datakey(client_encryption: Pmongoc_client_encryption_t; kms_provider: pchar; opts: Pmongoc_client_encryption_datakey_opts_t; keyid: Pbson_value_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_rewrap_many_datakey(client_encryption: Pmongoc_client_encryption_t; filter: Pbson_t; provider: pchar; master_key: Pbson_t; result: Pmongoc_client_encryption_rewrap_many_datakey_result_t;
  error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_delete_key(client_encryption: Pmongoc_client_encryption_t; keyid: Pbson_value_t; reply: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_get_key(client_encryption: Pmongoc_client_encryption_t; keyid: Pbson_value_t; key_doc: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_get_keys(client_encryption: Pmongoc_client_encryption_t; error: Pbson_error_t): Pmongoc_cursor_t; cdecl; external libmongoc;
function mongoc_client_encryption_add_key_alt_name(client_encryption: Pmongoc_client_encryption_t; keyid: Pbson_value_t; keyaltname: pchar; key_doc: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_remove_key_alt_name(client_encryption: Pmongoc_client_encryption_t; keyid: Pbson_value_t; keyaltname: pchar; key_doc: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_get_key_by_alt_name(client_encryption: Pmongoc_client_encryption_t; keyaltname: pchar; key_doc: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_encrypt(client_encryption: Pmongoc_client_encryption_t; value: Pbson_value_t; opts: Pmongoc_client_encryption_encrypt_opts_t; ciphertext: Pbson_value_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_encrypt_expression(client_encryption: Pmongoc_client_encryption_t; expr: Pbson_t; opts: Pmongoc_client_encryption_encrypt_opts_t; expr_out: Pbson_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_decrypt(client_encryption: Pmongoc_client_encryption_t; ciphertext: Pbson_value_t; value: Pbson_value_t; error: Pbson_error_t): Boolean; cdecl; external libmongoc;
function mongoc_client_encryption_encrypt_opts_new: Pmongoc_client_encryption_encrypt_opts_t; cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_opts_destroy(opts: Pmongoc_client_encryption_encrypt_opts_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_opts_set_keyid(opts: Pmongoc_client_encryption_encrypt_opts_t; keyid: Pbson_value_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_opts_set_keyaltname(opts: Pmongoc_client_encryption_encrypt_opts_t; keyaltname: pchar); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_opts_set_algorithm(opts: Pmongoc_client_encryption_encrypt_opts_t; algorithm: pchar); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_opts_set_contention_factor(opts: Pmongoc_client_encryption_encrypt_opts_t; contention_factor: Tint64_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_opts_set_query_type(opts: Pmongoc_client_encryption_encrypt_opts_t; query_type: pchar); cdecl; external libmongoc;
function mongoc_client_encryption_encrypt_range_opts_new: Pmongoc_client_encryption_encrypt_range_opts_t; cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_range_opts_destroy(range_opts: Pmongoc_client_encryption_encrypt_range_opts_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_range_opts_set_sparsity(range_opts: Pmongoc_client_encryption_encrypt_range_opts_t; sparsity: Tint64_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_range_opts_set_min(range_opts: Pmongoc_client_encryption_encrypt_range_opts_t; min: Pbson_value_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_range_opts_set_max(range_opts: Pmongoc_client_encryption_encrypt_range_opts_t; max: Pbson_value_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_range_opts_set_precision(range_opts: Pmongoc_client_encryption_encrypt_range_opts_t; precision: Tint32_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_encrypt_opts_set_range_opts(opts: Pmongoc_client_encryption_encrypt_opts_t; range_opts: Pmongoc_client_encryption_encrypt_range_opts_t); cdecl; external libmongoc;
function mongoc_client_encryption_datakey_opts_new: Pmongoc_client_encryption_datakey_opts_t; cdecl; external libmongoc;
procedure mongoc_client_encryption_datakey_opts_destroy(opts: Pmongoc_client_encryption_datakey_opts_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_datakey_opts_set_masterkey(opts: Pmongoc_client_encryption_datakey_opts_t; masterkey: Pbson_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_datakey_opts_set_keyaltnames(opts: Pmongoc_client_encryption_datakey_opts_t; keyaltnames: PPchar; keyaltnames_count: Tuint32_t); cdecl; external libmongoc;
procedure mongoc_client_encryption_datakey_opts_set_keymaterial(opts: Pmongoc_client_encryption_datakey_opts_t; data: Puint8_t; len: Tuint32_t); cdecl; external libmongoc;
function mongoc_client_encryption_get_crypt_shared_version(enc: Pmongoc_client_encryption_t): pchar; cdecl; external libmongoc;
function mongoc_client_encryption_create_encrypted_collection(enc: Pmongoc_client_encryption_t; database: Pmongoc_database_t; name: pchar; in_options: Pbson_t; opt_out_options: Pbson_t;
  kms_provider: pchar; opt_masterkey: Pbson_t; error: Pbson_error_t): Pmongoc_collection_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:16:18 ===


implementation



end.
