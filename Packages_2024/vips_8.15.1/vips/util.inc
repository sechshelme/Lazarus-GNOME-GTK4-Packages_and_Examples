

{$IFDEF read_function}
function vips_enum_string(enm: TGType; value: longint): pchar; cdecl; external libvips;
function vips_enum_nick(enm: TGType; value: longint): pchar; cdecl; external libvips;
function vips_enum_from_nick(domain: pchar; _type: TGType; str: pchar): longint; cdecl; external libvips;
function vips_flags_from_nick(domain: pchar; _type: TGType; nick: pchar): longint; cdecl; external libvips;
function vips_slist_equal(l1: PGSList; l2: PGSList): Tgboolean; cdecl; external libvips;
function vips_slist_map2(list: PGSList; fn: TVipsSListMap2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_slist_map2_rev(list: PGSList; fn: TVipsSListMap2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_slist_map4(list: PGSList; fn: TVipsSListMap4Fn; a: pointer; b: pointer; c: pointer; d: pointer): pointer; cdecl; external libvips;
function vips_slist_fold2(list: PGSList; start: pointer; fn: TVipsSListFold2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_slist_filter(list: PGSList; fn: TVipsSListMap2Fn; a: pointer; b: pointer): PGSList; cdecl; external libvips;
procedure vips_slist_free_all(list: PGSList); cdecl; external libvips;
function vips_map_equal(a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_hash_table_map(hash: PGHashTable; fn: TVipsSListMap2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_strncpy(dest: pchar; src: pchar; n: longint): pchar; cdecl; external libvips;
function vips_strrstr(haystack: pchar; needle: pchar): pchar; cdecl; external libvips;
function vips_ispostfix(a: pchar; b: pchar): Tgboolean; cdecl; external libvips;
function vips_iscasepostfix(a: pchar; b: pchar): Tgboolean; cdecl; external libvips;
function vips_isprefix(a: pchar; b: pchar): Tgboolean; cdecl; external libvips;
function vips_break_token(str: pchar; brk: pchar): pchar; cdecl; external libvips;
procedure vips__chomp(str: pchar); cdecl; external libvips;
function vips_vsnprintf(str: pchar; size: Tsize_t; format: pchar; ap: Tva_list): longint; cdecl; external libvips;
function vips_snprintf(str: pchar; size: Tsize_t; format: pchar; args: array of const): longint; cdecl; external libvips;
function vips_snprintf(str: pchar; size: Tsize_t; format: pchar): longint; cdecl; external libvips;
function vips_filename_suffix_match(path: pchar; suffixes: PPchar): longint; cdecl; external libvips;
function vips_file_length(fd: longint): Tgint64; cdecl; external libvips;
function vips__write(fd: longint; buf: pointer; count: Tsize_t): longint; cdecl; external libvips;
function vips__open(filename: pchar; flags: longint; mode: longint): longint; cdecl; external libvips;
function vips__open_read(filename: pchar): longint; cdecl; external libvips;
function vips__fopen(filename: pchar; mode: pchar): PFILE; cdecl; external libvips;
function vips__file_open_read(filename: pchar; fallback_dir: pchar; text_mode: Tgboolean): PFILE; cdecl; external libvips;
function vips__file_open_write(filename: pchar; text_mode: Tgboolean): PFILE; cdecl; external libvips;
function vips__file_read(fp: PFILE; name: pchar; length_out: Psize_t): pchar; cdecl; external libvips;
function vips__file_read_name(name: pchar; fallback_dir: pchar; length_out: Psize_t): pchar; cdecl; external libvips;
function vips__file_write(data: pointer; size: Tsize_t; nmemb: Tsize_t; stream: PFILE): longint; cdecl; external libvips;
function vips__get_bytes(filename: pchar; buf: pbyte; len: Tgint64): Tgint64; cdecl; external libvips;
function vips__fgetc(fp: PFILE): longint; cdecl; external libvips;
function vips__gvalue_ref_string_new(text: pchar): PGValue; cdecl; external libvips;
procedure vips__gslist_gvalue_free(list: PGSList); cdecl; external libvips;
function vips__gslist_gvalue_copy(list: PGSList): PGSList; cdecl; external libvips;
function vips__gslist_gvalue_merge(a: PGSList; b: PGSList): PGSList; cdecl; external libvips;
function vips__gslist_gvalue_get(list: PGSList): pchar; cdecl; external libvips;
function vips__seek_no_error(fd: longint; pos: Tgint64; whence: longint): Tgint64; cdecl; external libvips;
function vips__seek(fd: longint; pos: Tgint64; whence: longint): Tgint64; cdecl; external libvips;
function vips__ftruncate(fd: longint; pos: Tgint64): longint; cdecl; external libvips;
function vips_existsf(name: pchar): longint; cdecl; varargs; external libvips;
function vips_isdirf(name: pchar): longint; cdecl; varargs; external libvips;
function vips_mkdirf(name: pchar): longint; cdecl; varargs; external libvips;
function vips_rmdirf(name: pchar): longint; cdecl; varargs; external libvips;
function vips_rename(old_name: pchar; new_name: pchar): longint; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_enum}
type
  PVipsToken = ^TVipsToken;
  TVipsToken = longint;

const
  VIPS_TOKEN_LEFT = 1;
  VIPS_TOKEN_RIGHT = 2;
  VIPS_TOKEN_STRING = 3;
  VIPS_TOKEN_EQUALS = 4;
  VIPS_TOKEN_COMMA = 5;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips__token_get(buffer: pchar; token: PVipsToken; _string: pchar; size: longint): pchar; cdecl; external libvips;
function vips__token_must(buffer: pchar; token: PVipsToken; _string: pchar; size: longint): pchar; cdecl; external libvips;
function vips__token_need(buffer: pchar; need_token: TVipsToken; _string: pchar; size: longint): pchar; cdecl; external libvips;
function vips__token_segment(p: pchar; token: PVipsToken; _string: pchar; size: longint): pchar; cdecl; external libvips;
function vips__token_segment_need(p: pchar; need_token: TVipsToken; _string: pchar; size: longint): pchar; cdecl; external libvips;
function vips__find_rightmost_brackets(p: pchar): pchar; cdecl; external libvips;
procedure vips__filename_split8(name: pchar; filename: pchar; option_string: pchar); cdecl; external libvips;
function vips_ispoweroftwo(p: longint): longint; cdecl; external libvips;
function vips_amiMSBfirst: longint; cdecl; external libvips;
function vips__temp_name(format: pchar): pchar; cdecl; external libvips;
procedure vips__change_suffix(name: pchar; out_: pchar; mx: longint; new_suff: pchar; olds: PPchar; nolds: longint); cdecl; external libvips;
function vips_realpath(path: pchar): pchar; cdecl; external libvips;
function vips__random(seed: Tguint32): Tguint32; cdecl; external libvips;
function vips__random_add(seed: Tguint32; value: longint): Tguint32; cdecl; external libvips;
function vips__icc_dir: pchar; cdecl; external libvips;
function vips__windows_prefix: pchar; cdecl; external libvips;
function vips__get_iso8601: pchar; cdecl; external libvips;
function vips_strtod(str: pchar; out_: Pdouble): longint; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:08:34 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
