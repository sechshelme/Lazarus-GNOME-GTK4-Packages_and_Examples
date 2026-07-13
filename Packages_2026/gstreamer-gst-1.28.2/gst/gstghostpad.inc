

  {$IFDEF read_struct}
type
  PGstProxyPadPrivate = type Pointer;

  PGstProxyPad = ^TGstProxyPad;
  TGstProxyPad = record
    pad: TGstPad;
    priv: PGstProxyPadPrivate;
  end;

  PGstProxyPadClass = ^TGstProxyPadClass;
  TGstProxyPadClass = record
    parent_class: TGstPadClass;
    _gst_reserved: array[0..0] of Tgpointer;
  end;

  PGstGhostPadPrivate = type Pointer;

  PGstGhostPad = ^TGstGhostPad;
  TGstGhostPad = record
    pad: TGstProxyPad;
    priv: PGstGhostPadPrivate;
  end;

  PGstGhostPadClass = ^TGstGhostPadClass;
  TGstGhostPadClass = record
    parent_class: TGstProxyPadClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_proxy_pad_get_type: TGType; cdecl; external libgstreamer;
function gst_proxy_pad_get_internal(pad: PGstProxyPad): PGstProxyPad; cdecl; external libgstreamer;
function gst_proxy_pad_iterate_internal_links_default(pad: PGstPad; parent: PGstObject): PGstIterator; cdecl; external libgstreamer;
function gst_proxy_pad_chain_default(pad: PGstPad; parent: PGstObject; buffer: PGstBuffer): TGstFlowReturn; cdecl; external libgstreamer;
function gst_proxy_pad_chain_list_default(pad: PGstPad; parent: PGstObject; list: PGstBufferList): TGstFlowReturn; cdecl; external libgstreamer;
function gst_proxy_pad_getrange_default(pad: PGstPad; parent: PGstObject; offset: Tguint64; size: Tguint; buffer: PPGstBuffer): TGstFlowReturn; cdecl; external libgstreamer;

function gst_ghost_pad_get_type: TGType; cdecl; external libgstreamer;
function gst_ghost_pad_new(name: Pgchar; target: PGstPad): PGstPad; cdecl; external libgstreamer;
function gst_ghost_pad_new_no_target(name: Pgchar; dir: TGstPadDirection): PGstPad; cdecl; external libgstreamer;
function gst_ghost_pad_new_from_template(name: Pgchar; target: PGstPad; templ: PGstPadTemplate): PGstPad; cdecl; external libgstreamer;
function gst_ghost_pad_new_no_target_from_template(name: Pgchar; templ: PGstPadTemplate): PGstPad; cdecl; external libgstreamer;
function gst_ghost_pad_get_target(gpad: PGstGhostPad): PGstPad; cdecl; external libgstreamer;
function gst_ghost_pad_set_target(gpad: PGstGhostPad; newtarget: PGstPad): Tgboolean; cdecl; external libgstreamer;
function gst_ghost_pad_construct(gpad: PGstGhostPad): Tgboolean; cdecl; external libgstreamer; deprecated;
function gst_ghost_pad_activate_mode_default(pad: PGstPad; parent: PGstObject; mode: TGstPadMode; active: Tgboolean): Tgboolean; cdecl; external libgstreamer;
function gst_ghost_pad_internal_activate_mode_default(pad: PGstPad; parent: PGstObject; mode: TGstPadMode; active: Tgboolean): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 11:30:58 ===

function GST_GHOST_PAD_CAST(obj: Pointer): PGstGhostPad;

function GST_TYPE_PROXY_PAD: TGType;
function GST_PROXY_PAD(obj: Pointer): PGstProxyPad;
function GST_PROXY_PAD_CLASS(klass: Pointer): PGstProxyPadClass;
function GST_IS_PROXY_PAD(obj: Pointer): Tgboolean;
function GST_IS_PROXY_PAD_CLASS(klass: Pointer): Tgboolean;

function GST_TYPE_GHOST_PAD: TGType;
function GST_GHOST_PAD(obj: Pointer): PGstGhostPad;
function GST_GHOST_PAD_CLASS(klass: Pointer): PGstGhostPadClass;
function GST_IS_GHOST_PAD(obj: Pointer): Tgboolean;
function GST_IS_GHOST_PAD_CLASS(klass: Pointer): Tgboolean;
{$ENDIF read_function}



{$IFDEF read_implementation}

function GST_TYPE_PROXY_PAD: TGType;
begin
  GST_TYPE_PROXY_PAD := gst_proxy_pad_get_type;
end;

function GST_PROXY_PAD(obj: Pointer): PGstProxyPad;
begin
  Result := PGstProxyPad(g_type_check_instance_cast(obj, GST_TYPE_PROXY_PAD));
end;

function GST_PROXY_PAD_CLASS(klass: Pointer): PGstProxyPadClass;
begin
  Result := PGstProxyPadClass(g_type_check_class_cast(klass, GST_TYPE_PROXY_PAD));
end;

function GST_IS_PROXY_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PROXY_PAD);
end;

function GST_IS_PROXY_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PROXY_PAD);
end;


function GST_TYPE_GHOST_PAD: TGType;
begin
  GST_TYPE_GHOST_PAD := gst_ghost_pad_get_type;
end;

function GST_GHOST_PAD(obj: Pointer): PGstGhostPad;
begin
  Result := PGstGhostPad(g_type_check_instance_cast(obj, GST_TYPE_GHOST_PAD));
end;

function GST_GHOST_PAD_CLASS(klass: Pointer): PGstGhostPadClass;
begin
  Result := PGstGhostPadClass(g_type_check_class_cast(klass, GST_TYPE_GHOST_PAD));
end;

function GST_IS_GHOST_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GHOST_PAD);
end;

function GST_IS_GHOST_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GHOST_PAD);
end;


function GST_GHOST_PAD_CAST(obj: Pointer): PGstGhostPad;
begin
  GST_GHOST_PAD_CAST := PGstGhostPad(obj);
end;

{$ENDIF read_implementation}
