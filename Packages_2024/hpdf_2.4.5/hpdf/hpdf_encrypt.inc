{$IFDEF read_interface}


const
  HPDF_ID_LEN = 16;
  HPDF_PASSWD_LEN = 32;
  HPDF_ENCRYPT_KEY_MAX = 16;
  HPDF_MD5_KEY_LEN = 16;
  HPDF_PERMISSION_PAD = $FFFFFFC0;
  HPDF_ARC4_BUF_SIZE = 256;

type
  THPDF_MD5Context = record
    buf: array[0..3] of THPDF_UINT32;
    bits: array[0..1] of THPDF_UINT32;
    in_: array[0..63] of THPDF_BYTE;
  end;
  PHPDF_MD5Context = ^THPDF_MD5Context;

  THPDF_MD5_CTX = THPDF_MD5Context;
  PHPDF_MD5_CTX = ^THPDF_MD5_CTX;

  THPDF_ARC4_Ctx_Rec = record
    idx1: THPDF_BYTE;
    idx2: THPDF_BYTE;
    state: array[0..(HPDF_ARC4_BUF_SIZE) - 1] of THPDF_BYTE;
  end;
  PHPDF_ARC4_Ctx_Rec = ^THPDF_ARC4_Ctx_Rec;

  THPDF_Encrypt_Rec = record
    mode: THPDF_EncryptMode;
    key_len: THPDF_UINT;
    owner_passwd: array[0..(HPDF_PASSWD_LEN) - 1] of THPDF_BYTE;
    user_passwd: array[0..(HPDF_PASSWD_LEN) - 1] of THPDF_BYTE;
    owner_key: array[0..(HPDF_PASSWD_LEN) - 1] of THPDF_BYTE;
    user_key: array[0..(HPDF_PASSWD_LEN) - 1] of THPDF_BYTE;
    permission: THPDF_INT;
    encrypt_id: array[0..(HPDF_ID_LEN) - 1] of THPDF_BYTE;
    encryption_key: array[0..(HPDF_MD5_KEY_LEN + 5) - 1] of THPDF_BYTE;
    md5_encryption_key: array[0..(HPDF_MD5_KEY_LEN) - 1] of THPDF_BYTE;
    arc4ctx: THPDF_ARC4_Ctx_Rec;
  end;
  PHPDF_Encrypt_Rec = ^THPDF_Encrypt_Rec;

  PHPDF_Encrypt = ^THPDF_Encrypt;
  THPDF_Encrypt = PHPDF_Encrypt_Rec;

procedure HPDF_MD5Init(ctx: PHPDF_MD5Context); cdecl; external libhpdf;
procedure HPDF_MD5Update(ctx: PHPDF_MD5Context; buf: PHPDF_BYTE; len: THPDF_UINT32); cdecl; external libhpdf;
procedure HPDF_MD5Final(digest: PHPDF_BYTE; ctx: PHPDF_MD5Context); cdecl; external libhpdf;
procedure HPDF_PadOrTruncatePasswd(pwd: pchar; new_pwd: PHPDF_BYTE); cdecl; external libhpdf;
procedure HPDF_Encrypt_Init(attr: THPDF_Encrypt); cdecl; external libhpdf;
procedure HPDF_Encrypt_CreateUserKey(attr: THPDF_Encrypt); cdecl; external libhpdf;
procedure HPDF_Encrypt_CreateOwnerKey(attr: THPDF_Encrypt); cdecl; external libhpdf;
procedure HPDF_Encrypt_CreateEncryptionKey(attr: THPDF_Encrypt); cdecl; external libhpdf;
procedure HPDF_Encrypt_InitKey(attr: THPDF_Encrypt; object_id: THPDF_UINT32; gen_no: THPDF_UINT16); cdecl; external libhpdf;
procedure HPDF_Encrypt_Reset(attr: THPDF_Encrypt); cdecl; external libhpdf;
procedure HPDF_Encrypt_CryptBuf(attr: THPDF_Encrypt; src: PHPDF_BYTE; dst: PHPDF_BYTE; len: THPDF_UINT); cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
