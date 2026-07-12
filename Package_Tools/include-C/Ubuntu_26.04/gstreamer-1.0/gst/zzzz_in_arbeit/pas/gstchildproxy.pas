unit gstchildproxy;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstChildProxy = type Pointer;

  PGstChildProxyInterface = ^TGstChildProxyInterface;
  TGstChildProxyInterface = record
    parent: TGTypeInterface;
    get_child_by_name: function(parent: PGstChildProxy; name: Pgchar): PGObject; cdecl;
    get_child_by_index: function(parent: PGstChildProxy; index: Tguint): PGObject; cdecl;
    get_children_count: function(parent: PGstChildProxy): Tguint; cdecl;
    child_added: procedure(parent: PGstChildProxy; child: PGObject; name: Pgchar); cdecl;
    child_removed: procedure(parent: PGstChildProxy; child: PGObject; name: Pgchar); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_child_proxy_get_type: TGType; cdecl; external libgstreamer;
function gst_child_proxy_get_child_by_name(parent: PGstChildProxy; name: Pgchar): PGObject; cdecl; external libgstreamer;
function gst_child_proxy_get_child_by_name_recurse(child_proxy: PGstChildProxy; name: Pgchar): PGObject; cdecl; external libgstreamer;
function gst_child_proxy_get_children_count(parent: PGstChildProxy): Tguint; cdecl; external libgstreamer;
function gst_child_proxy_get_child_by_index(parent: PGstChildProxy; index: Tguint): PGObject; cdecl; external libgstreamer;
function gst_child_proxy_lookup(obj: PGstChildProxy; name: Pgchar; target: PPGObject; pspec: PPGParamSpec): Tgboolean; cdecl; external libgstreamer;
procedure gst_child_proxy_get_property(obj: PGstChildProxy; name: Pgchar; value: PGValue); cdecl; external libgstreamer;
procedure gst_child_proxy_get_valist(obj: PGstChildProxy; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_child_proxy_get(obj: PGstChildProxy; first_property_name: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_child_proxy_set_property(obj: PGstChildProxy; name: Pgchar; value: PGValue); cdecl; external libgstreamer;
procedure gst_child_proxy_set_valist(obj: PGstChildProxy; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libgstreamer;
procedure gst_child_proxy_set(obj: PGstChildProxy; first_property_name: Pgchar); cdecl; varargs; external libgstreamer;
procedure gst_child_proxy_child_added(parent: PGstChildProxy; child: PGObject; name: Pgchar); cdecl; external libgstreamer;
procedure gst_child_proxy_child_removed(parent: PGstChildProxy; child: PGObject; name: Pgchar); cdecl; external libgstreamer;

// === Konventiert am: 10-7-26 19:56:47 ===

function GST_TYPE_CHILD_PROXY: TGType;
function GST_CHILD_PROXY(obj: Pointer): PGstChildProxy;
function GST_IS_CHILD_PROXY(obj: Pointer): Tgboolean;
function GST_CHILD_PROXY_GET_INTERFACE(obj: Pointer): PGstChildProxyInterface;
{$ENDIF read_function}

implementation

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



end.
