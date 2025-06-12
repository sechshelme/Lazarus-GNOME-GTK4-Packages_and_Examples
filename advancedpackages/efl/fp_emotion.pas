unit fp_emotion;

interface

uses
  efl,
  fp_eina,
  fp_evas,
  fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$DEFINE read_interface}
  {$include emotion-1/efl_canvas_video_eo.inc}
  {$include emotion-1/efl_canvas_video_eo_legacy.inc}
  {$include emotion-1/Emotion.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
  {$include emotion-1/efl_canvas_video_eo.inc}
  {$include emotion-1/efl_canvas_video_eo_legacy.inc}
  {$include emotion-1/Emotion.inc}
{$UNDEF read_implementation}

end.

