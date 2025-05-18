unit eina_binbuf;

interface

uses
  ctypes, efl, eina_types, eina_strbuf, eina_slice;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Binbuf = TEina_Strbuf;
  PEina_Binbuf = ^TEina_Binbuf;

function eina_binbuf_new: PEina_Binbuf; cdecl; external libeina;
function eina_binbuf_manage_new(str: pbyte; length: Tsize_t; ro: TEina_Bool): PEina_Binbuf; cdecl; external libeina;
function eina_binbuf_manage_new_length(str: pbyte; length: Tsize_t): PEina_Binbuf; cdecl; external libeina; deprecated;
function eina_binbuf_manage_read_only_new_length(str: pbyte; length: Tsize_t): PEina_Binbuf; cdecl; external libeina; deprecated;
procedure eina_binbuf_free(buf: PEina_Binbuf); cdecl; external libeina;
procedure eina_binbuf_reset(buf: PEina_Binbuf); cdecl; external libeina;
function eina_binbuf_expand(buf: PEina_Binbuf; minimum_unused_space: Tsize_t): TEina_Rw_Slice; cdecl; external libeina;
function eina_binbuf_use(buf: PEina_Binbuf; extra_bytes: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_binbuf_append_length(buf: PEina_Binbuf; str: pbyte; length: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_binbuf_append_slice(buf: PEina_Binbuf; slice: TEina_Slice): TEina_Bool; cdecl; external libeina;
function eina_binbuf_append_buffer(buf: PEina_Binbuf; data: PEina_Binbuf): TEina_Bool; cdecl; external libeina;
function eina_binbuf_append_char(buf: PEina_Binbuf; c: byte): TEina_Bool; cdecl; external libeina;
function eina_binbuf_insert_length(buf: PEina_Binbuf; str: pbyte; length: Tsize_t; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_binbuf_insert_slice(buf: PEina_Binbuf; slice: TEina_Slice; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_binbuf_insert_char(buf: PEina_Binbuf; c: byte; pos: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_binbuf_remove(buf: PEina_Binbuf; start: Tsize_t; end_: Tsize_t): TEina_Bool; cdecl; external libeina;
function eina_binbuf_string_get(buf: PEina_Binbuf): pbyte; cdecl; external libeina;
function eina_binbuf_string_steal(buf: PEina_Binbuf): pbyte; cdecl; external libeina;
procedure eina_binbuf_string_free(buf: PEina_Binbuf); cdecl; external libeina;
function eina_binbuf_length_get(buf: PEina_Binbuf): Tsize_t; cdecl; external libeina;
function eina_binbuf_slice_get(buf: PEina_Binbuf): TEina_Slice; cdecl; external libeina;
function eina_binbuf_rw_slice_get(buf: PEina_Binbuf): TEina_Rw_Slice; cdecl; external libeina;
function eina_binbuf_release(buf: PEina_Binbuf): pbyte; cdecl; external libeina;

// === Konventiert am: 16-5-25 19:49:08 ===


implementation



end.
