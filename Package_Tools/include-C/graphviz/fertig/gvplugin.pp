
unit gvplugin;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvplugin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvplugin.h
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
Pgvplugin_api_t  = ^gvplugin_api_t;
Pgvplugin_installed_t  = ^gvplugin_installed_t;
Pgvplugin_library_t  = ^gvplugin_library_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $Id$ $Revision$  }
{ vim:set shiftwidth=4 ts=8:  }
{************************************************************************
 * Copyright (c) 2011 AT&T Intellectual Property 
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors: See CVS logs. Details at http://www.graphviz.org/
 ************************************************************************ }
{ Header used by plugins  }
{$ifndef GVPLUGIN_H}
{$define GVPLUGIN_H}
{ C++ extern C conditionnal removed }
{$include "gvcext.h"}
{ 
 * Terminology:
 *
 *    package         - e.g. libgvplugin_cairo.so
 *       api	      - e.g. render
 *          type      - e.g. "png", "ps"
  }
{ an id that is only unique within a package 
			of plugins of the same api.
			A renderer-type such as "png" in the cairo package
			has an id that is different from the "ps" type
			in the same package  }
(* Const before type ignored *)
{ a string name, such as "png" or "ps" that
			distinguishes different types within the same
			 (renderer in this case)  }
{ an arbitrary integer used for ordering plugins of
			the same type from different packages  }
{ pointer to the jump table for the plugin  }
{ pointer to the feature description 
				void* because type varies by api  }
type
  Pgvplugin_installed_t = ^Tgvplugin_installed_t;
  Tgvplugin_installed_t = record
      id : longint;
      _type : Pchar;
      quality : longint;
      engine : pointer;
      features : pointer;
    end;

  Pgvplugin_api_t = ^Tgvplugin_api_t;
  Tgvplugin_api_t = record
      api : Tapi_t;
      types : Pgvplugin_installed_t;
    end;
{ used when this plugin is builtin and has
					no pathname  }

  Pgvplugin_library_t = ^Tgvplugin_library_t;
  Tgvplugin_library_t = record
      packagename : Pchar;
      apis : Pgvplugin_api_t;
    end;
{ C++ end of extern C conditionnal removed }
{$endif}
{ GVPLUGIN_H  }

implementation


end.
