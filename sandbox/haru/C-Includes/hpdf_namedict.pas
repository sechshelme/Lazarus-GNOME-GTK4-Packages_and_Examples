unit hpdf_namedict;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_namedict.h
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
{$ifndef _HPDF_NAMEDICT_H}
{$define _HPDF_NAMEDICT_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }

function HPDF_NameDict_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_NameDict;cdecl;external libhpdf;
function HPDF_NameDict_GetNameTree(namedict:THPDF_NameDict; key:THPDF_NameDictKey):THPDF_NameTree;cdecl;external libhpdf;
function HPDF_NameDict_SetNameTree(namedict:THPDF_NameDict; key:THPDF_NameDictKey; tree:THPDF_NameTree):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_NameDict_Validate(namedict:THPDF_NameDict):THPDF_BOOL;cdecl;external libhpdf;
{------- NameTree ------- }
function HPDF_NameTree_New(mmgr:THPDF_MMgr; xref:THPDF_Xref):THPDF_NameTree;cdecl;external libhpdf;
function HPDF_NameTree_Add(tree:THPDF_NameTree; name:THPDF_String; obj:pointer):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_NameTree_Add_String(tree:THPDF_NameTree; name:Pchar; value:Pchar):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_NameTree_Validate(tree:THPDF_NameTree):THPDF_BOOL;cdecl;external libhpdf;
{------- EmbeddedFile ------- }
function HPDF_EmbeddedFile_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; file:Pchar):THPDF_EmbeddedFile;cdecl;external libhpdf;
function HPDF_EmbeddedFile_Validate(emfile:THPDF_EmbeddedFile):THPDF_BOOL;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_NAMEDICT_H  }

// === Konventiert am: 28-1-26 14:09:32 ===


implementation



end.
