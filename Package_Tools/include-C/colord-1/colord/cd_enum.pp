
unit cd_enum;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_enum.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_enum.h
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
PCdClientError  = ^CdClientError;
PCdColorspace  = ^CdColorspace;
PCdDeviceError  = ^CdDeviceError;
PCdDeviceKind  = ^CdDeviceKind;
PCdDeviceMode  = ^CdDeviceMode;
PCdDeviceRelation  = ^CdDeviceRelation;
PCdObjectScope  = ^CdObjectScope;
PCdPixelFormat  = ^CdPixelFormat;
PCdProfileError  = ^CdProfileError;
PCdProfileKind  = ^CdProfileKind;
PCdProfileQuality  = ^CdProfileQuality;
PCdProfileWarning  = ^CdProfileWarning;
PCdRenderingIntent  = ^CdRenderingIntent;
PCdSensorCap  = ^CdSensorCap;
PCdSensorError  = ^CdSensorError;
PCdSensorKind  = ^CdSensorKind;
PCdSensorState  = ^CdSensorState;
PCdStandardSpace  = ^CdStandardSpace;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010-2015 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__COLORD_H_INSIDE__) && !defined (CD_COMPILATION)}
{$error "Only <colord.h> can be included directly."}
{$endif}
{$ifndef __CD_ENUM_H}
{$define __CD_ENUM_H}
{$include <glib-object.h>}
{*
 * CdDeviceKind:
 *
 * The device type.
 * }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{ Since: 0.1.0  }
{< private > }
type
  PCdDeviceKind = ^TCdDeviceKind;
  TCdDeviceKind =  Longint;
  Const
    CD_DEVICE_KIND_UNKNOWN = 0;
    CD_DEVICE_KIND_DISPLAY = 1;
    CD_DEVICE_KIND_SCANNER = 2;
    CD_DEVICE_KIND_PRINTER = 3;
    CD_DEVICE_KIND_CAMERA = 4;
    CD_DEVICE_KIND_WEBCAM = 5;
    CD_DEVICE_KIND_LAST = 6;
;
{*
 * CdProfileKind:
 *
 * The profile type.
 * }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{< private > }
type
  PCdProfileKind = ^TCdProfileKind;
  TCdProfileKind =  Longint;
  Const
    CD_PROFILE_KIND_UNKNOWN = 0;
    CD_PROFILE_KIND_INPUT_DEVICE = 1;
    CD_PROFILE_KIND_DISPLAY_DEVICE = 2;
    CD_PROFILE_KIND_OUTPUT_DEVICE = 3;
    CD_PROFILE_KIND_DEVICELINK = 4;
    CD_PROFILE_KIND_COLORSPACE_CONVERSION = 5;
    CD_PROFILE_KIND_ABSTRACT = 6;
    CD_PROFILE_KIND_NAMED_COLOR = 7;
    CD_PROFILE_KIND_LAST = 8;
;
{*
 * CdObjectScope:
 *
 * The options type.
 * }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{ Since: 0.1.4  }
{< private > }
type
  PCdObjectScope = ^TCdObjectScope;
  TCdObjectScope =  Longint;
  Const
    CD_OBJECT_SCOPE_UNKNOWN = 0;
    CD_OBJECT_SCOPE_NORMAL = 1;
    CD_OBJECT_SCOPE_TEMP = 2;
    CD_OBJECT_SCOPE_DISK = 3;
    CD_OBJECT_SCOPE_LAST = 4;
;
{*
 * CdRenderingIntent:
 * @CD_RENDERING_INTENT_UNKNOWN:		Unknown rendering intent
 * @CD_RENDERING_INTENT_PERCEPTUAL:		Used for photos as it maintains contrast
 * @CD_RENDERING_INTENT_RELATIVE_COLORIMETRIC:	Used for graphic design and named colors
 * @CD_RENDERING_INTENT_SATURATION:		Used for business charts as it maintains saturation without dithering
 * @CD_RENDERING_INTENT_ABSOLUTE_COLORIMETRIC:	Used when a specific color is required
 *
 * The rendering intent.
 * }
{ Since: 0.1.5  }
{ Since: 0.1.5  }
{ Since: 0.1.5  }
{ Since: 0.1.5  }
{ Since: 0.1.5  }
{< private > }
type
  PCdRenderingIntent = ^TCdRenderingIntent;
  TCdRenderingIntent =  Longint;
  Const
    CD_RENDERING_INTENT_UNKNOWN = 0;
    CD_RENDERING_INTENT_PERCEPTUAL = 1;
    CD_RENDERING_INTENT_RELATIVE_COLORIMETRIC = 2;
    CD_RENDERING_INTENT_SATURATION = 3;
    CD_RENDERING_INTENT_ABSOLUTE_COLORIMETRIC = 4;
    CD_RENDERING_INTENT_LAST = 5;
