/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   09:55                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstFFTS16 = record
  end;
  PGstFFTS16 = ^TGstFFTS16;

  TGstFFTS16Complex = record
    r: Tgint16;
    i: Tgint16;
  end;
  PGstFFTS16Complex = ^TGstFFTS16Complex;

function gst_fft_s16_new(len: Tgint; inverse: Tgboolean): PGstFFTS16; cdecl; external libgstfft;
procedure gst_fft_s16_free(self: PGstFFTS16); cdecl; external libgstfft;
procedure gst_fft_s16_fft(self: PGstFFTS16; timedata: Pgint16; freqdata: PGstFFTS16Complex); cdecl; external libgstfft;
procedure gst_fft_s16_inverse_fft(self: PGstFFTS16; freqdata: PGstFFTS16Complex; timedata: Pgint16); cdecl; external libgstfft;
procedure gst_fft_s16_window(self: PGstFFTS16; timedata: Pgint16; window: TGstFFTWindow); cdecl; external libgstfft;

// === Konventiert am: 7-10-24 09:39:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
