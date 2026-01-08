unit signature;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function SignatureImage(para1: PImage): TMagickBooleanType; cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 19:23:18 ===


implementation



end.
