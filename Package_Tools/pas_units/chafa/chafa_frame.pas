unit chafa_frame;

interface

uses
  fp_glib2, chafa_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TChafaFrame = record
  end;
  PChafaFrame = ^TChafaFrame;

function chafa_frame_new(Data: Tgconstpointer; pixel_type: TChafaPixelType; Width: Tgint; Height: Tgint; rowstride: Tgint): PChafaFrame; cdecl; external libchafa;
function chafa_frame_new_steal(Data: Tgpointer; pixel_type: TChafaPixelType; Width: Tgint; Height: Tgint; rowstride: Tgint): PChafaFrame; cdecl; external libchafa;
function chafa_frame_new_borrow(Data: Tgpointer; pixel_type: TChafaPixelType; Width: Tgint; Height: Tgint; rowstride: Tgint): PChafaFrame; cdecl; external libchafa;
procedure chafa_frame_ref(frame: PChafaFrame); cdecl; external libchafa;
procedure chafa_frame_unref(frame: PChafaFrame); cdecl; external libchafa;

// === Konventiert am: 29-1-25 19:11:13 ===


implementation



end.
