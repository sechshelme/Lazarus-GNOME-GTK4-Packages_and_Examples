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
                       PGESTimeline=type Pointer;
                    PGESLayer=type Pointer;
                              PGESTimelineElement=type Pointer;
                        PGESContainer=type Pointer;
                   PGESClip=type Pointer;
                            PGESOperationClip=type Pointer;
                       PGESPipeline=type Pointer;
                         PGESSourceClip=type Pointer;
                             PGESBaseEffectClip=type Pointer;
                      PGESUriClip=type Pointer;
                                 PGESBaseTransitionClip=type Pointer;
                             PGESTransitionClip=type Pointer;
                       PGESTestClip=type Pointer;
                        PGESTitleClip=type Pointer;
                          PGESOverlayClip=type Pointer;
                              PGESTextOverlayClip=type Pointer;
                         PGESEffectClip=type Pointer;
                    PGESGroup=type Pointer;
                    PGESTrack=type Pointer;
                           PGESTrackElement=type Pointer;
                     PGESSource=type Pointer;
                        PGESOperation=type Pointer;
                         PGESBaseEffect=type Pointer;
                     PGESEffect=type Pointer;
                          PGESVideoSource=type Pointer;
                          PGESAudioSource=type Pointer;
                             PGESVideoUriSource=type Pointer;
                             PGESAudioUriSource=type Pointer;
                          PGESImageSource=type Pointer;
                              PGESMultiFileSource=type Pointer;
                         PGESTransition=type Pointer;
                              PGESAudioTransition=type Pointer;
                              PGESVideoTransition=type Pointer;
                              PGESVideoTestSource=type Pointer;
                              PGESAudioTestSource=type Pointer;
                          PGESTitleSource=type Pointer;
                          PGESTextOverlay=type Pointer;
                        PGESFormatter=type Pointer;
                              PGESPitiviFormatter=type Pointer;
                    PGESAsset=type Pointer;
                        PGESClipAsset=type Pointer;
                           PGESUriClipAsset=type Pointer;
                                PGESTrackElementAsset=type Pointer;
                             PGESUriSourceAsset=type Pointer;
                      PGESProject=type Pointer;
                          PGESExtractable=type Pointer;
                         PGESVideoTrack=type Pointer;
                         PGESAudioTrack=type Pointer;
                         PGESMarkerList=type Pointer;
                     PGESMarker=type Pointer;
                          PGESEffectAsset=type Pointer;
                           PGESXmlFormatter=type Pointer;
                                PGESDiscovererManager=type Pointer;










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
