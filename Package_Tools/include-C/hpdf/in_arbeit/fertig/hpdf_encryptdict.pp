
unit hpdf_encryptdict;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_encryptdict.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_encryptdict.h
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
 * << Haru Free PDF Library >> -- hpdf_encryptdict.h
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
{$ifndef _HPDF_ENCRYPTDICT_H}
{$define _HPDF_ENCRYPTDICT_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }
{--------------------------------------------------------------------------- }
{------ HPDF_EncryptDict --------------------------------------------------- }

function HPDF_EncryptDict_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_EncryptDict;cdecl;external;
procedure HPDF_EncryptDict_CreateID(dict:THPDF_EncryptDict; info:THPDF_Dict; xref:THPDF_Xref);cdecl;external;
procedure HPDF_EncryptDict_OnFree(obj:THPDF_Dict);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function HPDF_EncryptDict_SetPassword(dict:THPDF_EncryptDict; owner_passwd:Pchar; user_passwd:Pchar):THPDF_STATUS;cdecl;external;
function HPDF_EncryptDict_Validate(dict:THPDF_EncryptDict):THPDF_BOOL;cdecl;external;
function HPDF_EncryptDict_Prepare(dict:THPDF_EncryptDict; info:THPDF_Dict; xref:THPDF_Xref):THPDF_STATUS;cdecl;external;
function HPDF_EncryptDict_GetAttr(dict:THPDF_EncryptDict):THPDF_Encrypt;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_ENCRYPTDICT_H  }

implementation


end.
