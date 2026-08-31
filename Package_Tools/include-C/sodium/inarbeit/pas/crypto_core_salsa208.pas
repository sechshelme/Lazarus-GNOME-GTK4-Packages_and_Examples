unit crypto_core_salsa208;

interface

uses
  fp_sodium;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef crypto_core_salsa208_H}
{$define crypto_core_salsa208_H}
{$include <stddef.h>}
{$include "export.h"}
{ C++ extern C conditionnal removed }

const
  crypto_core_salsa208_OUTPUTBYTES = 64;  
{     __attribute__ ((deprecated)) }
function crypto_core_salsa208_outputbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_salsa208_INPUTBYTES = 16;  
{     __attribute__ ((deprecated)) }
function crypto_core_salsa208_inputbytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_salsa208_KEYBYTES = 32;  
{     __attribute__ ((deprecated)) }
function crypto_core_salsa208_keybytes:Tsize_t;cdecl;external libsodium;
const
  crypto_core_salsa208_CONSTBYTES = 16;  
{     __attribute__ ((deprecated)) }
function crypto_core_salsa208_constbytes:Tsize_t;cdecl;external libsodium;
function crypto_core_salsa208(out:Pbyte; in:Pbyte; k:Pbyte; c:Pbyte):longint;cdecl;external libsodium;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 31-8-26 16:26:08 ===


implementation



end.