;
{*
 * CdPixelFormat:
 *
 * The pixel format of an image.
 * NOTE: these values are the same as the lcms2 AOTTTTTUYFPXSEEECCCCBBB type.
 * }
type
  PCdPixelFormat = ^TCdPixelFormat;
  TCdPixelFormat = Tguint32;
{ Since: 1.0.0  }

const
  CD_PIXEL_FORMAT_UNKNOWN = $00000000;  
{ Since: 1.0.0  }
  CD_PIXEL_FORMAT_ARGB32 = $00044099;  
{ Since: 1.0.0  }
  CD_PIXEL_FORMAT_RGB24 = $00040019;  
{ Since: 1.0.0  }
  CD_PIXEL_FORMAT_CMYK32 = $00060021;  
{ Since: 1.0.0  }
  CD_PIXEL_FORMAT_BGRA32 = $00044499;  
{ Since: 1.1.8  }
  CD_PIXEL_FORMAT_RGBA32 = $00040099;  
{*
 * CdColorspace:
 *
 * The known colorspace.
 * }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{ Since: 0.1.1  }
{< private > }
type
  PCdColorspace = ^TCdColorspace;
  TCdColorspace =  Longint;
  Const
    CD_COLORSPACE_UNKNOWN = 0;
    CD_COLORSPACE_XYZ = 1;
    CD_COLORSPACE_LAB = 2;
    CD_COLORSPACE_LUV = 3;
    CD_COLORSPACE_YCBCR = 4;
    CD_COLORSPACE_YXY = 5;
    CD_COLORSPACE_RGB = 6;
    CD_COLORSPACE_GRAY = 7;
    CD_COLORSPACE_HSV = 8;
    CD_COLORSPACE_CMYK = 9;
    CD_COLORSPACE_CMY = 10;
    CD_COLORSPACE_LAST = 11;
;
{*
 * CdDeviceMode:
 *
 * The device mode.
 * }
{ Since: 0.1.2  }
{ Since: 0.1.2  }
{ Since: 0.1.2  }
{< private > }
type
  PCdDeviceMode = ^TCdDeviceMode;
  TCdDeviceMode =  Longint;
  Const
    CD_DEVICE_MODE_UNKNOWN = 0;
    CD_DEVICE_MODE_PHYSICAL = 1;
    CD_DEVICE_MODE_VIRTUAL = 2;
    CD_DEVICE_MODE_LAST = 3;
;
{*
 * CdDeviceRelation:
 *
 * The device to profile relationship.
 * }
{ Since: 0.1.3  }
{ Since: 0.1.3  }
{ Since: 0.1.3  }
{< private > }
type
  PCdDeviceRelation = ^TCdDeviceRelation;
  TCdDeviceRelation =  Longint;
  Const
    CD_DEVICE_RELATION_UNKNOWN = 0;
    CD_DEVICE_RELATION_SOFT = 1;
    CD_DEVICE_RELATION_HARD = 2;
    CD_DEVICE_RELATION_LAST = 3;
;
{*
 * CdSensorKind:
 *
 * The sensor type.
 * }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6, but not used since 0.1.16  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.14  }
{ Since: 0.1.15  }
{ Since: 0.1.16  }
{ Since: 0.1.16  }
{ Since: 0.1.24  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.26  }
{ Since: 0.1.27  }
{ Since: 1.2.2  }
{ Since: 1.2.11  }
{ Since: 1.2.11  }
{ Since: 1.4.5  }
{< private > }
type
  PCdSensorKind = ^TCdSensorKind;
  TCdSensorKind =  Longint;
  Const
    CD_SENSOR_KIND_UNKNOWN = 0;
    CD_SENSOR_KIND_DUMMY = 1;
    CD_SENSOR_KIND_HUEY = 2;
    CD_SENSOR_KIND_COLOR_MUNKI_PHOTO = 3;
    CD_SENSOR_KIND_SPYDER = 4;
    CD_SENSOR_KIND_DTP20 = 5;
    CD_SENSOR_KIND_DTP22 = 6;
    CD_SENSOR_KIND_DTP41 = 7;
    CD_SENSOR_KIND_DTP51 = 8;
    CD_SENSOR_KIND_DTP94 = 9;
    CD_SENSOR_KIND_SPECTRO_SCAN = 10;
    CD_SENSOR_KIND_I1_PRO = 11;
    CD_SENSOR_KIND_COLORIMTRE_HCFR = 12;
    CD_SENSOR_KIND_I1_DISPLAY3 = 13;
    CD_SENSOR_KIND_COLORHUG = 14;
    CD_SENSOR_KIND_SPYDER2 = 15;
    CD_SENSOR_KIND_SPYDER3 = 16;
    CD_SENSOR_KIND_COLORHUG_PLUS = 17;
    CD_SENSOR_KIND_I1_DISPLAY1 = 18;
    CD_SENSOR_KIND_I1_DISPLAY2 = 19;
    CD_SENSOR_KIND_DTP92 = 20;
    CD_SENSOR_KIND_I1_MONITOR = 21;
    CD_SENSOR_KIND_SPYDER4 = 22;
    CD_SENSOR_KIND_COLOR_MUNKI_SMILE = 23;
    CD_SENSOR_KIND_COLORHUG2 = 24;
    CD_SENSOR_KIND_SPYDER5 = 25;
    CD_SENSOR_KIND_SPARK = 26;
    CD_SENSOR_KIND_SPYDERX = 27;
    CD_SENSOR_KIND_LAST = 28;
