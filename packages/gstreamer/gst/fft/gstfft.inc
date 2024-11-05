/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   09:55                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstFFTWindow = ^TGstFFTWindow;
  TGstFFTWindow = longint;

const
  GST_FFT_WINDOW_RECTANGULAR = 0;
  GST_FFT_WINDOW_HAMMING = 1;
  GST_FFT_WINDOW_HANN = 2;
  GST_FFT_WINDOW_BARTLETT = 3;
  GST_FFT_WINDOW_BLACKMAN = 4;

function gst_fft_next_fast_length(n: Tgint): Tgint; cdecl; external libgstfft;

// === Konventiert am: 7-10-24 09:39:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
