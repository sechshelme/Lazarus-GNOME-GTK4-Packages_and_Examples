

  {$IFDEF read_enum}
type
  PVipsFormatFlags = ^TVipsFormatFlags;
  TVipsFormatFlags = longint;

const
  VIPS_FORMAT_NONE = 0;
  VIPS_FORMAT_PARTIAL = 1;
  VIPS_FORMAT_BIGENDIAN = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsFormat = record
    parent_object: TVipsObject;
  end;
  PVipsFormat = ^TVipsFormat;

  TVipsFormatClass = record
    parent_class: TVipsObjectClass;
    is_a: function(para1: pchar): Tgboolean; cdecl;
    header: function(para1: pchar; para2: PVipsImage): longint; cdecl;
    load: function(para1: pchar; para2: PVipsImage): longint; cdecl;
    save: function(para1: PVipsImage; para2: pchar): longint; cdecl;
    get_flags: function(para1: pchar): TVipsFormatFlags; cdecl;
    priority: longint;
    suffs: ^pchar;
  end;
  PVipsFormatClass = ^TVipsFormatClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_format_get_type: TGType; cdecl; external libvips;
function vips_format_map(fn: TVipsSListMap2Fn; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_format_for_file(filename: pchar): PVipsFormatClass; cdecl; external libvips;
function vips_format_for_name(filename: pchar): PVipsFormatClass; cdecl; external libvips;
function vips_format_get_flags(format: PVipsFormatClass; filename: pchar): TVipsFormatFlags; cdecl; external libvips;
function vips_format_read(filename: pchar; out_: PVipsImage): longint; cdecl; external libvips;
function vips_format_write(in_: PVipsImage; filename: pchar): longint; cdecl; external libvips;

// === Konventiert am: 26-4-26 16:13:33 ===

function VIPS_TYPE_FORMAT: TGType;
function VIPS_FORMAT(obj: Pointer): PVipsFormat;
function VIPS_FORMAT_CLASS(klass: Pointer): PVipsFormatClass;
function VIPS_IS_FORMAT(obj: Pointer): Tgboolean;
function VIPS_IS_FORMAT_CLASS(klass: Pointer): Tgboolean;
function VIPS_FORMAT_GET_CLASS(obj: Pointer): PVipsFormatClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function VIPS_TYPE_FORMAT: TGType;
begin
  VIPS_TYPE_FORMAT := vips_format_get_type;
end;

function VIPS_FORMAT(obj: Pointer): PVipsFormat;
begin
  Result := PVipsFormat(g_type_check_instance_cast(obj, VIPS_TYPE_FORMAT));
end;

function VIPS_FORMAT_CLASS(klass: Pointer): PVipsFormatClass;
begin
  Result := PVipsFormatClass(g_type_check_class_cast(klass, VIPS_TYPE_FORMAT));
end;

function VIPS_IS_FORMAT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_FORMAT);
end;

function VIPS_IS_FORMAT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_FORMAT);
end;

function VIPS_FORMAT_GET_CLASS(obj: Pointer): PVipsFormatClass;
begin
  Result := PVipsFormatClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
