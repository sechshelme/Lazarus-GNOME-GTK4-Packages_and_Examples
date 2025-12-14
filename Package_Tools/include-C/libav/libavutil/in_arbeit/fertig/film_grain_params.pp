
unit film_grain_params;
interface

{
  Automatically converted by H2Pas 1.0.0 from film_grain_params.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    film_grain_params.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAVFilmGrainAOMParams  = ^AVFilmGrainAOMParams;
PAVFilmGrainH274Params  = ^AVFilmGrainH274Params;
PAVFilmGrainParams  = ^AVFilmGrainParams;
PAVFilmGrainParamsType  = ^AVFilmGrainParamsType;
PAVFrame  = ^AVFrame;
Psize_t  = ^size_t;
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
{$ifndef AVUTIL_FILM_GRAIN_PARAMS_H}
{$define AVUTIL_FILM_GRAIN_PARAMS_H}
{$include "frame.h"}
{*
     * The union is valid when interpreted as AVFilmGrainAOMParams (codec.aom)
      }
{*
     * The union is valid when interpreted as AVFilmGrainH274Params (codec.h274)
      }
type
  TAVFilmGrainParamsType =  Longint;
  Const
    AV_FILM_GRAIN_PARAMS_NONE = 0;
    AV_FILM_GRAIN_PARAMS_AV1 = 1;
    AV_FILM_GRAIN_PARAMS_H274 = 2;

{*
 * This structure describes how to handle film grain synthesis for AOM codecs.
 *
 * @note The struct must be allocated as part of AVFilmGrainParams using
 *       av_film_grain_params_alloc(). Its size is not a part of the public ABI.
  }
{*
     * Number of points, and the scale and value for each point of the
     * piecewise linear scaling function for the uma plane.
      }
{ value, scaling  }{*
     * Signals whether to derive the chroma scaling function from the luma.
     * Not equivalent to copying the luma values and scales.
      }
{*
     * If chroma_scaling_from_luma is set to 0, signals the chroma scaling
     * function parameters.
      }
{ cb, cr  }{ cb, cr  }{ value, scaling  }{*
     * Specifies the shift applied to the chroma components. For AV1, its within
     * [8; 11] and determines the range and quantization of the film grain.
      }
{*
     * Specifies the auto-regression lag.
      }
{*
     * Luma auto-regression coefficients. The number of coefficients is given by
     * 2 * ar_coeff_lag * (ar_coeff_lag + 1).
      }
{*
     * Chroma auto-regression coefficients. The number of coefficients is given by
     * 2 * ar_coeff_lag * (ar_coeff_lag + 1) + !!num_y_points.
      }
{ cb, cr  }{*
     * Specifies the range of the auto-regressive coefficients. Values of 6,
     * 7, 8 and so on represent a range of [-2, 2), [-1, 1), [-0.5, 0.5) and
     * so on. For AV1 must be between 6 and 9.
      }
{*
     * Signals the down shift applied to the generated gaussian numbers during
     * synthesis.
      }
{*
     * Specifies the luma/chroma multipliers for the index to the component
     * scaling function.
      }
{ cb, cr  }{ cb, cr  }{*
     * Offset used for component scaling function. For AV1 its a 9-bit value
     * with a range [-256, 255]
      }
{ cb, cr  }{*
     * Signals whether to overlap film grain blocks.
      }
{*
     * Signals to clip to limited color levels after film grain application.
      }
type
  PAVFilmGrainAOMParams = ^TAVFilmGrainAOMParams;
  TAVFilmGrainAOMParams = record
      num_y_points : longint;
      y_points : array[0..13] of array[0..1] of Tuint8_t;
      chroma_scaling_from_luma : longint;
      num_uv_points : array[0..1] of longint;
      uv_points : array[0..1] of array[0..9] of array[0..1] of Tuint8_t;
      scaling_shift : longint;
      ar_coeff_lag : longint;
      ar_coeffs_y : array[0..23] of Tint8_t;
      ar_coeffs_uv : array[0..1] of array[0..24] of Tint8_t;
      ar_coeff_shift : longint;
      grain_scale_shift : longint;
      uv_mult : array[0..1] of longint;
      uv_mult_luma : array[0..1] of longint;
      uv_offset : array[0..1] of longint;
      overlap_flag : longint;
      limit_output_range : longint;
    end;
{*
 * This structure describes how to handle film grain synthesis for codecs using
 * the ITU-T H.274 Versatile suplemental enhancement information message.
 *
 * @note The struct must be allocated as part of AVFilmGrainParams using
 *       av_film_grain_params_alloc(). Its size is not a part of the public ABI.
  }
{*
     * Specifies the film grain simulation mode.
     * 0 = Frequency filtering, 1 = Auto-regression
      }
{*
     * Specifies the bit depth used for the luma component.
      }
{*
     * Specifies the bit depth used for the chroma components.
      }
{*
     * Specifies the blending mode used to blend the simulated film grain
     * with the decoded images.
     *
     * 0 = Additive, 1 = Multiplicative
      }
{*
     * Specifies a scale factor used in the film grain characterization equations.
      }
{*
     * Indicates if the modelling of film grain for a given component is present.
      }
{ y, cb, cr  }{*
     * Specifies the number of intensity intervals for which a specific set of
     * model values has been estimated, with a range of [1, 256].
      }
{ y, cb, cr  }{*
     * Specifies the number of model values present for each intensity interval
     * in which the film grain has been modelled, with a range of [1, 6].
      }
{ y, cb, cr  }{*
     * Specifies the lower ounds of each intensity interval for whichthe set of
     * model values applies for the component.
      }
{ y, cb, cr  }{ intensity interval  }{*
     * Specifies the upper bound of each intensity interval for which the set of
     * model values applies for the component.
      }
{ y, cb, cr  }{ intensity interval  }{*
     * Specifies the model values for the component for each intensity interval.
     * - When model_id == 0, the following applies:
     *     For comp_model_value[y], the range of values is [0, 2^bit_depth_luma - 1]
     *     For comp_model_value[cb..cr], the range of values is [0, 2^bit_depth_chroma - 1]
     * - Otherwise, the following applies:
     *     For comp_model_value[y], the range of values is [-2^(bit_depth_luma - 1), 2^(bit_depth_luma - 1) - 1]
     *     For comp_model_value[cb..cr], the range of values is [-2^(bit_depth_chroma - 1), 2^(bit_depth_chroma - 1) - 1]
      }
{ y, cb, cr  }{ intensity interval  }{ model value  }
  PAVFilmGrainH274Params = ^TAVFilmGrainH274Params;
  TAVFilmGrainH274Params = record
      model_id : longint;
      bit_depth_luma : longint;
      bit_depth_chroma : longint;
      color_range : TAVColorRange;
      color_primaries : TAVColorPrimaries;
      color_trc : TAVColorTransferCharacteristic;
      color_space : TAVColorSpace;
      blending_mode_id : longint;
      log2_scale_factor : longint;
      component_model_present : array[0..2] of longint;
      num_intensity_intervals : array[0..2] of Tuint16_t;
      num_model_values : array[0..2] of Tuint8_t;
      intensity_interval_lower_bound : array[0..2] of array[0..255] of Tuint8_t;
      intensity_interval_upper_bound : array[0..2] of array[0..255] of Tuint8_t;
      comp_model_value : array[0..2] of array[0..255] of array[0..5] of Tint16_t;
    end;
{*
 * This structure describes how to handle film grain synthesis in video
 * for specific codecs. Must be present on every frame where film grain is
 * meant to be synthesised for correct presentation.
 *
 * @note The struct must be allocated with av_film_grain_params_alloc() and
 *       its size is not a part of the public ABI.
  }
{*
     * Specifies the codec for which this structure is valid.
      }
{*
     * Seed to use for the synthesis process, if the codec allows for it.
     *
     * @note For H.264, this refers to `pic_offset` as defined in
     *       SMPTE RDD 5-2006.
      }
{*
     * Additional fields may be added both here and in any structure included.
     * If a codec's film grain structure differs slightly over another
     * codec's, fields within may change meaning depending on the type.
      }

  PAVFilmGrainParams = ^TAVFilmGrainParams;
  TAVFilmGrainParams = record
      _type : TAVFilmGrainParamsType;
      seed : Tuint64_t;
      codec : record
          case longint of
            0 : ( aom : TAVFilmGrainAOMParams );
            1 : ( h274 : TAVFilmGrainH274Params );
          end;
    end;
{*
 * Allocate an AVFilmGrainParams structure and set its fields to
 * default values. The resulting struct can be freed using av_freep().
 * If size is not NULL it will be set to the number of bytes allocated.
 *
 * @return An AVFilmGrainParams filled with default values or NULL
 *         on failure.
  }

function av_film_grain_params_alloc(size:Psize_t):PAVFilmGrainParams;cdecl;external;
{*
 * Allocate a complete AVFilmGrainParams and add it to the frame.
 *
 * @param frame The frame which side data is added to.
 *
 * @return The AVFilmGrainParams structure to be filled by caller.
  }
function av_film_grain_params_create_side_data(frame:PAVFrame):PAVFilmGrainParams;cdecl;external;
{$endif}
{ AVUTIL_FILM_GRAIN_PARAMS_H  }

implementation


end.
