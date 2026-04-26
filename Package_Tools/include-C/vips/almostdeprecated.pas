unit almostdeprecated;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Old and broken stuff that we still enable by default, but don't document
 * and certainly don't recommend.
 *
 * 30/6/09
 * 	- from vips.h
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef IM_ALMOSTDEPRECATED_H}
{$define IM_ALMOSTDEPRECATED_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ Was public, now deprecated.
  }
type
  PVipsBBits = ^TVipsBBits;
  TVipsBBits =  Longint;
  Const
    IM_BBITS_BYTE = 8;
    IM_BBITS_SHORT = 16;
    IM_BBITS_INT = 32;
    IM_BBITS_FLOAT = 32;
    IM_BBITS_COMPLEX = 64;
    IM_BBITS_DOUBLE = 64;
    IM_BBITS_DPCOMPLEX = 128;
;
{ Used to define a region of interest for im_extract() etc. Too boring to be
 * public API, see im_extract_area() etc.
  }
{ 1 2 3 or 0, for r g b or all respectively
				*(channel select)	 }
type
  PIMAGE_BOX = ^TIMAGE_BOX;
  TIMAGE_BOX = record
      xstart : longint;
      ystart : longint;
      xsize : longint;
      ysize : longint;
      chsel : longint;
    end;
{xxxx VIPS_DEPRECATED }

function im_extract(para1:PIMAGE; para2:PIMAGE; para3:PIMAGE_BOX):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_measure(im:PIMAGE; box:PIMAGE_BOX; h:longint; v:longint; sel:Plongint; 
           nsel:longint; name:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_isuint(im:PIMAGE):Tgboolean;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_isint(im:PIMAGE):Tgboolean;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_isfloat(im:PIMAGE):Tgboolean;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_isscalar(im:PIMAGE):Tgboolean;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_iscomplex(im:PIMAGE):Tgboolean;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_c2ps(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_clip(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
const
  MASK_IDEAL_HIGHPASS = IM_MASK_IDEAL_HIGHPASS;  
  MASK_IDEAL_LOWPASS = IM_MASK_IDEAL_LOWPASS;  
  MASK_BUTTERWORTH_HIGHPASS = IM_MASK_BUTTERWORTH_HIGHPASS;  
  MASK_BUTTERWORTH_LOWPASS = IM_MASK_BUTTERWORTH_LOWPASS;  
  MASK_GAUSS_HIGHPASS = IM_MASK_GAUSS_HIGHPASS;  
  MASK_GAUSS_LOWPASS = IM_MASK_GAUSS_LOWPASS;  
  MASK_IDEAL_RINGPASS = IM_MASK_IDEAL_RINGPASS;  
  MASK_IDEAL_RINGREJECT = IM_MASK_IDEAL_RINGREJECT;  
  MASK_BUTTERWORTH_RINGPASS = IM_MASK_BUTTERWORTH_RINGPASS;  
  MASK_BUTTERWORTH_RINGREJECT = IM_MASK_BUTTERWORTH_RINGREJECT;  
  MASK_GAUSS_RINGPASS = IM_MASK_GAUSS_RINGPASS;  
  MASK_GAUSS_RINGREJECT = IM_MASK_GAUSS_RINGREJECT;  
  MASK_IDEAL_BANDPASS = IM_MASK_IDEAL_BANDPASS;  
  MASK_IDEAL_BANDREJECT = IM_MASK_IDEAL_BANDREJECT;  
  MASK_BUTTERWORTH_BANDPASS = IM_MASK_BUTTERWORTH_BANDPASS;  
  MASK_BUTTERWORTH_BANDREJECT = IM_MASK_BUTTERWORTH_BANDREJECT;  
  MASK_GAUSS_BANDPASS = IM_MASK_GAUSS_BANDPASS;  
  MASK_GAUSS_BANDREJECT = IM_MASK_GAUSS_BANDREJECT;  
  MASK_FRACTAL_FLT = IM_MASK_FRACTAL_FLT;  
  MaskType = ImMaskType;  
{ Copy and swap types.
  }
type
  Pim_arch_type = ^Tim_arch_type;
  Tim_arch_type =  Longint;
  Const
    IM_ARCH_NATIVE = 0;
    IM_ARCH_BYTE_SWAPPED = 1;
    IM_ARCH_LSB_FIRST = 2;
    IM_ARCH_MSB_FIRST = 3;
;
{xxxx VIPS_DEPRECATED }

function im_isnative(arch:Tim_arch_type):Tgboolean;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_copy_from(in:PIMAGE; out:PIMAGE; architecture:Tim_arch_type):longint;cdecl;external libvips;
{ Backwards compatibility macros.
  }
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function im_clear_error_string : longint;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function im_errorstring : longint;

{ Deprecated API.
  }
{xxxx VIPS_DEPRECATED_FOR(vips_error) }
procedure im_errormsg(fmt:Pchar; args:array of const);cdecl;external libvips;
procedure im_errormsg(fmt:Pchar);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_verror) }
procedure im_verrormsg(fmt:Pchar; ap:Tva_list);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_error_system) }
procedure im_errormsg_system(err:longint; fmt:Pchar; args:array of const);cdecl;external libvips;
procedure im_errormsg_system(err:longint; fmt:Pchar);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(g_info) }
procedure im_diagnostics(fmt:Pchar; args:array of const);cdecl;external libvips;
procedure im_diagnostics(fmt:Pchar);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(g_warning) }
procedure im_warning(fmt:Pchar; args:array of const);cdecl;external libvips;
procedure im_warning(fmt:Pchar);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(g_thread_join) }
function vips_g_thread_join(thread:PGThread):pointer;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_iterate(im:PVipsImage; start:TVipsStartFn; generate:Tim_generate_fn; stop:TVipsStopFn; a:pointer; 
           b:pointer):longint;cdecl;external libvips;
{ Async rendering.
  }
{xxxx VIPS_DEPRECATED_FOR(vips_sink_screen) }
function im_render_priority(in:PVipsImage; out:PVipsImage; mask:PVipsImage; width:longint; height:longint; 
           max:longint; priority:longint; notify:procedure (para1:PVipsImage; para2:PVipsRect; para3:pointer); client:pointer):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_sink_screen) }
