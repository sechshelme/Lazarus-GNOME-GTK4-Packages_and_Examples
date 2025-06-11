{$IFDEF read_interface}


type
  PEldbus_Introspection_Argument_Direction = ^TEldbus_Introspection_Argument_Direction;
  TEldbus_Introspection_Argument_Direction = longint;

const
  ELDBUS_INTROSPECTION_ARGUMENT_DIRECTION_NONE = 0;
  ELDBUS_INTROSPECTION_ARGUMENT_DIRECTION_IN = 1;
  ELDBUS_INTROSPECTION_ARGUMENT_DIRECTION_OUT = 2;

type
  PEldbus_Introspection_Property_Access = ^TEldbus_Introspection_Property_Access;
  TEldbus_Introspection_Property_Access = longint;

const
  ELDBUS_INTROSPECTION_PROPERTY_ACCESS_READ = 0;
  ELDBUS_INTROSPECTION_PROPERTY_ACCESS_WRITE = 1;
  ELDBUS_INTROSPECTION_PROPERTY_ACCESS_READWRITE = 2;

type
  TEldbus_Introspection_Node = record
    name: PEina_Stringshare;
    nodes: PEina_List;
    interfaces: PEina_List;
  end;
  PEldbus_Introspection_Node = ^TEldbus_Introspection_Node;

  TEldbus_Introspection_Interface = record
    name: PEina_Stringshare;
    methods: PEina_List;
    signals: PEina_List;
    properties: PEina_List;
    annotations: PEina_List;
  end;
  PEldbus_Introspection_Interface = ^TEldbus_Introspection_Interface;

  TEldbus_Introspection_Method = record
    name: PEina_Stringshare;
    arguments: PEina_List;
    annotations: PEina_List;
  end;
  PEldbus_Introspection_Method = ^TEldbus_Introspection_Method;

  TEldbus_Introspection_Property = record
    name: PEina_Stringshare;
    _type: PEina_Stringshare;
    access: TEldbus_Introspection_Property_Access;
    annotations: PEina_List;
  end;
  PEldbus_Introspection_Property = ^TEldbus_Introspection_Property;

  TEldbus_Introspection_Annotation = record
    name: PEina_Stringshare;
    value: PEina_Stringshare;
  end;
  PEldbus_Introspection_Annotation = ^TEldbus_Introspection_Annotation;

  TEldbus_Introspection_Argument = record
    name: PEina_Stringshare;
    _type: PEina_Stringshare;
    direction: TEldbus_Introspection_Argument_Direction;
  end;
  PEldbus_Introspection_Argument = ^TEldbus_Introspection_Argument;

  TEldbus_Introspection_Signal = record
    name: PEina_Stringshare;
    arguments: PEina_List;
    annotations: PEina_List;
  end;
  PEldbus_Introspection_Signal = ^TEldbus_Introspection_Signal;

function eldbus_introspection_parse(xml: pchar): PEldbus_Introspection_Node; cdecl; external libeldbus;
procedure eldbus_introspection_node_free(node: PEldbus_Introspection_Node); cdecl; external libeldbus;
function eldbus_introspection_interface_find(interfaces: PEina_List; name: pchar): PEldbus_Introspection_Interface; cdecl; external libeldbus;
function eldbus_introspection_property_find(properties: PEina_List; name: pchar): PEldbus_Introspection_Property; cdecl; external libeldbus;
function eldbus_introspection_argument_find(arguments: PEina_List; name: pchar): PEldbus_Introspection_Argument; cdecl; external libeldbus;

// === Konventiert am: 10-6-25 19:52:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
