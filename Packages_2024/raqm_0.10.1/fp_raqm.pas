unit fp_raqm;

interface

const
  {$IFDEF Linux}
  libraqm = 'raqm';
  {$ENDIF}

  {$IFDEF Windows}
  libraqm = 'libraqm-0.dll';
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  // ==== Freetype2
type
  TFT_Face = type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Praqm_t = type Pointer;

type
  Praqm_direction_t = ^Traqm_direction_t;
  Traqm_direction_t = longint;

const
  RAQM_DIRECTION_DEFAULT = 0;
  RAQM_DIRECTION_RTL = 1;
  RAQM_DIRECTION_LTR = 2;
  RAQM_DIRECTION_TTB = 3;

type
  Traqm_glyph_t = record
    index: dword;
    x_advance: longint;
    y_advance: longint;
    x_offset: longint;
    y_offset: longint;
    cluster: Tuint32_t;
    ftface: TFT_Face;
  end;
  Praqm_glyph_t = ^Traqm_glyph_t;

function raqm_create: Praqm_t; cdecl; external libraqm;
function raqm_reference(rq: Praqm_t): Praqm_t; cdecl; external libraqm;
procedure raqm_destroy(rq: Praqm_t); cdecl; external libraqm;
procedure raqm_clear_contents(rq: Praqm_t); cdecl; external libraqm;
function raqm_set_text(rq: Praqm_t; text: Puint32_t; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_set_text_utf8(rq: Praqm_t; text: pchar; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_set_text_utf16(rq: Praqm_t; text: Puint16_t; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_set_par_direction(rq: Praqm_t; dir: Traqm_direction_t): boolean; cdecl; external libraqm;
function raqm_set_language(rq: Praqm_t; lang: pchar; start: Tsize_t; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_add_font_feature(rq: Praqm_t; feature: pchar; len: longint): boolean; cdecl; external libraqm;
function raqm_set_freetype_face(rq: Praqm_t; face: TFT_Face): boolean; cdecl; external libraqm;
function raqm_set_freetype_face_range(rq: Praqm_t; face: TFT_Face; start: Tsize_t; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_set_freetype_load_flags(rq: Praqm_t; flags: longint): boolean; cdecl; external libraqm;
function raqm_set_freetype_load_flags_range(rq: Praqm_t; flags: longint; start: Tsize_t; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_set_letter_spacing_range(rq: Praqm_t; spacing: longint; start: Tsize_t; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_set_word_spacing_range(rq: Praqm_t; spacing: longint; start: Tsize_t; len: Tsize_t): boolean; cdecl; external libraqm;
function raqm_set_invisible_glyph(rq: Praqm_t; gid: longint): boolean; cdecl; external libraqm;
function raqm_layout(rq: Praqm_t): boolean; cdecl; external libraqm;
function raqm_get_glyphs(rq: Praqm_t; length: Psize_t): Praqm_glyph_t; cdecl; external libraqm;
function raqm_get_par_resolved_direction(rq: Praqm_t): Traqm_direction_t; cdecl; external libraqm;
function raqm_get_direction_at_index(rq: Praqm_t; index: Tsize_t): Traqm_direction_t; cdecl; external libraqm;
function raqm_index_to_position(rq: Praqm_t; index: Psize_t; x: Plongint; y: Plongint): boolean; cdecl; external libraqm;
function raqm_position_to_index(rq: Praqm_t; x: longint; y: longint; index: Psize_t): boolean; cdecl; external libraqm;
procedure raqm_version(major: Pdword; minor: Pdword; micro: Pdword); cdecl; external libraqm;
function raqm_version_string: pchar; cdecl; external libraqm;
function raqm_version_atleast(major: dword; minor: dword; micro: dword): boolean; cdecl; external libraqm;

// === Konventiert am: 29-12-25 19:51:32 ===



const
  RAQM_VERSION_MAJOR = 0;
  RAQM_VERSION_MINOR = 10;
  RAQM_VERSION_MICRO = 1;
  RAQM_VERSION_STRING_ = '0.10.1';

function RAQM_VERSION_ATLEAST(major, minor, micro: longint): boolean;

implementation

function RAQM_VERSION_ATLEAST(major, minor, micro: longint): boolean;
begin
  RAQM_VERSION_ATLEAST := (((major * 10000) + (minor * 100)) + micro) <= (((RAQM_VERSION_MAJOR * 10000) + (RAQM_VERSION_MINOR * 100)) + RAQM_VERSION_MICRO);
end;

end.
