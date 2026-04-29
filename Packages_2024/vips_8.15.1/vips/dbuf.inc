

  {$IFDEF read_struct}
type
  TVipsDbuf = record
    data: pbyte;
    allocated_size: Tsize_t;
    data_size: Tsize_t;
    write_point: Tsize_t;
  end;
  PVipsDbuf = ^TVipsDbuf;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure vips_dbuf_init(dbuf: PVipsDbuf); cdecl; external libvips;
function vips_dbuf_minimum_size(dbuf: PVipsDbuf; size: Tsize_t): Tgboolean; cdecl; external libvips;
function vips_dbuf_allocate(dbuf: PVipsDbuf; size: Tsize_t): Tgboolean; cdecl; external libvips;
function vips_dbuf_read(dbuf: PVipsDbuf; data: pbyte; size: Tsize_t): Tsize_t; cdecl; external libvips;
function vips_dbuf_get_write(dbuf: PVipsDbuf; size: Psize_t): pbyte; cdecl; external libvips;
function vips_dbuf_write(dbuf: PVipsDbuf; data: pbyte; size: Tsize_t): Tgboolean; cdecl; external libvips;
function vips_dbuf_writef(dbuf: PVipsDbuf; fmt: pchar; args: array of const): Tgboolean; cdecl; external libvips;
function vips_dbuf_writef(dbuf: PVipsDbuf; fmt: pchar): Tgboolean; cdecl; external libvips;
function vips_dbuf_write_amp(dbuf: PVipsDbuf; str: pchar): Tgboolean; cdecl; external libvips;
procedure vips_dbuf_reset(dbuf: PVipsDbuf); cdecl; external libvips;
procedure vips_dbuf_destroy(dbuf: PVipsDbuf); cdecl; external libvips;
function vips_dbuf_seek(dbuf: PVipsDbuf; offset: Toff_t; whence: longint): Tgboolean; cdecl; external libvips;
procedure vips_dbuf_truncate(dbuf: PVipsDbuf); cdecl; external libvips;
function vips_dbuf_tell(dbuf: PVipsDbuf): Toff_t; cdecl; external libvips;
function vips_dbuf_string(dbuf: PVipsDbuf; size: Psize_t): pbyte; cdecl; external libvips;
function vips_dbuf_steal(dbuf: PVipsDbuf; size: Psize_t): pbyte; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:14:38 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
