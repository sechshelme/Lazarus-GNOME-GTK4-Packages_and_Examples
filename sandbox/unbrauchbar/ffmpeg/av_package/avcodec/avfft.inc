{$IFDEF read_interface}


type
  PFFTSample = ^TFFTSample;
  TFFTSample = single;

  TFFTComplex = record
    re: TFFTSample;
    im: TFFTSample;
  end;
  PFFTComplex = ^TFFTComplex;

  PFFTContext = type Pointer;

function av_fft_init(nbits: longint; inverse: longint): PFFTContext; cdecl; external libavcodec; deprecated;
procedure av_fft_permute(s: PFFTContext; z: PFFTComplex); cdecl; external libavcodec; deprecated;
procedure av_fft_calc(s: PFFTContext; z: PFFTComplex); cdecl; external libavcodec; deprecated;
procedure av_fft_end(s: PFFTContext); cdecl; external libavcodec; deprecated;
function av_mdct_init(nbits: longint; inverse: longint; scale: double): PFFTContext; cdecl; external libavcodec; deprecated;
procedure av_imdct_calc(s: PFFTContext; output: PFFTSample; input: PFFTSample); cdecl; external libavcodec; deprecated;
procedure av_imdct_half(s: PFFTContext; output: PFFTSample; input: PFFTSample); cdecl; external libavcodec; deprecated;
procedure av_mdct_calc(s: PFFTContext; output: PFFTSample; input: PFFTSample); cdecl; external libavcodec; deprecated;
procedure av_mdct_end(s: PFFTContext); cdecl; external libavcodec; deprecated;

type
  TRDFTransformType = longint;

const
  DFT_R2C = 0;
  IDFT_C2R = 1;
  IDFT_R2C = 2;
  DFT_C2R = 3;

type
  PRDFTContext = type Pointer;

function av_rdft_init(nbits: longint; trans: TRDFTransformType): PRDFTContext; cdecl; external libavcodec; deprecated;
procedure av_rdft_calc(s: PRDFTContext; data: PFFTSample); cdecl; external libavcodec; deprecated;
procedure av_rdft_end(s: PRDFTContext); cdecl; external libavcodec; deprecated;

type
  PDCTContext = type Pointer;

type
  TDCTTransformType = longint;

const
  DCT_II = 0;
  DCT_III = 1;
  DCT_I = 2;
  DST_I = 3;

function av_dct_init(nbits: longint; _type: TDCTTransformType): PDCTContext; cdecl; external libavcodec; deprecated;
procedure av_dct_calc(s: PDCTContext; data: PFFTSample); cdecl; external libavcodec; deprecated;
procedure av_dct_end(s: PDCTContext); cdecl; external libavcodec; deprecated;

// === Konventiert am: 19-12-25 17:10:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
