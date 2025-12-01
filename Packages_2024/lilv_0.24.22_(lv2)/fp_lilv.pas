unit fp_lilv;

interface

const
  {$IFDEF Linux}
  liblilv0 = 'lilv-0';
  {$ENDIF}

  {$IFDEF Windows}
  liblilv0 = 'lilv-0.dll'; // ??????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
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

  Tsize_t = SizeUInt;

  PFILE = type Pointer;

  Tva_list = Pointer; // ???????


type
  // /usr/include/lv2/lv2plug.in/ns/ext/urid/urid.h
  PLV2_URID_Map = type Pointer;
  PLV2_URID_Unmap = type Pointer;

  // /usr/include/lv2.h
  PLV2_Feature = type Pointer;
  PPLV2_Feature = ^PLV2_Feature;

  TLV2_Handle = Pointer;

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

// ============================

const
  LILV_NS_DOAP = 'http://usefulinc.com/ns/doap#';
  LILV_NS_FOAF = 'http://xmlns.com/foaf/0.1/';
  LILV_NS_LILV = 'http://drobilla.net/ns/lilv#';
  LILV_NS_LV2 = 'http://lv2plug.in/ns/lv2core#';
  LILV_NS_OWL = 'http://www.w3.org/2002/07/owl#';
  LILV_NS_RDF = 'http://www.w3.org/1999/02/22-rdf-syntax-ns#';
  LILV_NS_RDFS = 'http://www.w3.org/2000/01/rdf-schema#';
  LILV_NS_XSD = 'http://www.w3.org/2001/XMLSchema#';
  LILV_URI_ATOM_PORT = 'http://lv2plug.in/ns/ext/atom#AtomPort';
  LILV_URI_AUDIO_PORT = 'http://lv2plug.in/ns/lv2core#AudioPort';
  LILV_URI_CONTROL_PORT = 'http://lv2plug.in/ns/lv2core#ControlPort';
  LILV_URI_CV_PORT = 'http://lv2plug.in/ns/lv2core#CVPort';
  LILV_URI_EVENT_PORT = 'http://lv2plug.in/ns/ext/event#EventPort';
  LILV_URI_INPUT_PORT = 'http://lv2plug.in/ns/lv2core#InputPort';
  LILV_URI_MIDI_EVENT = 'http://lv2plug.in/ns/ext/midi#MidiEvent';
  LILV_URI_OUTPUT_PORT = 'http://lv2plug.in/ns/lv2core#OutputPort';
  LILV_URI_PORT = 'http://lv2plug.in/ns/lv2core#Port';

type
  PLilvPlugin = type Pointer;
  PLilvPluginClass = type Pointer;
  PLilvPort = type Pointer;
  PLilvScalePoint = type Pointer;
  PLilvUI = type Pointer;
  PLilvNode = type Pointer;
  PPLilvNode = ^PLilvNode;
  PLilvWorld = type Pointer;
  PLilvState = type Pointer;

  PLilvIter = ^TLilvIter;
  TLilvIter = pointer;

  PLilvPluginClasses = ^TLilvPluginClasses;
  TLilvPluginClasses = pointer;

  PLilvPlugins = ^TLilvPlugins;
  TLilvPlugins = pointer;

  PLilvScalePoints = ^TLilvScalePoints;
  TLilvScalePoints = pointer;

  PLilvUIs = ^TLilvUIs;
  TLilvUIs = pointer;

  PLilvNodes = ^TLilvNodes;
  TLilvNodes = pointer;

type
  TLilvInstanceImpl = record
    lv2_descriptor: PLV2_Descriptor;
    lv2_handle: TLV2_Handle;
    pimpl: pointer;
  end;
  PLilvInstanceImpl = ^TLilvInstanceImpl;

  PLilvInstance = PLilvInstanceImpl;

