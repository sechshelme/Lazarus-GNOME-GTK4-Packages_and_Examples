unit cd_edid;

interface

uses
  fp_glib2, fp_colord, cd_color;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  CD_EDID_ERROR_FAILED_TO_PARSE = 0;
  CD_EDID_ERROR_LAST = 1;

type
  TCdEdidClass = record
    parent_class: TGObjectClass;
    _cd_edid_reserved1: procedure; cdecl;
    _cd_edid_reserved2: procedure; cdecl;
    _cd_edid_reserved3: procedure; cdecl;
    _cd_edid_reserved4: procedure; cdecl;
    _cd_edid_reserved5: procedure; cdecl;
    _cd_edid_reserved6: procedure; cdecl;
    _cd_edid_reserved7: procedure; cdecl;
    _cd_edid_reserved8: procedure; cdecl;
  end;
  PCdEdidClass = ^TCdEdidClass;

  TCdEdid = record
    parent_instance: TGObject;
  end;
  PCdEdid = ^TCdEdid;

function cd_edid_get_type: TGType; cdecl; external libcolord;
function cd_edid_error_quark: TGQuark; cdecl; external libcolord;
function cd_edid_new: PCdEdid; cdecl; external libcolord;
procedure cd_edid_reset(edid: PCdEdid); cdecl; external libcolord;
function cd_edid_parse(edid: PCdEdid; edid_data: PGBytes; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_edid_get_monitor_name(edid: PCdEdid): Pgchar; cdecl; external libcolord;
function cd_edid_get_vendor_name(edid: PCdEdid): Pgchar; cdecl; external libcolord;
function cd_edid_get_serial_number(edid: PCdEdid): Pgchar; cdecl; external libcolord;
function cd_edid_get_eisa_id(edid: PCdEdid): Pgchar; cdecl; external libcolord;
function cd_edid_get_checksum(edid: PCdEdid): Pgchar; cdecl; external libcolord;
function cd_edid_get_pnp_id(edid: PCdEdid): Pgchar; cdecl; external libcolord;
function cd_edid_get_width(edid: PCdEdid): Tguint; cdecl; external libcolord;
function cd_edid_get_height(edid: PCdEdid): Tguint; cdecl; external libcolord;
function cd_edid_get_gamma(edid: PCdEdid): Tgdouble; cdecl; external libcolord;
function cd_edid_get_red(edid: PCdEdid): PCdColorYxy; cdecl; external libcolord;
function cd_edid_get_green(edid: PCdEdid): PCdColorYxy; cdecl; external libcolord;
function cd_edid_get_blue(edid: PCdEdid): PCdColorYxy; cdecl; external libcolord;
function cd_edid_get_white(edid: PCdEdid): PCdColorYxy; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:08:12 ===

function CD_TYPE_EDID: TGType;
function CD_EDID(obj: Pointer): PCdEdid;
function CD_IS_EDID(obj: Pointer): Tgboolean;
function CD_EDID_CLASS(klass: Pointer): PCdEdidClass;
function CD_IS_EDID_CLASS(klass: Pointer): Tgboolean;
function CD_EDID_GET_CLASS(obj: Pointer): PCdEdidClass;

implementation

function CD_TYPE_EDID: TGType;
begin
  Result := cd_edid_get_type;
end;

function CD_EDID(obj: Pointer): PCdEdid;
begin
  Result := PCdEdid(g_type_check_instance_cast(obj, CD_TYPE_EDID));
end;

function CD_IS_EDID(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_EDID);
end;

function CD_EDID_CLASS(klass: Pointer): PCdEdidClass;
begin
  Result := PCdEdidClass(g_type_check_class_cast(klass, CD_TYPE_EDID));
end;

function CD_IS_EDID_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_EDID);
end;

function CD_EDID_GET_CLASS(obj: Pointer): PCdEdidClass;
begin
  Result := PCdEdidClass(PGTypeInstance(obj)^.g_class);
end;


end.
