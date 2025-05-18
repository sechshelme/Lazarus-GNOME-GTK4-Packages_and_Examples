{$IFDEF read_interface}

type
  TEina_UStrbuf = TEina_Strbuf;
  PEina_UStrbuf = ^TEina_UStrbuf;

function eina_ustrbuf_new: PEina_UStrbuf; cdecl; external libeina;
function eina_ustrbuf_manage_new(str: PEina_Unicode): PEina_UStrbuf; cdecl; external libeina;
function eina_ustrbuf_manage_new_length(str: PEina_Unicode; length: Tsize_t): PEina_UStrbuf; cdecl; external libeina;
procedure eina_ustrbuf_free(buf: PEina_UStrbuf); cdecl; external libeina;
procedure eina_ustrbuf_reset(buf: PEina_UStrbuf); cdecl; external libeina;
function eina_ustrbuf_append(buf: PEina_UStrbuf; str: PEina_Unicode): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_append_escaped(buf: PEina_UStrbuf; str: PEina_Unicode): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_append_n(buf: PEina_UStrbuf; str: PEina_Unicode; maxlen: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_append_length(buf: PEina_UStrbuf; str: PEina_Unicode; length: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_append_slice(buf: PEina_UStrbuf; slice: TEina_Slice): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_append_char(buf: PEina_UStrbuf; c: TEina_Unicode): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_insert(buf: PEina_UStrbuf; str: PEina_Unicode; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_insert_escaped(buf: PEina_UStrbuf; str: PEina_Unicode; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_insert_n(buf: PEina_UStrbuf; str: PEina_Unicode; maxlen: Tsize_t; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_insert_length(buf: PEina_UStrbuf; str: PEina_Unicode; length: Tsize_t; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_insert_slice(buf: PEina_UStrbuf; slice: TEina_Slice; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_insert_char(buf: PEina_UStrbuf; c: TEina_Unicode; pos: Tsize_t): TEina_Bool; cdecl; external libeina;

function eina_ustrbuf_remove(buf: PEina_UStrbuf; start: Tsize_t; end_: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_ustrbuf_string_get(buf: PEina_UStrbuf): PEina_Unicode; cdecl; external libeina;
function eina_ustrbuf_string_steal(buf: PEina_UStrbuf): PEina_Unicode; cdecl; external libeina;
procedure eina_ustrbuf_string_free(buf: PEina_UStrbuf); cdecl; external libeina;
function eina_ustrbuf_length_get(buf: PEina_UStrbuf): Tsize_t; cdecl; external libeina;
function eina_ustrbuf_slice_get(buf: PEina_UStrbuf): TEina_Slice; cdecl; external libeina;
function eina_ustrbuf_rw_slice_get(buf: PEina_UStrbuf): TEina_Rw_Slice; cdecl; external libeina;
function eina_ustrbuf_release(buf: PEina_UStrbuf): PEina_Unicode; cdecl; external libeina;

function eina_ustrbuf_prepend(buf: PEina_UStrbuf; str: PEina_Unicode): TEina_Bool;
function eina_ustrbuf_prepend_escaped(buf: PEina_UStrbuf; str: PEina_Unicode): TEina_Bool;
function eina_ustrbuf_prepend_n(buf: PEina_UStrbuf; str: PEina_Unicode; maxlen: Tsize_t): TEina_Bool;
function eina_ustrbuf_prepend_length(buf: PEina_UStrbuf; str: PEina_Unicode; length: Tsize_t): TEina_Bool;
function eina_ustrbuf_prepend_char(buf: PEina_UStrbuf; c: TEina_Unicode): TEina_Bool;

// === Konventiert am: 16-5-25 17:19:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function eina_ustrbuf_prepend(buf: PEina_UStrbuf; str: PEina_Unicode
  ): TEina_Bool;
begin
  eina_ustrbuf_prepend := eina_ustrbuf_insert(buf, str, 0);
end;

function eina_ustrbuf_prepend_escaped(buf: PEina_UStrbuf; str: PEina_Unicode
  ): TEina_Bool;
begin
  eina_ustrbuf_prepend_escaped := eina_ustrbuf_insert_escaped(buf, str, 0);
end;

function eina_ustrbuf_prepend_n(buf: PEina_UStrbuf; str: PEina_Unicode;
  maxlen: Tsize_t): TEina_Bool;
begin
  eina_ustrbuf_prepend_n := eina_ustrbuf_insert_n(buf, str, maxlen, 0);
end;

function eina_ustrbuf_prepend_length(buf: PEina_UStrbuf; str: PEina_Unicode;
  length: Tsize_t): TEina_Bool;
begin
  eina_ustrbuf_prepend_length := eina_ustrbuf_insert_length(buf, str, length, 0);
end;

function eina_ustrbuf_prepend_char(buf: PEina_UStrbuf; c: TEina_Unicode
  ): TEina_Bool;
begin
  eina_ustrbuf_prepend_char := eina_ustrbuf_insert_char(buf, c, 0);
end;


{$ENDIF read_implementation}
