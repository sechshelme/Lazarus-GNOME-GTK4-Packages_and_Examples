unit eina_strbuf;

interface

uses
  ctypes, efl, eina_types, eina_slice;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Strbuf = record
  end;
  PEina_Strbuf = ^TEina_Strbuf;

function eina_strbuf_new: PEina_Strbuf; cdecl; external libeina;
function eina_strbuf_manage_new(str: pchar): PEina_Strbuf; cdecl; external libeina;
function eina_strbuf_manage_new_length(str: pchar; length: Tsize_t): PEina_Strbuf; cdecl; external libeina;
function eina_strbuf_manage_read_only_new_length(str: pchar; length: Tsize_t): PEina_Strbuf; cdecl; external libeina;
procedure eina_strbuf_free(buf: PEina_Strbuf); cdecl; external libeina;
procedure eina_strbuf_reset(buf: PEina_Strbuf); cdecl; external libeina;
function eina_strbuf_append(buf: PEina_Strbuf; str: pchar): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_escaped(buf: PEina_Strbuf; str: pchar): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_n(buf: PEina_Strbuf; str: pchar; maxlen: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_length(buf: PEina_Strbuf; str: pchar; length: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_slice(buf: PEina_Strbuf; slice: TEina_Slice): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_buffer(buf: PEina_Strbuf; data: PEina_Strbuf): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_char(buf: PEina_Strbuf; c: char): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_printf(buf: PEina_Strbuf; fmt: pchar; args: array of const): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_printf(buf: PEina_Strbuf; fmt: pchar): TEina_Bool; cdecl; external libeina;
function eina_strbuf_append_vprintf(buf: PEina_Strbuf; fmt: pchar; args: Tva_list): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert(buf: PEina_Strbuf; str: pchar; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_escaped(buf: PEina_Strbuf; str: pchar; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_n(buf: PEina_Strbuf; str: pchar; maxlen: Tsize_t; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_length(buf: PEina_Strbuf; str: pchar; length: Tsize_t; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_slice(buf: PEina_Strbuf; slice: TEina_Slice; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_char(buf: PEina_Strbuf; c: char; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_printf(buf: PEina_Strbuf; fmt: pchar; pos: Tsize_t; args: array of const): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_printf(buf: PEina_Strbuf; fmt: pchar; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_vprintf(buf: PEina_Strbuf; fmt: pchar; pos: Tsize_t; args: Tva_list): TEina_Bool; cdecl; external libeina;

function eina_strbuf_remove(buf: PEina_Strbuf; start: Tsize_t; end_: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_strbuf_string_get(buf: PEina_Strbuf): pchar; cdecl; external libeina;
function eina_strbuf_string_steal(buf: PEina_Strbuf): pchar; cdecl; external libeina;
procedure eina_strbuf_string_free(buf: PEina_Strbuf); cdecl; external libeina;
function eina_strbuf_length_get(buf: PEina_Strbuf): Tsize_t; cdecl; external libeina;
function eina_strbuf_replace(buf: PEina_Strbuf; str: pchar; with_: pchar; n: dword): TEina_Bool; cdecl; external libeina;


function eina_strbuf_replace_last(buf: PEina_Strbuf; str: pchar; with_: pchar): TEina_Bool; cdecl; external libeina;
function eina_strbuf_replace_all(buf: PEina_Strbuf; str: pchar; with_: pchar): longint; cdecl; external libeina;
procedure eina_strbuf_trim(buf: PEina_Strbuf); cdecl; external libeina;
procedure eina_strbuf_ltrim(buf: PEina_Strbuf); cdecl; external libeina;
procedure eina_strbuf_rtrim(buf: PEina_Strbuf); cdecl; external libeina;
procedure eina_strbuf_tolower(buf: PEina_Strbuf); cdecl; external libeina;
function eina_strbuf_substr_get(buf: PEina_Strbuf; pos: Tsize_t; len: Tsize_t): PEina_Strbuf; cdecl; external libeina;
function eina_strbuf_slice_get(buf: PEina_Strbuf): TEina_Slice; cdecl; external libeina;
function eina_strbuf_rw_slice_get(buf: PEina_Strbuf): TEina_Rw_Slice; cdecl; external libeina;
function eina_strbuf_release(buf: PEina_Strbuf): pchar; cdecl; external libeina;
function eina_strbuf_append_strftime(buf: PEina_Strbuf; fmt: pchar; tm: Ptm): TEina_Bool; cdecl; external libeina;
function eina_strbuf_insert_strftime(buf: PEina_Strbuf; fmt: pchar; tm: Ptm; pos: Tsize_t): TEina_Bool; cdecl; external libeina;

function eina_strbuf_prepend(buf: PEina_Strbuf; str: pchar): TEina_Bool;
function eina_strbuf_prepend_escaped(buf: PEina_Strbuf; str: pchar): TEina_Bool;
function eina_strbuf_prepend_n(buf: PEina_Strbuf; str: pchar; maxlen: Tsize_t): TEina_Bool;
function eina_strbuf_prepend_length(buf: PEina_Strbuf; str: pchar; length: Tsize_t): TEina_Bool;
function eina_strbuf_prepend_char(buf: PEina_Strbuf; c: char): TEina_Bool;
function eina_strbuf_prepend_vprintf(buf: PEina_Strbuf; fmt: pchar; args: Tva_list): TEina_Bool;
function eina_strbuf_replace_first(buf: PEina_Strbuf; str: pchar; with_: pchar): TEina_Bool;
function eina_strbuf_prepend_strftime(buf: PEina_Strbuf; fmt: pchar; tm: Ptm): TEina_Bool;

// === Konventiert am: 16-5-25 17:19:50 ===


implementation



function eina_strbuf_prepend(buf: PEina_Strbuf; str: pchar): TEina_Bool;
begin
  eina_strbuf_prepend := eina_strbuf_insert(buf, str, 0);
end;


function eina_strbuf_prepend_escaped(buf: PEina_Strbuf; str: pchar): TEina_Bool;
begin
  eina_strbuf_prepend_escaped := eina_strbuf_insert_escaped(buf, str, 0);
end;


function eina_strbuf_prepend_n(buf: PEina_Strbuf; str: pchar; maxlen: Tsize_t): TEina_Bool;
begin
  eina_strbuf_prepend_n := eina_strbuf_insert_n(buf, str, maxlen, 0);
end;


function eina_strbuf_prepend_length(buf: PEina_Strbuf; str: pchar; length: Tsize_t): TEina_Bool;
begin
  eina_strbuf_prepend_length := eina_strbuf_insert_length(buf, str, length, 0);
end;


function eina_strbuf_prepend_char(buf: PEina_Strbuf; c: char): TEina_Bool;
begin
  eina_strbuf_prepend_char := eina_strbuf_insert_char(buf, c, 0);
end;


function eina_strbuf_prepend_vprintf(buf: PEina_Strbuf; fmt: pchar; args: Tva_list): TEina_Bool;
begin
  eina_strbuf_prepend_vprintf := eina_strbuf_insert_vprintf(buf, fmt, 0, args);
end;


function eina_strbuf_replace_first(buf: PEina_Strbuf; str: pchar; with_: pchar): TEina_Bool;
begin
  eina_strbuf_replace_first := eina_strbuf_replace(buf, str, with_, 1);
end;


function eina_strbuf_prepend_strftime(buf: PEina_Strbuf; fmt: pchar; tm: Ptm): TEina_Bool;
begin
  eina_strbuf_prepend_strftime := eina_strbuf_insert_strftime(buf, fmt, tm, 0);
end;


end.
