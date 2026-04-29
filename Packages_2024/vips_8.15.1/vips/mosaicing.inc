

{$IFDEF read_function}
function vips_merge(ref: PVipsImage; sec: PVipsImage; out_: PPVipsImage; direction: TVipsDirection; dx: longint; dy: longint): longint; varargs; cdecl; external libvips;
function vips_mosaic(ref: PVipsImage; sec: PVipsImage; out_: PPVipsImage; direction: TVipsDirection; xref: longint; yref: longint; xsec: longint; ysec: longint): longint; varargs; cdecl; external libvips;
function vips_mosaic1(ref: PVipsImage; sec: PVipsImage; out_: PPVipsImage; direction: TVipsDirection; xr1: longint; yr1: longint; xs1: longint; ys1: longint; xr2: longint; yr2: longint; xs2: longint; ys2: longint): longint; varargs; cdecl; external libvips;
function vips_match(ref: PVipsImage; sec: PVipsImage; out_: PPVipsImage; xr1: longint; yr1: longint; xs1: longint; ys1: longint; xr2: longint; yr2: longint; xs2: longint; ys2: longint): longint; varargs; cdecl; external libvips;
function vips_globalbalance(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_remosaic(in_: PVipsImage; out_: PPVipsImage; old_str: pchar; new_str: pchar): longint; varargs; cdecl; external libvips;
function vips_matrixinvert(m: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:12:00 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
