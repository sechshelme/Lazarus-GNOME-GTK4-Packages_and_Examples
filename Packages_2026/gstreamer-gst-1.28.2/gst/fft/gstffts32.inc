{$IFDEF read_interface}


type
  PGstFFTS32 = type Pointer;

  PGstFFTS32Complex = ^TGstFFTS32Complex;
  TGstFFTS32Complex = record
    r: Tgint32;
    i: Tgint32;
  end;

function gst_fft_s32_new(len: Tgint; inverse: Tgboolean): PGstFFTS32; cdecl; external libgstfft;
procedure gst_fft_s32_free(self: PGstFFTS32); cdecl; external libgstfft;
procedure gst_fft_s32_fft(self: PGstFFTS32; timedata: Pgint32; freqdata: PGstFFTS32Complex); cdecl; external libgstfft;
procedure gst_fft_s32_inverse_fft(self: PGstFFTS32; freqdata: PGstFFTS32Complex; timedata: Pgint32); cdecl; external libgstfft;
procedure gst_fft_s32_window(self: PGstFFTS32; timedata: Pgint32; window: TGstFFTWindow); cdecl; external libgstfft;

// === Konventiert am: 26-7-26 16:54:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
