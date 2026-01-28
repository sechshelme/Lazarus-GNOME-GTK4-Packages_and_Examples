unit hpdf_encryptdict;

interface

uses
  fp_hpdf;

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

function HPDF_EncryptDict_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_EncryptDict;cdecl;external libhpdf;
procedure HPDF_EncryptDict_CreateID(dict:THPDF_EncryptDict; info:THPDF_Dict; xref:THPDF_Xref);cdecl;external libhpdf;
procedure HPDF_EncryptDict_OnFree(obj:THPDF_Dict);cdecl;external libhpdf;
function HPDF_EncryptDict_SetPassword(dict:THPDF_EncryptDict; owner_passwd:Pchar; user_passwd:Pchar):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_EncryptDict_Validate(dict:THPDF_EncryptDict):THPDF_BOOL;cdecl;external libhpdf;
function HPDF_EncryptDict_Prepare(dict:THPDF_EncryptDict; info:THPDF_Dict; xref:THPDF_Xref):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_EncryptDict_GetAttr(dict:THPDF_EncryptDict):THPDF_Encrypt;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_ENCRYPTDICT_H  }

// === Konventiert am: 28-1-26 14:02:20 ===


implementation



end.
