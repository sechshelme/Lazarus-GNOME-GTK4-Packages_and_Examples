{$IFDEF read_interface}


type
  PGstFFTF64 = type Pointer;

  PGstFFTF64Complex = ^TGstFFTF64Complex;
  TGstFFTF64Complex = record
    r: Tgdouble;
    i: Tgdouble;
  end;

function gst_fft_f64_new(len: Tgint; inverse: Tgboolean): PGstFFTF64; cdecl; external libgstfft;
procedure gst_fft_f64_free(self: PGstFFTF64); cdecl; external libgstfft;
procedure gst_fft_f64_fft(self: PGstFFTF64; timedata: Pgdouble; freqdata: PGstFFTF64Complex); cdecl; external libgstfft;
procedure gst_fft_f64_inverse_fft(self: PGstFFTF64; freqdata: PGstFFTF64Complex; timedata: Pgdouble); cdecl; external libgstfft;
procedure gst_fft_f64_window(self: PGstFFTF64; timedata: Pgdouble; window: TGstFFTWindow); cdecl; external libgstfft;

// === Konventiert am: 26-7-26 16:54:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