;
{ renamed due to trademark issue  }
  CD_SENSOR_KIND_COLORHUG_SPECTRO = CD_SENSOR_KIND_COLORHUG_PLUS;  
{*
 * CdSensorCap:
 *
 * The sensor capabilities, i.e. things the sensor can do.
 * }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6 (hint: raw measurement)  }
{ Since: 0.1.17  }
{ Since: 0.1.29  }
{ Since: 0.1.31  }
{ Since: 0.1.31  }
{ Since: 0.1.31  }
{ Since: 0.1.31  }
{ Since: 0.1.31  }
{ Since: 1.3.1  }
{ Since: 1.3.1  }
{ Since: 1.3.1  }
{< private > }
type
  PCdSensorCap = ^TCdSensorCap;
  TCdSensorCap =  Longint;
  Const
    CD_SENSOR_CAP_UNKNOWN = 0;
    CD_SENSOR_CAP_LCD = 1;
    CD_SENSOR_CAP_CRT = 2;
    CD_SENSOR_CAP_PRINTER = 3;
    CD_SENSOR_CAP_SPOT = 4;
    CD_SENSOR_CAP_PROJECTOR = 5;
    CD_SENSOR_CAP_AMBIENT = 6;
    CD_SENSOR_CAP_CALIBRATION = 7;
    CD_SENSOR_CAP_LED = 8;
    CD_SENSOR_CAP_PLASMA = 9;
    CD_SENSOR_CAP_LCD_CCFL = 10;
    CD_SENSOR_CAP_LCD_RGB_LED = 11;
    CD_SENSOR_CAP_LCD_WHITE_LED = 12;
    CD_SENSOR_CAP_WIDE_GAMUT_LCD_CCFL = 13;
    CD_SENSOR_CAP_WIDE_GAMUT_LCD_RGB_LED = 14;
    CD_SENSOR_CAP_SPECTRAL = 15;
    CD_SENSOR_CAP_CALIBRATION_DARK = 16;
    CD_SENSOR_CAP_CALIBRATION_IRRADIANCE = 17;
    CD_SENSOR_CAP_LAST = 18;
;
{*
 * CdSensorState:
 *
 * The state of the sensor.
 * }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.19  }
{< private > }
type
  PCdSensorState = ^TCdSensorState;
  TCdSensorState =  Longint;
  Const
    CD_SENSOR_STATE_UNKNOWN = 0;
    CD_SENSOR_STATE_STARTING = 1;
    CD_SENSOR_STATE_IDLE = 2;
    CD_SENSOR_STATE_MEASURING = 3;
    CD_SENSOR_STATE_BUSY = 4;
    CD_SENSOR_STATE_LAST = 5;
;
{*
 * CdStandardSpace:
 *
 * A standard colorspace
 * }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{ Since: 0.1.6  }
{< private > }
type
  PCdStandardSpace = ^TCdStandardSpace;
  TCdStandardSpace =  Longint;
  Const
    CD_STANDARD_SPACE_UNKNOWN = 0;
    CD_STANDARD_SPACE_SRGB = 1;
    CD_STANDARD_SPACE_ADOBE_RGB = 2;
    CD_STANDARD_SPACE_PROPHOTO_RGB = 3;
    CD_STANDARD_SPACE_LAST = 4;
