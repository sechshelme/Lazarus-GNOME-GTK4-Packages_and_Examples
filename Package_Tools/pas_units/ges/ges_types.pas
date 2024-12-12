unit ges_types;

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  GES_PADDING = 4;
  GES_PADDING_LARGE = 20;

  GES_FRAME_NUMBER_NONE = Tgint64(9223372036854775807);

type
  PGESFrameNumber = ^TGESFrameNumber;
  TGESFrameNumber = Tgint64;

function GES_FRAME_NUMBER_IS_VALID(frames: Tgint64): Tgboolean;

const
  GES_TYPE_FRAME_NUMBER = G_TYPE_UINT64;

  // === Konventiert am: 12-12-24 17:06:00 ===


implementation


function GES_FRAME_NUMBER_IS_VALID(frames: Tgint64): Tgboolean;
begin
  GES_FRAME_NUMBER_IS_VALID := (TGESFrameNumber(frames)) <> GES_FRAME_NUMBER_NONE;
end;


end.
