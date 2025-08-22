
unit gsl_sf_elljac;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsl_sf_elljac.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsl_sf_elljac.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pdouble  = ^double;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ specfunc/gsl_sf_elljac.h
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
{$ifndef __GSL_SF_ELLJAC_H__}
{$define __GSL_SF_ELLJAC_H__}
{ Jacobian elliptic functions sn, dn, cn,
 * by descending Landen transformations
 *
 * exceptions: GSL_EDOM
  }

function gsl_sf_elljac_e(u:Tdouble; m:Tdouble; sn:Pdouble; cn:Pdouble; dn:Pdouble):longint;cdecl;external;
{$endif}
{ __GSL_SF_ELLJAC_H__  }

implementation


end.
