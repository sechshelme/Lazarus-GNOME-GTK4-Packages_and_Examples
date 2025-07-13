
unit _pam_compat;
interface

{
  Automatically converted by H2Pas 1.0.0 from _pam_compat.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    _pam_compat.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _PAM_COMPAT_H}
{$define _PAM_COMPAT_H}
{
 * This file was contributed by Derrick J Brashear <shadow@dementia.org>
 * slight modification by Brad M. Garcia <bgarcia@fore.com>
 *
 * A number of operating systems have started to implement PAM.
 * unfortunately, they have a different set of numeric values for
 * certain constants.  This file is included for compatibility's sake.
  }
{ Solaris uses different constants. We redefine to those here  }
{$if defined(solaris) || (defined(__SVR4) && defined(sun))}
{$ifdef _SECURITY_PAM_MODULES_H}
{ flags for pam_chauthtok()  }
{$undef PAM_PRELIM_CHECK}

const
  PAM_PRELIM_CHECK = $1;  
{$undef PAM_UPDATE_AUTHTOK}
  PAM_UPDATE_AUTHTOK = $2;  
{$endif}
{ _SECURITY_PAM_MODULES_H  }
{$ifdef _SECURITY__PAM_TYPES_H}
{ generic for pam_* functions  }
{$undef PAM_SILENT}

const
  PAM_SILENT = $80000000;  
{$undef PAM_CHANGE_EXPIRED_AUTHTOK}
  PAM_CHANGE_EXPIRED_AUTHTOK = $4;  
{ flags for pam_setcred()  }
{$undef PAM_ESTABLISH_CRED}
  PAM_ESTABLISH_CRED = $1;  
{$undef PAM_DELETE_CRED}
  PAM_DELETE_CRED = $2;  
{$undef PAM_REINITIALIZE_CRED}
  PAM_REINITIALIZE_CRED = $4;  
{$undef PAM_REFRESH_CRED}
  PAM_REFRESH_CRED = $8;  
{ another binary incompatibility comes from the return codes!  }
{$undef PAM_CONV_ERR}
  PAM_CONV_ERR = 6;  
{$undef PAM_PERM_DENIED}
  PAM_PERM_DENIED = 7;  
{$undef PAM_MAXTRIES}
  PAM_MAXTRIES = 8;  
{$undef PAM_AUTH_ERR}
  PAM_AUTH_ERR = 9;  
{$undef PAM_NEW_AUTHTOK_REQD}
  PAM_NEW_AUTHTOK_REQD = 10;  
{$undef PAM_CRED_INSUFFICIENT}
  PAM_CRED_INSUFFICIENT = 11;  
{$undef PAM_AUTHINFO_UNAVAIL}
  PAM_AUTHINFO_UNAVAIL = 12;  
{$undef PAM_USER_UNKNOWN}
  PAM_USER_UNKNOWN = 13;  
{$undef PAM_CRED_UNAVAIL}
  PAM_CRED_UNAVAIL = 14;  
{$undef PAM_CRED_EXPIRED}
  PAM_CRED_EXPIRED = 15;  
{$undef PAM_CRED_ERR}
  PAM_CRED_ERR = 16;  
{$undef PAM_ACCT_EXPIRED}
  PAM_ACCT_EXPIRED = 17;  
{$undef PAM_AUTHTOK_EXPIRED}
  PAM_AUTHTOK_EXPIRED = 18;  
{$undef PAM_SESSION_ERR}
  PAM_SESSION_ERR = 19;  
{$undef PAM_AUTHTOK_ERR}
  PAM_AUTHTOK_ERR = 20;  
{$undef PAM_AUTHTOK_RECOVERY_ERR}
  PAM_AUTHTOK_RECOVERY_ERR = 21;  
{$undef PAM_AUTHTOK_LOCK_BUSY}
  PAM_AUTHTOK_LOCK_BUSY = 22;  
{$undef PAM_AUTHTOK_DISABLE_AGING}
  PAM_AUTHTOK_DISABLE_AGING = 23;  
{$undef PAM_NO_MODULE_DATA}
  PAM_NO_MODULE_DATA = 24;  
{$undef PAM_IGNORE}
  PAM_IGNORE = 25;  
{$undef PAM_ABORT}
  PAM_ABORT = 26;  
{$undef PAM_TRY_AGAIN}
  PAM_TRY_AGAIN = 27;  
{$endif}
{ _SECURITY__PAM_TYPES_H  }
{$else}
{ For compatibility with old Linux-PAM implementations.  }

const
  PAM_AUTHTOK_RECOVER_ERR = PAM_AUTHTOK_RECOVERY_ERR;  
{$endif}
{ defined(solaris) || (defined(__SVR4) && defined(sun))  }
{$endif}
{ _PAM_COMPAT_H  }

implementation


end.
