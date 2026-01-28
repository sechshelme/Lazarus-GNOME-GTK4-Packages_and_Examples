unit hpdf_encryptdict;

interface

uses
  fp_hpdf, hpdf, hpdf_encrypt, hpdf_types, hpdf_objects;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function HPDF_EncryptDict_New(mmgr: THPDF_MMgr; xref: THPDF_Xref): THPDF_EncryptDict; cdecl; external libhpdf;
procedure HPDF_EncryptDict_CreateID(dict: THPDF_EncryptDict; info: THPDF_Dict; xref: THPDF_Xref); cdecl; external libhpdf;
procedure HPDF_EncryptDict_OnFree(obj: THPDF_Dict); cdecl; external libhpdf;
function HPDF_EncryptDict_SetPassword(dict: THPDF_EncryptDict; owner_passwd: pchar; user_passwd: pchar): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EncryptDict_Validate(dict: THPDF_EncryptDict): THPDF_BOOL; cdecl; external libhpdf;
function HPDF_EncryptDict_Prepare(dict: THPDF_EncryptDict; info: THPDF_Dict; xref: THPDF_Xref): THPDF_STATUS; cdecl; external libhpdf;
function HPDF_EncryptDict_GetAttr(dict: THPDF_EncryptDict): THPDF_Encrypt; cdecl; external libhpdf;

// === Konventiert am: 28-1-26 14:02:20 ===


implementation



end.