;
{*
 * CdProfileWarning:
 * @CD_PROFILE_WARNING_NONE: No error is found
 * @CD_PROFILE_WARNING_DESCRIPTION_MISSING: The description is missing or of zero length
 * @CD_PROFILE_WARNING_COPYRIGHT_MISSING: The copyright is missing or of zero length
 * @CD_PROFILE_WARNING_VCGT_NON_MONOTONIC: The video card gamma table is not monotonic
 * @CD_PROFILE_WARNING_SCUM_DOT: Lab 100, 0, 0 does not map to RGB 255,255,255
 * @CD_PROFILE_WARNING_GRAY_AXIS_INVALID: There is significant a/b for gray
 * @CD_PROFILE_WARNING_GRAY_AXIS_NON_MONOTONIC: The gray ramp is not monotonic
 * @CD_PROFILE_WARNING_PRIMARIES_INVALID: One or more of the primaries are invalid
 * @CD_PROFILE_WARNING_PRIMARIES_NON_ADDITIVE: The primaries to not add to give D50 white
 * @CD_PROFILE_WARNING_PRIMARIES_UNLIKELY: One or more of the primaries are outside of ROMM RGB
 * @CD_PROFILE_WARNING_WHITEPOINT_INVALID: RGB 255,255,255 does not return D50
 * @CD_PROFILE_WARNING_WHITEPOINT_UNLIKELY: Whitepoint is outside of usual range
 *
 * The warning about the profile. Profiles with warnings can still be
 * used, but may be of limited use.
 * }
{ FIXME: next API break, add CD_PROFILE_WARNING_UNKNOWN  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.25  }
{ Since: 0.1.34  }
{< private > }
type
  PCdProfileWarning = ^TCdProfileWarning;
  TCdProfileWarning =  Longint;
  Const
    CD_PROFILE_WARNING_NONE = 0;
    CD_PROFILE_WARNING_DESCRIPTION_MISSING = 1;
    CD_PROFILE_WARNING_COPYRIGHT_MISSING = 2;
    CD_PROFILE_WARNING_VCGT_NON_MONOTONIC = 3;
    CD_PROFILE_WARNING_SCUM_DOT = 4;
    CD_PROFILE_WARNING_GRAY_AXIS_INVALID = 5;
    CD_PROFILE_WARNING_GRAY_AXIS_NON_MONOTONIC = 6;
    CD_PROFILE_WARNING_PRIMARIES_INVALID = 7;
    CD_PROFILE_WARNING_PRIMARIES_NON_ADDITIVE = 8;
    CD_PROFILE_WARNING_PRIMARIES_UNLIKELY = 9;
    CD_PROFILE_WARNING_WHITEPOINT_INVALID = 10;
    CD_PROFILE_WARNING_WHITEPOINT_UNLIKELY = 11;
    CD_PROFILE_WARNING_LAST = 12;
;
{*
 * CdProfileQuality:
 * @CD_PROFILE_QUALITY_LOW: Low quality profile, fast
 * @CD_PROFILE_QUALITY_MEDIUM: Medium quality profile
 * @CD_PROFILE_QUALITY_HIGH: High quality profile, slow
 *
 * The quality of the profile produced through calibration.
 * }
{ FIXME: next API break, add CD_PROFILE_QUALITY_UNKNOWN  }
{ Since: 0.1.27  }
{ Since: 0.1.27  }
{ Since: 0.1.27  }
{< private > }
type
  PCdProfileQuality = ^TCdProfileQuality;
  TCdProfileQuality =  Longint;
  Const
    CD_PROFILE_QUALITY_LOW = 0;
    CD_PROFILE_QUALITY_MEDIUM = 1;
    CD_PROFILE_QUALITY_HIGH = 2;
    CD_PROFILE_QUALITY_LAST = 3;
;
{*
 * CdSensorError:
 * @CD_SENSOR_ERROR_NO_SUPPORT:		This action is unsupported on this hardware
 * @CD_SENSOR_ERROR_NO_DATA:		The sensor provided no data
 * @CD_SENSOR_ERROR_INTERNAL:		An internal error occurred
 * @CD_SENSOR_ERROR_ALREADY_LOCKED:	The sensor is already locked
 * @CD_SENSOR_ERROR_NOT_LOCKED:		The sensor is not locked
 * @CD_SENSOR_ERROR_IN_USE:		The sensor is already in use
 * @CD_SENSOR_ERROR_FAILED_TO_AUTHENTICATE:	Authentication failed
 * @CD_SENSOR_ERROR_REQUIRED_POSITION_CALIBRATE:	The sensor needs to be in the calibrate position
 * @CD_SENSOR_ERROR_REQUIRED_POSITION_SURFACE:		The sensor needs to be in the surface position
 * @CD_SENSOR_ERROR_REQUIRED_DARK_CALIBRATION:		The sensor needs dark calibration
 * @CD_SENSOR_ERROR_REQUIRED_IRRADIANCE_CALIBRATION:	The sensor needs irradiance calibration
 *
 * The sensor error code.
 *
 * Since: 0.1.26
 * }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 1.2.13  }
{ Since: 1.1.1  }
{< private > }
type
  PCdSensorError = ^TCdSensorError;
  TCdSensorError =  Longint;
  Const
    CD_SENSOR_ERROR_NO_SUPPORT = 0;
    CD_SENSOR_ERROR_NO_DATA = 1;
    CD_SENSOR_ERROR_INTERNAL = 2;
    CD_SENSOR_ERROR_ALREADY_LOCKED = 3;
    CD_SENSOR_ERROR_NOT_LOCKED = 4;
    CD_SENSOR_ERROR_IN_USE = 5;
    CD_SENSOR_ERROR_FAILED_TO_AUTHENTICATE = 6;
    CD_SENSOR_ERROR_REQUIRED_POSITION_CALIBRATE = 7;
    CD_SENSOR_ERROR_REQUIRED_POSITION_SURFACE = 8;
    CD_SENSOR_ERROR_REQUIRED_DARK_CALIBRATION = 9;
    CD_SENSOR_ERROR_REQUIRED_IRRADIANCE_CALIBRATION = 10;
    CD_SENSOR_ERROR_LAST = 11;
