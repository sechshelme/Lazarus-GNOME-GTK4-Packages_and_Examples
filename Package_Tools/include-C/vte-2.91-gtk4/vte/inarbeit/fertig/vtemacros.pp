
unit vtemacros;
interface

{
  Automatically converted by H2Pas 1.0.0 from vtemacros.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    vtemacros.h
}

    { Pointers to basic pascal types, inserted by h2pas conversion program.}
    Type
      PLongint  = ^Longint;
      PSmallInt = ^SmallInt;
      PByte     = ^Byte;
      PWord     = ^Word;
      PDWord    = ^DWord;
      PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2014 Christian Persch
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__VTE_VTE_H_INSIDE__) && !defined (VTE_COMPILATION)}
{$error "Only <vte/vte.h> can be included directly."}
{$endif}
{$include <gtk/gtk.h>}
{$if GTK_CHECK_VERSION(4,0,0)}

const
  _VTE_GTK = 4;  
(*** was #elif ****){$else GTK_CHECK_VERSION(3,90,0)}
{$error gtk+ version not supported}
(*** was #elif ****){$else GTK_CHECK_VERSION(3,0,0)}

const
  _VTE_GTK = 3;  
{$else}
{$error gtk+ version unknown}
{$endif}
{$if __GNUC__ > 2 || (__GNUC__ == 2 && __GNUC_MINOR__ > 6)}

{ was #define dname def_expr }
function _VTE_GNUC_PACKED : longint; { return type might be wrong }

{$else}
{$define _VTE_GNUC_PACKED}
{$endif}
{ !__GNUC__  }
{$ifdef VTE_COMPILATION}
(* error 
#define _VTE_GNUC_NONNULL(...)
in define line 43 *)
{$else}
{$if defined(__GNUC__)}
(* error 
#define _VTE_GNUC_NONNULL(...) __attribute__((__nonnull__(__VA_ARGS__)))
in define line 46 *)
{$else}
(* error 
#define _VTE_GNUC_NONNULL(...)
in define line 48 *)
{$endif}
{$endif}
(* error 
#define extern __attribute__((__visibility__("default"))) extern
in define line 52 *)
{$if defined(VTE_COMPILATION) && defined(__cplusplus)}
{$if __cplusplus >= 201103L}

    const
      _VTE_CXX_NOEXCEPT = noexcept;      
{$endif}
{$endif}
{$ifndef _VTE_CXX_NOEXCEPT}
{$define _VTE_CXX_NOEXCEPT}    
{$endif}

implementation

{ was #define dname def_expr }
function _VTE_GNUC_PACKED : longint; { return type might be wrong }
  begin
    _VTE_GNUC_PACKED:=__attribute__(__packed__);
  end;


end.
