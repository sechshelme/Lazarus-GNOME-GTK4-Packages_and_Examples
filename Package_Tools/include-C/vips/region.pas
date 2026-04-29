unit region;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, rect, object_, basic, image,  private;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PVipsRegionShrink = ^TVipsRegionShrink;
  TVipsRegionShrink = longint;

const
  VIPS_REGION_SHRINK_MEAN = 0;
  VIPS_REGION_SHRINK_MEDIAN = 1;
  VIPS_REGION_SHRINK_MODE = 2;
  VIPS_REGION_SHRINK_MAX = 3;
  VIPS_REGION_SHRINK_MIN = 4;
  VIPS_REGION_SHRINK_NEAREST = 5;
  VIPS_REGION_SHRINK_LAST = 6;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TVipsRegion = record
    parent_object: TVipsObject;
    im: PVipsImage;
    valid: TVipsRect;
    _type: TRegionType;
    data: PVipsPel;
    bpl: longint;
    seq: pointer;
    thread: PGThread;
    window: PVipsWindow;
    buffer: PVipsBuffer;
    invalid: Tgboolean;
  end;
  PVipsRegion = ^TVipsRegion;

  TVipsRegionClass = record
    parent_class: TVipsObjectClass;
  end;
  PVipsRegionClass = ^TVipsRegionClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_region_get_type: TGType; cdecl; external libvips;
function vips_region_new(image: PVipsImage): PVipsRegion; cdecl; external libvips;
function vips_region_buffer(reg: PVipsRegion; r: PVipsRect): longint; cdecl; external libvips;
function vips_region_image(reg: PVipsRegion; r: PVipsRect): longint; cdecl; external libvips;
function vips_region_region(reg: PVipsRegion; dest: PVipsRegion; r: PVipsRect; x: longint; y: longint): longint; cdecl; external libvips;
function vips_region_equalsregion(reg1: PVipsRegion; reg2: PVipsRegion): longint; cdecl; external libvips;
function vips_region_position(reg: PVipsRegion; x: longint; y: longint): longint; cdecl; external libvips;
procedure vips_region_paint(reg: PVipsRegion; r: PVipsRect; value: longint); cdecl; external libvips;
procedure vips_region_paint_pel(reg: PVipsRegion; r: PVipsRect; ink: PVipsPel); cdecl; external libvips;
procedure vips_region_black(reg: PVipsRegion); cdecl; external libvips;
procedure vips_region_copy(reg: PVipsRegion; dest: PVipsRegion; r: PVipsRect; x: longint; y: longint); cdecl; external libvips;
function vips_region_shrink_method(from: PVipsRegion; to_: PVipsRegion; target: PVipsRect; method: TVipsRegionShrink): longint; cdecl; external libvips;
function vips_region_shrink(from: PVipsRegion; to_: PVipsRegion; target: PVipsRect): longint; cdecl; external libvips;
function vips_region_prepare(reg: PVipsRegion; r: PVipsRect): longint; cdecl; external libvips;
function vips_region_prepare_to(reg: PVipsRegion; dest: PVipsRegion; r: PVipsRect; x: longint; y: longint): longint; cdecl; external libvips;
function vips_region_fetch(region: PVipsRegion; left: longint; top: longint; width: longint; height: longint; len: Psize_t): PVipsPel; cdecl; external libvips;
function vips_region_width(region: PVipsRegion): longint; cdecl; external libvips;
function vips_region_height(region: PVipsRegion): longint; cdecl; external libvips;
procedure vips_region_invalidate(reg: PVipsRegion); cdecl; external libvips;

// === Konventiert am: 26-4-26 16:10:41 ===

function VIPS_TYPE_REGION: TGType;
function VIPS_REGION(obj: Pointer): PVipsRegion;
function VIPS_REGION_CLASS(klass: Pointer): PVipsRegionClass;
function VIPS_IS_REGION(obj: Pointer): Tgboolean;
function VIPS_IS_REGION_CLASS(klass: Pointer): Tgboolean;
function VIPS_REGION_GET_CLASS(obj: Pointer): PVipsRegionClass;
{$ENDIF read_function}

implementation

function VIPS_TYPE_REGION: TGType;
begin
  VIPS_TYPE_REGION := vips_region_get_type;
end;

function VIPS_REGION(obj: Pointer): PVipsRegion;
begin
  Result := PVipsRegion(g_type_check_instance_cast(obj, VIPS_TYPE_REGION));
end;

function VIPS_REGION_CLASS(klass: Pointer): PVipsRegionClass;
begin
  Result := PVipsRegionClass(g_type_check_class_cast(klass, VIPS_TYPE_REGION));
end;

function VIPS_IS_REGION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VIPS_TYPE_REGION);
end;

function VIPS_IS_REGION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VIPS_TYPE_REGION);
end;

function VIPS_REGION_GET_CLASS(obj: Pointer): PVipsRegionClass;
begin
  Result := PVipsRegionClass(PGTypeInstance(obj)^.g_class);
end;



end.