function im_cache(in:PVipsImage; out:PVipsImage; width:longint; height:longint; max:longint):longint;cdecl;external libvips;
{ Deprecated operations.
  }
{xxxx VIPS_DEPRECATED }
function im_cmulnorm(in1:PIMAGE; in2:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_fav4(para1:PPIMAGE; para2:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_gadd(para1:Tdouble; para2:PIMAGE; para3:Tdouble; para4:PIMAGE; para5:Tdouble; 
           para6:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_litecor(para1:PIMAGE; para2:PIMAGE; para3:PIMAGE; para4:longint; para5:Tdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_sink_screen) }
function im_render_fade(in:PIMAGE; out:PIMAGE; mask:PIMAGE; width:longint; height:longint; 
           max:longint; fps:longint; steps:longint; priority:longint; notify:procedure (para1:PIMAGE; para2:PVipsRect; para3:pointer); 
           client:pointer):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_sink_screen) }
function im_render(in:PIMAGE; out:PIMAGE; mask:PIMAGE; width:longint; height:longint; 
           max:longint; notify:procedure (para1:PIMAGE; para2:PVipsRect; para3:pointer); client:pointer):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_cooc_matrix(im:PIMAGE; m:PIMAGE; xp:longint; yp:longint; xs:longint; 
           ys:longint; dx:longint; dy:longint; flag:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_cooc_asm(m:PIMAGE; asmoment:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_cooc_contrast(m:PIMAGE; contrast:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_cooc_correlation(m:PIMAGE; correlation:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_cooc_entropy(m:PIMAGE; entropy:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_glds_matrix(im:PIMAGE; m:PIMAGE; xpos:longint; ypos:longint; xsize:longint; 
           ysize:longint; dx:longint; dy:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_glds_asm(m:PIMAGE; asmoment:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_glds_contrast(m:PIMAGE; contrast:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_glds_entropy(m:PIMAGE; entropy:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_glds_mean(m:PIMAGE; mean:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_dif_std(im:PIMAGE; xpos:longint; ypos:longint; xsize:longint; ysize:longint; 
           dx:longint; dy:longint; pmean:Pdouble; pstd:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_simcontr(out:PIMAGE; xsize:longint; ysize:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_spatres(in:PIMAGE; out:PIMAGE; step:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_stretch3(in:PIMAGE; out:PIMAGE; dx:Tdouble; dy:Tdouble):longint;cdecl;external libvips;
{ Renamed operations.
  }
{ arithmetic
  }
{xxxx VIPS_DEPRECATED_FOR(vips_remainder_const) }
function im_remainderconst_vec(in:PIMAGE; out:PIMAGE; n:longint; c:Pdouble):longint;cdecl;external libvips;
{ boolean
  }
{xxxx VIPS_DEPRECATED_FOR(vips_andimage_const1) }
function im_andconst(para1:PIMAGE; para2:PIMAGE; para3:Tdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_andimage_const) }
function im_and_vec(para1:PIMAGE; para2:PIMAGE; para3:longint; para4:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_orimage_const1) }
function im_orconst(para1:PIMAGE; para2:PIMAGE; para3:Tdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_orimage_const) }
function im_or_vec(para1:PIMAGE; para2:PIMAGE; para3:longint; para4:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_eorimage_const1) }
function im_eorconst(para1:PIMAGE; para2:PIMAGE; para3:Tdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_eorimage_const) }
function im_eor_vec(para1:PIMAGE; para2:PIMAGE; para3:longint; para4:Pdouble):longint;cdecl;external libvips;
{ mosaicing
  }
{xxxx VIPS_DEPRECATED_FOR(vips_affine) }
function im_affine(in:PIMAGE; out:PIMAGE; a:Tdouble; b:Tdouble; c:Tdouble; 
           d:Tdouble; dx:Tdouble; dy:Tdouble; ox:longint; oy:longint; 
           ow:longint; oh:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_similarity) }
function im_similarity(in:PIMAGE; out:PIMAGE; a:Tdouble; b:Tdouble; dx:Tdouble; 
           dy:Tdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_similarity) }
function im_similarity_area(in:PIMAGE; out:PIMAGE; a:Tdouble; b:Tdouble; dx:Tdouble; 
           dy:Tdouble; ox:longint; oy:longint; ow:longint; oh:longint):longint;cdecl;external libvips;
{ colour
  }
{xxxx VIPS_DEPRECATED_FOR(vips_icc_export) }
function im_icc_export(in:PIMAGE; out:PIMAGE; output_profile_filename:Pchar; intent:longint):longint;cdecl;external libvips;
{ conversion
  }
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2dcm(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2cm(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2us(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2ui(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2s(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2i(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2d(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2f(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_cast) }
function im_clip2c(in:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_slice(in:PIMAGE; out:PIMAGE; para3:Tdouble; para4:Tdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_thresh(in:PIMAGE; out:PIMAGE; para3:Tdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(printf) }
function im_print(message:Pchar):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_convsub(in:PIMAGE; out:PIMAGE; mask:PINTMASK; xskip:longint; yskip:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_bernd(tiffname:Pchar; x:longint; y:longint; w:longint; h:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_resize_linear(para1:PIMAGE; para2:PIMAGE; para3:longint; para4:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_convf) }
function im_convf(in:PIMAGE; out:PIMAGE; mask:PDOUBLEMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_convsep) }
function im_convsepf(in:PIMAGE; out:PIMAGE; mask:PDOUBLEMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_conv_raw(in:PIMAGE; out:PIMAGE; mask:PINTMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_convf_raw(in:PIMAGE; out:PIMAGE; mask:PDOUBLEMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_convsep_raw(in:PIMAGE; out:PIMAGE; mask:PINTMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_convsepf_raw(in:PIMAGE; out:PIMAGE; mask:PDOUBLEMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_fastcor_raw(in:PIMAGE; ref:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_spcor_raw(in:PIMAGE; ref:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_gradcor_raw(in:PIMAGE; ref:PIMAGE; out:PIMAGE):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_contrast_surface_raw(in:PIMAGE; out:PIMAGE; half_win_size:longint; spacing:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_stdif) }
function im_stdif_raw(in:PIMAGE; out:PIMAGE; a:Tdouble; m0:Tdouble; b:Tdouble; 
           s0:Tdouble; xwin:longint; ywin:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_hist_local) }
function im_lhisteq_raw(in:PIMAGE; out:PIMAGE; xwin:longint; ywin:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_morph) }
function im_erode_raw(in:PIMAGE; out:PIMAGE; m:PINTMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_morph) }
function im_dilate_raw(in:PIMAGE; out:PIMAGE; m:PINTMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_rank_raw(in:PIMAGE; out:PIMAGE; xsize:longint; ysize:longint; order:longint):longint;cdecl;external libvips;
{ inplace
  }
{xxxx VIPS_DEPRECATED_FOR(vips_draw_circle) }
function im_circle(im:PIMAGE; cx:longint; cy:longint; radius:longint; intensity:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_line1) }
function im_line(para1:PIMAGE; para2:longint; para3:longint; para4:longint; para5:longint; 
           para6:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_labelregions) }
function im_segment(test:PIMAGE; mask:PIMAGE; segments:Plongint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_rect) }
function im_paintrect(im:PIMAGE; r:PVipsRect; ink:PPEL):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_image) }
function im_insertplace(main:PIMAGE; sub:PIMAGE; x:longint; y:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_flood) }
function im_flood_copy(in:PIMAGE; out:PIMAGE; x:longint; y:longint; ink:PPEL):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_flood) }
function im_flood_blob_copy(in:PIMAGE; out:PIMAGE; x:longint; y:longint; ink:PPEL):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_flood) }
function im_flood_other_copy(test:PIMAGE; mark:PIMAGE; out:PIMAGE; x:longint; y:longint; 
           serial:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_flood) }
function im_flood(im:PIMAGE; x:longint; y:longint; ink:PPEL; dout:PVipsRect):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_flood) }
function im_flood_blob(im:PIMAGE; x:longint; y:longint; ink:PPEL; dout:PVipsRect):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_flood) }
function im_flood_other(test:PIMAGE; mark:PIMAGE; x:longint; y:longint; serial:longint; 
           dout:PVipsRect):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_line) }
function im_fastline(im:PIMAGE; x1:longint; y1:longint; x2:longint; y2:longint; 
           pel:PPEL):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_line) }
