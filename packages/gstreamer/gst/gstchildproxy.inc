/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


type
  TGstChildProxy = record
  end;
  PGstChildProxy = ^TGstChildProxy;

  PGstChildProxyInterface = ^TGstChildProxyInterface;

  TGstChildProxyInterface = record
    parent: TGTypeInterface;
    get_child_by_name: function(parent: PGstChildProxy; Name: Pgchar): PGObject; cdecl;
    get_child_by_index: function(parent: PGstChildProxy; index: Tguint): PGObject; cdecl;
    get_children_count: function(parent: PGstChildProxy): Tguint; cdecl;
    child_added: procedure(parent: PGstChildProxy; child: PGObject; Name: Pgchar); cdecl;
    child_removed: procedure(parent: PGstChildProxy; child: PGObject; Name: Pgchar); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

function gst_child_proxy_get_type: TGType; cdecl; external libgstreamer;
function gst_child_proxy_get_child_by_name(parent: PGstChildProxy; Name: Pgchar): PGObject; cdecl; external libgstreamer;
function gst_child_proxy_get_child_by_name_recurse(child_proxy: PGstChildProxy; Name: Pgchar): PGObject; cdecl; external libgstreamer;
function gst_child_proxy_get_children_count(parent: PGstChildProxy): Tguint; cdecl; external libgstreamer;
function gst_child_proxy_get_child_by_index(parent: PGstChildProxy; index: Tguint): PGObject; cdecl; external libgstreamer;
function gst_child_proxy_lookup(obj: PGstChildProxy; Name: Pgchar; target: PPGObject; pspec: PPGParamSpec): Tgboolean; cdecl; external libgstreamer;
procedure gst_child_proxy_get_property(obj: PGstChildProxy; Name: Pgchar; Value: PGValue); cdecl; external libgstreamer;
procedure gst_child_proxy_get_valist(obj: PGstChildProxy; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_child_proxy_get(obj: PGstChildProxy; first_property_name: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_child_proxy_set_property(obj: PGstChildProxy; Name: Pgchar; Value: PGValue); cdecl; external libgstreamer;
procedure gst_child_proxy_set_valist(obj: PGstChildProxy; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_child_proxy_set(obj: PGstChildProxy; first_property_name: Pgchar); varargs cdecl; external libgstreamer;
procedure gst_child_proxy_child_added(parent: PGstChildProxy; child: PGObject; Name: Pgchar); cdecl; external libgstreamer;
procedure gst_child_proxy_child_removed(parent: PGstChildProxy; child: PGObject; Name: Pgchar); cdecl; external libgstreamer;

// === Konventiert am: 16-9-24 17:56:25 ===

function GST_TYPE_CHILD_PROXY: TGType;
function GST_CHILD_PROXY(obj: Pointer): PGstChildProxy;
function GST_IS_CHILD_PROXY(obj: Pointer): Tgboolean;
function GST_CHILD_PROXY_GET_INTERFACE(obj: Pointer): PGstChildProxyInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_CHILD_PROXY: TGType;
begin
  GST_TYPE_CHILD_PROXY := gst_child_proxy_get_type;
end;

function GST_CHILD_PROXY(obj: Pointer): PGstChildProxy;
begin
  Result := PGstChildProxy(g_type_check_instance_cast(obj, GST_TYPE_CHILD_PROXY));
end;

function GST_IS_CHILD_PROXY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_CHILD_PROXY);
end;

function GST_CHILD_PROXY_GET_INTERFACE(obj: Pointer): PGstChildProxyInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_CHILD_PROXY);
end;



{$ENDIF read_implementation}
