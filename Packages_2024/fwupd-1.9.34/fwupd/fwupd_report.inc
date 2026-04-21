
  {$IFDEF read_struct}
type
  TFwupdReport = record
    parent_instance: TGObject;
  end;
  PFwupdReport = ^TFwupdReport;

  TFwupdReportClass = record
    parent_class: TGObjectClass;
    _fwupd_reserved1: procedure; cdecl;
    _fwupd_reserved2: procedure; cdecl;
    _fwupd_reserved3: procedure; cdecl;
    _fwupd_reserved4: procedure; cdecl;
    _fwupd_reserved5: procedure; cdecl;
    _fwupd_reserved6: procedure; cdecl;
    _fwupd_reserved7: procedure; cdecl;
  end;
  PFwupdReportClass = ^TFwupdReportClass;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
const
  FWUPD_REPORT_FLAG_NONE = 0;
  FWUPD_REPORT_FLAG_FROM_OEM = 1 shl 0;
  FWUPD_REPORT_FLAG_IS_UPGRADE = 1 shl 1;
  FWUPD_REPORT_FLAG_UNKNOWN = G_MAXUINT64;

type
  PFwupdReportFlags = ^TFwupdReportFlags;
  TFwupdReportFlags = Tguint64;
  {$ENDIF read_enum}

{$IFDEF read_function}
function fwupd_report_get_type: TGType; cdecl; external libfwupd;
function fwupd_report_new: PFwupdReport; cdecl; external libfwupd;
function fwupd_report_to_string(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
function fwupd_report_get_created(self: PFwupdReport): Tguint64; cdecl; external libfwupd;
procedure fwupd_report_set_created(self: PFwupdReport; created: Tguint64); cdecl; external libfwupd;
function fwupd_report_get_version_old(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
procedure fwupd_report_set_version_old(self: PFwupdReport; version_old: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_vendor(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
procedure fwupd_report_set_vendor(self: PFwupdReport; vendor: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_vendor_id(self: PFwupdReport): Tguint32; cdecl; external libfwupd;
procedure fwupd_report_set_vendor_id(self: PFwupdReport; vendor_id: Tguint32); cdecl; external libfwupd;
function fwupd_report_get_device_name(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
procedure fwupd_report_set_device_name(self: PFwupdReport; device_name: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_distro_id(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
procedure fwupd_report_set_distro_id(self: PFwupdReport; distro_id: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_distro_version(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
procedure fwupd_report_set_distro_version(self: PFwupdReport; distro_version: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_distro_variant(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
procedure fwupd_report_set_distro_variant(self: PFwupdReport; distro_variant: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_remote_id(self: PFwupdReport): Pgchar; cdecl; external libfwupd;
procedure fwupd_report_set_remote_id(self: PFwupdReport; remote_id: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_metadata(self: PFwupdReport): PGHashTable; cdecl; external libfwupd;
procedure fwupd_report_add_metadata_item(self: PFwupdReport; key: Pgchar; value: Pgchar); cdecl; external libfwupd;
function fwupd_report_get_metadata_item(self: PFwupdReport; key: Pgchar): Pgchar; cdecl; external libfwupd;
function fwupd_report_from_variant(value: PGVariant): PFwupdReport; cdecl; external libfwupd;
function fwupd_report_to_variant(self: PFwupdReport): PGVariant; cdecl; external libfwupd;
function fwupd_report_get_flags(self: PFwupdReport): Tguint64; cdecl; external libfwupd;
procedure fwupd_report_set_flags(self: PFwupdReport; flags: Tguint64); cdecl; external libfwupd;
procedure fwupd_report_add_flag(self: PFwupdReport; flag: TFwupdReportFlags); cdecl; external libfwupd;
procedure fwupd_report_remove_flag(self: PFwupdReport; flag: TFwupdReportFlags); cdecl; external libfwupd;
function fwupd_report_has_flag(self: PFwupdReport; flag: TFwupdReportFlags): Tgboolean; cdecl; external libfwupd;
function fwupd_report_flag_to_string(report_flag: TFwupdReportFlags): Pgchar; cdecl; external libfwupd;
function fwupd_report_flag_from_string(report_flag: Pgchar): TFwupdReportFlags; cdecl; external libfwupd;

// === Konventiert am: 21-4-26 15:36:17 ===

function FWUPD_TYPE_REPORT: TGType;
function FWUPD_REPORT(obj: Pointer): PFwupdReport;
function FWUPD_IS_REPORT(obj: Pointer): Tgboolean;
function FWUPD_REPORT_CLASS(klass: Pointer): PFwupdReportClass;
function FWUPD_IS_REPORT_CLASS(klass: Pointer): Tgboolean;
function FWUPD_REPORT_GET_CLASS(obj: Pointer): PFwupdReportClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function FWUPD_TYPE_REPORT: TGType;
begin
  Result := fwupd_report_get_type;
end;

function FWUPD_REPORT(obj: Pointer): PFwupdReport;
begin
  Result := PFwupdReport(g_type_check_instance_cast(obj, FWUPD_TYPE_REPORT));
end;

function FWUPD_IS_REPORT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, FWUPD_TYPE_REPORT);
end;

function FWUPD_REPORT_CLASS(klass: Pointer): PFwupdReportClass;
begin
  Result := PFwupdReportClass(g_type_check_class_cast(klass, FWUPD_TYPE_REPORT));
end;

function FWUPD_IS_REPORT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, FWUPD_TYPE_REPORT);
end;

function FWUPD_REPORT_GET_CLASS(obj: Pointer): PFwupdReportClass;
begin
  Result := PFwupdReportClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
