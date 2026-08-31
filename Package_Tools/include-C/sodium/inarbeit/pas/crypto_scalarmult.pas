unit crypto_scalarmult;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_scalarmult_H}
{$define crypto_scalarmult_H}
{$include <stddef.h>}
{$include "crypto_scalarmult_curve25519.h"}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_scalarmult_BYTES = crypto_scalarmult_curve25519_BYTES;  

function crypto_scalarmult_bytes:Tsize_t;cdecl;external libsodium;
const
  crypto_scalarmult_SCALARBYTES = crypto_scalarmult_curve25519_SCALARBYTES;  

function crypto_scalarmult_scalarbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_scalarmult_PRIMITIVE = 'curve25519';  

function crypto_scalarmult_primitive:Pchar;cdecl;external libsodium;
function crypto_scalarmult_base(q:Pbyte; n:Pbyte):longint;cdecl;external libsodium;
{
 * NOTE: Do not use the result of this function directly for key exchange.
 *
 * Hash the result with the public keys in order to compute a shared
 * secret key: H(q || client_pk || server_pk)
 *
 * Or unless this is not an option, use the crypto_kx() API instead.
  }
function crypto_scalarmult(q:Pbyte; n:Pbyte; p:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 17:19:13 ===


implementation



end.