;
{*
 * CdProfileError:
 * @CD_PROFILE_ERROR_INTERNAL: 		An internal error occurred
 * @CD_PROFILE_ERROR_ALREADY_INSTALLED: The profile is already installed
 * @CD_PROFILE_ERROR_FAILED_TO_WRITE: 	The profile could not be written
 * @CD_PROFILE_ERROR_FAILED_TO_PARSE: 	The profile could not be parsed
 * @CD_PROFILE_ERROR_FAILED_TO_READ: 	The profile could not be read
 * @CD_PROFILE_ERROR_FAILED_TO_AUTHENTICATE:	Authentication failed
 * @CD_PROFILE_ERROR_PROPERTY_INVALID:	One or more of the properties was invalid
 * @CD_PROFILE_ERROR_FAILED_TO_GET_UID:	Failed to get UID for sender
 *
 * Errors that can be thrown
  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.31  }
{ Since: 1.2.1  }
{< private > }
type
  PCdProfileError = ^TCdProfileError;
  TCdProfileError =  Longint;
  Const
    CD_PROFILE_ERROR_INTERNAL = 0;
    CD_PROFILE_ERROR_ALREADY_INSTALLED = 1;
    CD_PROFILE_ERROR_FAILED_TO_WRITE = 2;
    CD_PROFILE_ERROR_FAILED_TO_PARSE = 3;
    CD_PROFILE_ERROR_FAILED_TO_READ = 4;
    CD_PROFILE_ERROR_FAILED_TO_AUTHENTICATE = 5;
    CD_PROFILE_ERROR_PROPERTY_INVALID = 6;
    CD_PROFILE_ERROR_FAILED_TO_GET_UID = 7;
    CD_PROFILE_ERROR_LAST = 8;
