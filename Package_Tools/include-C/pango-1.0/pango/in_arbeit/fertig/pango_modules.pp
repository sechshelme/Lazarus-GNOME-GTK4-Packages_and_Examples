
unit pango_modules;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_modules.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_modules.h
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
Pchar  = ^char;
PGSList  = ^GSList;
PGTypeModule  = ^GTypeModule;
Plongint  = ^longint;
PPangoEngine  = ^PangoEngine;
PPangoEngineInfo  = ^PangoEngineInfo;
PPangoIncludedModule  = ^PangoIncludedModule;
PPangoLanguage  = ^PangoLanguage;
PPangoMap  = ^PangoMap;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-modules.h:
 *
 * Copyright (C) 1999 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_MODULES_H__}
{$define __PANGO_MODULES_H__}
{$include <pango/pango-engine.h>}
{ All of this is deprecated and entirely useless for bindings.
 * Leave it out of the gir file.
  }
{$ifndef __GI_SCANNER__}
{$ifndef PANGO_DISABLE_DEPRECATED}
type
{*
 * PangoIncludedModule:
 * @list: a function that lists the engines defined in this module.
 * @init: a function to initialize the module.
 * @exit: a function to finalize the module.
 * @create: a function to create an engine, given the engine name.
 *
 * The `PangoIncludedModule` structure for a statically linked module
 * contains the functions that would otherwise be loaded from a dynamically
 * loaded module.
 *
 * Deprecated: 1.38
  }
(* Const before type ignored *)
  PPangoIncludedModule = ^TPangoIncludedModule;
  TPangoIncludedModule = record
      list : procedure (engines:PPPangoEngineInfo; n_engines:Plongint);cdecl;
      init : procedure (module:PGTypeModule);cdecl;
      exit : procedure ;cdecl;
      create : function (id:Pchar):PPangoEngine;cdecl;
    end;


function pango_find_map(language:PPangoLanguage; engine_type_id:Tguint; render_type_id:Tguint):PPangoMap;cdecl;external;
function pango_map_get_engine(map:PPangoMap; script:TPangoScript):PPangoEngine;cdecl;external;
procedure pango_map_get_engines(map:PPangoMap; script:TPangoScript; exact_engines:PPGSList; fallback_engines:PPGSList);cdecl;external;
procedure pango_module_register(module:PPangoIncludedModule);cdecl;external;
{$endif}
{ PANGO_DISABLE_DEPRECATED  }
{$endif}
{ __GI_SCANNER__  }
{$endif}
{ __PANGO_MODULES_H__  }

implementation


end.
