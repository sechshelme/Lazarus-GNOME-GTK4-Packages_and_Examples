

{$IFDEF read_function}
function vips_fwfft(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_invfft(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_freqmult(in_: PVipsImage; mask: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_spectrum(in_: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
function vips_phasecor(in1: PVipsImage; in2: PVipsImage; out_: PPVipsImage): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:13:25 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
