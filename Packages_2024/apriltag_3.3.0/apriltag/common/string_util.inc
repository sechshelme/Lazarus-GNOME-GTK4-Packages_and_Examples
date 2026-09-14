{$IFDEF read_interface}


type
  Pstring_buffer_t = type Pointer;

  Pstring_feeder_t = ^Tstring_feeder_t;
  Tstring_feeder_t = record
    s: pchar;
    len: Tsize_t;
    pos: Tsize_t;
    line: longint;
    col: longint;
  end;

function sprintf_alloc(fmt: pchar): pchar; cdecl; varargs; external libapriltag_utils;
function vsprintf_alloc(fmt: pchar; args: Tva_list): pchar; cdecl; external libapriltag_utils;
function _str_concat_private(first: pchar): pchar; cdecl; varargs; external libapriltag_utils;
function str_diff_idx(a: pchar; b: pchar): longint; cdecl; external libapriltag_utils;
function str_split(str: pchar; delim: pchar): Pzarray_t; cdecl; external libapriltag_utils;
function str_split_spaces(str: pchar): Pzarray_t; cdecl; external libapriltag_utils;
procedure str_split_destroy(s: Pzarray_t); cdecl; external libapriltag_utils;
function str_trim(str: pchar): pchar; cdecl; external libapriltag_utils;
function str_lstrip(str: pchar): pchar; cdecl; external libapriltag_utils;
function str_rstrip(str: pchar): pchar; cdecl; external libapriltag_utils;
function str_ends_with(haystack: pchar; needle: pchar): Tbool; cdecl; external libapriltag_utils;
function str_starts_with(haystack: pchar; needle: pchar): Tbool; cdecl; external libapriltag_utils;
function str_starts_with_any(haystack: pchar; needles: PPchar; num_needles: longint): Tbool; cdecl; external libapriltag_utils;
function str_matches_any(haystack: pchar; needles: PPchar; num_needles: longint): Tbool; cdecl; external libapriltag_utils;
function str_substring(str: pchar; startidx: Tsize_t; endidx: longint): pchar; cdecl; external libapriltag_utils;
function str_indexof(haystack: pchar; needle: pchar): longint; cdecl; external libapriltag_utils;
function str_last_indexof(haystack: pchar; needle: pchar): longint; cdecl; external libapriltag_utils;
function str_tolowercase(s: pchar): pchar; cdecl; external libapriltag_utils;
function str_touppercase(s: pchar): pchar; cdecl; external libapriltag_utils;
function str_replace(haystack: pchar; needle: pchar; replacement: pchar): pchar; cdecl; external libapriltag_utils;
function str_replace_many(_haystack: pchar): pchar; cdecl; varargs; external libapriltag_utils;
function string_buffer_create: Pstring_buffer_t; cdecl; external libapriltag_utils;
procedure string_buffer_destroy(sb: Pstring_buffer_t); cdecl; external libapriltag_utils;
procedure string_buffer_append(sb: Pstring_buffer_t; c: char); cdecl; external libapriltag_utils;
function string_buffer_pop_back(sb: Pstring_buffer_t): char; cdecl; external libapriltag_utils;
procedure string_buffer_append_string(sb: Pstring_buffer_t; str: pchar); cdecl; external libapriltag_utils;
procedure string_buffer_appendf(sb: Pstring_buffer_t; fmt: pchar; args: array of const); cdecl; external libapriltag_utils;
procedure string_buffer_appendf(sb: Pstring_buffer_t; fmt: pchar); cdecl; external libapriltag_utils;
function string_buffer_ends_with(sb: Pstring_buffer_t; str: pchar): Tbool; cdecl; external libapriltag_utils;
function string_buffer_size(sb: Pstring_buffer_t): Tsize_t; cdecl; external libapriltag_utils;
function string_buffer_to_string(sb: Pstring_buffer_t): pchar; cdecl; external libapriltag_utils;
procedure string_buffer_reset(sb: Pstring_buffer_t); cdecl; external libapriltag_utils;
function string_feeder_create(str: pchar): Pstring_feeder_t; cdecl; external libapriltag_utils;
procedure string_feeder_destroy(sf: Pstring_feeder_t); cdecl; external libapriltag_utils;
function string_feeder_has_next(sf: Pstring_feeder_t): Tbool; cdecl; external libapriltag_utils;
function string_feeder_next(sf: Pstring_feeder_t): char; cdecl; external libapriltag_utils;
function string_feeder_next_length(sf: Pstring_feeder_t; length: Tsize_t): pchar; cdecl; external libapriltag_utils;
function string_feeder_peek(sf: Pstring_feeder_t): char; cdecl; external libapriltag_utils;
function string_feeder_peek_length(sf: Pstring_feeder_t; length: Tsize_t): pchar; cdecl; external libapriltag_utils;
function string_feeder_get_line(sf: Pstring_feeder_t): longint; cdecl; external libapriltag_utils;
function string_feeder_get_column(sf: Pstring_feeder_t): longint; cdecl; external libapriltag_utils;
function string_feeder_starts_with(sf: Pstring_feeder_t; str: pchar): Tbool; cdecl; external libapriltag_utils;
procedure string_feeder_require(sf: Pstring_feeder_t; str: pchar); cdecl; external libapriltag_utils;
function str_expand_envs(in_: pchar): pchar; cdecl; external libapriltag_utils;

function streq(const str1, str2: pansichar): boolean;
function strcaseeq(const str1, str2: pansichar): boolean;

function str_contains(const haystack, needle: pansichar): integer;


// === Konventiert am: 12-9-26 17:22:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function streq(const str1, str2: pansichar): boolean;
var
  i: integer;
begin
  i := 0;
  while str1[i] <> #0 do begin
    if str1[i] <> str2[i] then  begin
      Exit(False);
    end;
    Inc(i);
  end;

  Result := (str2[i] = #0);
end;

function strcaseeq(const str1, str2: pansichar): boolean;
var
  i: integer;
  c1, c2: ansichar;
begin
  i := 0;
  while str1[i] <> #0 do begin
    c1 := str1[i];
    c2 := str2[i];

    if c1 = c2 then  begin
      Inc(i);
      Continue;
    end else if (c1 >= 'a') and (c1 <= 'z') and (ansichar(byte(c1) - 32) = c2) then  begin
      Inc(i);
      Continue;
    end else if (c1 >= 'A') and (c1 <= 'Z') and (ansichar(byte(c1) + 32) = c2) then  begin
      Inc(i);
      Continue;
    end;

    Result := False;
    Exit;
  end;

  Result := (str2[i] = #0);
end;


function str_contains(const haystack, needle: pansichar): integer;
begin
  if str_indexof(haystack, needle) >= 0 then  begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;




{$ENDIF read_implementation}
