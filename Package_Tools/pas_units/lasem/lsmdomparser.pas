unit lsmdomparser;

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
{$ifndef LSM_DOM_PARSER_H}
{$define LSM_DOM_PARSER_H}
{$include <lsmdomdocument.h>}
{$include <gio/gio.h>}

procedure lsm_dom_document_append_from_memory(document:PLsmDomDocument; node:PLsmDomNode; buffer:Pchar; size:Tgssize; error:PPGError);cdecl;external liblasem;
function lsm_dom_document_new_from_memory(buffer:Pchar; size:Tgssize; error:PPGError):PLsmDomDocument;cdecl;external liblasem;
function lsm_dom_document_new_from_path(path:Pchar; error:PPGError):PLsmDomDocument;cdecl;external liblasem;
function lsm_dom_document_new_from_url(url:Pchar; error:PPGError):PLsmDomDocument;cdecl;external liblasem;
procedure lsm_dom_document_save_to_stream(document:PLsmDomDocument; stream:PGOutputStream; error:PPGError);cdecl;external liblasem;
procedure lsm_dom_document_save_to_memory(document:PLsmDomDocument; buffer:PPchar; size:Pgsize; error:PPGError);cdecl;external liblasem;
procedure lsm_dom_document_save_to_path(document:PLsmDomDocument; path:Pchar; error:PPGError);cdecl;external liblasem;
procedure lsm_dom_document_save_to_url(document:PLsmDomDocument; url:Pchar; error:PPGError);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:38:00 ===


implementation



end.
