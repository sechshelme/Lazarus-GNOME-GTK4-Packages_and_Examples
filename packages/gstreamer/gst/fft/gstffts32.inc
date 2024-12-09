
{$IFDEF read_interface}

type
  TGstFFTS32 = record
  end;
  PGstFFTS32 = ^TGstFFTS32;

  TGstFFTS32Complex = record
    r: Tgint32;
    i: Tgint32;
  end;
  PGstFFTS32Complex = ^TGstFFTS32Complex;

function gst_fft_s32_new(len: Tgint; inverse: Tgboolean): PGstFFTS32; cdecl; external libgstfft;
procedure gst_fft_s32_free(self: PGstFFTS32); cdecl; external libgstfft;
procedure gst_fft_s32_fft(self: PGstFFTS32; timedata: Pgint32; freqdata: PGstFFTS32Complex); cdecl; external libgstfft;
procedure gst_fft_s32_inverse_fft(self: PGstFFTS32; freqdata: PGstFFTS32Complex; timedata: Pgint32); cdecl; external libgstfft;
procedure gst_fft_s32_window(self: PGstFFTS32; timedata: Pgint32; window: TGstFFTWindow); cdecl; external libgstfft;

// === Konventiert am: 7-10-24 09:39:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
