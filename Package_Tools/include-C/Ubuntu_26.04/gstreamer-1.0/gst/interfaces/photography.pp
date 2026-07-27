
unit photography;
interface

{
  Automatically converted by H2Pas 1.0.0 from photography.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    photography
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
Pgfloat  = ^gfloat;
PGstCaps  = ^GstCaps;
PGstPhotography  = ^GstPhotography;
PGstPhotographyCaps  = ^GstPhotographyCaps;
PGstPhotographyColorToneMode  = ^GstPhotographyColorToneMode;
PGstPhotographyExposureMode  = ^GstPhotographyExposureMode;
PGstPhotographyFlashMode  = ^GstPhotographyFlashMode;
PGstPhotographyFlickerReductionMode  = ^GstPhotographyFlickerReductionMode;
PGstPhotographyFocusMode  = ^GstPhotographyFocusMode;
PGstPhotographyFocusStatus  = ^GstPhotographyFocusStatus;
PGstPhotographyInterface  = ^GstPhotographyInterface;
PGstPhotographyNoiseReduction  = ^GstPhotographyNoiseReduction;
PGstPhotographySceneMode  = ^GstPhotographySceneMode;
PGstPhotographySettings  = ^GstPhotographySettings;
PGstPhotographyShakeRisk  = ^GstPhotographyShakeRisk;
PGstPhotographyWhiteBalanceMode  = ^GstPhotographyWhiteBalanceMode;
Pguint  = ^guint;
Pguint32  = ^guint32;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 *
 * Copyright (C) 2008 Nokia Corporation <multimedia@maemo.org>
 *
 * photography.h: photography interface for digital imaging
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_PHOTOGRAPHY_H__}
{$define __GST_PHOTOGRAPHY_H__}
{$include <gst/gst.h>}
{$include <gst/interfaces/photography-prelude.h>}
{$include <gst/interfaces/photography-enumtypes.h>}

