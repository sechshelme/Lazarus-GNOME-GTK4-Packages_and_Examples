unit nm_wimax_nsp;

interface

uses
  fp_glib2, fp_nm, nm_dbus_interface, nm_core_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  NM_WIMAX_NSP_NAME = 'name';
  NM_WIMAX_NSP_SIGNAL_QUALITY = 'signal-quality';
  NM_WIMAX_NSP_NETWORK_TYPE = 'network-type';

type
  PNMWimaxNsp = type Pointer;
  PNMWimaxNspClass = type Pointer;

function nm_wimax_nsp_get_type: TGType; cdecl; external libnm;
function nm_wimax_nsp_get_name(nsp: PNMWimaxNsp): pchar; cdecl; external libnm; deprecated;
function nm_wimax_nsp_get_signal_quality(nsp: PNMWimaxNsp): Tguint32; cdecl; external libnm; deprecated;
function nm_wimax_nsp_get_network_type(nsp: PNMWimaxNsp): TNMWimaxNspNetworkType; cdecl; external libnm; deprecated;
function nm_wimax_nsp_filter_connections(nsp: PNMWimaxNsp; connections: PGPtrArray): PGPtrArray; cdecl; external libnm; deprecated;
function nm_wimax_nsp_connection_valid(nsp: PNMWimaxNsp; connection: PNMConnection): Tgboolean; cdecl; external libnm; deprecated;

// === Konventiert am: 5-8-26 20:08:05 ===

function NM_TYPE_WIMAX_NSP: TGType;
function NM_WIMAX_NSP(obj: Pointer): PNMWimaxNsp;
function NM_WIMAX_NSP_CLASS(klass: Pointer): PNMWimaxNspClass;
function NM_IS_WIMAX_NSP(obj: Pointer): Tgboolean;
function NM_IS_WIMAX_NSP_CLASS(klass: Pointer): Tgboolean;
function NM_WIMAX_NSP_GET_CLASS(obj: Pointer): PNMWimaxNspClass;

implementation

function NM_TYPE_WIMAX_NSP: TGType;
begin
  NM_TYPE_WIMAX_NSP := nm_wimax_nsp_get_type;
end;

function NM_WIMAX_NSP(obj: Pointer): PNMWimaxNsp;
begin
  Result := PNMWimaxNsp(g_type_check_instance_cast(obj, NM_TYPE_WIMAX_NSP));
end;

function NM_WIMAX_NSP_CLASS(klass: Pointer): PNMWimaxNspClass;
begin
  Result := PNMWimaxNspClass(g_type_check_class_cast(klass, NM_TYPE_WIMAX_NSP));
end;

function NM_IS_WIMAX_NSP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, NM_TYPE_WIMAX_NSP);
end;

function NM_IS_WIMAX_NSP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, NM_TYPE_WIMAX_NSP);
end;

function NM_WIMAX_NSP_GET_CLASS(obj: Pointer): PNMWimaxNspClass;
begin
  Result := PNMWimaxNspClass(PGTypeInstance(obj)^.g_class);
end;



end.
