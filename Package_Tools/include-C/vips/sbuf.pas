unit sbuf;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, object_, connection;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  VIPS_SBUF_BUFFER_SIZE = 4096;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsSbuf = record
    parent_object: TVipsObject;
    source: PVipsSource;
    input_buffer: array[0..(VIPS_SBUF_BUFFER_SIZE + 1) - 1] of byte;
    chars_in_buffer: longint;
    read_point: longint;
    line: array[0..(VIPS_SBUF_BUFFER_SIZE + 1) - 1] of byte;
  end;
  PVipsSbuf = ^TVipsSbuf;

  TVipsSbufClass = record
    parent_class: TVipsObjectClass;
  end;
  PVipsSbufClass = ^TVipsSbufClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_sbuf_get_type: TGType; cdecl; external libvips;
function vips_sbuf_new_from_source(source: PVipsSource): PVipsSbuf; cdecl; external libvips;
procedure vips_sbuf_unbuffer(sbuf: PVipsSbuf); cdecl; external libvips;
function vips_sbuf_getc(sbuf: PVipsSbuf): longint; cdecl; external libvips;
procedure vips_sbuf_ungetc(sbuf: PVipsSbuf); cdecl; external libvips;
function vips_sbuf_require(sbuf: PVipsSbuf; require: longint): longint; cdecl; external libvips;
function vips_sbuf_get_line(sbuf: PVipsSbuf): pchar; cdecl; external libvips;
function vips_sbuf_get_line_copy(sbuf: PVipsSbuf): pchar; cdecl; external libvips;
function vips_sbuf_get_non_whitespace(sbuf: PVipsSbuf): pchar; cdecl; external libvips;
function vips_sbuf_skip_whitespace(sbuf: PVipsSbuf): longint; cdecl; external libvips;

// === Konventiert am: 26-4-26 16:10:18 ===

function VIPS_TYPE_SBUF: TGType;
function VIPS_SBUF(obj: Pointer): PVipsSbuf;
function VIPS_SBUF_CLASS(klass: Pointer): PVipsSbufClass;
function VIPS_IS_SBUF(obj: Pointer): Tgboolean;
function VIPS_IS_SBUF_CLASS(klass: Pointer): Tgboolean;
function VIPS_SBUF_GET_CLASS(obj: Pointer): PVipsSbufClass;
{$ENDIF read_function}

implementation

function VIPS_TYPE_SBUF: TGType;
begin
  VIPS_TYPE_SBUF := vips_sbuf_get_type;
end;

function VIPS_SBUF(obj: Pointer): PVipsSbuf;
begin
  Result := PVipsSbuf(g_type_check_instance_cast(obj, VIPS_TYPE_SBUF));
end;

function VIPS_SBUF_CLASS(klass: Pointer): PVipsSbufClass;
begin
  Result := PVipsSbufClass(g_type_check_class_cast(klass, VIPS_TYPE_SBUF));
end;

function VIPS_IS_SBUF(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_SBUF);
end;

function VIPS_IS_SBUF_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_SBUF);
end;

function VIPS_SBUF_GET_CLASS(obj: Pointer): PVipsSbufClass;
begin
  Result := PVipsSbufClass(PGTypeInstance(obj)^.g_class);
end;



end.
