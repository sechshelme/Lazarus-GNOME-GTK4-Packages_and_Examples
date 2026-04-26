unit mask;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ mask.h
 *
 * 20/9/09
 * 	- from proto.h
  }
{ All deprecated.
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
{$ifndef IM_MASK_H}
{$define IM_MASK_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
type
  Pim__INTMASK = ^Tim__INTMASK;
  Tim__INTMASK = record
      xsize : longint;
      ysize : longint;
      scale : longint;
      offset : longint;
      coeff : Plongint;
      filename : Pchar;
    end;
  TINTMASK = Tim__INTMASK;
  PINTMASK = ^TINTMASK;

  Pim__DOUBLEMASK = ^Tim__DOUBLEMASK;
  Tim__DOUBLEMASK = record
      xsize : longint;
      ysize : longint;
      scale : Tdouble;
      offset : Tdouble;
      coeff : Pdouble;
      filename : Pchar;
    end;
  TDOUBLEMASK = Tim__DOUBLEMASK;
  PDOUBLEMASK = ^TDOUBLEMASK;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function IM_MASK(M,X,Y : longint) : longint;

{xxxx VIPS_DEPRECATED }
function im_create_imask(filename:Pchar; xsize:longint; ysize:longint):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_create_imaskv(filename:Pchar; xsize:longint; ysize:longint; args:array of const):PINTMASK;cdecl;external libvips;
function im_create_imaskv(filename:Pchar; xsize:longint; ysize:longint):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_create_dmask(filename:Pchar; xsize:longint; ysize:longint):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_create_dmaskv(filename:Pchar; xsize:longint; ysize:longint; args:array of const):PDOUBLEMASK;cdecl;external libvips;
function im_create_dmaskv(filename:Pchar; xsize:longint; ysize:longint):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_read_imask(filename:Pchar):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_read_dmask(filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
procedure im_print_imask(in:PINTMASK);cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
procedure im_print_dmask(in:PDOUBLEMASK);cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_write_imask(in:PINTMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_write_dmask(in:PDOUBLEMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_write_imask_name(in:PINTMASK; filename:Pchar):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_write_dmask_name(in:PDOUBLEMASK; filename:Pchar):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_free_imask(in:PINTMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_free_dmask(in:PDOUBLEMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_log_imask(filename:Pchar; sigma:Tdouble; min_ampl:Tdouble):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_log_dmask(filename:Pchar; sigma:Tdouble; min_ampl:Tdouble):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_gauss_imask(filename:Pchar; sigma:Tdouble; min_ampl:Tdouble):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_gauss_imask_sep(filename:Pchar; sigma:Tdouble; min_ampl:Tdouble):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_gauss_dmask(filename:Pchar; sigma:Tdouble; min_ampl:Tdouble):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_gauss_dmask_sep(filename:Pchar; sigma:Tdouble; min_ampl:Tdouble):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_dup_imask(in:PINTMASK; filename:Pchar):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_dup_dmask(in:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_scale_dmask(in:PDOUBLEMASK; filename:Pchar):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
procedure im_norm_dmask(mask:PDOUBLEMASK);cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_imask2dmask(in:PINTMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_dmask2imask(in:PDOUBLEMASK; filename:Pchar):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_rotate_imask90(in:PINTMASK; filename:Pchar):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_rotate_imask45(in:PINTMASK; filename:Pchar):PINTMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_rotate_dmask90(in:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_rotate_dmask45(in:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_mattrn(in:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_matcat(top:PDOUBLEMASK; bottom:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_matmul(in1:PDOUBLEMASK; in2:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_lu_decomp(mat:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_lu_solve(lu:PDOUBLEMASK; vec:Pdouble):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_matinv(mat:PDOUBLEMASK; filename:Pchar):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_matinv_inplace(mat:PDOUBLEMASK):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_local_dmask(out:PVipsImage; mask:PDOUBLEMASK):PDOUBLEMASK;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_local_imask(out:PVipsImage; mask:PINTMASK):PINTMASK;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{IM_MASK_H }

// === Konventiert am: 26-4-26 16:12:16 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function IM_MASK(M,X,Y : longint) : longint;
begin
  IM_MASK:=M^.(coeff[(TX(+(Y)))*(M^.xsize)]);
end;


end.
