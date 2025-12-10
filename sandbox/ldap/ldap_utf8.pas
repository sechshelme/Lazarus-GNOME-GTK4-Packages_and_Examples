unit ldap_utf8;

interface

uses
  cytypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ $OpenLDAP$  }
{ This work is part of OpenLDAP Software <http://www.openldap.org/>.
 *
 * Copyright 1998-2022 The OpenLDAP Foundation.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted only as authorized by the OpenLDAP
 * Public License.
 *
 * A copy of this license is available in file LICENSE in the
 * top-level directory of the distribution or, alternatively, at
 * <http://www.OpenLDAP.org/license.html>.
  }
{ This notice applies to changes, created by or for Novell, Inc.,
 * to preexisting works for which notices appear elsewhere in this file.
 *
 * Copyright (C) 2000 Novell, Inc. All Rights Reserved.
 *
 * THIS WORK IS SUBJECT TO U.S. AND INTERNATIONAL COPYRIGHT LAWS AND TREATIES.
 * USE, MODIFICATION, AND REDISTRIBUTION OF THIS WORK IS SUBJECT TO VERSION
 * 2.0.1 OF THE OPENLDAP PUBLIC LICENSE, A COPY OF WHICH IS AVAILABLE AT
 * HTTP://WWW.OPENLDAP.ORG/LICENSE.HTML OR IN THE FILE "LICENSE" IN THE
 * TOP-LEVEL DIRECTORY OF THE DISTRIBUTION. ANY USE OR EXPLOITATION OF THIS
 * WORK OTHER THAN AS AUTHORIZED IN VERSION 2.0.1 OF THE OPENLDAP PUBLIC
 * LICENSE, OR OTHER PRIOR WRITTEN CONSENT FROM NOVELL, COULD SUBJECT THE
 * PERPETRATOR TO CRIMINAL AND CIVIL LIABILITY.
  }
{ Note: A verbatim copy of version 2.0.1 of the OpenLDAP Public License
 * can be found in the file "build/LICENSE-2.0.1" in this distribution
 * of OpenLDAP Software.
  }
{$ifndef _LDAP_UTF8_H}
{$define _LDAP_UTF8_H}
{$include <lber_types.h>	/* get ber_*_t */}
{
 * UTF-8 Utility Routines
  }

const
  LDAP_UCS4_INVALID = $80000000;  
type
  Pldap_ucs4_t = ^Tldap_ucs4_t;
  Tldap_ucs4_t = Tber_int_t;
{ LDAP_MAX_UTF8_LEN is 3 or 6 depending on size of wchar_t  }

{ was #define dname def_expr }
function LDAP_MAX_UTF8_LEN : longint; { return type might be wrong }

{ Unicode conversion routines   }
function ldap_x_utf8_to_ucs4(p:Pchar):Tldap_ucs4_t;cdecl;external libldap;
function ldap_x_ucs4_to_utf8(c:Tldap_ucs4_t; buf:Pchar):longint;cdecl;external libldap;
{
 * Wide Char / UTF-8 Conversion Routines
  }
{ UTF-8 character to Wide Char  }
function ldap_x_utf8_to_wc(wchar:Pwchar_t; utf8char:Pchar):longint;cdecl;external libldap;
{ UTF-8 string to Wide Char string  }
function ldap_x_utf8s_to_wcs(wcstr:Pwchar_t; utf8str:Pchar; count:Tsize_t):longint;cdecl;external libldap;
{ Wide Char to UTF-8 character  }
function ldap_x_wc_to_utf8(utf8char:Pchar; wchar:Twchar_t; count:Tsize_t):longint;cdecl;external libldap;
{ Wide Char string to UTF-8 string  }
function ldap_x_wcs_to_utf8s(utf8str:Pchar; wcstr:Pwchar_t; count:Tsize_t):longint;cdecl;external libldap;
{
 * MultiByte Char / UTF-8 Conversion Routines
  }
{ UTF-8 character to MultiByte character  }
function ldap_x_utf8_to_mb(mbchar:Pchar; utf8char:Pchar; ldap_f_wctomb:function (mbchar:Pchar; wchar:Twchar_t):longint):longint;cdecl;external libldap;
{ UTF-8 string to MultiByte string  }
function ldap_x_utf8s_to_mbs(mbstr:Pchar; utf8str:Pchar; count:Tsize_t; ldap_f_wcstombs:function (mbstr:Pchar; wcstr:Pwchar_t; count:Tsize_t):Tsize_t):longint;cdecl;external libldap;
{ MultiByte character to UTF-8 character  }
function ldap_x_mb_to_utf8(utf8char:Pchar; mbchar:Pchar; mbsize:Tsize_t; ldap_f_mbtowc:function (wchar:Pwchar_t; mbchar:Pchar; count:Tsize_t):longint):longint;cdecl;external libldap;
{ MultiByte string to UTF-8 string  }
function ldap_x_mbs_to_utf8s(utf8str:Pchar; mbstr:Pchar; count:Tsize_t; ldap_f_mbstowcs:function (wcstr:Pwchar_t; mbstr:Pchar; count:Tsize_t):Tsize_t):longint;cdecl;external libldap;
{$endif}
{ _LDAP_UTF8_H  }

// === Konventiert am: 10-12-25 16:58:24 ===


implementation


{ was #define dname def_expr }
function LDAP_MAX_UTF8_LEN : longint; { return type might be wrong }
  begin
    LDAP_MAX_UTF8_LEN:=((sizeof(wchar_t))*3)/2;
  end;


end.
