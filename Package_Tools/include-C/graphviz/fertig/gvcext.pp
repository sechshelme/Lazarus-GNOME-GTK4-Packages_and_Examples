
unit gvcext;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvcext.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvcext.h
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
Papi_t  = ^api_t;
Pchar  = ^char;
Plt_symlist_t  = ^lt_symlist_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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
{ Common header used by both clients and plugins  }
{$ifndef GVCEXT_H}
{$define GVCEXT_H}
{ C++ extern C conditionnal removed }
{
 * Define an apis array of name strings using an enumerated api_t as index.
 * The enumerated type is defined here.  The apis array is
 * inititialized in gvplugin.c by redefining ELEM and reinvoking APIS.
  }
{
 * Define api_t using names based on the plugin names with API_ prefixed.
  }
type
  Papi_t = ^Tapi_t;
  Tapi_t =  Longint;
  Const
    _DUMMY_ELEM_ = 0;
;
{ API_render, API_layout, ...  }
{ Stupid but true: The sole purpose of "_DUMMY_ELEM_=0"
			 * is to avoid a "," after the last element of the enum
			 * because some compilers when using "-pedantic"
			 * generate an error for about the dangling ","
			 * but only if this header is used from a .cpp file!
			 * Setting it to 0 makes sure that the enumeration
			 * does not define an extra value.  (It does however
			 * define _DUMMY_ELEM_ as an enumeration symbol,
			 * but its value duplicates that of the first
			 * symbol in the enumeration - in this case "render".)
			  }
{ One could wonder why trailing "," in:
			 * 	int nums[]=1,2,3,;
			 * is OK, but in:
			 * 	typedef enum a,b,c, abc_t; 
			 * is not!!!
			  }
{$undef ELEM}
type
  TGVJ_s = TGVJ_t;
  TGVG_s = TGVG_t;
  TGVC_s = TGVC_t;
(* Const before type ignored *)

  Plt_symlist_t = ^Tlt_symlist_t;
  Tlt_symlist_t = record
      name : Pchar;
      address : pointer;
    end;
  Tgvplugin_available_s = Tgvplugin_available_t;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
