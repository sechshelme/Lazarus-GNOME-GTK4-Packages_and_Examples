unit chafa_image;

interface

uses
  fp_glib2, chafa_frame;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TChafaImage = record
  end;
  PChafaImage = ^TChafaImage;

function chafa_image_new: PChafaImage; cdecl; external libchafa;
procedure chafa_image_ref(image: PChafaImage); cdecl; external libchafa;
procedure chafa_image_unref(image: PChafaImage); cdecl; external libchafa;
procedure chafa_image_set_frame(image: PChafaImage; frame: PChafaFrame); cdecl; external libchafa;

// === Konventiert am: 29-1-25 19:08:08 ===


implementation



end.
