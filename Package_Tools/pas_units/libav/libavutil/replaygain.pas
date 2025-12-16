unit replaygain;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVReplayGain = ^TAVReplayGain;

  TAVReplayGain = record
    track_gain: Tint32_t;
    track_peak: Tuint32_t;
    album_gain: Tint32_t;
    album_peak: Tuint32_t;
  end;

  // === Konventiert am: 14-12-25 17:37:08 ===


implementation



end.
