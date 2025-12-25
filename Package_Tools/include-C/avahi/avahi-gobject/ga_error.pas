unit ga_error;

interface

uses
  fp_avahi_common;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * ga-error.h - Header for Avahi error types
 * Copyright (C) 2006-2007 Collabora Ltd.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
  }
{$ifndef __GA_ERROR_H__}
{$define __GA_ERROR_H__}
{$include <glib-object.h>}
{$include <avahi-common/error.h>}

function ga_error_quark:TGQuark;cdecl;external libavahi_gobject;
{ was #define dname def_expr }
function GA_ERROR : longint; { return type might be wrong }

{$endif}
{ #ifndef __GA_ERROR_H__  }

// === Konventiert am: 25-12-25 15:56:56 ===


implementation


{ was #define dname def_expr }
function GA_ERROR : longint; { return type might be wrong }
  begin
    GA_ERROR:=ga_error_quark;
  end;


end.
