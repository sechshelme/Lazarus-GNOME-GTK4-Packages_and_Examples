
unit hpdf_catalog;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_catalog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_catalog.h
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
PHPDF_Catalog  = ^HPDF_Catalog;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_catalog.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_CATALOG_H}
{$define _HPDF_CATALOG_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }
type
  PHPDF_Catalog = ^THPDF_Catalog;
  THPDF_Catalog = THPDF_Dict;

function HPDF_Catalog_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_Catalog;cdecl;external;
function HPDF_Catalog_GetNames(catalog:THPDF_Catalog):THPDF_NameDict;cdecl;external;
function HPDF_Catalog_SetNames(catalog:THPDF_Catalog; dict:THPDF_NameDict):THPDF_STATUS;cdecl;external;
function HPDF_Catalog_GetRoot(catalog:THPDF_Catalog):THPDF_Pages;cdecl;external;
function HPDF_Catalog_GetPageLayout(catalog:THPDF_Catalog):THPDF_PageLayout;cdecl;external;
function HPDF_Catalog_SetPageLayout(catalog:THPDF_Catalog; layout:THPDF_PageLayout):THPDF_STATUS;cdecl;external;
function HPDF_Catalog_GetPageMode(catalog:THPDF_Catalog):THPDF_PageMode;cdecl;external;
function HPDF_Catalog_SetPageMode(catalog:THPDF_Catalog; mode:THPDF_PageMode):THPDF_STATUS;cdecl;external;
function HPDF_Catalog_SetOpenAction(catalog:THPDF_Catalog; open_action:THPDF_Destination):THPDF_STATUS;cdecl;external;
function HPDF_Catalog_AddPageLabel(catalog:THPDF_Catalog; page_num:THPDF_UINT; page_label:THPDF_Dict):THPDF_STATUS;cdecl;external;
function HPDF_Catalog_GetViewerPreference(catalog:THPDF_Catalog):THPDF_UINT;cdecl;external;
function HPDF_Catalog_SetViewerPreference(catalog:THPDF_Catalog; value:THPDF_UINT):THPDF_STATUS;cdecl;external;
function HPDF_Catalog_Validate(catalog:THPDF_Catalog):THPDF_BOOL;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_CATALOG_H  }

implementation


end.
