unit gdbusintrospection;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, gioenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PPGDBusAnnotationInfo = ^PGDBusAnnotationInfo;
  PGDBusAnnotationInfo = ^TGDBusAnnotationInfo;
  TGDBusAnnotationInfo = record
    ref_count: Tgint;
    key: Pgchar;
    value: Pgchar;
    annotations: ^PGDBusAnnotationInfo;
  end;

  PGDBusArgInfo = ^TGDBusArgInfo;
  TGDBusArgInfo = record
    ref_count: Tgint;
    name: Pgchar;
    signature: Pgchar;
    annotations: ^PGDBusAnnotationInfo;
  end;

  PGDBusMethodInfo = ^TGDBusMethodInfo;
  TGDBusMethodInfo = record
    ref_count: Tgint;
    name: Pgchar;
    in_args: ^PGDBusArgInfo;
    out_args: ^PGDBusArgInfo;
    annotations: ^PGDBusAnnotationInfo;
  end;

  PGDBusSignalInfo = ^TGDBusSignalInfo;
  TGDBusSignalInfo = record
    ref_count: Tgint;
    name: Pgchar;
    args: ^PGDBusArgInfo;
    annotations: ^PGDBusAnnotationInfo;
  end;

  PGDBusPropertyInfo = ^TGDBusPropertyInfo;
  TGDBusPropertyInfo = record
    ref_count: Tgint;
    name: Pgchar;
    signature: Pgchar;
    flags: TGDBusPropertyInfoFlags;
    annotations: ^PGDBusAnnotationInfo;
  end;

  PPGDBusInterfaceInfo = ^PGDBusInterfaceInfo;
  PGDBusInterfaceInfo = ^TGDBusInterfaceInfo;
  TGDBusInterfaceInfo = record
    ref_count: Tgint;
    name: Pgchar;
    methods: ^PGDBusMethodInfo;
    signals: ^PGDBusSignalInfo;
    properties: ^PGDBusPropertyInfo;
    annotations: ^PGDBusAnnotationInfo;
  end;

  PGDBusNodeInfo = ^TGDBusNodeInfo;
  TGDBusNodeInfo = record
    ref_count: Tgint;
    path: Pgchar;
    interfaces: ^PGDBusInterfaceInfo;
    nodes: ^PGDBusNodeInfo;
    annotations: ^PGDBusAnnotationInfo;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_dbus_annotation_info_lookup(annotations: PPGDBusAnnotationInfo; name: Pgchar): Pgchar; cdecl; external libgio2;