;
{*
 * CdDeviceError:
 * @CD_DEVICE_ERROR_INTERNAL:		An internal error occurred
 * @CD_DEVICE_ERROR_PROFILE_DOES_NOT_EXIST:	The profile does not exist
 * @CD_DEVICE_ERROR_PROFILE_ALREADY_ADDED:	The profile has already been added
 * @CD_DEVICE_ERROR_PROFILING:		The device is being profiled
 * @CD_DEVICE_ERROR_NOTHING_MATCHED:	Nothing matched the search term
 * @CD_DEVICE_ERROR_FAILED_TO_INHIBIT:	Cound not inhibit device
 * @CD_DEVICE_ERROR_FAILED_TO_UNINHIBIT:	Cound not uninhibit device
 * @CD_DEVICE_ERROR_FAILED_TO_AUTHENTICATE:	Authentication failed
 * @CD_DEVICE_ERROR_NOT_ENABLED:	The device has been disabled
 *
 * Errors that can be thrown
  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{< private > }
type
  PCdDeviceError = ^TCdDeviceError;
  TCdDeviceError =  Longint;
  Const
    CD_DEVICE_ERROR_INTERNAL = 0;
    CD_DEVICE_ERROR_PROFILE_DOES_NOT_EXIST = 1;
    CD_DEVICE_ERROR_PROFILE_ALREADY_ADDED = 2;
    CD_DEVICE_ERROR_PROFILING = 3;
    CD_DEVICE_ERROR_NOTHING_MATCHED = 4;
    CD_DEVICE_ERROR_FAILED_TO_INHIBIT = 5;
    CD_DEVICE_ERROR_FAILED_TO_UNINHIBIT = 6;
    CD_DEVICE_ERROR_FAILED_TO_AUTHENTICATE = 7;
    CD_DEVICE_ERROR_NOT_ENABLED = 8;
    CD_DEVICE_ERROR_LAST = 9;
;
{*
 * CdClientError:
 * @CD_CLIENT_ERROR_INTERNAL:		An internal error occurred
 * @CD_CLIENT_ERROR_ALREADY_EXISTS:	The profile already exists
 * @CD_CLIENT_ERROR_FAILED_TO_AUTHENTICATE:	Authentication failed
 * @CD_CLIENT_ERROR_NOT_SUPPORTED:	Feature not supported
 * @CD_CLIENT_ERROR_NOT_FOUND:		Profile or device not found
 * @CD_CLIENT_ERROR_INPUT_INVALID:	One or more of the parameters is invalid
 * @CD_CLIENT_ERROR_FILE_INVALID:	The file if invalid
 *
 * Errors that can be thrown
  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{ Since: 0.1.26  }
{< private > }
type
  PCdClientError = ^TCdClientError;
  TCdClientError =  Longint;
  Const
    CD_CLIENT_ERROR_INTERNAL = 0;
    CD_CLIENT_ERROR_ALREADY_EXISTS = 1;
    CD_CLIENT_ERROR_FAILED_TO_AUTHENTICATE = 2;
    CD_CLIENT_ERROR_NOT_SUPPORTED = 3;
    CD_CLIENT_ERROR_NOT_FOUND = 4;
    CD_CLIENT_ERROR_INPUT_INVALID = 5;
    CD_CLIENT_ERROR_FILE_INVALID = 6;
    CD_CLIENT_ERROR_LAST = 7;
;
{ defined in org.freedesktop.ColorManager.xml  }
{ Since: 0.1.0  }
  CD_CLIENT_PROPERTY_DAEMON_VERSION = 'DaemonVersion';  
{ Since: 1.0.2  }
  CD_CLIENT_PROPERTY_SYSTEM_VENDOR = 'SystemVendor';  
{ Since: 1.0.2  }
  CD_CLIENT_PROPERTY_SYSTEM_MODEL = 'SystemModel';  
{ defined in metadata-spec.txt  }
{ Since: 0.1.8  }
  CD_PROFILE_METADATA_STANDARD_SPACE = 'STANDARD_space';  
{ Since: 0.1.8  }
  CD_PROFILE_METADATA_EDID_MD5 = 'EDID_md5';  
{ Since: 0.1.8  }
  CD_PROFILE_METADATA_EDID_MODEL = 'EDID_model';  
{ Since: 0.1.8  }
  CD_PROFILE_METADATA_EDID_SERIAL = 'EDID_serial';  
{ Since: 0.1.8  }
  CD_PROFILE_METADATA_EDID_MNFT = 'EDID_mnft';  
{ Since: 0.1.8  }
  CD_PROFILE_METADATA_EDID_VENDOR = 'EDID_manufacturer';  
{ Since: 0.1.8  }
  CD_PROFILE_METADATA_FILE_CHECKSUM = 'FILE_checksum';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_CMF_PRODUCT = 'CMF_product';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_CMF_BINARY = 'CMF_binary';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_CMF_VERSION = 'CMF_version';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_DATA_SOURCE = 'DATA_source';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_DATA_SOURCE_EDID = 'edid';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_DATA_SOURCE_CALIB = 'calib';  
{ Since: 0.1.14  }
  CD_PROFILE_METADATA_DATA_SOURCE_STANDARD = 'standard';  
{ Since: 0.1.14  }
  CD_PROFILE_METADATA_DATA_SOURCE_TEST = 'test';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_MAPPING_FORMAT = 'MAPPING_format';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_MAPPING_QUALIFIER = 'MAPPING_qualifier';  
{ Since: 0.1.9  }
  CD_PROFILE_METADATA_MAPPING_DEVICE_ID = 'MAPPING_device_id';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_ACCURACY_DE76_AVG = 'ACCURACY_dE76_avg';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_ACCURACY_DE76_MAX = 'ACCURACY_dE76_max';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_ACCURACY_DE76_RMS = 'ACCURACY_dE76_rms';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_MEASUREMENT_DEVICE = 'MEASUREMENT_device';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_SCREEN_SURFACE = 'SCREEN_surface';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_SCREEN_SURFACE_MATTE = 'matte';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_SCREEN_SURFACE_GLOSSY = 'glossy';  
{ Since: 0.1.17  }
  CD_PROFILE_METADATA_SCREEN_BRIGHTNESS = 'SCREEN_brightness';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_CONNECTION_TYPE = 'CONNECTION_type';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_CONNECTION_TYPE_INTERNAL = 'internal';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_CONNECTION_TYPE_VGA = 'vga';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_CONNECTION_TYPE_DVI = 'dvi';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_CONNECTION_TYPE_HDMI = 'hdmi';  
{ Since: 0.1.16  }
  CD_PROFILE_METADATA_CONNECTION_TYPE_DISPLAYPORT = 'displayport';  
{ Since: 0.1.25  }
  CD_PROFILE_METADATA_LICENSE = 'License';  
{ Since: 0.1.27  }
  CD_PROFILE_METADATA_QUALITY = 'Quality';  
{ Since: 0.1.27  }
  CD_PROFILE_METADATA_QUALITY_LOW = 'low';  
{ Since: 0.1.27  }
  CD_PROFILE_METADATA_QUALITY_MEDIUM = 'medium';  
{ Since: 0.1.27  }
  CD_PROFILE_METADATA_QUALITY_HIGH = 'high';  
{ defined in org.freedesktop.ColorManager.Profile.xml  }
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_FILENAME = 'Filename';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_QUALIFIER = 'Qualifier';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_FORMAT = 'Format';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_COLORSPACE = 'Colorspace';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_TITLE = 'Title';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_KIND = 'Kind';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_CREATED = 'Created';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_HAS_VCGT = 'HasVcgt';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_IS_SYSTEM_WIDE = 'IsSystemWide';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_METADATA = 'Metadata';  
{ Since: 0.1.8  }
  CD_PROFILE_PROPERTY_ID = 'ProfileId';  
{ Since: 0.1.10  }
  CD_PROFILE_PROPERTY_SCOPE = 'Scope';  
{ Since: 0.1.13  }
  CD_PROFILE_PROPERTY_OWNER = 'Owner';  
{ Since: 0.1.25  }
  CD_PROFILE_PROPERTY_WARNINGS = 'Warnings';  
{ defined in metadata-spec.txt  }
{ Since: 0.1.8  }
  CD_DEVICE_METADATA_XRANDR_NAME = 'XRANDR_name';  
{ Since: 0.1.34  }
  CD_DEVICE_METADATA_OUTPUT_EDID_MD5 = 'OutputEdidMd5';  
{ Since: 0.1.25  }
  CD_DEVICE_METADATA_OUTPUT_PRIORITY = 'OutputPriority';  
{ Since: 0.1.25  }
  CD_DEVICE_METADATA_OUTPUT_PRIORITY_PRIMARY = 'primary';  
{ Since: 0.1.25  }
  CD_DEVICE_METADATA_OUTPUT_PRIORITY_SECONDARY = 'secondary';  
{ Since: 0.1.29  }
  CD_DEVICE_METADATA_OWNER_CMDLINE = 'OwnerCmdline';  
{ defined in org.freedesktop.ColorManager.Device.xml  }
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_MODEL = 'Model';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_KIND = 'Kind';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_VENDOR = 'Vendor';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_SERIAL = 'Serial';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_COLORSPACE = 'Colorspace';  
{ Since: 0.1.9  }
  CD_DEVICE_PROPERTY_FORMAT = 'Format';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_MODE = 'Mode';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_PROFILES = 'Profiles';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_CREATED = 'Created';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_MODIFIED = 'Modified';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_METADATA = 'Metadata';  
{ Since: 0.1.8  }
  CD_DEVICE_PROPERTY_ID = 'DeviceId';  
{ Since: 0.1.9  }
  CD_DEVICE_PROPERTY_SCOPE = 'Scope';  
{ Since: 0.1.13  }
  CD_DEVICE_PROPERTY_OWNER = 'Owner';  
{ Since: 0.1.24  }
  CD_DEVICE_PROPERTY_SEAT = 'Seat';  
{ Since: 0.1.18  }
  CD_DEVICE_PROPERTY_PROFILING_INHIBITORS = 'ProfilingInhibitors';  
{ Since: 0.1.26  }
  CD_DEVICE_PROPERTY_ENABLED = 'Enabled';  
{ Since: 0.1.27  }
  CD_DEVICE_PROPERTY_EMBEDDED = 'Embedded';  
{ defined in org.freedesktop.ColorManager.Sensor.xml  }
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_ID = 'SensorId';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_KIND = 'Kind';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_STATE = 'State';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_MODE = 'Mode';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_SERIAL = 'Serial';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_MODEL = 'Model';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_VENDOR = 'Vendor';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_NATIVE = 'Native';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_LOCKED = 'Locked';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_CAPABILITIES = 'Capabilities';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_OPTIONS = 'Options';  
{ Since: 0.1.26  }
  CD_SENSOR_PROPERTY_EMBEDDED = 'Embedded';  
{ Since: 0.1.28  }
  CD_SENSOR_PROPERTY_METADATA = 'Metadata';  
{ defined in metadata-spec.txt  }
{ Since: 0.1.28  }
  CD_SENSOR_METADATA_IMAGE_ATTACH = 'ImageAttach';  
{ Since: 0.1.28  }
  CD_SENSOR_METADATA_IMAGE_CALIBRATE = 'ImageCalibrate';  
{ Since: 0.1.28  }
  CD_SENSOR_METADATA_IMAGE_SCREEN = 'ImageScreen';  
{ convenience functions as it's easy to forget the bitwise operators  }
{#define cd_bitfield_add(bitfield,tmp)		do  ((bitfield) |= (cd_bitfield_value(tmp)));  while (0) }
{#define cd_bitfield_remove(bitfield,tmp)	do  ((bitfield) &= ~(cd_bitfield_value(tmp)));  while (0) }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function cd_bitfield_contain(bitfield,tmp : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function cd_bitfield_value(tmp : longint) : longint;

function cd_bitfield_from_enums(value:Tgint; args:array of const):Tguint64;cdecl;external;
function cd_bitfield_from_enums(value:Tgint):Tguint64;cdecl;external;
(* Const before type ignored *)
function cd_device_kind_to_string(kind_enum:TCdDeviceKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_kind_from_string(kind:Pgchar):TCdDeviceKind;cdecl;external;
(* Const before type ignored *)
function cd_profile_kind_to_string(profile_kind:TCdProfileKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_kind_from_string(profile_kind:Pgchar):TCdProfileKind;cdecl;external;
(* Const before type ignored *)
function cd_rendering_intent_from_string(rendering_intent:Pgchar):TCdRenderingIntent;cdecl;external;
(* Const before type ignored *)
function cd_rendering_intent_to_string(rendering_intent:TCdRenderingIntent):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_pixel_format_from_string(pixel_format:Pgchar):TCdPixelFormat;cdecl;external;
(* Const before type ignored *)
function cd_pixel_format_to_string(pixel_format:TCdPixelFormat):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_colorspace_to_string(colorspace:TCdColorspace):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_colorspace_from_string(colorspace:Pgchar):TCdColorspace;cdecl;external;
(* Const before type ignored *)
function cd_device_mode_to_string(device_mode:TCdDeviceMode):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_mode_from_string(device_mode:Pgchar):TCdDeviceMode;cdecl;external;
(* Const before type ignored *)
function cd_device_relation_to_string(device_relation:TCdDeviceRelation):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_relation_from_string(device_relation:Pgchar):TCdDeviceRelation;cdecl;external;
(* Const before type ignored *)
function cd_object_scope_to_string(object_scope:TCdObjectScope):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_object_scope_from_string(object_scope:Pgchar):TCdObjectScope;cdecl;external;
(* Const before type ignored *)
function cd_sensor_kind_to_string(sensor_kind:TCdSensorKind):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_sensor_kind_from_string(sensor_kind:Pgchar):TCdSensorKind;cdecl;external;
(* Const before type ignored *)
function cd_sensor_state_to_string(sensor_state:TCdSensorState):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_sensor_state_from_string(sensor_state:Pgchar):TCdSensorState;cdecl;external;
(* Const before type ignored *)
function cd_sensor_cap_to_string(sensor_cap:TCdSensorCap):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_sensor_cap_from_string(sensor_cap:Pgchar):TCdSensorCap;cdecl;external;
(* Const before type ignored *)
function cd_standard_space_to_string(standard_space:TCdStandardSpace):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_standard_space_from_string(standard_space:Pgchar):TCdStandardSpace;cdecl;external;
(* Const before type ignored *)
function cd_profile_warning_to_string(kind_enum:TCdProfileWarning):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_warning_from_string(_type:Pgchar):TCdProfileWarning;cdecl;external;
(* Const before type ignored *)
function cd_profile_quality_to_string(quality_enum:TCdProfileQuality):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_quality_from_string(quality:Pgchar):TCdProfileQuality;cdecl;external;
function cd_device_kind_to_profile_kind(device_kind:TCdDeviceKind):TCdProfileKind;cdecl;external;
(* Const before type ignored *)
function cd_sensor_error_to_string(error_enum:TCdSensorError):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_sensor_error_from_string(error_desc:Pgchar):TCdSensorError;cdecl;external;
(* Const before type ignored *)
function cd_profile_error_to_string(error_enum:TCdProfileError):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_profile_error_from_string(error_desc:Pgchar):TCdProfileError;cdecl;external;
(* Const before type ignored *)
function cd_device_error_to_string(error_enum:TCdDeviceError):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_device_error_from_string(error_desc:Pgchar):TCdDeviceError;cdecl;external;
(* Const before type ignored *)
function cd_client_error_to_string(error_enum:TCdClientError):Pgchar;cdecl;external;
(* Const before type ignored *)
function cd_client_error_from_string(error_desc:Pgchar):TCdClientError;cdecl;external;
{$endif}
{ __CD_ENUM_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function cd_bitfield_contain(bitfield,tmp : longint) : longint;
begin
  cd_bitfield_contain:=(Tbitfield(@(cd_bitfield_value(tmp))))>0;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function cd_bitfield_value(tmp : longint) : longint;
begin
  cd_bitfield_value:=(Tguint64(1)) shl tmp;
end;


end.
