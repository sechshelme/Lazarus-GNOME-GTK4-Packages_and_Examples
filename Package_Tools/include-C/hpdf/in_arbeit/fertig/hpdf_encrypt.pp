
unit hpdf_encrypt;
interface

{
  Automatically converted by H2Pas 1.0.0 from hpdf_encrypt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hpdf_encrypt.h
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
PHPDF_ARC4_Ctx_Rec  = ^HPDF_ARC4_Ctx_Rec;
PHPDF_BYTE  = ^HPDF_BYTE;
PHPDF_Encrypt  = ^HPDF_Encrypt;
PHPDF_Encrypt_Rec  = ^HPDF_Encrypt_Rec;
PHPDF_MD5_CTX  = ^HPDF_MD5_CTX;
PHPDF_MD5Context  = ^HPDF_MD5Context;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_encrypt.h
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
 *------------------------------------------------------------------------------
 *
 * The code implements MD5 message-digest algorithm is based on the code
 * written by Colin Plumb.
 * The copyright of it is as follows.
 *
 * This code implements the MD5 message-digest algorithm.
 * The algorithm is due to Ron Rivest.  This code was
 * written by Colin Plumb in 1993, no copyright is claimed.
 * This code is in the public domain; do with it what you wish.
 *
 * Equivalent code is available from RSA Data Security, Inc.
 * This code has been tested against that, and is equivalent,
 * except that you don't need to include two pages of legalese
 * with every copy.
 *
 * To compute the message digest of a chunk of bytes, declare an
 * MD5Context structure, pass it to MD5Init, call MD5Update as
 * needed on buffers full of bytes, and then call MD5Final, which
 * will fill a supplied 16-byte array with the digest.
 *
 *--------------------------------------------------------------------------- }
{$ifndef HPDF_ENCRYPT_H}
{$define HPDF_ENCRYPT_H}
{$include "hpdf_mmgr.h"}
{ C++ extern C conditionnal removed }
{---------------------------------------------------------------------------- }
{----- encrypt-dict --------------------------------------------------------- }

const
  HPDF_ID_LEN = 16;  
  HPDF_PASSWD_LEN = 32;  
  HPDF_ENCRYPT_KEY_MAX = 16;  
  HPDF_MD5_KEY_LEN = 16;  
  HPDF_PERMISSION_PAD = $FFFFFFC0;  
  HPDF_ARC4_BUF_SIZE = 256;  
type
  PHPDF_MD5Context = ^THPDF_MD5Context;
  THPDF_MD5Context = record
      buf : array[0..3] of THPDF_UINT32;
      bits : array[0..1] of THPDF_UINT32;
      in : array[0..63] of THPDF_BYTE;
    end;
  THPDF_MD5_CTX = THPDF_MD5Context;
  PHPDF_MD5_CTX = ^THPDF_MD5_CTX;

  PHPDF_ARC4_Ctx_Rec = ^THPDF_ARC4_Ctx_Rec;
  THPDF_ARC4_Ctx_Rec = record
      idx1 : THPDF_BYTE;
      idx2 : THPDF_BYTE;
      state : array[0..(HPDF_ARC4_BUF_SIZE)-1] of THPDF_BYTE;
    end;

  PHPDF_Encrypt = ^THPDF_Encrypt;
  THPDF_Encrypt = PHPDF_Encrypt_Rec;
{ key_len must be a multiple of 8, and between 40 to 128  }
{ owner-password (not encrypted)  }
{ user-password (not encrypted)  }
{ owner-password (encrypted)  }
{ user-password (encrypted)  }

  PHPDF_Encrypt_Rec = ^THPDF_Encrypt_Rec;
  THPDF_Encrypt_Rec = record
      mode : THPDF_EncryptMode;
      key_len : THPDF_UINT;
      owner_passwd : array[0..(HPDF_PASSWD_LEN)-1] of THPDF_BYTE;
      user_passwd : array[0..(HPDF_PASSWD_LEN)-1] of THPDF_BYTE;
      owner_key : array[0..(HPDF_PASSWD_LEN)-1] of THPDF_BYTE;
      user_key : array[0..(HPDF_PASSWD_LEN)-1] of THPDF_BYTE;
      permission : THPDF_INT;
      encrypt_id : array[0..(HPDF_ID_LEN)-1] of THPDF_BYTE;
      encryption_key : array[0..(HPDF_MD5_KEY_LEN+5)-1] of THPDF_BYTE;
      md5_encryption_key : array[0..(HPDF_MD5_KEY_LEN)-1] of THPDF_BYTE;
      arc4ctx : THPDF_ARC4_Ctx_Rec;
    end;

procedure HPDF_MD5Init(ctx:PHPDF_MD5Context);cdecl;external;
(* Const before type ignored *)
procedure HPDF_MD5Update(ctx:PHPDF_MD5Context; buf:PHPDF_BYTE; len:THPDF_UINT32);cdecl;external;
procedure HPDF_MD5Final(digest:array[0..15] of THPDF_BYTE; ctx:PHPDF_MD5Context);cdecl;external;
(* Const before type ignored *)
procedure HPDF_PadOrTruncatePasswd(pwd:Pchar; new_pwd:PHPDF_BYTE);cdecl;external;
procedure HPDF_Encrypt_Init(attr:THPDF_Encrypt);cdecl;external;
procedure HPDF_Encrypt_CreateUserKey(attr:THPDF_Encrypt);cdecl;external;
procedure HPDF_Encrypt_CreateOwnerKey(attr:THPDF_Encrypt);cdecl;external;
procedure HPDF_Encrypt_CreateEncryptionKey(attr:THPDF_Encrypt);cdecl;external;
procedure HPDF_Encrypt_InitKey(attr:THPDF_Encrypt; object_id:THPDF_UINT32; gen_no:THPDF_UINT16);cdecl;external;
procedure HPDF_Encrypt_Reset(attr:THPDF_Encrypt);cdecl;external;
(* Const before type ignored *)
procedure HPDF_Encrypt_CryptBuf(attr:THPDF_Encrypt; src:PHPDF_BYTE; dst:PHPDF_BYTE; len:THPDF_UINT);cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ HPDF_ENCRYPT_H  }

implementation


end.
