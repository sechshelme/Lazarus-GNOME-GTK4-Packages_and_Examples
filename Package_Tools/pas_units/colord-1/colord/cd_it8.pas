unit cd_it8;

interface

uses
  fp_glib2, fp_colord, cd_color, cd_math, cd_spectrum;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  PCdIt8Error = ^TCdIt8Error;
  TCdIt8Error = longint;

const
  CD_IT8_ERROR_FAILED = 0;
  CD_IT8_ERROR_INVALID_FORMAT = 1;
  CD_IT8_ERROR_UNKNOWN_KIND = 2;
  CD_IT8_ERROR_LAST = 3;

type
  PCdIt8Kind = ^TCdIt8Kind;
  TCdIt8Kind = longint;

const
  CD_IT8_KIND_UNKNOWN = 0;
  CD_IT8_KIND_TI1 = 1;
  CD_IT8_KIND_TI3 = 2;
  CD_IT8_KIND_CCMX = 3;
  CD_IT8_KIND_CAL = 4;
  CD_IT8_KIND_CCSS = 5;
  CD_IT8_KIND_SPECT = 6;
  CD_IT8_KIND_CMF = 7;
  CD_IT8_KIND_LAST = 8;

type
  TCdIt8Class = record
    parent_class: TGObjectClass;
    _cd_it8_reserved1: procedure; cdecl;
    _cd_it8_reserved2: procedure; cdecl;
    _cd_it8_reserved3: procedure; cdecl;
    _cd_it8_reserved4: procedure; cdecl;
    _cd_it8_reserved5: procedure; cdecl;
    _cd_it8_reserved6: procedure; cdecl;
    _cd_it8_reserved7: procedure; cdecl;
    _cd_it8_reserved8: procedure; cdecl;
  end;
  PCdIt8Class = ^TCdIt8Class;

  TCdIt8 = record
    parent_instance: TGObject;
  end;
  PCdIt8 = ^TCdIt8;

function cd_it8_get_type: TGType; cdecl; external libcolord;
function cd_it8_error_quark: TGQuark; cdecl; external libcolord;
function cd_it8_new: PCdIt8; cdecl; external libcolord;
function cd_it8_new_with_kind(kind: TCdIt8Kind): PCdIt8; cdecl; external libcolord;
function cd_it8_load_from_data(it8: PCdIt8; data: Pgchar; size: Tgsize; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_load_from_file(it8: PCdIt8; file_: PGFile; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_save_to_file(it8: PCdIt8; file_: PGFile; error: PPGError): Tgboolean; cdecl; external libcolord;
function cd_it8_save_to_data(it8: PCdIt8; data: PPgchar; size: Pgsize; error: PPGError): Tgboolean; cdecl; external libcolord;
procedure cd_it8_set_kind(it8: PCdIt8; kind: TCdIt8Kind); cdecl; external libcolord;
procedure cd_it8_set_normalized(it8: PCdIt8; normalized: Tgboolean); cdecl; external libcolord;
procedure cd_it8_set_originator(it8: PCdIt8; originator: Pgchar); cdecl; external libcolord;
procedure cd_it8_set_title(it8: PCdIt8; title: Pgchar); cdecl; external libcolord;
procedure cd_it8_set_spectral(it8: PCdIt8; spectral: Tgboolean); cdecl; external libcolord;
procedure cd_it8_set_instrument(it8: PCdIt8; instrument: Pgchar); cdecl; external libcolord;
procedure cd_it8_set_reference(it8: PCdIt8; reference: Pgchar); cdecl; external libcolord;
procedure cd_it8_set_enable_created(it8: PCdIt8; enable_created: Tgboolean); cdecl; external libcolord;
procedure cd_it8_add_data(it8: PCdIt8; rgb: PCdColorRGB; xyz: PCdColorXYZ); cdecl; external libcolord;
procedure cd_it8_add_option(it8: PCdIt8; option: Pgchar); cdecl; external libcolord;
procedure cd_it8_set_matrix(it8: PCdIt8; matrix: PCdMat3x3); cdecl; external libcolord;
procedure cd_it8_set_spectrum_array(it8: PCdIt8; data: PGPtrArray); cdecl; external libcolord;
procedure cd_it8_add_spectrum(it8: PCdIt8; spectrum: PCdSpectrum); cdecl; external libcolord;
function cd_it8_get_matrix(it8: PCdIt8): PCdMat3x3; cdecl; external libcolord;
function cd_it8_get_kind(it8: PCdIt8): TCdIt8Kind; cdecl; external libcolord;
function cd_it8_get_normalized(it8: PCdIt8): Tgboolean; cdecl; external libcolord;
function cd_it8_get_originator(it8: PCdIt8): Pgchar; cdecl; external libcolord;
function cd_it8_get_title(it8: PCdIt8): Pgchar; cdecl; external libcolord;
function cd_it8_get_spectral(it8: PCdIt8): Tgboolean; cdecl; external libcolord;
function cd_it8_get_instrument(it8: PCdIt8): Pgchar; cdecl; external libcolord;
function cd_it8_get_reference(it8: PCdIt8): Pgchar; cdecl; external libcolord;
function cd_it8_get_enable_created(it8: PCdIt8): Tgboolean; cdecl; external libcolord;
function cd_it8_get_data_size(it8: PCdIt8): Tguint; cdecl; external libcolord;
function cd_it8_get_data_item(it8: PCdIt8; idx: Tguint; rgb: PCdColorRGB; xyz: PCdColorXYZ): Tgboolean; cdecl; external libcolord;
function cd_it8_get_spectrum_array(it8: PCdIt8): PGPtrArray; cdecl; external libcolord;
function cd_it8_get_spectrum_by_id(it8: PCdIt8; id: Pgchar): PCdSpectrum; cdecl; external libcolord;
function cd_it8_has_option(it8: PCdIt8; option: Pgchar): Tgboolean; cdecl; external libcolord;
function cd_it8_get_xyz_for_rgb(it8: PCdIt8; R: Tgdouble; G: Tgdouble; B: Tgdouble; delta: Tgdouble): PCdColorXYZ; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:07:25 ===

function CD_TYPE_IT8: TGType;
function CD_IT8(obj: Pointer): PCdIt8;
function CD_IS_IT8(obj: Pointer): Tgboolean;
function CD_IT8_CLASS(klass: Pointer): PCdIt8Class;
function CD_IS_IT8_CLASS(klass: Pointer): Tgboolean;
function CD_IT8_GET_CLASS(obj: Pointer): PCdIt8Class;

implementation

function CD_TYPE_IT8: TGType;
begin
  Result := cd_it8_get_type;
end;

function CD_IT8(obj: Pointer): PCdIt8;
begin
  Result := PCdIt8(g_type_check_instance_cast(obj, CD_TYPE_IT8));
end;

function CD_IS_IT8(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, CD_TYPE_IT8);
end;

function CD_IT8_CLASS(klass: Pointer): PCdIt8Class;
begin
  Result := PCdIt8Class(g_type_check_class_cast(klass, CD_TYPE_IT8));
end;

function CD_IS_IT8_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, CD_TYPE_IT8);
end;

function CD_IT8_GET_CLASS(obj: Pointer): PCdIt8Class;
begin
  Result := PCdIt8Class(PGTypeInstance(obj)^.g_class);
end;



end.
