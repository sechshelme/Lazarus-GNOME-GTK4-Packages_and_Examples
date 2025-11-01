{$IFDEF read_interface}


type
  PCdSpectrum = type Pointer;

function cd_spectrum_get_type: TGType; cdecl; external libcolord;
function cd_spectrum_new: PCdSpectrum; cdecl; external libcolord;
function cd_spectrum_sized_new(reserved_size: Tguint): PCdSpectrum; cdecl; external libcolord;
function cd_spectrum_planckian_new(temperature: Tgdouble): PCdSpectrum; cdecl; external libcolord;
function cd_spectrum_planckian_new_full(temperature: Tgdouble; start: Tgdouble; end_: Tgdouble; resolution: Tgdouble): PCdSpectrum; cdecl; external libcolord;
procedure cd_spectrum_free(spectrum: PCdSpectrum); cdecl; external libcolord;
function cd_spectrum_dup(spectrum: PCdSpectrum): PCdSpectrum; cdecl; external libcolord;
procedure cd_spectrum_limit_min(spectrum: PCdSpectrum; value: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_limit_max(spectrum: PCdSpectrum; value: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_normalize(spectrum: PCdSpectrum; wavelength: Tgdouble; value: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_normalize_max(spectrum: PCdSpectrum; value: Tgdouble); cdecl; external libcolord;
function cd_spectrum_subtract(s1: PCdSpectrum; s2: PCdSpectrum; resolution: Tgdouble): PCdSpectrum; cdecl; external libcolord;
function cd_spectrum_to_string(spectrum: PCdSpectrum; max_width: Tguint; max_height: Tguint): Pgchar; cdecl; external libcolord;
function cd_spectrum_get_id(spectrum: PCdSpectrum): Pgchar; cdecl; external libcolord;
function cd_spectrum_get_data(spectrum: PCdSpectrum): PGArray; cdecl; external libcolord;
function cd_spectrum_get_start(spectrum: PCdSpectrum): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_end(spectrum: PCdSpectrum): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_norm(spectrum: PCdSpectrum): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_resolution(spectrum: PCdSpectrum): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_size(spectrum: PCdSpectrum): Tguint; cdecl; external libcolord;
function cd_spectrum_get_value_max(spectrum: PCdSpectrum): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_value_min(spectrum: PCdSpectrum): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_value(spectrum: PCdSpectrum; idx: Tguint): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_value_raw(spectrum: PCdSpectrum; idx: Tguint): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_wavelength(spectrum: PCdSpectrum; idx: Tguint): Tgdouble; cdecl; external libcolord;
function cd_spectrum_get_value_for_nm(spectrum: PCdSpectrum; wavelength: Tgdouble): Tgdouble; cdecl; external libcolord;
procedure cd_spectrum_set_id(spectrum: PCdSpectrum; id: Pgchar); cdecl; external libcolord;
procedure cd_spectrum_set_data(spectrum: PCdSpectrum; value: PGArray); cdecl; external libcolord;
procedure cd_spectrum_set_start(spectrum: PCdSpectrum; start: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_set_end(spectrum: PCdSpectrum; end_: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_set_norm(spectrum: PCdSpectrum; norm: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_set_value(spectrum: PCdSpectrum; idx: Tguint; data: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_add_value(spectrum: PCdSpectrum; data: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_set_wavelength_cal(spectrum: PCdSpectrum; c1: Tgdouble; c2: Tgdouble; c3: Tgdouble); cdecl; external libcolord;
procedure cd_spectrum_get_wavelength_cal(spectrum: PCdSpectrum; c1: Pgdouble; c2: Pgdouble; c3: Pgdouble); cdecl; external libcolord;
function cd_spectrum_multiply(s1: PCdSpectrum; s2: PCdSpectrum; resolution: Tgdouble): PCdSpectrum; cdecl; external libcolord;
function cd_spectrum_multiply_scalar(spectrum: PCdSpectrum; value: Tgdouble): PCdSpectrum; cdecl; external libcolord;
function cd_spectrum_resample(spectrum: PCdSpectrum; start: Tgdouble; end_: Tgdouble; resolution: Tgdouble): PCdSpectrum; cdecl; external libcolord;
function cd_spectrum_resample_to_size(spectrum: PCdSpectrum; size: Tguint): PCdSpectrum; cdecl; external libcolord;

// === Konventiert am: 1-11-25 16:04:17 ===

function CD_TYPE_SPECTRUM: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function CD_TYPE_SPECTRUM: TGType;
begin
  CD_TYPE_SPECTRUM := cd_spectrum_get_type;
end;



{$ENDIF read_implementation}
