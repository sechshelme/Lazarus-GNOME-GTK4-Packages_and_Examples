unit fribidi_types;

interface

uses
  fp_fribidi;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pfribidi_boolean = ^Tfribidi_boolean;
  Tfribidi_boolean = longint;

  PFriBidiChar = ^TFriBidiChar;
  TFriBidiChar = Tuint32_t;

  PFriBidiStrIndex = ^TFriBidiStrIndex;
  TFriBidiStrIndex = longint;

  PFriBidiBracketType = ^TFriBidiBracketType;
  TFriBidiBracketType = TFriBidiChar;

const
  FRIBIDI_NO_BRACKET = 0;


  // === Konventiert am: 31-12-25 16:09:14 ===


implementation


end.
