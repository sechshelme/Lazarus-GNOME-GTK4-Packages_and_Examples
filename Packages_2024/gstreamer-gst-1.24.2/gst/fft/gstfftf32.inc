
{$IFDEF read_interface}

type
  TGstFFTF32 = record
  end;
  PGstFFTF32 = ^TGstFFTF32;

  TGstFFTF32Complex = record
    r: Tgfloat;
    i: Tgfloat;
  end;
  PGstFFTF32Complex = ^TGstFFTF32Complex;

function gst_fft_f32_new(len: Tgint; inverse: Tgboolean): PGstFFTF32; cdecl; external libgstfft;
procedure gst_fft_f32_free(self: PGstFFTF32); cdecl; external libgstfft;
procedure gst_fft_f32_fft(self: PGstFFTF32; timedata: Pgfloat; freqdata: PGstFFTF32Complex); cdecl; external libgstfft;
procedure gst_fft_f32_inverse_fft(self: PGstFFTF32; freqdata: PGstFFTF32Complex; timedata: Pgfloat); cdecl; external libgstfft;
procedure gst_fft_f32_window(self: PGstFFTF32; timedata: Pgfloat; window: TGstFFTWindow); cdecl; external libgstfft;

// === Konventiert am: 7-10-24 09:39:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
