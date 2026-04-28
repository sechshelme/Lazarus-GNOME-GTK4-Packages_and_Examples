unit transform;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, rect, fp_vips;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TVipsTransformation = record
    iarea: TVipsRect;
    oarea: TVipsRect;
    a: double;
    b: double;
    c: double;
    d: double;
    idx: double;
    idy: double;
    odx: double;
    ody: double;
    ia: double;
    ib: double;
    ic: double;
    id: double;
  end;
  PVipsTransformation = ^TVipsTransformation;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure vips__transform_init(trn: PVipsTransformation); cdecl; external libvips;
function vips__transform_calc_inverse(trn: PVipsTransformation): longint; cdecl; external libvips;
function vips__transform_isidentity(trn: PVipsTransformation): longint; cdecl; external libvips;
function vips__transform_add(in1: PVipsTransformation; in2: PVipsTransformation; out_: PVipsTransformation): longint; cdecl; external libvips;
procedure vips__transform_print(trn: PVipsTransformation); cdecl; external libvips;
procedure vips__transform_forward_point(trn: PVipsTransformation; x: double; y: double; ox: Pdouble; oy: Pdouble); cdecl; external libvips;
procedure vips__transform_invert_point(trn: PVipsTransformation; x: double; y: double; ox: Pdouble; oy: Pdouble); cdecl; external libvips;
procedure vips__transform_forward_rect(trn: PVipsTransformation; in_: PVipsRect; out_: PVipsRect); cdecl; external libvips;
procedure vips__transform_invert_rect(trn: PVipsTransformation; in_: PVipsRect; out_: PVipsRect); cdecl; external libvips;
procedure vips__transform_set_area(para1: PVipsTransformation); cdecl; external libvips;
function vips__affine(in_: PVipsImage; out_: PVipsImage; trn: PVipsTransformation): longint; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:09:23 ===


implementation



end.
