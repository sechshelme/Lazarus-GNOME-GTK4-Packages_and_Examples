unit type_;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, basic;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TVipsThing = record
    i: longint;
  end;
  PVipsThing = ^TVipsThing;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_thing_get_type: TGType; cdecl; external libvips;
function vips_thing_new(i: longint): PVipsThing; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsArea = record
    data: pointer;
    length: Tsize_t;
    n: longint;
    count: longint;
    lock: PGMutex;
    free_fn: TVipsCallbackFn;
    client: pointer;
    _type: TGType;
    sizeof_type: Tsize_t;
  end;
  PVipsArea = ^TVipsArea;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_area_copy(area: PVipsArea): PVipsArea; cdecl; external libvips;
function vips_area_free_cb(mem: pointer; area: PVipsArea): longint; cdecl; external libvips;
procedure vips_area_unref(area: PVipsArea); cdecl; external libvips;
function vips_area_new(free_fn: TVipsCallbackFn; data: pointer): PVipsArea; cdecl; external libvips;
function vips_area_new_array(_type: TGType; sizeof_type: Tsize_t; n: longint): PVipsArea; cdecl; external libvips;
function vips_area_new_array_object(n: longint): PVipsArea; cdecl; external libvips;
function vips_area_get_data(area: PVipsArea; length: Psize_t; n: Plongint; _type: PGType; sizeof_type: Psize_t): pointer; cdecl; external libvips;

function vips_area_get_type: TGType; cdecl; external libvips;

function vips_save_string_get_type: TGType; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsSaveString = record
    s: pchar;
  end;
  PVipsSaveString = ^TVipsSaveString;

type
  TVipsRefString = record
    area: TVipsArea;
  end;
  PVipsRefString = ^TVipsRefString;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_ref_string_new(str: pchar): PVipsRefString; cdecl; external libvips;
function vips_ref_string_get(refstr: PVipsRefString; length: Psize_t): pchar; cdecl; external libvips;
function vips_ref_string_get_type: TGType; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsBlob = record
    area: TVipsArea;
  end;
  PVipsBlob = ^TVipsBlob;
  PPVipsBlob = ^PVipsBlob;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_blob_new(free_fn: TVipsCallbackFn; data: pointer; length: Tsize_t): PVipsBlob; cdecl; external libvips;
function vips_blob_copy(data: pointer; length: Tsize_t): PVipsBlob; cdecl; external libvips;
function vips_blob_get(blob: PVipsBlob; length: Psize_t): pointer; cdecl; external libvips;
procedure vips_blob_set(blob: PVipsBlob; free_fn: TVipsCallbackFn; data: pointer; length: Tsize_t); cdecl; external libvips;
function vips_blob_get_type: TGType; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsArrayDouble = record
    area: TVipsArea;
  end;
  PVipsArrayDouble = ^TVipsArrayDouble;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_array_double_new(arr: Pdouble; n: longint): PVipsArrayDouble; cdecl; external libvips;
function vips_array_double_newv(n: longint): PVipsArrayDouble; varargs; cdecl; external libvips;
function vips_array_double_get(arr: PVipsArrayDouble; n: Plongint): Pdouble; cdecl; external libvips;
function vips_array_double_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_ARRAY_INT: longint;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsArrayInt = record
    area: TVipsArea;
  end;
  PVipsArrayInt = ^TVipsArrayInt;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_array_int_new(arr: Plongint; n: longint): PVipsArrayInt; cdecl; external libvips;
function vips_array_int_newv(n: longint): PVipsArrayInt; varargs; cdecl; external libvips;
function vips_array_int_get(arr: PVipsArrayInt; n: Plongint): Plongint; cdecl; external libvips;
function vips_array_int_get_type: TGType; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsArrayImage = record
    area: TVipsArea;
  end;
  PVipsArrayImage = ^TVipsArrayImage;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_array_image_get_type: TGType; cdecl; external libvips;
