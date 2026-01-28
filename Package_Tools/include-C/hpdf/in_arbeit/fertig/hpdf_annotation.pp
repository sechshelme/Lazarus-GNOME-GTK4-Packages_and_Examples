
unit hpdf_annotation;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_annotation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_annotation.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_annotation.h
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
{$ifndef _HPDF_ANNOTATION_H}
{$define _HPDF_ANNOTATION_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{------ HPDF_Annotation ----------------------------------------------------- }

function HPDF_Annotation_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; _type:THPDF_AnnotType; rect:THPDF_Rect):THPDF_Annotation;cdecl;external;
function HPDF_WidgetAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect):THPDF_Annotation;cdecl;external;
function HPDF_LinkAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect; dst:THPDF_Destination):THPDF_Annotation;cdecl;external;
(* Const before type ignored *)
function HPDF_URILinkAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect; uri:Pchar):THPDF_Annotation;cdecl;external;
function HPDF_3DAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect; tb:THPDF_BOOL; np:THPDF_BOOL; 
           u3d:THPDF_U3D; ap:THPDF_Image):THPDF_Annotation;cdecl;external;
(* Const before type ignored *)
function HPDF_MarkupAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect; text:Pchar; encoder:THPDF_Encoder; 
           subtype:THPDF_AnnotType):THPDF_Annotation;cdecl;external;
function HPDF_PopupAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect; parent:THPDF_Annotation):THPDF_Annotation;cdecl;external;
(* Const before type ignored *)
function HPDF_StampAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect; name:THPDF_StampAnnotName; text:Pchar; 
           encoder:THPDF_Encoder):THPDF_Annotation;cdecl;external;
(* Const before type ignored *)
function HPDF_ProjectionAnnot_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; rect:THPDF_Rect; text:Pchar; encoder:THPDF_Encoder):THPDF_Annotation;cdecl;external;
function HPDF_Annotation_Validate(annot:THPDF_Annotation):THPDF_BOOL;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_ANNOTATION_H  }

implementation


end.
