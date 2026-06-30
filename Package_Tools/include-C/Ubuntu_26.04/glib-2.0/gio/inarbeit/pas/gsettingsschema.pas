unit gsettingsschema;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGSettingsSchemaSource = type Pointer;
  PGSettingsSchema = type Pointer;
  PGSettingsSchemaKey = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_settings_schema_source_get_type: TGType; cdecl; external libgio2;
function g_settings_schema_source_get_default: PGSettingsSchemaSource; cdecl; external libgio2;
function g_settings_schema_source_ref(source: PGSettingsSchemaSource): PGSettingsSchemaSource; cdecl; external libgio2;
procedure g_settings_schema_source_unref(source: PGSettingsSchemaSource); cdecl; external libgio2;
function g_settings_schema_source_new_from_directory(directory: Pgchar; parent: PGSettingsSchemaSource; trusted: Tgboolean; error: PPGError): PGSettingsSchemaSource; cdecl; external libgio2;
function g_settings_schema_source_lookup(source: PGSettingsSchemaSource; schema_id: Pgchar; recursive: Tgboolean): PGSettingsSchema; cdecl; external libgio2;
procedure g_settings_schema_source_list_schemas(source: PGSettingsSchemaSource; recursive: Tgboolean; non_relocatable: PPPgchar; relocatable: PPPgchar); cdecl; external libgio2;

function g_settings_schema_get_type: TGType; cdecl; external libgio2;
function g_settings_schema_ref(schema: PGSettingsSchema): PGSettingsSchema; cdecl; external libgio2;
procedure g_settings_schema_unref(schema: PGSettingsSchema); cdecl; external libgio2;
function g_settings_schema_get_id(schema: PGSettingsSchema): Pgchar; cdecl; external libgio2;
function g_settings_schema_get_path(schema: PGSettingsSchema): Pgchar; cdecl; external libgio2;
function g_settings_schema_get_key(schema: PGSettingsSchema; name: Pgchar): PGSettingsSchemaKey; cdecl; external libgio2;
function g_settings_schema_has_key(schema: PGSettingsSchema; name: Pgchar): Tgboolean; cdecl; external libgio2;
function g_settings_schema_list_keys(schema: PGSettingsSchema): PPgchar; cdecl; external libgio2;
function g_settings_schema_list_children(schema: PGSettingsSchema): PPgchar; cdecl; external libgio2;

function g_settings_schema_key_get_type: TGType; cdecl; external libgio2;
function g_settings_schema_key_ref(key: PGSettingsSchemaKey): PGSettingsSchemaKey; cdecl; external libgio2;
procedure g_settings_schema_key_unref(key: PGSettingsSchemaKey); cdecl; external libgio2;
function g_settings_schema_key_get_value_type(key: PGSettingsSchemaKey): PGVariantType; cdecl; external libgio2;
function g_settings_schema_key_get_default_value(key: PGSettingsSchemaKey): PGVariant; cdecl; external libgio2;
function g_settings_schema_key_get_range(key: PGSettingsSchemaKey): PGVariant; cdecl; external libgio2;
function g_settings_schema_key_range_check(key: PGSettingsSchemaKey; value: PGVariant): Tgboolean; cdecl; external libgio2;
function g_settings_schema_key_get_name(key: PGSettingsSchemaKey): Pgchar; cdecl; external libgio2;
function g_settings_schema_key_get_summary(key: PGSettingsSchemaKey): Pgchar; cdecl; external libgio2;
function g_settings_schema_key_get_description(key: PGSettingsSchemaKey): Pgchar; cdecl; external libgio2;

function G_TYPE_SETTINGS_SCHEMA_SOURCE: TGType;
function G_TYPE_SETTINGS_SCHEMA: TGType;
function G_TYPE_SETTINGS_SCHEMA_KEY: TGType;
{$ENDIF read_function}


// === Konventiert am: 26-6-26 19:52:18 ===


implementation

function G_TYPE_SETTINGS_SCHEMA_SOURCE: TGType;
begin
  G_TYPE_SETTINGS_SCHEMA_SOURCE := g_settings_schema_source_get_type;
end;

function G_TYPE_SETTINGS_SCHEMA: TGType;
begin
  G_TYPE_SETTINGS_SCHEMA := g_settings_schema_get_type;
end;

function G_TYPE_SETTINGS_SCHEMA_KEY: TGType;
begin
  G_TYPE_SETTINGS_SCHEMA_KEY := g_settings_schema_key_get_type;
end;


end.