{ was #define dname def_expr }
function GST_TYPE_PHOTOGRAPHY : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PHOTOGRAPHY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PHOTOGRAPHY(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PHOTOGRAPHY_GET_INTERFACE(inst : longint) : longint;

{*
 * GST_PHOTOGRAPHY_AUTOFOCUS_DONE:
 *
 * Name of custom GstMessage that will be posted to #GstBus when autofocusing
 * is complete.
 * This message contains following fields:
 *
 * * `status` (#GstPhotographyFocusStatus): Tells if focusing succeeded or failed.
 *
 * * `focus-window-rows` (#G_TYPE_INT): Tells number of focus matrix rows.
 *
 * * `focus-window-columns` (#G_TYPE_INT): Tells number of focus matrix columns.
 *
 * * `focus-window-mask` (#G_TYPE_INT): Bitmask containing rows x columns bits
 *   which mark the focus points in the focus matrix. Lowest bit (LSB) always
 *   represents the top-left corner of the focus matrix. This field is only valid
 *   when focusing status is SUCCESS.
  }
const
  GST_PHOTOGRAPHY_AUTOFOCUS_DONE = 'autofocus-done';  
{*
 * GST_PHOTOGRAPHY_SHAKE_RISK:
 *
 * Name of custom GstMessage that is posted to #GstBus during autofocusing
 * process. It is posted if there is change in the risk of captured image
 * becoming "shaken" due to camera movement and too long exposure time.
 *
 * This message contains following fields:
 *
 * * `status` (#GstPhotographyShakeRisk): Tells risk level of capturing shaken image.
  }
  GST_PHOTOGRAPHY_SHAKE_RISK = 'shake-risk';  
{ Maximum white point values used in #GstPhotographySettings  }
  MAX_WHITE_POINT_VALUES = 4;  
{ Interface property names  }
  GST_PHOTOGRAPHY_PROP_WB_MODE = 'white-balance-mode';  
  GST_PHOTOGRAPHY_PROP_COLOR_TONE = 'color-tone-mode';  
  GST_PHOTOGRAPHY_PROP_SCENE_MODE = 'scene-mode';  
  GST_PHOTOGRAPHY_PROP_FLASH_MODE = 'flash-mode';  
  GST_PHOTOGRAPHY_PROP_NOISE_REDUCTION = 'noise-reduction';  
  GST_PHOTOGRAPHY_PROP_FOCUS_STATUS = 'focus-status';  
  GST_PHOTOGRAPHY_PROP_CAPABILITIES = 'capabilities';  
  GST_PHOTOGRAPHY_PROP_SHAKE_RISK = 'shake-risk';  
  GST_PHOTOGRAPHY_PROP_EV_COMP = 'ev-compensation';  
  GST_PHOTOGRAPHY_PROP_ISO_SPEED = 'iso-speed';  
  GST_PHOTOGRAPHY_PROP_APERTURE = 'aperture';  
  GST_PHOTOGRAPHY_PROP_EXPOSURE_TIME = 'exposure-time';  
  GST_PHOTOGRAPHY_PROP_IMAGE_CAPTURE_SUPPORTED_CAPS = 'image-capture-supported-caps';  
  GST_PHOTOGRAPHY_PROP_IMAGE_PREVIEW_SUPPORTED_CAPS = 'image-preview-supported-caps';  
  GST_PHOTOGRAPHY_PROP_FLICKER_MODE = 'flicker-mode';  
  GST_PHOTOGRAPHY_PROP_FOCUS_MODE = 'focus-mode';  
  GST_PHOTOGRAPHY_PROP_ZOOM = 'zoom';  
  GST_PHOTOGRAPHY_PROP_COLOR_TEMPERATURE = 'color-temperature';  
  GST_PHOTOGRAPHY_PROP_WHITE_POINT = 'white-point';  
  GST_PHOTOGRAPHY_PROP_ANALOG_GAIN = 'analog-gain';  
  GST_PHOTOGRAPHY_PROP_EXPOSURE_MODE = 'exposure-mode';  
  GST_PHOTOGRAPHY_PROP_LENS_FOCUS = 'lens-focus';  
  GST_PHOTOGRAPHY_PROP_MIN_EXPOSURE_TIME = 'min-exposure-time';  
  GST_PHOTOGRAPHY_PROP_MAX_EXPOSURE_TIME = 'max-exposure-time';  
{*
 * GstPhotography:
 *
 * Opaque #GstPhotography data structure.
  }
type
{*
 * GstPhotographyNoiseReduction:
 * @GST_PHOTOGRAPHY_NOISE_REDUCTION_BAYER: Adaptive noise reduction on Bayer
 * format
 * @GST_PHOTOGRAPHY_NOISE_REDUCTION_YCC: reduces the noise on Y and 2-chroma
 * images.
 * @GST_PHOTOGRAPHY_NOISE_REDUCTION_TEMPORAL: Multi-frame adaptive NR,
 * provided for the video mode
 * @GST_PHOTOGRAPHY_NOISE_REDUCTION_FIXED: Fixed Pattern Noise refers to noise
 * that does not change between frames. The noise is removed from the sensor
 * image, by subtracting a previously-captured black image in memory.
 * @GST_PHOTOGRAPHY_NOISE_REDUCTION_EXTRA: Extra Noise Reduction. In the case
 * of high-ISO capturing, some noise remains after YCC NR. XNR reduces this
 * remaining noise.
 *
 * Noise Reduction features of a photography capture or filter element.
  }

  PGstPhotographyNoiseReduction = ^TGstPhotographyNoiseReduction;
  TGstPhotographyNoiseReduction =  Longint;
  Const
    GST_PHOTOGRAPHY_NOISE_REDUCTION_BAYER = 1 shl 0;
    GST_PHOTOGRAPHY_NOISE_REDUCTION_YCC = 1 shl 1;
    GST_PHOTOGRAPHY_NOISE_REDUCTION_TEMPORAL = 1 shl 2;
    GST_PHOTOGRAPHY_NOISE_REDUCTION_FIXED = 1 shl 3;
    GST_PHOTOGRAPHY_NOISE_REDUCTION_EXTRA = 1 shl 4;
;
{*
 * GstPhotographyWhiteBalanceMode:
 * @GST_PHOTOGRAPHY_WB_MODE_AUTO: Choose white balance mode automatically
 * @GST_PHOTOGRAPHY_WB_MODE_DAYLIGHT: Mode for daylight conditions
 * @GST_PHOTOGRAPHY_WB_MODE_CLOUDY: Mode for cloudy conditions
 * @GST_PHOTOGRAPHY_WB_MODE_SUNSET: Mode for sunset conditions
 * @GST_PHOTOGRAPHY_WB_MODE_TUNGSTEN: Mode for tungsten lighting
 * @GST_PHOTOGRAPHY_WB_MODE_FLUORESCENT: Mode for fluorescent lighting
 * @GST_PHOTOGRAPHY_WB_MODE_MANUAL: Disable automatic white balance adjustment
 * and keep current values.
 * @GST_PHOTOGRAPHY_WB_MODE_WARM_FLUORESCENT: Mode for warm fluorescent lighting (Since: 1.2)
 * @GST_PHOTOGRAPHY_WB_MODE_SHADE: Mode for shade lighting (Since: 1.2)
 *
 * Modes for white balance control.
  }
type
  PGstPhotographyWhiteBalanceMode = ^TGstPhotographyWhiteBalanceMode;
  TGstPhotographyWhiteBalanceMode =  Longint;
  Const
    GST_PHOTOGRAPHY_WB_MODE_AUTO = 0;
    GST_PHOTOGRAPHY_WB_MODE_DAYLIGHT = 1;
    GST_PHOTOGRAPHY_WB_MODE_CLOUDY = 2;
    GST_PHOTOGRAPHY_WB_MODE_SUNSET = 3;
    GST_PHOTOGRAPHY_WB_MODE_TUNGSTEN = 4;
    GST_PHOTOGRAPHY_WB_MODE_FLUORESCENT = 5;
    GST_PHOTOGRAPHY_WB_MODE_MANUAL = 6;
    GST_PHOTOGRAPHY_WB_MODE_WARM_FLUORESCENT = 7;
    GST_PHOTOGRAPHY_WB_MODE_SHADE = 8;
;
{*
 * GstPhotographyColorToneMode:
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_NORMAL: No effects
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_SEPIA: Sepia
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_NEGATIVE: Negative
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_GRAYSCALE: Grayscale
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_NATURAL: Natural
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_VIVID: Vivid
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_COLORSWAP: Colorswap
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_SOLARIZE: Solarize
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_OUT_OF_FOCUS: Out of focus
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKY_BLUE: Sky blue
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_GRASS_GREEN: Grass green
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKIN_WHITEN: Skin whiten
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_POSTERIZE: Posterize (Since: 1.2)
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_WHITEBOARD: Whiteboard (Since: 1.2)
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_BLACKBOARD: Blackboard (Since: 1.2)
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_AQUA: Aqua (Since: 1.2)
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_EMBOSS: Emboss (Since: 1.18)
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKETCH: Sketch (Since: 1.18)
 * @GST_PHOTOGRAPHY_COLOR_TONE_MODE_NEON: Neon (Since: 1.18)
 *
 *
 * Modes for special color effects.
  }
type
  PGstPhotographyColorToneMode = ^TGstPhotographyColorToneMode;
  TGstPhotographyColorToneMode =  Longint;
  Const
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_NORMAL = 0;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_SEPIA = 1;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_NEGATIVE = 2;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_GRAYSCALE = 3;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_NATURAL = 4;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_VIVID = 5;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_COLORSWAP = 6;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_SOLARIZE = 7;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_OUT_OF_FOCUS = 8;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKY_BLUE = 9;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_GRASS_GREEN = 10;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKIN_WHITEN = 11;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_POSTERIZE = 12;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_WHITEBOARD = 13;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_BLACKBOARD = 14;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_AQUA = 15;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_EMBOSS = 16;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_SKETCH = 17;
    GST_PHOTOGRAPHY_COLOR_TONE_MODE_NEON = 18;
;
{*
 * GstPhotographySceneMode:
 * @GST_PHOTOGRAPHY_SCENE_MODE_MANUAL: Set individual options manually
 * @GST_PHOTOGRAPHY_SCENE_MODE_CLOSEUP: Mode for close objects
 * @GST_PHOTOGRAPHY_SCENE_MODE_PORTRAIT: Mode for portraits
 * @GST_PHOTOGRAPHY_SCENE_MODE_LANDSCAPE: Mode for landscapes
 * @GST_PHOTOGRAPHY_SCENE_MODE_SPORT: Mode for scene with fast motion
 * @GST_PHOTOGRAPHY_SCENE_MODE_NIGHT: Mode for night conditions
 * @GST_PHOTOGRAPHY_SCENE_MODE_AUTO: Choose scene mode automatically
 * @GST_PHOTOGRAPHY_SCENE_MODE_ACTION: Take photos of fast moving
 *     objects (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_NIGHT_PORTRAIT: Take people pictures
 *     at night (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_THEATRE: Take photos in a theater (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_BEACH: Take pictures on the beach (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_SNOW: Take pictures on the snow (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_SUNSET: Take sunset photos (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_STEADY_PHOTO: Avoid blurry pictures
 *     (for example, due to hand shake) (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_FIREWORKS: For shooting firework
 *     displays (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_PARTY: Take indoor low-light shot (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_CANDLELIGHT: Capture the naturally warm color
 *     of scenes lit by candles (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_BARCODE: Applications are looking for
 *     a barcode (Since: 1.2)
 * @GST_PHOTOGRAPHY_SCENE_MODE_BACKLIGHT: Backlit photos (Since: 1.18)
 * @GST_PHOTOGRAPHY_SCENE_MODE_FLOWERS: For shooting flowers (Since: 1.18)
 * @GST_PHOTOGRAPHY_SCENE_MODE_AR: Specific for Augmented Reality (Since: 1.18)
 * @GST_PHOTOGRAPHY_SCENE_MODE_HDR: High Dynamic Range photography (Since: 1.18)
 *
 * Each mode contains preset #GstPhotography options in order to produce
 * good capturing result in certain scene.
  }
type
  PGstPhotographySceneMode = ^TGstPhotographySceneMode;
  TGstPhotographySceneMode =  Longint;
  Const
    GST_PHOTOGRAPHY_SCENE_MODE_MANUAL = 0;
    GST_PHOTOGRAPHY_SCENE_MODE_CLOSEUP = 1;
    GST_PHOTOGRAPHY_SCENE_MODE_PORTRAIT = 2;
    GST_PHOTOGRAPHY_SCENE_MODE_LANDSCAPE = 3;
    GST_PHOTOGRAPHY_SCENE_MODE_SPORT = 4;
    GST_PHOTOGRAPHY_SCENE_MODE_NIGHT = 5;
    GST_PHOTOGRAPHY_SCENE_MODE_AUTO = 6;
    GST_PHOTOGRAPHY_SCENE_MODE_ACTION = 7;
    GST_PHOTOGRAPHY_SCENE_MODE_NIGHT_PORTRAIT = 8;
    GST_PHOTOGRAPHY_SCENE_MODE_THEATRE = 9;
    GST_PHOTOGRAPHY_SCENE_MODE_BEACH = 10;
    GST_PHOTOGRAPHY_SCENE_MODE_SNOW = 11;
    GST_PHOTOGRAPHY_SCENE_MODE_SUNSET = 12;
    GST_PHOTOGRAPHY_SCENE_MODE_STEADY_PHOTO = 13;
    GST_PHOTOGRAPHY_SCENE_MODE_FIREWORKS = 14;
    GST_PHOTOGRAPHY_SCENE_MODE_PARTY = 15;
    GST_PHOTOGRAPHY_SCENE_MODE_CANDLELIGHT = 16;
    GST_PHOTOGRAPHY_SCENE_MODE_BARCODE = 17;
    GST_PHOTOGRAPHY_SCENE_MODE_BACKLIGHT = 18;
    GST_PHOTOGRAPHY_SCENE_MODE_FLOWERS = 19;
    GST_PHOTOGRAPHY_SCENE_MODE_AR = 20;
    GST_PHOTOGRAPHY_SCENE_MODE_HDR = 21;
;
{*
 * GstPhotographyFlashMode:
 * @GST_PHOTOGRAPHY_FLASH_MODE_AUTO: Fire flash automatically according to
 * lighting conditions.
 * @GST_PHOTOGRAPHY_FLASH_MODE_OFF: Never fire flash
 * @GST_PHOTOGRAPHY_FLASH_MODE_ON: Always fire flash
 * @GST_PHOTOGRAPHY_FLASH_MODE_FILL_IN: Fill in flash
 * @GST_PHOTOGRAPHY_FLASH_MODE_RED_EYE: Flash mode for reducing chance of
 * capturing red eyes
 *
 * Modes for flash control.
  }
type
  PGstPhotographyFlashMode = ^TGstPhotographyFlashMode;
  TGstPhotographyFlashMode =  Longint;
  Const
    GST_PHOTOGRAPHY_FLASH_MODE_AUTO = 0;
    GST_PHOTOGRAPHY_FLASH_MODE_OFF = 1;
    GST_PHOTOGRAPHY_FLASH_MODE_ON = 2;
    GST_PHOTOGRAPHY_FLASH_MODE_FILL_IN = 3;
    GST_PHOTOGRAPHY_FLASH_MODE_RED_EYE = 4;
;
{*
 * GstPhotographyFocusStatus:
 * @GST_PHOTOGRAPHY_FOCUS_STATUS_NONE: No status available
 * @GST_PHOTOGRAPHY_FOCUS_STATUS_RUNNING: Focusing is ongoing
 * @GST_PHOTOGRAPHY_FOCUS_STATUS_FAIL: Focusing failed
 * @GST_PHOTOGRAPHY_FOCUS_STATUS_SUCCESS: Focusing succeeded
 *
 * Status of the focusing operation, used in #GST_PHOTOGRAPHY_AUTOFOCUS_DONE
 * message.
  }
type
  PGstPhotographyFocusStatus = ^TGstPhotographyFocusStatus;
  TGstPhotographyFocusStatus =  Longint;
  Const
    GST_PHOTOGRAPHY_FOCUS_STATUS_NONE = 0;
    GST_PHOTOGRAPHY_FOCUS_STATUS_RUNNING = 1;
    GST_PHOTOGRAPHY_FOCUS_STATUS_FAIL = 2;
    GST_PHOTOGRAPHY_FOCUS_STATUS_SUCCESS = 3;
;
{*
 * GstPhotographyCaps:
 *
 * Bitmask that indicates which #GstPhotography interface features an instance
 * supports.
  }
type
  PGstPhotographyCaps = ^TGstPhotographyCaps;
  TGstPhotographyCaps =  Longint;
  Const
    GST_PHOTOGRAPHY_CAPS_NONE = 0 shl 0;
    GST_PHOTOGRAPHY_CAPS_EV_COMP = 1 shl 0;
    GST_PHOTOGRAPHY_CAPS_ISO_SPEED = 1 shl 1;
    GST_PHOTOGRAPHY_CAPS_WB_MODE = 1 shl 2;
    GST_PHOTOGRAPHY_CAPS_TONE = 1 shl 3;
    GST_PHOTOGRAPHY_CAPS_SCENE = 1 shl 4;
    GST_PHOTOGRAPHY_CAPS_FLASH = 1 shl 5;
    GST_PHOTOGRAPHY_CAPS_ZOOM = 1 shl 6;
    GST_PHOTOGRAPHY_CAPS_FOCUS = 1 shl 7;
    GST_PHOTOGRAPHY_CAPS_APERTURE = 1 shl 8;
    GST_PHOTOGRAPHY_CAPS_EXPOSURE = 1 shl 9;
    GST_PHOTOGRAPHY_CAPS_SHAKE = 1 shl 10;
    GST_PHOTOGRAPHY_CAPS_WHITE_BALANCE = 1 shl 11;
    GST_PHOTOGRAPHY_CAPS_NOISE_REDUCTION = 1 shl 12;
    GST_PHOTOGRAPHY_CAPS_FLICKER_REDUCTION = 1 shl 13;
    GST_PHOTOGRAPHY_CAPS_ALL =  not (0);
;
{*
 * GstPhotographyShakeRisk:
 * @GST_PHOTOGRAPHY_SHAKE_RISK_LOW: Low risk
 * @GST_PHOTOGRAPHY_SHAKE_RISK_MEDIUM: Medium risk
 * @GST_PHOTOGRAPHY_SHAKE_RISK_HIGH: High risk
 *
 * Risk level of captured image becoming "shaken" due to camera movement and
 * too long exposure time. Used in #GST_PHOTOGRAPHY_SHAKE_RISK #GstMessage.
  }
type
  PGstPhotographyShakeRisk = ^TGstPhotographyShakeRisk;
  TGstPhotographyShakeRisk =  Longint;
  Const
    GST_PHOTOGRAPHY_SHAKE_RISK_LOW = 0;
    GST_PHOTOGRAPHY_SHAKE_RISK_MEDIUM = 1;
    GST_PHOTOGRAPHY_SHAKE_RISK_HIGH = 2;
;
{*
 * GstPhotographyFlickerReductionMode:
 * @GST_PHOTOGRAPHY_FLICKER_REDUCTION_OFF: Disable flicker reduction
 * @GST_PHOTOGRAPHY_FLICKER_REDUCTION_50HZ: 50Hz flicker reduction
 * @GST_PHOTOGRAPHY_FLICKER_REDUCTION_60HZ: 60Hz flicker reduction
 * @GST_PHOTOGRAPHY_FLICKER_REDUCTION_AUTO: Choose mode automatically
 *
 * Reduce flicker in video caused by light source fluctuation.
  }
type
  PGstPhotographyFlickerReductionMode = ^TGstPhotographyFlickerReductionMode;
  TGstPhotographyFlickerReductionMode =  Longint;
  Const
    GST_PHOTOGRAPHY_FLICKER_REDUCTION_OFF = 0;
    GST_PHOTOGRAPHY_FLICKER_REDUCTION_50HZ = 1;
    GST_PHOTOGRAPHY_FLICKER_REDUCTION_60HZ = 2;
    GST_PHOTOGRAPHY_FLICKER_REDUCTION_AUTO = 3;
;
{*
 * GstPhotographyFocusMode:
 * @GST_PHOTOGRAPHY_FOCUS_MODE_AUTO: Choose focus mode automatically
 * @GST_PHOTOGRAPHY_FOCUS_MODE_MACRO: Mode for focusing objects close to lens
 * @GST_PHOTOGRAPHY_FOCUS_MODE_PORTRAIT: Mode for portraits
 * @GST_PHOTOGRAPHY_FOCUS_MODE_INFINITY: Mode for landscapes and far away objects
 * @GST_PHOTOGRAPHY_FOCUS_MODE_HYPERFOCAL: Mode for maximum depth of field, keeping
 * focus acceptable both in infinify and as close objects as possible
 * @GST_PHOTOGRAPHY_FOCUS_MODE_EXTENDED: Extended focus mode
 * @GST_PHOTOGRAPHY_FOCUS_MODE_CONTINUOUS_NORMAL: Continuous autofocus mode
 * @GST_PHOTOGRAPHY_FOCUS_MODE_CONTINUOUS_EXTENDED: Extended continuous
 * autofocus mode
 * @GST_PHOTOGRAPHY_FOCUS_MODE_MANUAL: Disable automatic focusing
 * and keep current value. #GstPhotography:lens-focus property can
 * be used to change focus manually.
 *
 * Choose mode for focusing algorithm.
  }
type
  PGstPhotographyFocusMode = ^TGstPhotographyFocusMode;
  TGstPhotographyFocusMode =  Longint;
  Const
    GST_PHOTOGRAPHY_FOCUS_MODE_AUTO = 0;
    GST_PHOTOGRAPHY_FOCUS_MODE_MACRO = 1;
    GST_PHOTOGRAPHY_FOCUS_MODE_PORTRAIT = 2;
    GST_PHOTOGRAPHY_FOCUS_MODE_INFINITY = 3;
    GST_PHOTOGRAPHY_FOCUS_MODE_HYPERFOCAL = 4;
    GST_PHOTOGRAPHY_FOCUS_MODE_EXTENDED = 5;
    GST_PHOTOGRAPHY_FOCUS_MODE_CONTINUOUS_NORMAL = 6;
    GST_PHOTOGRAPHY_FOCUS_MODE_CONTINUOUS_EXTENDED = 7;
    GST_PHOTOGRAPHY_FOCUS_MODE_MANUAL = 8;
;
{*
 * GstPhotographyExposureMode:
 * @GST_PHOTOGRAPHY_EXPOSURE_MODE_AUTO: Adjust exposure automatically
 * @GST_PHOTOGRAPHY_EXPOSURE_MODE_MANUAL: Disable automatic exposure adjustment
 * and keep current values.
 *
  }
type
  PGstPhotographyExposureMode = ^TGstPhotographyExposureMode;
  TGstPhotographyExposureMode =  Longint;
  Const
    GST_PHOTOGRAPHY_EXPOSURE_MODE_AUTO = 0;
    GST_PHOTOGRAPHY_EXPOSURE_MODE_MANUAL = 1;
;
{*
 * GstPhotographySettings:
 *
 * Structure containing all #GstPhotography settings, used to set all
 * settings in one call with @gst_photography_set_config().
  }
{ FIXME: add padding?  }
type
  PGstPhotographySettings = ^TGstPhotographySettings;
  TGstPhotographySettings = record
      wb_mode : TGstPhotographyWhiteBalanceMode;
      tone_mode : TGstPhotographyColorToneMode;
      scene_mode : TGstPhotographySceneMode;
      flash_mode : TGstPhotographyFlashMode;
      exposure_time : Tguint32;
      aperture : Tguint;
      ev_compensation : Tgfloat;
      iso_speed : Tguint;
      zoom : Tgfloat;
      flicker_mode : TGstPhotographyFlickerReductionMode;
      focus_mode : TGstPhotographyFocusMode;
      noise_reduction : TGstPhotographyNoiseReduction;
      exposure_mode : TGstPhotographyExposureMode;
      color_temperature : Tguint;
      white_point : array[0..(MAX_WHITE_POINT_VALUES)-1] of Tguint;
      analog_gain : Tgfloat;
      lens_focus : Tgfloat;
      min_exposure_time : Tguint;
      max_exposure_time : Tguint;
    end;
{*
 * GstPhotographyCapturePrepared:
 * @data: user data that has been given, when registering the callback
 * @configured_caps: #GstCaps defining the configured capture format.
 *     Ownership of these caps stays in the element.
 *
 * This callback will be called when the element has finished preparations
 * and is ready for image capture. The next buffer that element produces
 * will be of @configured_caps format, so this callback allows the application
 * to e.g. reconfigure capsfilters in pipeline if any.
  }
(* Const before type ignored *)

  TGstPhotographyCapturePrepared = procedure (data:Tgpointer; configured_caps:PGstCaps);cdecl;
{*
 * GstPhotographyInterface:
 * @parent: parent interface type.
 * @get_ev_compensation: vmethod to get ev exposure compensation value
 * @get_iso_speed: vmethod to get iso speed (light sensitivity) value
 * @get_aperture: vmethod to get aperture value
 * @get_exposure: vmethod to get exposure time value
 * @get_white_balance_mode: vmethod to get white balance mode value
 * @get_color_tone_mode: vmethod to get color tone mode value
 * @get_scene_mode: vmethod to get scene mode value
 * @get_flash_mode: vmethod to get flash mode value
 * @get_noise_reduction: vmethod to get noise reduction mode value
 * @get_zoom: vmethod to get zoom factor value
 * @set_ev_compensation: vmethod to set ev exposure compensation value
 * @set_iso_speed: vmethod to set iso speed (light sensitivity) value
 * @set_aperture: vmethod to set aperture value
 * @set_exposure: vmethod to set exposure time value
 * @set_white_balance_mode: vmethod to set white balance mode value
 * @set_color_tone_mode: vmethod to set color tone mode value
 * @set_scene_mode: vmethod to set scene mode value
 * @set_flash_mode: vmethod to set flash mode value
 * @set_noise_reduction: vmethod to set noise reduction mode value
 * @set_zoom: vmethod to set zoom factor value
 * @get_capabilities: vmethod to get supported capabilities of the interface
 * @prepare_for_capture: vmethod to tell the element to prepare for capturing
 * @set_autofocus: vmethod to set autofocus on/off
 * @set_config: vmethod to set all configuration parameters at once
 * @get_config: vmethod to get all configuration parameters at once
 * @get_image_capture_supported_caps: vmethod to get caps describing supported image capture formats
 * @set_exposure_mode: vmethod to set exposure mode (Since: 1.18)
 * @get_exposure_mode: vmethod to get exposure mode (Since: 1.18)
 * @set_analog_gain: vmethod to set analog gain (Since: 1.18)
 * @get_analog_gain: vmethod to get analog gain (Since: 1.18)
 * @set_lens_focus: vmethod to set lens focus (Since: 1.18)
 * @get_lens_focus: vmethod to get lens focus (Since: 1.18)
 * @set_color_temperature: vmethod to set color temperature (Since: 1.18)
 * @get_color_temperature: vmethod to get color temperature (Since: 1.18)
 * @set_min_exposure_time: vmethod to set min exposure time (Since: 1.18)
 * @get_min_exposure_time: vmethod to get min exposure time (Since: 1.18)
 * @set_max_exposure_time: vmethod to set max exposure time (Since: 1.18)
 * @get_max_exposure_time: vmethod to get max exposure time (Since: 1.18)
 *
 * #GstPhotographyInterface interface.
  }
{ virtual functions  }
{ FIXME: remove padding, not needed for interfaces  }
{< private >  }

  PGstPhotographyInterface = ^TGstPhotographyInterface;
  TGstPhotographyInterface = record
      parent : TGTypeInterface;
      get_ev_compensation : function (photo:PGstPhotography; ev_comp:Pgfloat):Tgboolean;cdecl;
      get_iso_speed : function (photo:PGstPhotography; iso_speed:Pguint):Tgboolean;cdecl;
      get_aperture : function (photo:PGstPhotography; aperture:Pguint):Tgboolean;cdecl;
      get_exposure : function (photo:PGstPhotography; exposure:Pguint32):Tgboolean;cdecl;
      get_white_balance_mode : function (photo:PGstPhotography; wb_mode:PGstPhotographyWhiteBalanceMode):Tgboolean;cdecl;
      get_color_tone_mode : function (photo:PGstPhotography; tone_mode:PGstPhotographyColorToneMode):Tgboolean;cdecl;
      get_scene_mode : function (photo:PGstPhotography; scene_mode:PGstPhotographySceneMode):Tgboolean;cdecl;
      get_flash_mode : function (photo:PGstPhotography; flash_mode:PGstPhotographyFlashMode):Tgboolean;cdecl;
      get_zoom : function (photo:PGstPhotography; zoom:Pgfloat):Tgboolean;cdecl;
      get_flicker_mode : function (photo:PGstPhotography; flicker_mode:PGstPhotographyFlickerReductionMode):Tgboolean;cdecl;
      get_focus_mode : function (photo:PGstPhotography; focus_mode:PGstPhotographyFocusMode):Tgboolean;cdecl;
      set_ev_compensation : function (photo:PGstPhotography; ev_comp:Tgfloat):Tgboolean;cdecl;
      set_iso_speed : function (photo:PGstPhotography; iso_speed:Tguint):Tgboolean;cdecl;
      set_aperture : function (photo:PGstPhotography; aperture:Tguint):Tgboolean;cdecl;
      set_exposure : function (photo:PGstPhotography; exposure:Tguint32):Tgboolean;cdecl;
      set_white_balance_mode : function (photo:PGstPhotography; wb_mode:TGstPhotographyWhiteBalanceMode):Tgboolean;cdecl;
      set_color_tone_mode : function (photo:PGstPhotography; tone_mode:TGstPhotographyColorToneMode):Tgboolean;cdecl;
      set_scene_mode : function (photo:PGstPhotography; scene_mode:TGstPhotographySceneMode):Tgboolean;cdecl;
      set_flash_mode : function (photo:PGstPhotography; flash_mode:TGstPhotographyFlashMode):Tgboolean;cdecl;
      set_zoom : function (photo:PGstPhotography; zoom:Tgfloat):Tgboolean;cdecl;
      set_flicker_mode : function (photo:PGstPhotography; flicker_mode:TGstPhotographyFlickerReductionMode):Tgboolean;cdecl;
      set_focus_mode : function (photo:PGstPhotography; focus_mode:TGstPhotographyFocusMode):Tgboolean;cdecl;
      get_capabilities : function (photo:PGstPhotography):TGstPhotographyCaps;cdecl;
      prepare_for_capture : function (photo:PGstPhotography; func:TGstPhotographyCapturePrepared; capture_caps:PGstCaps; user_data:Tgpointer):Tgboolean;cdecl;
      set_autofocus : procedure (photo:PGstPhotography; on:Tgboolean);cdecl;
      set_config : function (photo:PGstPhotography; config:PGstPhotographySettings):Tgboolean;cdecl;
      get_config : function (photo:PGstPhotography; config:PGstPhotographySettings):Tgboolean;cdecl;
      get_noise_reduction : function (photo:PGstPhotography; noise_reduction:PGstPhotographyNoiseReduction):Tgboolean;cdecl;
      set_noise_reduction : function (photo:PGstPhotography; noise_reduction:TGstPhotographyNoiseReduction):Tgboolean;cdecl;
      set_exposure_mode : function (photo:PGstPhotography; exposure_mode:TGstPhotographyExposureMode):Tgboolean;cdecl;
      get_exposure_mode : function (photo:PGstPhotography; exposure_mode:PGstPhotographyExposureMode):Tgboolean;cdecl;
      set_analog_gain : function (photo:PGstPhotography; analog_gain:Tgfloat):Tgboolean;cdecl;
      get_analog_gain : function (photo:PGstPhotography; analog_gain:Pgfloat):Tgboolean;cdecl;
      set_lens_focus : function (photo:PGstPhotography; lens_focus:Tgfloat):Tgboolean;cdecl;
      get_lens_focus : function (photo:PGstPhotography; lens_focus:Pgfloat):Tgboolean;cdecl;
      set_color_temperature : function (photo:PGstPhotography; color_temperature:Tguint):Tgboolean;cdecl;
      get_color_temperature : function (photo:PGstPhotography; color_temperature:Pguint):Tgboolean;cdecl;
      set_min_exposure_time : function (photo:PGstPhotography; min_exposure_time:Tguint):Tgboolean;cdecl;
      get_min_exposure_time : function (photo:PGstPhotography; min_exposure_time:Pguint):Tgboolean;cdecl;
      set_max_exposure_time : function (photo:PGstPhotography; max_exposure_time:Tguint):Tgboolean;cdecl;
      get_max_exposure_time : function (photo:PGstPhotography; max_exposure_time:Pguint):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;

function gst_photography_get_type:TGType;cdecl;external;
{ virtual class function wrappers  }
function gst_photography_get_ev_compensation(photo:PGstPhotography; ev_comp:Pgfloat):Tgboolean;cdecl;external;
function gst_photography_get_iso_speed(photo:PGstPhotography; iso_speed:Pguint):Tgboolean;cdecl;external;
function gst_photography_get_aperture(photo:PGstPhotography; aperture:Pguint):Tgboolean;cdecl;external;
function gst_photography_get_exposure(photo:PGstPhotography; exposure:Pguint32):Tgboolean;cdecl;external;
function gst_photography_get_white_balance_mode(photo:PGstPhotography; wb_mode:PGstPhotographyWhiteBalanceMode):Tgboolean;cdecl;external;
function gst_photography_get_color_tone_mode(photo:PGstPhotography; tone_mode:PGstPhotographyColorToneMode):Tgboolean;cdecl;external;
function gst_photography_get_scene_mode(photo:PGstPhotography; scene_mode:PGstPhotographySceneMode):Tgboolean;cdecl;external;
function gst_photography_get_flash_mode(photo:PGstPhotography; flash_mode:PGstPhotographyFlashMode):Tgboolean;cdecl;external;
function gst_photography_get_noise_reduction(photo:PGstPhotography; noise_reduction:PGstPhotographyNoiseReduction):Tgboolean;cdecl;external;
function gst_photography_get_zoom(photo:PGstPhotography; zoom:Pgfloat):Tgboolean;cdecl;external;
function gst_photography_get_flicker_mode(photo:PGstPhotography; mode:PGstPhotographyFlickerReductionMode):Tgboolean;cdecl;external;
function gst_photography_get_focus_mode(photo:PGstPhotography; mode:PGstPhotographyFocusMode):Tgboolean;cdecl;external;
function gst_photography_set_ev_compensation(photo:PGstPhotography; ev_comp:Tgfloat):Tgboolean;cdecl;external;
function gst_photography_set_iso_speed(photo:PGstPhotography; iso_speed:Tguint):Tgboolean;cdecl;external;
function gst_photography_set_aperture(photo:PGstPhotography; aperture:Tguint):Tgboolean;cdecl;external;
function gst_photography_set_exposure(photo:PGstPhotography; exposure:Tguint):Tgboolean;cdecl;external;
function gst_photography_set_white_balance_mode(photo:PGstPhotography; wb_mode:TGstPhotographyWhiteBalanceMode):Tgboolean;cdecl;external;
function gst_photography_set_color_tone_mode(photo:PGstPhotography; tone_mode:TGstPhotographyColorToneMode):Tgboolean;cdecl;external;
function gst_photography_set_scene_mode(photo:PGstPhotography; scene_mode:TGstPhotographySceneMode):Tgboolean;cdecl;external;
function gst_photography_set_flash_mode(photo:PGstPhotography; flash_mode:TGstPhotographyFlashMode):Tgboolean;cdecl;external;
function gst_photography_set_noise_reduction(photo:PGstPhotography; noise_reduction:TGstPhotographyNoiseReduction):Tgboolean;cdecl;external;
function gst_photography_set_zoom(photo:PGstPhotography; zoom:Tgfloat):Tgboolean;cdecl;external;
function gst_photography_set_flicker_mode(photo:PGstPhotography; mode:TGstPhotographyFlickerReductionMode):Tgboolean;cdecl;external;
function gst_photography_set_focus_mode(photo:PGstPhotography; mode:TGstPhotographyFocusMode):Tgboolean;cdecl;external;
function gst_photography_get_capabilities(photo:PGstPhotography):TGstPhotographyCaps;cdecl;external;
function gst_photography_prepare_for_capture(photo:PGstPhotography; func:TGstPhotographyCapturePrepared; capture_caps:PGstCaps; user_data:Tgpointer):Tgboolean;cdecl;external;
function gst_photography_set_config(photo:PGstPhotography; config:PGstPhotographySettings):Tgboolean;cdecl;external;
function gst_photography_get_config(photo:PGstPhotography; config:PGstPhotographySettings):Tgboolean;cdecl;external;
procedure gst_photography_set_autofocus(photo:PGstPhotography; on:Tgboolean);cdecl;external;
{$endif}
{ __GST_PHOTOGRAPHY_H__  }

implementation

{ was #define dname def_expr }
function GST_TYPE_PHOTOGRAPHY : longint; { return type might be wrong }
  begin
    GST_TYPE_PHOTOGRAPHY:=gst_photography_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PHOTOGRAPHY(obj : longint) : longint;
begin
  GST_PHOTOGRAPHY:=G_TYPE_CHECK_INSTANCE_CAST(obj,GST_TYPE_PHOTOGRAPHY,GstPhotography);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_IS_PHOTOGRAPHY(obj : longint) : longint;
begin
  GST_IS_PHOTOGRAPHY:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GST_TYPE_PHOTOGRAPHY);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_PHOTOGRAPHY_GET_INTERFACE(inst : longint) : longint;
begin
  GST_PHOTOGRAPHY_GET_INTERFACE:=G_TYPE_INSTANCE_GET_INTERFACE(inst,GST_TYPE_PHOTOGRAPHY,GstPhotographyInterface);
end;


end.
