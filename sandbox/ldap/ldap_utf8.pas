unit ldap_utf8;

interface

uses
  fp_ldap;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



const
  LDAP_UCS4_INVALID = $80000000;

type
  Pldap_ucs4_t = ^Tldap_ucs4_t;
  Tldap_ucs4_t = Tber_int_t;

function LDAP_MAX_UTF8_LEN: SizeUInt;

function ldap_x_utf8_to_ucs4(p: pchar): Tldap_ucs4_t; cdecl; external libldap;
function ldap_x_ucs4_to_utf8(c: Tldap_ucs4_t; buf: pchar): longint; cdecl; external libldap;
function ldap_x_utf8_to_wc(wchar: Pwchar_t; utf8char: pchar): longint; cdecl; external libldap;
function ldap_x_utf8s_to_wcs(wcstr: Pwchar_t; utf8str: pchar; count: Tsize_t): longint; cdecl; external libldap;
function ldap_x_wc_to_utf8(utf8char: pchar; wchar: Twchar_t; count: Tsize_t): longint; cdecl; external libldap;
function ldap_x_wcs_to_utf8s(utf8str: pchar; wcstr: Pwchar_t; count: Tsize_t): longint; cdecl; external libldap;

type
  Tutf8_to_mb_func = function(mbchar: pchar; wchar: Twchar_t): longint; cdecl;
  Tutf8s_to_mbs_func = function(mbstr: pchar; wcstr: Pwchar_t; count: Tsize_t): Tsize_t; cdecl;
  Tmb_to_utf8_func = function(wchar: Pwchar_t; mbchar: pchar; count: Tsize_t): longint; cdecl;
  Tmbs_to_utf8s_func = function(wcstr: Pwchar_t; mbstr: pchar; count: Tsize_t): Tsize_t; cdecl;

function ldap_x_utf8_to_mb(mbchar: pchar; utf8char: pchar; ldap_f_wctomb: Tutf8_to_mb_func): longint; cdecl; external libldap;
function ldap_x_utf8s_to_mbs(mbstr: pchar; utf8str: pchar; count: Tsize_t; ldap_f_wcstombs: Tutf8s_to_mbs_func): longint; cdecl; external libldap;
function ldap_x_mb_to_utf8(utf8char: pchar; mbchar: pchar; mbsize: Tsize_t; ldap_f_mbtowc: Tmb_to_utf8_func): longint; cdecl; external libldap;
function ldap_x_mbs_to_utf8s(utf8str: pchar; mbstr: pchar; count: Tsize_t; ldap_f_mbstowcs: Tmbs_to_utf8s_func): longint; cdecl; external libldap;

// === Konventiert am: 10-12-25 16:58:24 ===


implementation


function LDAP_MAX_UTF8_LEN: SizeUInt;
begin
  LDAP_MAX_UTF8_LEN := ((sizeof(Twchar_t)) * 3) div 2;
end;


end.
