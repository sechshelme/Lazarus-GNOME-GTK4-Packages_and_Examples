unit gprimes;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function g_spaced_primes_closest(num: Tguint): Tguint; cdecl; external libglib2;

// === Konventiert am: 22-6-26 17:16:45 ===


implementation



end.
