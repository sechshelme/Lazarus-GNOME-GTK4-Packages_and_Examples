unit lsmitex;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem - SVG and Mathml library
 *
 * Copyright © 2013 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_ITEX_H}
{$define LSM_ITEX_H}
{$include <lsmtypes.h>}

function lsm_itex_to_mathml(itex:Pchar; size:Tgssize):Pchar;cdecl;external liblasem;
procedure lsm_itex_free_mathml_buffer(mathml:Pchar);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:38:58 ===


implementation



end.
