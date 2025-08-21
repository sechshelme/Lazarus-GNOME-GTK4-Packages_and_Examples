unit gsl_message;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure gsl_message(message: pchar; file_: pchar; line: longint; mask: dword); cdecl; external libgsl;

const
  GSL_MESSAGE_MASK_ = $ffffffff;

var
  gsl_message_mask: dword; cvar;external libgsl;

const
  GSL_MESSAGE_MASK_A = 1;
  GSL_MESSAGE_MASK_B = 2;
  GSL_MESSAGE_MASK_C = 4;
  GSL_MESSAGE_MASK_D = 8;
  GSL_MESSAGE_MASK_E = 16;
  GSL_MESSAGE_MASK_F = 32;
  GSL_MESSAGE_MASK_G = 64;
  GSL_MESSAGE_MASK_H = 128;

  // === Konventiert am: 21-8-25 19:10:13 ===


implementation



end.
