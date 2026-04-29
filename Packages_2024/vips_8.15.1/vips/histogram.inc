

{$IFDEF read_function}
function vips_maplut(in_: PVipsImage; out_: PPVipsImage; lut: PVipsImage): longint; varargs; cdecl; external libvips;
function vips_percent(in_: PVipsImage; percent: double; threshold: Plongint): longint; varargs; cdecl; external libvips;
function vips_stdif(in_: PVipsImage; out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_hist_cum(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hist_norm(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hist_equal(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hist_plot(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hist_match(in_: PVipsImage; ref: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_hist_local(in_: PVipsImage; out_: PPVipsImage; width: longint; height: longint): longint; varargs; cdecl; external libvips;
function vips_hist_ismonotonic(in_: PVipsImage; out_: Pgboolean): longint; varargs; cdecl; external libvips;
function vips_hist_entropy(in_: PVipsImage; out_: Pdouble): longint; varargs; cdecl; external libvips;
function vips_case(index: PVipsImage; cases: PPVipsImage; out_: PPVipsImage; n: longint): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:13:07 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