function im_fastlineuser(im:PIMAGE; x1:longint; y1:longint; x2:longint; y2:longint; 
           fn:TVipsPlotFn; client1:pointer; client2:pointer; client3:pointer):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_mask) }
function im_plotmask(im:PIMAGE; ix:longint; iy:longint; ink:PPEL; mask:PPEL; 
           r:PVipsRect):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_getpoint) }
function im_readpoint(im:PIMAGE; x:longint; y:longint; pel:PPEL):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_point) }
function im_plotpoint(im:PIMAGE; x:longint; y:longint; pel:PPEL):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_draw_smudge) }
function im_smudge(image:PIMAGE; ix:longint; iy:longint; r:PVipsRect):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_smear(im:PIMAGE; ix:longint; iy:longint; r:PVipsRect):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(g_warning) }
procedure vips_warn(domain:Pchar; fmt:Pchar; args:array of const);cdecl;external libvips;
procedure vips_warn(domain:Pchar; fmt:Pchar);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(g_warning) }
procedure vips_vwarn(domain:Pchar; fmt:Pchar; ap:Tva_list);cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
procedure vips_info_set(info:Tgboolean);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(g_info) }
procedure vips_info(domain:Pchar; fmt:Pchar; args:array of const);cdecl;external libvips;
procedure vips_info(domain:Pchar; fmt:Pchar);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(g_info) }
procedure vips_vinfo(domain:Pchar; fmt:Pchar; ap:Tva_list);cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_autorot) }
function vips_autorot_get_angle(image:PVipsImage):TVipsAngle;cdecl;external libvips;
{xxxx VIPS_DEPRECATED_FOR(vips_thread_isvips) }
function vips_thread_isworker:Tgboolean;cdecl;external libvips;
{ iofuncs
  }
{xxxx VIPS_DEPRECATED_FOR(g_free) }
function vips_free(buf:pointer):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{IM_ALMOSTDEPRECATED_H }

// === Konventiert am: 26-4-26 16:15:40 ===


implementation


{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function im_clear_error_string : longint;
begin
  im_clear_error_string:=im_error_clear;
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function im_errorstring : longint;
begin
  im_errorstring:=im_error_buffer;
end;


end.
