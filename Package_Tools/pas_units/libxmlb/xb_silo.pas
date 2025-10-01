unit xb_silo;

interface

uses
  fp_glib2, fp_xmlb, xb_node, xb_query;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TXbSilo = record
    parent_instance: TGObject;
  end;
  PXbSilo = ^TXbSilo;

  TXbSiloClass = record
    parent_class: TGObjectClass;
    _xb_reserved1: procedure; cdecl;
    _xb_reserved2: procedure; cdecl;
    _xb_reserved3: procedure; cdecl;
    _xb_reserved4: procedure; cdecl;
    _xb_reserved5: procedure; cdecl;
    _xb_reserved6: procedure; cdecl;
    _xb_reserved7: procedure; cdecl;
  end;
  PXbSiloClass = ^TXbSiloClass;

  PXbSiloLoadFlags = ^TXbSiloLoadFlags;
  TXbSiloLoadFlags = longint;

const
  XB_SILO_LOAD_FLAG_NONE = 0;
  XB_SILO_LOAD_FLAG_NO_MAGIC = 1 shl 0;
  XB_SILO_LOAD_FLAG_WATCH_BLOB = 1 shl 1;
  XB_SILO_LOAD_FLAG_LAST = (1 shl 1) + 1;

type
  PXbSiloProfileFlags = ^TXbSiloProfileFlags;
  TXbSiloProfileFlags = longint;

const
  XB_SILO_PROFILE_FLAG_NONE = 0;
  XB_SILO_PROFILE_FLAG_DEBUG = 1 shl 0;
  XB_SILO_PROFILE_FLAG_APPEND = 1 shl 1;
  XB_SILO_PROFILE_FLAG_XPATH = 1 shl 2;
  XB_SILO_PROFILE_FLAG_OPTIMIZER = 1 shl 3;
  XB_SILO_PROFILE_FLAG_LAST = (1 shl 3) + 1;

function xb_silo_get_type: TGType; cdecl; external libxmlb;
function xb_silo_new: PXbSilo; cdecl; external libxmlb;
function xb_silo_new_from_xml(xml: Pgchar; error: PPGError): PXbSilo; cdecl; external libxmlb;
function xb_silo_get_bytes(self: PXbSilo): PGBytes; cdecl; external libxmlb;
function xb_silo_load_from_bytes(self: PXbSilo; blob: PGBytes; flags: TXbSiloLoadFlags; error: PPGError): Tgboolean; cdecl; external libxmlb;
function xb_silo_load_from_file(self: PXbSilo; file_: PGFile; flags: TXbSiloLoadFlags; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libxmlb;
function xb_silo_save_to_file(self: PXbSilo; file_: PGFile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libxmlb;
function xb_silo_to_string(self: PXbSilo; error: PPGError): Pgchar; cdecl; external libxmlb;
function xb_silo_get_size(self: PXbSilo): Tguint; cdecl; external libxmlb;
function xb_silo_get_guid(self: PXbSilo): Pgchar; cdecl; external libxmlb;
function xb_silo_get_root(self: PXbSilo): PXbNode; cdecl; external libxmlb;
procedure xb_silo_invalidate(self: PXbSilo); cdecl; external libxmlb;
function xb_silo_is_valid(self: PXbSilo): Tgboolean; cdecl; external libxmlb;
function xb_silo_watch_file(self: PXbSilo; file_: PGFile; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libxmlb;
procedure xb_silo_set_profile_flags(self: PXbSilo; profile_flags: TXbSiloProfileFlags); cdecl; external libxmlb;
function xb_silo_get_profile_string(self: PXbSilo): Pgchar; cdecl; external libxmlb;
function xb_silo_get_enable_node_cache(self: PXbSilo): Tgboolean; cdecl; external libxmlb;
procedure xb_silo_set_enable_node_cache(self: PXbSilo; enable_node_cache: Tgboolean); cdecl; external libxmlb;
function xb_silo_lookup_query(self: PXbSilo; xpath: Pgchar): PXbQuery; cdecl; external libxmlb;

// === Konventiert am: 1-10-25 19:42:40 ===

function XB_TYPE_SILO: TGType;
function XB_SILO(obj: Pointer): PXbSilo;
function XB_IS_SILO(obj: Pointer): Tgboolean;
function XB_SILO_CLASS(klass: Pointer): PXbSiloClass;
function XB_IS_SILO_CLASS(klass: Pointer): Tgboolean;
function XB_SILO_GET_CLASS(obj: Pointer): PXbSiloClass;

implementation

function XB_TYPE_SILO: TGType;
begin
  Result := xb_silo_get_type;
end;

function XB_SILO(obj: Pointer): PXbSilo;
begin
  Result := PXbSilo(g_type_check_instance_cast(obj, XB_TYPE_SILO));
end;

function XB_IS_SILO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XB_TYPE_SILO);
end;

function XB_SILO_CLASS(klass: Pointer): PXbSiloClass;
begin
  Result := PXbSiloClass(g_type_check_class_cast(klass, XB_TYPE_SILO));
end;

function XB_IS_SILO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, XB_TYPE_SILO);
end;

function XB_SILO_GET_CLASS(obj: Pointer): PXbSiloClass;
begin
  Result := PXbSiloClass(PGTypeInstance(obj)^.g_class);
end;


end.
