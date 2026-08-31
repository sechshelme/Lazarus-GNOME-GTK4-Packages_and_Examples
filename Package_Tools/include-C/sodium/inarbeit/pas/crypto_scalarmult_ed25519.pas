unit crypto_scalarmult_ed25519;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_scalarmult_ed25519_H}
{$define crypto_scalarmult_ed25519_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_scalarmult_ed25519_BYTES = 32;  

function crypto_scalarmult_ed25519_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_scalarmult_ed25519_SCALARBYTES = 32;  

function crypto_scalarmult_ed25519_scalarbytes:Tsize_t;cdecl;external libsodium;
{
 * NOTE: Do not use the result of this function directly for key exchange.
 *
 * Hash the result with the public keys in order to compute a shared
 * secret key: H(q || client_pk || server_pk)
 *
 * Or unless this is not an option, use the crypto_kx() API instead.
  }
function crypto_scalarmult_ed25519(q:Pbyte; n:Pbyte; p:Pbyte):longint;cdecl;external libsodium;
function crypto_scalarmult_ed25519_noclamp(q:Pbyte; n:Pbyte; p:Pbyte):longint;cdecl;external libsodium;
function crypto_scalarmult_ed25519_base(q:Pbyte; n:Pbyte):longint;cdecl;external libsodium;
function crypto_scalarmult_ed25519_base_noclamp(q:Pbyte; n:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:19:11 ===


implementation



end.