procedure vips_value_set_area(value: PGValue; free_fn: TVipsCallbackFn; data: pointer); cdecl; external libvips;
function vips_value_get_area(value: PGValue; length: Psize_t): pointer; cdecl; external libvips;
function vips_value_get_save_string(value: PGValue): pchar; cdecl; external libvips;
procedure vips_value_set_save_string(value: PGValue; str: pchar); cdecl; external libvips;
procedure vips_value_set_save_stringf(value: PGValue; fmt: pchar); varargs; cdecl; external libvips;
function vips_value_get_ref_string(value: PGValue; length: Psize_t): pchar; cdecl; external libvips;
procedure vips_value_set_ref_string(value: PGValue; str: pchar); cdecl; external libvips;
function vips_value_get_blob(value: PGValue; length: Psize_t): pointer; cdecl; external libvips;
procedure vips_value_set_blob(value: PGValue; free_fn: TVipsCallbackFn; data: pointer; length: Tsize_t); cdecl; external libvips;
procedure vips_value_set_blob_free(value: PGValue; data: pointer; length: Tsize_t); cdecl; external libvips;
procedure vips_value_set_array(value: PGValue; n: longint; _type: TGType; sizeof_type: Tsize_t); cdecl; external libvips;
function vips_value_get_array(value: PGValue; n: Plongint; _type: PGType; sizeof_type: Psize_t): pointer; cdecl; external libvips;
function vips_value_get_array_double(value: PGValue; n: Plongint): Pdouble; cdecl; external libvips;
procedure vips_value_set_array_double(value: PGValue; arr: Pdouble; n: longint); cdecl; external libvips;
function vips_value_get_array_int(value: PGValue; n: Plongint): Plongint; cdecl; external libvips;
procedure vips_value_set_array_int(value: PGValue; arr: Plongint; n: longint); cdecl; external libvips;
function vips_value_get_array_object(value: PGValue; n: Plongint): PPGObject; cdecl; external libvips;
procedure vips_value_set_array_object(value: PGValue; n: longint); cdecl; external libvips;

// === Konventiert am: 26-4-26 16:09:18 ===

function VIPS_TYPE_THING: longint;

function VIPS_TYPE_AREA: TGType;
function VIPS_AREA(X: Pointer): PVipsArea;

function VIPS_TYPE_SAVE_STRING: TGType;
function VIPS_TYPE_REF_STRING: TGType;
function VIPS_TYPE_BLOB: TGType;
function VIPS_TYPE_ARRAY_DOUBLE: TGType;
function VIPS_TYPE_ARRAY_IMAGE: TGType;
{$ENDIF read_function}


implementation

function VIPS_TYPE_THING: longint;
begin
  VIPS_TYPE_THING := vips_thing_get_type;
end;

function VIPS_TYPE_AREA: TGType;
begin
  VIPS_TYPE_AREA := vips_area_get_type;
end;

function VIPS_AREA(X: Pointer): PVipsArea;
begin
  VIPS_AREA := PVipsArea(X);
end;

function VIPS_TYPE_SAVE_STRING: TGType;
begin
  VIPS_TYPE_SAVE_STRING := vips_save_string_get_type;
end;

function VIPS_TYPE_REF_STRING: TGType;
begin
  VIPS_TYPE_REF_STRING := vips_ref_string_get_type;
end;

function VIPS_TYPE_BLOB: TGType;
begin
  VIPS_TYPE_BLOB := vips_blob_get_type;
end;

function VIPS_TYPE_ARRAY_DOUBLE: TGType;
begin
  VIPS_TYPE_ARRAY_DOUBLE := vips_array_double_get_type;
end;

function VIPS_TYPE_ARRAY_INT: longint;
begin
  VIPS_TYPE_ARRAY_INT := vips_array_int_get_type;
end;

function VIPS_TYPE_ARRAY_IMAGE: TGType;
begin
  VIPS_TYPE_ARRAY_IMAGE := vips_array_image_get_type;
end;


end.
