unit fribidi_shape;

interface

uses
  fp_fribidi, fribidi_flags, fribidi_bidi_types, fribidi_types, fribidi_joining_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure fribidi_shape(flags: TFriBidiFlags; embedding_levels: PFriBidiLevel; len: TFriBidiStrIndex; ar_props: PFriBidiArabicProp; str: PFriBidiChar); cdecl; external libfribidi;

// === Konventiert am: 31-12-25 16:09:12 ===


implementation



end.
