unit lsmdomimplementation;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2009 Emmanuel Pacaud
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
{$ifndef LSM_DOM_IMPLEMENTATION_H}
{$define LSM_DOM_IMPLEMENTATION_H}
{$include <lsmdomtypes.h>}
{$include <lsmdomdocument.h>}
type
  PLsmDomDocumentCreateFunction = ^TLsmDomDocumentCreateFunction;
  TLsmDomDocumentCreateFunction = function :PLsmDomDocument;cdecl;

function lsm_dom_implementation_create_document(namespace_uri:Pchar; qualified_name:Pchar):PLsmDomDocument;cdecl;external liblasem;
procedure lsm_dom_implementation_cleanup;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:37:25 ===


implementation



end.
