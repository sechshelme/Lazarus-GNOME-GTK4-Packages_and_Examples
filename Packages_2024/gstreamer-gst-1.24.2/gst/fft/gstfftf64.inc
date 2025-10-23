
{$IFDEF read_interface}

type
  TGstFFTF64 = record
  end;
  PGstFFTF64 = ^TGstFFTF64;

  TGstFFTF64Complex = record
    r: Tgdouble;
    i: Tgdouble;
  end;
  PGstFFTF64Complex = ^TGstFFTF64Complex;

function gst_fft_f64_new(len: Tgint; inverse: Tgboolean): PGstFFTF64; cdecl; external libgstfft;
procedure gst_fft_f64_free(self: PGstFFTF64); cdecl; external libgstfft;
procedure gst_fft_f64_fft(self: PGstFFTF64; timedata: Pgdouble; freqdata: PGstFFTF64Complex); cdecl; external libgstfft;
procedure gst_fft_f64_inverse_fft(self: PGstFFTF64; freqdata: PGstFFTF64Complex; timedata: Pgdouble); cdecl; external libgstfft;
procedure gst_fft_f64_window(self: PGstFFTF64; timedata: Pgdouble; window: TGstFFTWindow); cdecl; external libgstfft;

// === Konventiert am: 7-10-24 09:39:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