procedure lilv_free(ptr: pointer); cdecl; external liblilv0;
function lilv_uri_to_path(uri: pchar): pchar; cdecl; external liblilv0; deprecated;
function lilv_file_uri_parse(uri: pchar; hostname: PPchar): pchar; cdecl; external liblilv0;
function lilv_new_uri(world: PLilvWorld; uri: pchar): PLilvNode; cdecl; external liblilv0;
function lilv_new_file_uri(world: PLilvWorld; host: pchar; path: pchar): PLilvNode; cdecl; external liblilv0;
function lilv_new_string(world: PLilvWorld; str: pchar): PLilvNode; cdecl; external liblilv0;
function lilv_new_int(world: PLilvWorld; val: longint): PLilvNode; cdecl; external liblilv0;
function lilv_new_float(world: PLilvWorld; val: single): PLilvNode; cdecl; external liblilv0;
function lilv_new_bool(world: PLilvWorld; val: boolean): PLilvNode; cdecl; external liblilv0;
procedure lilv_node_free(val: PLilvNode); cdecl; external liblilv0;
function lilv_node_duplicate(val: PLilvNode): PLilvNode; cdecl; external liblilv0;
function lilv_node_equals(value: PLilvNode; other: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_get_turtle_token(value: PLilvNode): pchar; cdecl; external liblilv0;
function lilv_node_is_uri(value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_as_uri(value: PLilvNode): pchar; cdecl; external liblilv0;
function lilv_node_is_blank(value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_as_blank(value: PLilvNode): pchar; cdecl; external liblilv0;
function lilv_node_is_literal(value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_is_string(value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_as_string(value: PLilvNode): pchar; cdecl; external liblilv0;
function lilv_node_get_path(value: PLilvNode; hostname: PPchar): pchar; cdecl; external liblilv0;
function lilv_node_is_float(value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_as_float(value: PLilvNode): single; cdecl; external liblilv0;
function lilv_node_is_int(value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_as_int(value: PLilvNode): longint; cdecl; external liblilv0;
function lilv_node_is_bool(value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_node_as_bool(value: PLilvNode): boolean; cdecl; external liblilv0;

procedure lilv_plugin_classes_free(collection: PLilvPluginClasses); cdecl; external liblilv0;
function lilv_plugin_classes_size(collection: PLilvPluginClasses): dword; cdecl; external liblilv0;
function lilv_plugin_classes_begin(collection: PLilvPluginClasses): PLilvIter; cdecl; external liblilv0;
function lilv_plugin_classes_get(collection: PLilvPluginClasses; i: PLilvIter): PLilvPluginClass; cdecl; external liblilv0;
function lilv_plugin_classes_next(collection: PLilvPluginClasses; i: PLilvIter): PLilvIter; cdecl; external liblilv0;
function lilv_plugin_classes_is_end(collection: PLilvPluginClasses; i: PLilvIter): boolean; cdecl; external liblilv0;
function lilv_plugin_classes_get_by_uri(classes: PLilvPluginClasses; uri: PLilvNode): PLilvPluginClass; cdecl; external liblilv0;

procedure lilv_scale_points_free(collection: PLilvScalePoints); cdecl; external liblilv0;
function lilv_scale_points_size(collection: PLilvScalePoints): dword; cdecl; external liblilv0;
function lilv_scale_points_begin(collection: PLilvScalePoints): PLilvIter; cdecl; external liblilv0;
function lilv_scale_points_get(collection: PLilvScalePoints; i: PLilvIter): PLilvScalePoint; cdecl; external liblilv0;
function lilv_scale_points_next(collection: PLilvScalePoints; i: PLilvIter): PLilvIter; cdecl; external liblilv0;
function lilv_scale_points_is_end(collection: PLilvScalePoints; i: PLilvIter): boolean; cdecl; external liblilv0;

procedure lilv_uis_free(collection: PLilvUIs); cdecl; external liblilv0;
function lilv_uis_size(collection: PLilvUIs): dword; cdecl; external liblilv0;
function lilv_uis_begin(collection: PLilvUIs): PLilvIter; cdecl; external liblilv0;
function lilv_uis_get(collection: PLilvUIs; i: PLilvIter): PLilvUI; cdecl; external liblilv0;
function lilv_uis_next(collection: PLilvUIs; i: PLilvIter): PLilvIter; cdecl; external liblilv0;
function lilv_uis_is_end(collection: PLilvUIs; i: PLilvIter): boolean; cdecl; external liblilv0;
function lilv_uis_get_by_uri(uis: PLilvUIs; uri: PLilvNode): PLilvUI; cdecl; external liblilv0;

procedure lilv_nodes_free(collection: PLilvNodes); cdecl; external liblilv0;
function lilv_nodes_size(collection: PLilvNodes): dword; cdecl; external liblilv0;
function lilv_nodes_begin(collection: PLilvNodes): PLilvIter; cdecl; external liblilv0;
function lilv_nodes_get(collection: PLilvNodes; i: PLilvIter): PLilvNode; cdecl; external liblilv0;
function lilv_nodes_next(collection: PLilvNodes; i: PLilvIter): PLilvIter; cdecl; external liblilv0;
function lilv_nodes_is_end(collection: PLilvNodes; i: PLilvIter): boolean; cdecl; external liblilv0;
function lilv_nodes_get_first(collection: PLilvNodes): PLilvNode; cdecl; external liblilv0;
function lilv_nodes_contains(nodes: PLilvNodes; value: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_nodes_merge(a: PLilvNodes; b: PLilvNodes): PLilvNodes; cdecl; external liblilv0;

function lilv_plugins_size(collection: PLilvPlugins): dword; cdecl; external liblilv0;
function lilv_plugins_begin(collection: PLilvPlugins): PLilvIter; cdecl; external liblilv0;
function lilv_plugins_get(collection: PLilvPlugins; i: PLilvIter): PLilvPlugin; cdecl; external liblilv0;
function lilv_plugins_next(collection: PLilvPlugins; i: PLilvIter): PLilvIter; cdecl; external liblilv0;
function lilv_plugins_is_end(collection: PLilvPlugins; i: PLilvIter): boolean; cdecl; external liblilv0;
function lilv_plugins_get_by_uri(plugins: PLilvPlugins; uri: PLilvNode): PLilvPlugin; cdecl; external liblilv0;

function lilv_world_new: PLilvWorld; cdecl; external liblilv0;

const
  LILV_OPTION_FILTER_LANG = 'http://drobilla.net/ns/lilv#filter-lang';
  LILV_OPTION_DYN_MANIFEST = 'http://drobilla.net/ns/lilv#dyn-manifest';
  LILV_OPTION_LV2_PATH = 'http://drobilla.net/ns/lilv#lv2-path';

procedure lilv_world_set_option(world: PLilvWorld; uri: pchar; value: PLilvNode); cdecl; external liblilv0;
procedure lilv_world_free(world: PLilvWorld); cdecl; external liblilv0;
procedure lilv_world_load_all(world: PLilvWorld); cdecl; external liblilv0;
procedure lilv_world_load_bundle(world: PLilvWorld; bundle_uri: PLilvNode); cdecl; external liblilv0;
procedure lilv_world_load_specifications(world: PLilvWorld); cdecl; external liblilv0;
procedure lilv_world_load_plugin_classes(world: PLilvWorld); cdecl; external liblilv0;
function lilv_world_unload_bundle(world: PLilvWorld; bundle_uri: PLilvNode): longint; cdecl; external liblilv0;
function lilv_world_load_resource(world: PLilvWorld; resource: PLilvNode): longint; cdecl; external liblilv0;
function lilv_world_unload_resource(world: PLilvWorld; resource: PLilvNode): longint; cdecl; external liblilv0;
function lilv_world_get_plugin_class(world: PLilvWorld): PLilvPluginClass; cdecl; external liblilv0;
function lilv_world_get_plugin_classes(world: PLilvWorld): PLilvPluginClasses; cdecl; external liblilv0;
function lilv_world_get_all_plugins(world: PLilvWorld): PLilvPlugins; cdecl; external liblilv0;
function lilv_world_find_nodes(world: PLilvWorld; subject: PLilvNode; predicate: PLilvNode; obj: PLilvNode): PLilvNodes; cdecl; external liblilv0;
function lilv_world_get(world: PLilvWorld; subject: PLilvNode; predicate: PLilvNode; obj: PLilvNode): PLilvNode; cdecl; external liblilv0;
function lilv_world_ask(world: PLilvWorld; subject: PLilvNode; predicate: PLilvNode; obj: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_world_get_symbol(world: PLilvWorld; subject: PLilvNode): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_verify(plugin: PLilvPlugin): boolean; cdecl; external liblilv0;
function lilv_plugin_get_uri(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_get_bundle_uri(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_get_data_uris(plugin: PLilvPlugin): PLilvNodes; cdecl; external liblilv0;
function lilv_plugin_get_library_uri(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_get_name(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_get_class(plugin: PLilvPlugin): PLilvPluginClass; cdecl; external liblilv0;
function lilv_plugin_get_value(plugin: PLilvPlugin; predicate: PLilvNode): PLilvNodes; cdecl; external liblilv0;
function lilv_plugin_has_feature(plugin: PLilvPlugin; feature: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_plugin_get_supported_features(plugin: PLilvPlugin): PLilvNodes; cdecl; external liblilv0;
function lilv_plugin_get_required_features(plugin: PLilvPlugin): PLilvNodes; cdecl; external liblilv0;
function lilv_plugin_get_optional_features(plugin: PLilvPlugin): PLilvNodes; cdecl; external liblilv0;
function lilv_plugin_has_extension_data(plugin: PLilvPlugin; uri: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_plugin_get_extension_data(plugin: PLilvPlugin): PLilvNodes; cdecl; external liblilv0;
function lilv_plugin_get_num_ports(plugin: PLilvPlugin): Tuint32_t; cdecl; external liblilv0;
procedure lilv_plugin_get_port_ranges_float(plugin: PLilvPlugin; min_values: Psingle; max_values: Psingle; def_values: Psingle); cdecl; external liblilv0;
function lilv_plugin_get_num_ports_of_class(plugin: PLilvPlugin; class_1: PLilvNode; args: array of const): Tuint32_t; cdecl; external liblilv0;
function lilv_plugin_get_num_ports_of_class(plugin: PLilvPlugin; class_1: PLilvNode): Tuint32_t; cdecl; external liblilv0;
function lilv_plugin_get_num_ports_of_class_va(plugin: PLilvPlugin; class_1: PLilvNode; args: Tva_list): Tuint32_t; cdecl; external liblilv0;
function lilv_plugin_has_latency(plugin: PLilvPlugin): boolean; cdecl; external liblilv0;
function lilv_plugin_get_latency_port_index(plugin: PLilvPlugin): Tuint32_t; cdecl; external liblilv0;
function lilv_plugin_get_port_by_index(plugin: PLilvPlugin; index: Tuint32_t): PLilvPort; cdecl; external liblilv0;
function lilv_plugin_get_port_by_symbol(plugin: PLilvPlugin; symbol: PLilvNode): PLilvPort; cdecl; external liblilv0;
function lilv_plugin_get_port_by_designation(plugin: PLilvPlugin; port_class: PLilvNode; designation: PLilvNode): PLilvPort; cdecl; external liblilv0;
function lilv_plugin_get_project(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_get_author_name(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_get_author_email(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_get_author_homepage(plugin: PLilvPlugin): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_is_replaced(plugin: PLilvPlugin): boolean; cdecl; external liblilv0;
procedure lilv_plugin_write_description(world: PLilvWorld; plugin: PLilvPlugin; base_uri: PLilvNode; plugin_file: PFILE); cdecl; external liblilv0;
procedure lilv_plugin_write_manifest_entry(world: PLilvWorld; plugin: PLilvPlugin; base_uri: PLilvNode; manifest_file: PFILE; plugin_file_path: pchar); cdecl; external liblilv0;
function lilv_plugin_get_related(plugin: PLilvPlugin; _type: PLilvNode): PLilvNodes; cdecl; external liblilv0;
function lilv_port_get_node(plugin: PLilvPlugin; port: PLilvPort): PLilvNode; cdecl; external liblilv0;
function lilv_port_get_value(plugin: PLilvPlugin; port: PLilvPort; predicate: PLilvNode): PLilvNodes; cdecl; external liblilv0;
function lilv_port_get(plugin: PLilvPlugin; port: PLilvPort; predicate: PLilvNode): PLilvNode; cdecl; external liblilv0;
function lilv_port_get_properties(plugin: PLilvPlugin; port: PLilvPort): PLilvNodes; cdecl; external liblilv0;
function lilv_port_has_property(plugin: PLilvPlugin; port: PLilvPort; _property: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_port_supports_event(plugin: PLilvPlugin; port: PLilvPort; event_type: PLilvNode): boolean; cdecl; external liblilv0;
function lilv_port_get_index(plugin: PLilvPlugin; port: PLilvPort): Tuint32_t; cdecl; external liblilv0;
function lilv_port_get_symbol(plugin: PLilvPlugin; port: PLilvPort): PLilvNode; cdecl; external liblilv0;
function lilv_port_get_name(plugin: PLilvPlugin; port: PLilvPort): PLilvNode; cdecl; external liblilv0;
function lilv_port_get_classes(plugin: PLilvPlugin; port: PLilvPort): PLilvNodes; cdecl; external liblilv0;
function lilv_port_is_a(plugin: PLilvPlugin; port: PLilvPort; port_class: PLilvNode): boolean; cdecl; external liblilv0;
procedure lilv_port_get_range(plugin: PLilvPlugin; port: PLilvPort; def: PPLilvNode; min: PPLilvNode; max: PPLilvNode); cdecl; external liblilv0;
function lilv_port_get_scale_points(plugin: PLilvPlugin; port: PLilvPort): PLilvScalePoints; cdecl; external liblilv0;
function lilv_state_new_from_world(world: PLilvWorld; map: PLV2_URID_Map; node: PLilvNode): PLilvState; cdecl; external liblilv0;
function lilv_state_new_from_file(world: PLilvWorld; map: PLV2_URID_Map; subject: PLilvNode; path: pchar): PLilvState; cdecl; external liblilv0;
function lilv_state_new_from_string(world: PLilvWorld; map: PLV2_URID_Map; str: pchar): PLilvState; cdecl; external liblilv0;

type
  TLilvGetPortValueFunc = function(port_symbol: pchar; user_data: pointer; size: Puint32_t; _type: Puint32_t): pointer; cdecl;

function lilv_state_new_from_instance(plugin: PLilvPlugin; instance: PLilvInstance; map: PLV2_URID_Map; scratch_dir: pchar; copy_dir: pchar;
  link_dir: pchar; save_dir: pchar; get_value: TLilvGetPortValueFunc; user_data: pointer; flags: Tuint32_t;
  features: PPLV2_Feature): PLilvState; cdecl; external liblilv0;
procedure lilv_state_free(state: PLilvState); cdecl; external liblilv0;
function lilv_state_equals(a: PLilvState; b: PLilvState): boolean; cdecl; external liblilv0;
function lilv_state_get_num_properties(state: PLilvState): dword; cdecl; external liblilv0;
function lilv_state_get_plugin_uri(state: PLilvState): PLilvNode; cdecl; external liblilv0;
function lilv_state_get_uri(state: PLilvState): PLilvNode; cdecl; external liblilv0;
function lilv_state_get_label(state: PLilvState): pchar; cdecl; external liblilv0;
procedure lilv_state_set_label(state: PLilvState; _label: pchar); cdecl; external liblilv0;
function lilv_state_set_metadata(state: PLilvState; key: Tuint32_t; value: pointer; size: Tsize_t; _type: Tuint32_t;
  flags: Tuint32_t): longint; cdecl; external liblilv0;

type
  TLilvSetPortValueFunc = procedure(port_symbol: pchar; user_data: pointer; value: pointer; size: Tuint32_t; _type: Tuint32_t); cdecl;

procedure lilv_state_emit_port_values(state: PLilvState; set_value: TLilvSetPortValueFunc; user_data: pointer); cdecl; external liblilv0;
procedure lilv_state_restore(state: PLilvState; instance: PLilvInstance; set_value: TLilvSetPortValueFunc; user_data: pointer; flags: Tuint32_t;
  features: PPLV2_Feature); cdecl; external liblilv0;
function lilv_state_save(world: PLilvWorld; map: PLV2_URID_Map; unmap: PLV2_URID_Unmap; state: PLilvState; uri: pchar;
  dir: pchar; filename: pchar): longint; cdecl; external liblilv0;
function lilv_state_to_string(world: PLilvWorld; map: PLV2_URID_Map; unmap: PLV2_URID_Unmap; state: PLilvState; uri: pchar;
  base_uri: pchar): pchar; cdecl; external liblilv0;
function lilv_state_delete(world: PLilvWorld; state: PLilvState): longint; cdecl; external liblilv0;
function lilv_scale_point_get_label(point: PLilvScalePoint): PLilvNode; cdecl; external liblilv0;
function lilv_scale_point_get_value(point: PLilvScalePoint): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_class_get_parent_uri(plugin_class: PLilvPluginClass): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_class_get_uri(plugin_class: PLilvPluginClass): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_class_get_label(plugin_class: PLilvPluginClass): PLilvNode; cdecl; external liblilv0;
function lilv_plugin_class_get_children(plugin_class: PLilvPluginClass): PLilvPluginClasses; cdecl; external liblilv0;

function lilv_plugin_instantiate(plugin: PLilvPlugin; sample_rate: double; features: PPLV2_Feature): PLilvInstance; cdecl; external liblilv0;
procedure lilv_instance_free(instance: PLilvInstance); cdecl; external liblilv0;
function lilv_plugin_get_uis(plugin: PLilvPlugin): PLilvUIs; cdecl; external liblilv0;
function lilv_ui_get_uri(ui: PLilvUI): PLilvNode; cdecl; external liblilv0;
function lilv_ui_get_classes(ui: PLilvUI): PLilvNodes; cdecl; external liblilv0;
function lilv_ui_is_a(ui: PLilvUI; class_uri: PLilvNode): boolean; cdecl; external liblilv0;

type
  TLilvUISupportedFunc = function(container_type_uri: pchar; ui_type_uri: pchar): dword; cdecl;

function lilv_ui_is_supported(ui: PLilvUI; supported_func: TLilvUISupportedFunc; container_type: PLilvNode; ui_type: PPLilvNode): dword; cdecl; external liblilv0;
function lilv_ui_get_bundle_uri(ui: PLilvUI): PLilvNode; cdecl; external liblilv0;
function lilv_ui_get_binary_uri(ui: PLilvUI): PLilvNode; cdecl; external liblilv0;

// === Konventiert am: 26-11-25 15:46:20 ===

function lilv_instance_get_uri(instance: PLilvInstance): pchar; inline;
procedure lilv_instance_connect_port(instance: PLilvInstance; port_index: cardinal; data_location: Pointer); inline;
procedure lilv_instance_activate(instance: PLilvInstance); inline;
procedure lilv_instance_run(instance: PLilvInstance; sample_count: cardinal); inline;
procedure lilv_instance_deactivate(instance: PLilvInstance); inline;
function lilv_instance_get_extension_data(instance: PLilvInstance; uri: pchar): Pointer; inline;
function lilv_instance_get_descriptor(instance: PLilvInstance): PLV2_Descriptor; inline;
function lilv_instance_get_handle(instance: PLilvInstance): TLV2_Handle; inline;


implementation

function lilv_instance_get_uri(instance: PLilvInstance): pchar; inline;
begin
  Result := instance^.lv2_descriptor^.URI;
end;

procedure lilv_instance_connect_port(instance: PLilvInstance; port_index: cardinal; data_location: Pointer); inline;
begin
  instance^.lv2_descriptor^.connect_port(instance^.lv2_handle, port_index, data_location);
end;

procedure lilv_instance_activate(instance: PLilvInstance); inline;
begin
  if Assigned(instance^.lv2_descriptor^.activate) then begin
    instance^.lv2_descriptor^.activate(instance^.lv2_handle);
  end;
end;

procedure lilv_instance_run(instance: PLilvInstance; sample_count: cardinal); inline;
begin
  instance^.lv2_descriptor^.run(instance^.lv2_handle, sample_count);
end;

procedure lilv_instance_deactivate(instance: PLilvInstance); inline;
begin
  if Assigned(instance^.lv2_descriptor^.deactivate) then begin
    instance^.lv2_descriptor^.deactivate(instance^.lv2_handle);
  end;
end;

function lilv_instance_get_extension_data(instance: PLilvInstance; uri: pchar): Pointer; inline;
begin
  if Assigned(instance^.lv2_descriptor^.extension_data) then begin
    Result := instance^.lv2_descriptor^.extension_data(uri);
  end else begin
    Result := nil;
  end;
end;

function lilv_instance_get_descriptor(instance: PLilvInstance): PLV2_Descriptor; inline;
begin
  Result := instance^.lv2_descriptor;
end;

function lilv_instance_get_handle(instance: PLilvInstance): TLV2_Handle;
begin
  Result := instance^.lv2_handle;
end;



end.
