unit ghmac;

interface

uses
  common_GLIB, gtypes, gchecksum, garray;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGHmac = type Pointer;

function g_hmac_new(digest_type: TGChecksumType; key: Pguchar; key_len: Tgsize): PGHmac; cdecl; external libglib2;
function g_hmac_copy(hmac: PGHmac): PGHmac; cdecl; external libglib2;
function g_hmac_ref(hmac: PGHmac): PGHmac; cdecl; external libglib2;
procedure g_hmac_unref(hmac: PGHmac); cdecl; external libglib2;
procedure g_hmac_update(hmac: PGHmac; data: Pguchar; length: Tgssize); cdecl; external libglib2;
function g_hmac_get_string(hmac: PGHmac): Pgchar; cdecl; external libglib2;
procedure g_hmac_get_digest(hmac: PGHmac; buffer: Pguint8; digest_len: Pgsize); cdecl; external libglib2;
function g_compute_hmac_for_data(digest_type: TGChecksumType; key: Pguchar; key_len: Tgsize; data: Pguchar; length: Tgsize): Pgchar; cdecl; external libglib2;
function g_compute_hmac_for_string(digest_type: TGChecksumType; key: Pguchar; key_len: Tgsize; str: Pgchar; length: Tgssize): Pgchar; cdecl; external libglib2;
function g_compute_hmac_for_bytes(digest_type: TGChecksumType; key: PGBytes; data: PGBytes): Pgchar; cdecl; external libglib2;

// === Konventiert am: 22-6-26 16:36:06 ===


implementation



end.
