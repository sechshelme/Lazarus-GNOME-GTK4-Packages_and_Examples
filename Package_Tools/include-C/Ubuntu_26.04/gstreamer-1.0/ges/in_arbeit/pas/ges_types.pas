unit ges_types;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GES_PADDING = 4;
  GES_PADDING_LARGE = 20;

type
  PGESFrameNumber = ^TGESFrameNumber;
  TGESFrameNumber = Tgint64;

const
  GES_FRAME_NUMBER_NONE: Tgint64 = 9223372036854775807;
  GES_TYPE_FRAME_NUMBER = G_TYPE_UINT64;
  {$ENDIF read_enum}


  {$IFDEF read_struct}
type
    PGESAsset = type Pointer;
  PGESExtractable= type Pointer;
        PGESTimeline =type Pointer;
        PGESTrack=type Pointer;
        PGESLayer=type Pointer;
        PGESGroup=type Pointer;
        PGESTimelineElement=type Pointer;
          PGESProject = type Pointer;
          PGstEncodingProfile=type Pointer;
          PGESFormatter=type Pointer;






    {$ENDIF read_struct}


  // === Konventiert am: 28-7-26 13:18:02 ===

{$IFDEF read_function}
function GES_FRAME_NUMBER_IS_VALID(frames: Tgint64): boolean;
{$ENDIF read_function}

implementation

function GES_FRAME_NUMBER_IS_VALID(frames: Tgint64): boolean;
begin
  GES_FRAME_NUMBER_IS_VALID := TGESFrameNumber(frames) <> GES_FRAME_NUMBER_NONE;
end;

end.
