unit peas_extension_set;

interface

uses
  fp_glib2, fp_peas2, peas_engine, peas_plugin_info;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TPeasExtensionSet = record
  end;
  PPeasExtensionSet = ^TPeasExtensionSet;

  TPeasExtensionSetForeachFunc = procedure(set_: PPeasExtensionSet; info: PPeasPluginInfo; extension: PGObject; data: Tgpointer); cdecl;

  TPeasExtensionSetClass = record
    parent_class: TGObjectClass;
  end;
  PPeasExtensionSetClass = ^TPeasExtensionSetClass;

function peas_extension_set_get_type: TGType; cdecl; external libpeas2;
procedure peas_extension_set_foreach(set_: PPeasExtensionSet; func: TPeasExtensionSetForeachFunc; data: Tgpointer); cdecl; external libpeas2;
function peas_extension_set_get_extension(set_: PPeasExtensionSet; info: PPeasPluginInfo): PGObject; cdecl; external libpeas2;
function peas_extension_set_new_with_properties(engine: PPeasEngine; exten_type: TGType; n_properties: Tguint; prop_names: PPchar; prop_values: PGValue): PPeasExtensionSet; cdecl; external libpeas2;
function peas_extension_set_new_valist(engine: PPeasEngine; exten_type: TGType; first_property: pchar; var_args: Tva_list): PPeasExtensionSet; cdecl; external libpeas2;
function peas_extension_set_new(engine: PPeasEngine; exten_type: TGType; first_property: pchar): PPeasExtensionSet; cdecl; varargs; external libpeas2;

// === Konventiert am: 3-9-25 15:45:02 ===

function PEAS_TYPE_EXTENSION_SET: TGType;
function PEAS_EXTENSION_SET(obj: Pointer): PPeasExtensionSet;
function PEAS_IS_EXTENSION_SET(obj: Pointer): Tgboolean;

implementation

function PEAS_TYPE_EXTENSION_SET: TGType;
begin
  Result := peas_extension_set_get_type;
end;

function PEAS_EXTENSION_SET(obj: Pointer): PPeasExtensionSet;
begin
  Result := PPeasExtensionSet(g_type_check_instance_cast(obj, PEAS_TYPE_EXTENSION_SET));
end;

function PEAS_IS_EXTENSION_SET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PEAS_TYPE_EXTENSION_SET);
end;



end.
