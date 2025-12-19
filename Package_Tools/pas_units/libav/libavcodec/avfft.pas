unit avfft;

interface

uses
  fp_ffmpeg;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVCODEC_AVFFT_H}
{$define AVCODEC_AVFFT_H}
{$include "libavutil/attributes.h"}
{$include "version_major.h"}
{$if FF_API_AVFFT}
{*
 * @file
 * @ingroup lavc_fft
 * FFT functions
  }
{*
 * @defgroup lavc_fft FFT functions
 * @ingroup lavc_misc
 *
 * @
  }
type
  PFFTSample = ^TFFTSample;
  TFFTSample = single;

  PFFTComplex = ^TFFTComplex;
  TFFTComplex = record
      re : TFFTSample;
      im : TFFTSample;
    end;
{*
 * Set up a complex FFT.
 * @param nbits           log2 of the length of the input array
 * @param inverse         if 0 perform the forward transform, if 1 perform the inverse
 * @deprecated use av_tx_init from libavutil/tx.h with a type of AV_TX_FLOAT_FFT
  }
{xxxxxxxxxx attribute_deprecated }

function av_fft_init(nbits:longint; inverse:longint):PFFTContext;cdecl;external libavcodec;
{*
 * Do the permutation needed BEFORE calling ff_fft_calc().
 * @deprecated without replacement
  }
{xxxxxxxxxx attribute_deprecated }
procedure av_fft_permute(s:PFFTContext; z:PFFTComplex);cdecl;external libavcodec;
{*
 * Do a complex FFT with the parameters defined in av_fft_init(). The
 * input data must be permuted before. No 1.0/sqrt(n) normalization is done.
 * @deprecated use the av_tx_fn value returned by av_tx_init, which also does permutation
  }
{xxxxxxxxxx attribute_deprecated }
procedure av_fft_calc(s:PFFTContext; z:PFFTComplex);cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_fft_end(s:PFFTContext);cdecl;external libavcodec;
{*
 * @deprecated use av_tx_init from libavutil/tx.h with a type of AV_TX_FLOAT_MDCT,
 * with a flag of AV_TX_FULL_IMDCT for a replacement to av_imdct_calc.
  }
{xxxxxxxxxx attribute_deprecated }
function av_mdct_init(nbits:longint; inverse:longint; scale:Tdouble):PFFTContext;cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_imdct_calc(s:PFFTContext; output:PFFTSample; input:PFFTSample);cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_imdct_half(s:PFFTContext; output:PFFTSample; input:PFFTSample);cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_mdct_calc(s:PFFTContext; output:PFFTSample; input:PFFTSample);cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_mdct_end(s:PFFTContext);cdecl;external libavcodec;
{ Real Discrete Fourier Transform  }
type
  TRDFTransformType =  Longint;
  Const
    DFT_R2C = 0;
    IDFT_C2R = 1;
    IDFT_R2C = 2;
    DFT_C2R = 3;

type
{*
 * Set up a real FFT.
 * @param nbits           log2 of the length of the input array
 * @param trans           the type of transform
 *
 * @deprecated use av_tx_init from libavutil/tx.h with a type of AV_TX_FLOAT_RDFT
  }
{xxxxxxxxxx attribute_deprecated }

function av_rdft_init(nbits:longint; trans:TRDFTransformType):PRDFTContext;cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_rdft_calc(s:PRDFTContext; data:PFFTSample);cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_rdft_end(s:PRDFTContext);cdecl;external libavcodec;
{ Discrete Cosine Transform  }
type
  TDCTTransformType =  Longint;
  Const
    DCT_II = 0;
    DCT_III = 1;
    DCT_I = 2;
    DST_I = 3;

{*
 * Set up DCT.
 *
 * @param nbits           size of the input array:
 *                        (1 << nbits)     for DCT-II, DCT-III and DST-I
 *                        (1 << nbits) + 1 for DCT-I
 * @param type            the type of transform
 *
 * @note the first element of the input of DST-I is ignored
 *
 * @deprecated use av_tx_init from libavutil/tx.h with an appropriate type of AV_TX_FLOAT_DCT
  }
{xxxxxxxxxx attribute_deprecated }

function av_dct_init(nbits:longint; _type:TDCTTransformType):PDCTContext;cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_dct_calc(s:PDCTContext; data:PFFTSample);cdecl;external libavcodec;
{xxxxxxxxxx attribute_deprecated }
procedure av_dct_end(s:PDCTContext);cdecl;external libavcodec;
{*
 * @
  }
{$endif}
{ FF_API_AVFFT  }
{$endif}
{ AVCODEC_AVFFT_H  }

// === Konventiert am: 19-12-25 17:10:01 ===


implementation



end.
