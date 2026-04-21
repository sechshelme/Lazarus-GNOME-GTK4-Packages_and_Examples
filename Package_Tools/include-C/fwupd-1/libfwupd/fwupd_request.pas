unit fwupd_request;

interface

uses
  fp_glib2, fp_fwupd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TFwupdRequest = record
    parent_instance: TGObject;
  end;
  PFwupdRequest = ^TFwupdRequest;

  TFwupdRequestClass = record
    parent_class: TGObjectClass;
    invalidate: procedure(client: PFwupdRequest); cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
    _fwupd_reserved7: procedure; cdecl;
  end;
  PFwupdRequestClass = ^TFwupdRequestClass;

type
  PFwupdRequestKind = ^TFwupdRequestKind;
  TFwupdRequestKind = longint;

const
  FWUPD_REQUEST_KIND_UNKNOWN = 0;
  FWUPD_REQUEST_KIND_POST = 1;
  FWUPD_REQUEST_KIND_IMMEDIATE = 2;
  FWUPD_REQUEST_KIND_LAST = 3;

const
  FWUPD_REQUEST_ID_REMOVE_REPLUG = 'org.freedesktop.fwupd.request.remove-replug';
  FWUPD_REQUEST_ID_PRESS_UNLOCK = 'org.freedesktop.fwupd.request.press-unlock';
  FWUPD_REQUEST_ID_REMOVE_USB_CABLE = 'org.freedesktop.fwupd.request.remove-usb-cable';
  FWUPD_REQUEST_ID_INSERT_USB_CABLE = 'org.freedesktop.fwupd.request.insert-usb-cable';
  FWUPD_REQUEST_ID_DO_NOT_POWER_OFF = 'org.freedesktop.fwupd.request.do-not-power-off';
  FWUPD_REQUEST_ID_REPLUG_INSTALL = 'org.freedesktop.fwupd.replug-install';
  FWUPD_REQUEST_ID_REPLUG_POWER = 'org.freedesktop.fwupd.replug-power';
  FWUPD_REQUEST_FLAG_NONE = 0;
  FWUPD_REQUEST_FLAG_ALLOW_GENERIC_MESSAGE = 1 shl 0;
  FWUPD_REQUEST_FLAG_ALLOW_GENERIC_IMAGE = 1 shl 1;
  FWUPD_REQUEST_FLAG_NON_GENERIC_MESSAGE = 1 shl 2;
  FWUPD_REQUEST_FLAG_NON_GENERIC_IMAGE = 1 shl 3;
  FWUPD_REQUEST_FLAG_UNKNOWN = G_MAXUINT64;

type
  PFwupdRequestFlags = ^TFwupdRequestFlags;
  TFwupdRequestFlags = Tguint64;

function fwupd_request_get_type: TGType; cdecl; external libfwupd;
function fwupd_request_kind_to_string(kind: TFwupdRequestKind): Pgchar; cdecl; external libfwupd;
function fwupd_request_kind_from_string(kind: Pgchar): TFwupdRequestKind; cdecl; external libfwupd;
function fwupd_request_flag_to_string(flag: TFwupdRequestFlags): Pgchar; cdecl; external libfwupd;
function fwupd_request_flag_from_string(flag: Pgchar): TFwupdRequestFlags; cdecl; external libfwupd;
function fwupd_request_new: PFwupdRequest; cdecl; external libfwupd;
function fwupd_request_to_string(self: PFwupdRequest): Pgchar; cdecl; external libfwupd;
function fwupd_request_get_id(self: PFwupdRequest): Pgchar; cdecl; external libfwupd;
procedure fwupd_request_set_id(self: PFwupdRequest; id: Pgchar); cdecl; external libfwupd;
function fwupd_request_get_created(self: PFwupdRequest): Tguint64; cdecl; external libfwupd;
procedure fwupd_request_set_created(self: PFwupdRequest; created: Tguint64); cdecl; external libfwupd;
function fwupd_request_get_device_id(self: PFwupdRequest): Pgchar; cdecl; external libfwupd;
procedure fwupd_request_set_device_id(self: PFwupdRequest; device_id: Pgchar); cdecl; external libfwupd;
function fwupd_request_get_message(self: PFwupdRequest): Pgchar; cdecl; external libfwupd;
procedure fwupd_request_set_message(self: PFwupdRequest; message: Pgchar); cdecl; external libfwupd;
function fwupd_request_get_image(self: PFwupdRequest): Pgchar; cdecl; external libfwupd;
procedure fwupd_request_set_image(self: PFwupdRequest; image: Pgchar); cdecl; external libfwupd;
function fwupd_request_get_kind(self: PFwupdRequest): TFwupdRequestKind; cdecl; external libfwupd;
procedure fwupd_request_set_kind(self: PFwupdRequest; kind: TFwupdRequestKind); cdecl; external libfwupd;
function fwupd_request_get_flags(self: PFwupdRequest): TFwupdRequestFlags; cdecl; external libfwupd;
procedure fwupd_request_set_flags(self: PFwupdRequest; flags: TFwupdRequestFlags); cdecl; external libfwupd;
procedure fwupd_request_add_flag(self: PFwupdRequest; flag: TFwupdRequestFlags); cdecl; external libfwupd;
procedure fwupd_request_remove_flag(self: PFwupdRequest; flag: TFwupdRequestFlags); cdecl; external libfwupd;
function fwupd_request_has_flag(self: PFwupdRequest; flag: TFwupdRequestFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_request_from_variant(value: PGVariant): PFwupdRequest; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:36:22 ===

function FWUPD_TYPE_REQUEST: TGType;
function FWUPD_REQUEST(obj: Pointer): PFwupdRequest;
function FWUPD_IS_REQUEST(obj: Pointer): Tgboolean;
function FWUPD_REQUEST_CLASS(klass: Pointer): PFwupdRequestClass;
function FWUPD_IS_REQUEST_CLASS(klass: Pointer): Tgboolean;
function FWUPD_REQUEST_GET_CLASS(obj: Pointer): PFwupdRequestClass;

implementation

function FWUPD_TYPE_REQUEST: TGType;
begin
  Result := fwupd_request_get_type;
end;

function FWUPD_REQUEST(obj: Pointer): PFwupdRequest;
begin
  Result := PFwupdRequest(g_type_check_instance_cast(obj, FWUPD_TYPE_REQUEST));
end;

function FWUPD_IS_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_REQUEST);
end;

function FWUPD_REQUEST_CLASS(klass: Pointer): PFwupdRequestClass;
begin
  Result := PFwupdRequestClass(g_type_check_class_cast(klass, FWUPD_TYPE_REQUEST));
end;

function FWUPD_IS_REQUEST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_REQUEST);
end;

function FWUPD_REQUEST_GET_CLASS(obj: Pointer): PFwupdRequestClass;
begin
  Result := PFwupdRequestClass(PGTypeInstance(obj)^.g_class);
end;


end.
