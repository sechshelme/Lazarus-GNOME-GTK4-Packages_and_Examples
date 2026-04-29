
  {$IFDEF read_struct}
type
  TVipsBuf = record
    base: pchar;
    mx: longint;
    i: longint;
    full: Tgboolean;
    lasti: longint;
    dynamic: Tgboolean;
  end;
  PVipsBuf = ^TVipsBuf;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure vips_buf_rewind(buf: PVipsBuf); cdecl; external libvips;
procedure vips_buf_destroy(buf: PVipsBuf); cdecl; external libvips;
procedure vips_buf_init(buf: PVipsBuf); cdecl; external libvips;
procedure vips_buf_set_static(buf: PVipsBuf; base: pchar; mx: longint); cdecl; external libvips;
procedure vips_buf_set_dynamic(buf: PVipsBuf; mx: longint); cdecl; external libvips;
procedure vips_buf_init_static(buf: PVipsBuf; base: pchar; mx: longint); cdecl; external libvips;
procedure vips_buf_init_dynamic(buf: PVipsBuf; mx: longint); cdecl; external libvips;
function vips_buf_appendns(buf: PVipsBuf; str: pchar; sz: longint): Tgboolean; cdecl; external libvips;
function vips_buf_appends(buf: PVipsBuf; str: pchar): Tgboolean; cdecl; external libvips;
function vips_buf_appendf(buf: PVipsBuf; fmt: pchar; args: array of const): Tgboolean; cdecl; external libvips;
function vips_buf_appendf(buf: PVipsBuf; fmt: pchar): Tgboolean; cdecl; external libvips;
function vips_buf_vappendf(buf: PVipsBuf; fmt: pchar; ap: Tva_list): Tgboolean; cdecl; external libvips;
function vips_buf_appendc(buf: PVipsBuf; ch: char): Tgboolean; cdecl; external libvips;
function vips_buf_appendsc(buf: PVipsBuf; quote: Tgboolean; str: pchar): Tgboolean; cdecl; external libvips;
function vips_buf_appendgv(buf: PVipsBuf; value: PGValue): Tgboolean; cdecl; external libvips;
function vips_buf_append_size(buf: PVipsBuf; n: Tsize_t): Tgboolean; cdecl; external libvips;
function vips_buf_removec(buf: PVipsBuf; ch: char): Tgboolean; cdecl; external libvips;
function vips_buf_change(buf: PVipsBuf; o: pchar; n: pchar): Tgboolean; cdecl; external libvips;
function vips_buf_is_empty(buf: PVipsBuf): Tgboolean; cdecl; external libvips;
function vips_buf_is_full(buf: PVipsBuf): Tgboolean; cdecl; external libvips;
function vips_buf_all(buf: PVipsBuf): pchar; cdecl; external libvips;
function vips_buf_firstline(buf: PVipsBuf): pchar; cdecl; external libvips;
function vips_buf_appendg(buf: PVipsBuf; g: double): Tgboolean; cdecl; external libvips;
function vips_buf_appendd(buf: PVipsBuf; d: longint): Tgboolean; cdecl; external libvips;
function vips_buf_len(buf: PVipsBuf): longint; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:15:17 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