function g_dbus_interface_info_lookup_method(info: PGDBusInterfaceInfo; name: Pgchar): PGDBusMethodInfo; cdecl; external libgio2;
function g_dbus_interface_info_lookup_signal(info: PGDBusInterfaceInfo; name: Pgchar): PGDBusSignalInfo; cdecl; external libgio2;
function g_dbus_interface_info_lookup_property(info: PGDBusInterfaceInfo; name: Pgchar): PGDBusPropertyInfo; cdecl; external libgio2;
procedure g_dbus_interface_info_cache_build(info: PGDBusInterfaceInfo); cdecl; external libgio2;
procedure g_dbus_interface_info_cache_release(info: PGDBusInterfaceInfo); cdecl; external libgio2;
procedure g_dbus_interface_info_generate_xml(info: PGDBusInterfaceInfo; indent: Tguint; string_builder: PGString); cdecl; external libgio2;
function g_dbus_node_info_new_for_xml(xml_data: Pgchar; error: PPGError): PGDBusNodeInfo; cdecl; external libgio2;
function g_dbus_node_info_lookup_interface(info: PGDBusNodeInfo; name: Pgchar): PGDBusInterfaceInfo; cdecl; external libgio2;
procedure g_dbus_node_info_generate_xml(info: PGDBusNodeInfo; indent: Tguint; string_builder: PGString); cdecl; external libgio2;
function g_dbus_node_info_ref(info: PGDBusNodeInfo): PGDBusNodeInfo; cdecl; external libgio2;
function g_dbus_interface_info_ref(info: PGDBusInterfaceInfo): PGDBusInterfaceInfo; cdecl; external libgio2;
function g_dbus_method_info_ref(info: PGDBusMethodInfo): PGDBusMethodInfo; cdecl; external libgio2;
function g_dbus_signal_info_ref(info: PGDBusSignalInfo): PGDBusSignalInfo; cdecl; external libgio2;
function g_dbus_property_info_ref(info: PGDBusPropertyInfo): PGDBusPropertyInfo; cdecl; external libgio2;
function g_dbus_arg_info_ref(info: PGDBusArgInfo): PGDBusArgInfo; cdecl; external libgio2;
function g_dbus_annotation_info_ref(info: PGDBusAnnotationInfo): PGDBusAnnotationInfo; cdecl; external libgio2;
procedure g_dbus_node_info_unref(info: PGDBusNodeInfo); cdecl; external libgio2;
procedure g_dbus_interface_info_unref(info: PGDBusInterfaceInfo); cdecl; external libgio2;
procedure g_dbus_method_info_unref(info: PGDBusMethodInfo); cdecl; external libgio2;
procedure g_dbus_signal_info_unref(info: PGDBusSignalInfo); cdecl; external libgio2;
procedure g_dbus_property_info_unref(info: PGDBusPropertyInfo); cdecl; external libgio2;
procedure g_dbus_arg_info_unref(info: PGDBusArgInfo); cdecl; external libgio2;
procedure g_dbus_annotation_info_unref(info: PGDBusAnnotationInfo); cdecl; external libgio2;

function g_dbus_node_info_get_type: TGType; cdecl; external libgio2;
function g_dbus_interface_info_get_type: TGType; cdecl; external libgio2;
function g_dbus_method_info_get_type: TGType; cdecl; external libgio2;
function g_dbus_signal_info_get_type: TGType; cdecl; external libgio2;
function g_dbus_property_info_get_type: TGType; cdecl; external libgio2;
function g_dbus_arg_info_get_type: TGType; cdecl; external libgio2;
function g_dbus_annotation_info_get_type: TGType; cdecl; external libgio2;

function G_TYPE_DBUS_NODE_INFO: TGType;
function G_TYPE_DBUS_INTERFACE_INFO: TGType;
function G_TYPE_DBUS_METHOD_INFO: TGType;
function G_TYPE_DBUS_SIGNAL_INFO: TGType;
function G_TYPE_DBUS_PROPERTY_INFO: TGType;
function G_TYPE_DBUS_ARG_INFO: TGType;
function G_TYPE_DBUS_ANNOTATION_INFO: TGType;
{$ENDIF read_function}

// === Konventiert am: 26-6-26 16:42:09 ===


implementation


function G_TYPE_DBUS_NODE_INFO: TGType;
begin
  G_TYPE_DBUS_NODE_INFO := g_dbus_node_info_get_type;
end;

function G_TYPE_DBUS_INTERFACE_INFO: TGType;
begin
  G_TYPE_DBUS_INTERFACE_INFO := g_dbus_interface_info_get_type;
end;

function G_TYPE_DBUS_METHOD_INFO: TGType;
begin
  G_TYPE_DBUS_METHOD_INFO := g_dbus_method_info_get_type;
end;

function G_TYPE_DBUS_SIGNAL_INFO: TGType;
begin
  G_TYPE_DBUS_SIGNAL_INFO := g_dbus_signal_info_get_type;
end;

function G_TYPE_DBUS_PROPERTY_INFO: TGType;
begin
  G_TYPE_DBUS_PROPERTY_INFO := g_dbus_property_info_get_type;
end;

function G_TYPE_DBUS_ARG_INFO: TGType;
begin
  G_TYPE_DBUS_ARG_INFO := g_dbus_arg_info_get_type;
end;

function G_TYPE_DBUS_ANNOTATION_INFO: TGType;
begin
  G_TYPE_DBUS_ANNOTATION_INFO := g_dbus_annotation_info_get_type;
end;

end.
