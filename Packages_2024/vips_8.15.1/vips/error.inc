

{$IFDEF read_function}
function vips_error_buffer: pchar; cdecl; external libvips;
function vips_error_buffer_copy: pchar; cdecl; external libvips;
procedure vips_error_clear; cdecl; external libvips;
procedure vips_error_freeze; cdecl; external libvips;
procedure vips_error_thaw; cdecl; external libvips;
procedure vips_error(domain: pchar; fmt: pchar; args: array of const); cdecl; external libvips;
procedure vips_error(domain: pchar; fmt: pchar); cdecl; external libvips;
procedure vips_verror(domain: pchar; fmt: pchar; ap: Tva_list); cdecl; external libvips;
procedure vips_error_system(err: longint; domain: pchar; fmt: pchar; args: array of const); cdecl; external libvips;
procedure vips_error_system(err: longint; domain: pchar; fmt: pchar); cdecl; external libvips;
procedure vips_verror_system(err: longint; domain: pchar; fmt: pchar; ap: Tva_list); cdecl; external libvips;
procedure vips_error_g(error: PPGError); cdecl; external libvips;
procedure vips_g_error(error: PPGError); cdecl; external libvips;
procedure vips_error_exit(fmt: pchar; args: array of const); cdecl; external libvips;
procedure vips_error_exit(fmt: pchar); cdecl; external libvips;
function vips_check_uncoded(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_coding(domain: pchar; im: PVipsImage; coding: TVipsCoding): longint; cdecl; external libvips;
function vips_check_coding_known(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_coding_noneorlabq(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_coding_same(domain: pchar; im1: PVipsImage; im2: PVipsImage): longint; cdecl; external libvips;
function vips_check_mono(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_bands(domain: pchar; im: PVipsImage; bands: longint): longint; cdecl; external libvips;
function vips_check_bands_1or3(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_bands_atleast(domain: pchar; im: PVipsImage; bands: longint): longint; cdecl; external libvips;
function vips_check_bands_1orn(domain: pchar; im1: PVipsImage; im2: PVipsImage): longint; cdecl; external libvips;
function vips_check_bands_1orn_unary(domain: pchar; im: PVipsImage; n: longint): longint; cdecl; external libvips;
function vips_check_bands_same(domain: pchar; im1: PVipsImage; im2: PVipsImage): longint; cdecl; external libvips;
function vips_check_bandno(domain: pchar; im: PVipsImage; bandno: longint): longint; cdecl; external libvips;
function vips_check_int(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_uint(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_uintorf(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_noncomplex(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_complex(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_twocomponents(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_format(domain: pchar; im: PVipsImage; fmt: TVipsBandFormat): longint; cdecl; external libvips;
function vips_check_u8or16(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_8or16(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_u8or16orf(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_format_same(domain: pchar; im1: PVipsImage; im2: PVipsImage): longint; cdecl; external libvips;
function vips_check_size_same(domain: pchar; im1: PVipsImage; im2: PVipsImage): longint; cdecl; external libvips;
function vips_check_oddsquare(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_vector_length(domain: pchar; n: longint; len: longint): longint; cdecl; external libvips;
function vips_check_vector(domain: pchar; n: longint; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_hist(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_matrix(domain: pchar; im: PVipsImage; out_: PPVipsImage): longint; cdecl; external libvips;
function vips_check_separable(domain: pchar; im: PVipsImage): longint; cdecl; external libvips;
function vips_check_precision_intfloat(domain: pchar; precision: TVipsPrecision): longint; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:13:58 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
