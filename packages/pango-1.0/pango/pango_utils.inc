
{$IFDEF read_interface}

function pango_split_file_list(str: pchar): ppchar; cdecl; external libpango; deprecated 'PANGO_DEPRECATED';
function pango_trim_string(str: pchar): pchar; cdecl; external libpango; deprecated 'PANGO_DEPRECATED';
function pango_read_line(stream: PFILE; str: PGString): Tgint; cdecl; external libpango; deprecated 'PANGO_DEPRECATED';
function pango_skip_space(pos: PPchar): Tgboolean; cdecl; external libpango; deprecated 'PANGO_DEPRECATED';
function pango_scan_word(pos: PPchar; out_: PGString): Tgboolean; cdecl; external libpango; deprecated 'PANGO_DEPRECATED';
function pango_scan_string(pos: PPchar; out_: PGString): Tgboolean; cdecl; external libpango; deprecated 'PANGO_DEPRECATED';
function pango_scan_int(pos: PPchar; out_: Plongint): Tgboolean; cdecl; external libpango; deprecated 'PANGO_DEPRECATED';
function pango_parse_enum(_type:TGType; str:Pchar; value:Plongint; warn:Tgboolean; possible_values:PPchar):Tgboolean;cdecl;external libpango; deprecated 'PANGO_DEPRECATED';
function pango_parse_style(str: pchar; style: PPangoStyle; warn: Tgboolean): Tgboolean; cdecl; external libpango;
function pango_parse_variant(str: pchar; variant: PPangoVariant; warn: Tgboolean): Tgboolean; cdecl; external libpango;
function pango_parse_weight(str: pchar; weight: PPangoWeight; warn: Tgboolean): Tgboolean; cdecl; external libpango;
function pango_parse_stretch(str: pchar; stretch: PPangoStretch; warn: Tgboolean): Tgboolean; cdecl; external libpango;
procedure pango_quantize_line_geometry(thickness: Plongint; position: Plongint); cdecl; external libpango;
function pango_log2vis_get_embedding_levels(Text: Pgchar; length: longint; pbase_dir: PPangoDirection): Pguint8; cdecl; external libpango;
function pango_is_zero_width(ch: Tgunichar): Tgboolean; cdecl; external libpango;
procedure pango_find_paragraph_boundary(Text: pchar; length: longint; paragraph_delimiter_index: Plongint; next_paragraph_start: Plongint); cdecl; external libpango;

function pango_version: longint; cdecl; external libpango;
function pango_version_string: pchar; cdecl; external libpango;
function pango_version_check(required_major: longint; required_minor: longint; required_micro: longint): pchar; cdecl; external libpango;

function PANGO_VERSION_ENCODE(major, minor, micro: longint): longint;

// === Konventiert am: 26-11-24 13:57:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function PANGO_VERSION_ENCODE(major, minor, micro: longint): longint;
begin
  PANGO_VERSION_ENCODE := ((major * 10000) + (minor * 100)) + (micro * 1);
end;

{$ENDIF read_implementation}
