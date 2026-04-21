unit fwupd_plugin;

interface

uses
  fp_glib2, fp_fwupd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TFwupdPlugin = record
    parent_instance: TGObject;
  end;
  PFwupdPlugin = ^TFwupdPlugin;

  TFwupdPluginClass = record
    parent_class: TGObjectClass;
    _fwupd_reserved1: procedure; cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
    _fwupd_reserved7: procedure; cdecl;
  end;
  PFwupdPluginClass = ^TFwupdPluginClass;

function fwupd_plugin_get_type: TGType; cdecl; external libfwupd;
function fwupd_plugin_new: PFwupdPlugin; cdecl; external libfwupd;
function fwupd_plugin_to_string(self: PFwupdPlugin): Pgchar; cdecl; external libfwupd;
function fwupd_plugin_get_name(self: PFwupdPlugin): Pgchar; cdecl; external libfwupd;
procedure fwupd_plugin_set_name(self: PFwupdPlugin; name: Pgchar); cdecl; external libfwupd;
function fwupd_plugin_get_flags(self: PFwupdPlugin): Tguint64; cdecl; external libfwupd;
procedure fwupd_plugin_set_flags(self: PFwupdPlugin; flags: Tguint64); cdecl; external libfwupd;
procedure fwupd_plugin_add_flag(self: PFwupdPlugin; flag: TFwupdPluginFlags); cdecl; external libfwupd;
procedure fwupd_plugin_remove_flag(self: PFwupdPlugin; flag: TFwupdPluginFlags); cdecl; external libfwupd;
function fwupd_plugin_has_flag(self: PFwupdPlugin; flag: TFwupdPluginFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_plugin_from_variant(value: PGVariant): PFwupdPlugin; cdecl; external libfwupd;
function fwupd_plugin_array_from_variant(value: PGVariant): PGPtrArray; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:35:52 ===

function FWUPD_TYPE_PLUGIN: TGType;
function FWUPD_PLUGIN(obj: Pointer): PFwupdPlugin;
function FWUPD_IS_PLUGIN(obj: Pointer): Tgboolean;
function FWUPD_PLUGIN_CLASS(klass: Pointer): PFwupdPluginClass;
function FWUPD_IS_PLUGIN_CLASS(klass: Pointer): Tgboolean;
function FWUPD_PLUGIN_GET_CLASS(obj: Pointer): PFwupdPluginClass;

implementation

function FWUPD_TYPE_PLUGIN: TGType;
begin
  Result := fwupd_plugin_get_type;
end;

function FWUPD_PLUGIN(obj: Pointer): PFwupdPlugin;
begin
  Result := PFwupdPlugin(g_type_check_instance_cast(obj, FWUPD_TYPE_PLUGIN));
end;

function FWUPD_IS_PLUGIN(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_PLUGIN);
end;

function FWUPD_PLUGIN_CLASS(klass: Pointer): PFwupdPluginClass;
begin
  Result := PFwupdPluginClass(g_type_check_class_cast(klass, FWUPD_TYPE_PLUGIN));
end;

function FWUPD_IS_PLUGIN_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_PLUGIN);
end;

function FWUPD_PLUGIN_GET_CLASS(obj: Pointer): PFwupdPluginClass;
begin
  Result := PFwupdPluginClass(PGTypeInstance(obj)^.g_class);
end;




end.
