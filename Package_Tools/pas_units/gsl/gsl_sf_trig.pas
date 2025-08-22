unit gsl_sf_trig;

interface

uses
  fp_gsl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_trig.h
 * 
 * Copyright (C) 1996, 1997, 1998, 1999, 2000 Gerard Jungman
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or (at
 * your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
  }
{ Author:  G. Jungman  }
{$ifndef __GSL_SF_TRIG_H__}
{$define __GSL_SF_TRIG_H__}
{$include <gsl/gsl_sf_result.h>}
{ Sin(x) with GSL semantics. This is actually important
 * because we want to control the error estimate, and trying
 * to guess the error for the standard library implementation
 * every time it is used would be a little goofy.
  }

function gsl_sf_sin_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_sin(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Cos(x) with GSL semantics.
  }
function gsl_sf_cos_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_cos(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Hypot(x,y) with GSL semantics.
  }
function gsl_sf_hypot_e(x:Tdouble; y:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_hypot(x:Tdouble; y:Tdouble):Tdouble;cdecl;external libgsl;
{ Sin(z) for complex z
 *
 * exceptions: GSL_EOVRFLW
  }
function gsl_sf_complex_sin_e(zr:Tdouble; zi:Tdouble; szr:Pgsl_sf_result; szi:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Cos(z) for complex z
 *
 * exceptions: GSL_EOVRFLW
  }
function gsl_sf_complex_cos_e(zr:Tdouble; zi:Tdouble; czr:Pgsl_sf_result; czi:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Log(Sin(z)) for complex z
 *
 * exceptions: GSL_EDOM, GSL_ELOSS
  }
function gsl_sf_complex_logsin_e(zr:Tdouble; zi:Tdouble; lszr:Pgsl_sf_result; lszi:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Sinc(x) = sin(pi x) / (pi x)
 *
 * exceptions: none
  }
function gsl_sf_sinc_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_sinc(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Log(Sinh(x)), x > 0
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_lnsinh_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lnsinh(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Log(Cosh(x))
 *
 * exceptions: none
  }
function gsl_sf_lncosh_e(x:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_lncosh(x:Tdouble):Tdouble;cdecl;external libgsl;
{ Convert polar to rectlinear coordinates.
 *
 * exceptions: GSL_ELOSS
  }
function gsl_sf_polar_to_rect(r:Tdouble; theta:Tdouble; x:Pgsl_sf_result; y:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Convert rectilinear to polar coordinates.
 * return argument in range [-pi, pi]
 *
 * exceptions: GSL_EDOM
  }
function gsl_sf_rect_to_polar(x:Tdouble; y:Tdouble; r:Pgsl_sf_result; theta:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Sin(x) for quantity with an associated error.
  }
function gsl_sf_sin_err_e(x:Tdouble; dx:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Cos(x) for quantity with an associated error.
  }
function gsl_sf_cos_err_e(x:Tdouble; dx:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
{ Force an angle to lie in the range (-pi,pi].
 *
 * exceptions: GSL_ELOSS
  }
function gsl_sf_angle_restrict_symm_e(theta:Pdouble):longint;cdecl;external libgsl;
function gsl_sf_angle_restrict_symm(theta:Tdouble):Tdouble;cdecl;external libgsl;
{ Force an angle to lie in the range [0, 2pi)
 *
 * exceptions: GSL_ELOSS
  }
function gsl_sf_angle_restrict_pos_e(theta:Pdouble):longint;cdecl;external libgsl;
function gsl_sf_angle_restrict_pos(theta:Tdouble):Tdouble;cdecl;external libgsl;
function gsl_sf_angle_restrict_symm_err_e(theta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
function gsl_sf_angle_restrict_pos_err_e(theta:Tdouble; result:Pgsl_sf_result):longint;cdecl;external libgsl;
{$endif}
{ __GSL_SF_TRIG_H__  }

// === Konventiert am: 22-8-25 13:59:21 ===


implementation



end.
