unit avdevice;

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
{$ifndef AVDEVICE_AVDEVICE_H}
{$define AVDEVICE_AVDEVICE_H}
{$include "version_major.h"}
{$ifndef HAVE_AV_CONFIG_H}
{ When included as part of the ffmpeg build, only include the major version
 * to avoid unnecessary rebuilds. When included externally, keep including
 * the full version information.  }
{$include "version.h"}
{$endif}
{*
 * @file
 * @ingroup lavd
 * Main libavdevice API header
  }
{*
 * @defgroup lavd libavdevice
 * Special devices muxing/demuxing library.
 *
 * Libavdevice is a complementary library to @ref libavf "libavformat". It
 * provides various "special" platform-specific muxers and demuxers, e.g. for
 * grabbing devices, audio capture and playback etc. As a consequence, the
 * (de)muxers in libavdevice are of the AVFMT_NOFILE type (they use their own
 * I/O functions). The filename passed to avformat_open_input() often does not
 * refer to an actually existing file, but has some special device-specific
 * meaning - e.g. for xcbgrab it is the display name.
 *
 * To use libavdevice, simply call avdevice_register_all() to register all
 * compiled muxers and demuxers. They all use standard libavformat API.
 *
 * @
  }
{$include "libavutil/log.h"}
{$include "libavutil/opt.h"}
{$include "libavutil/dict.h"}
{$include "libavformat/avformat.h"}
{*
 * Return the LIBAVDEVICE_VERSION_INT constant.
  }

function avdevice_version:dword;cdecl;external libavdevice;
{*
 * Return the libavdevice build-time configuration.
  }
function avdevice_configuration:Pchar;cdecl;external libavdevice;
{*
 * Return the libavdevice license.
  }
function avdevice_license:Pchar;cdecl;external libavdevice;
{*
 * Initialize libavdevice and register all the input and output devices.
  }
procedure avdevice_register_all;cdecl;external libavdevice;
{*
 * Audio input devices iterator.
 *
 * If d is NULL, returns the first registered input audio/video device,
 * if d is non-NULL, returns the next registered input audio/video device after d
 * or NULL if d is the last one.
  }
function av_input_audio_device_next(d:PAVInputFormat):PAVInputFormat;cdecl;external libavdevice;
{*
 * Video input devices iterator.
 *
 * If d is NULL, returns the first registered input audio/video device,
 * if d is non-NULL, returns the next registered input audio/video device after d
 * or NULL if d is the last one.
  }
function av_input_video_device_next(d:PAVInputFormat):PAVInputFormat;cdecl;external libavdevice;
{*
 * Audio output devices iterator.
 *
 * If d is NULL, returns the first registered output audio/video device,
 * if d is non-NULL, returns the next registered output audio/video device after d
 * or NULL if d is the last one.
  }
function av_output_audio_device_next(d:PAVOutputFormat):PAVOutputFormat;cdecl;external libavdevice;
{*
 * Video output devices iterator.
 *
 * If d is NULL, returns the first registered output audio/video device,
 * if d is non-NULL, returns the next registered output audio/video device after d
 * or NULL if d is the last one.
  }
function av_output_video_device_next(d:PAVOutputFormat):PAVOutputFormat;cdecl;external libavdevice;
{*< x coordinate of top left corner  }
{*< y coordinate of top left corner  }
{*< width  }
{*< height  }
type
  PAVDeviceRect = ^TAVDeviceRect;
  TAVDeviceRect = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
    end;
{*
 * Message types used by avdevice_app_to_dev_control_message().
  }
{*
     * Dummy message.
      }
{*
     * Window size change message.
     *
     * Message is sent to the device every time the application changes the size
     * of the window device renders to.
     * Message should also be sent right after window is created.
     *
     * data: AVDeviceRect: new window size.
      }
{*
     * Repaint request message.
     *
     * Message is sent to the device when window has to be repainted.
     *
     * data: AVDeviceRect: area required to be repainted.
     *       NULL: whole area is required to be repainted.
      }
{*
     * Request pause/play.
     *
     * Application requests pause/unpause playback.
     * Mostly usable with devices that have internal buffer.
     * By default devices are not paused.
     *
     * data: NULL
      }
{*
     * Volume control message.
     *
     * Set volume level. It may be device-dependent if volume
     * is changed per stream or system wide. Per stream volume
     * change is expected when possible.
     *
     * data: double: new volume with range of 0.0 - 1.0.
      }
{*
     * Mute control messages.
     *
     * Change mute state. It may be device-dependent if mute status
     * is changed per stream or system wide. Per stream mute status
     * change is expected when possible.
     *
     * data: NULL.
      }
{*
     * Get volume/mute messages.
     *
     * Force the device to send AV_DEV_TO_APP_VOLUME_LEVEL_CHANGED or
     * AV_DEV_TO_APP_MUTE_STATE_CHANGED command respectively.
     *
     * data: NULL.
      }
  TAVAppToDevMessageType =  Longint;
  Const
    AV_APP_TO_DEV_NONE = MKBETAG('N','O','N','E');
    AV_APP_TO_DEV_WINDOW_SIZE = MKBETAG('G','E','O','M');
    AV_APP_TO_DEV_WINDOW_REPAINT = MKBETAG('R','E','P','A');
    AV_APP_TO_DEV_PAUSE = MKBETAG('P','A','U',' ');
    AV_APP_TO_DEV_PLAY = MKBETAG('P','L','A','Y');
    AV_APP_TO_DEV_TOGGLE_PAUSE = MKBETAG('P','A','U','T');
    AV_APP_TO_DEV_SET_VOLUME = MKBETAG('S','V','O','L');
    AV_APP_TO_DEV_MUTE = MKBETAG(' ','M','U','T');
    AV_APP_TO_DEV_UNMUTE = MKBETAG('U','M','U','T');
    AV_APP_TO_DEV_TOGGLE_MUTE = MKBETAG('T','M','U','T');
    AV_APP_TO_DEV_GET_VOLUME = MKBETAG('G','V','O','L');
    AV_APP_TO_DEV_GET_MUTE = MKBETAG('G','M','U','T');

{*
 * Message types used by avdevice_dev_to_app_control_message().
  }
{*
     * Dummy message.
      }
{*
     * Create window buffer message.
     *
     * Device requests to create a window buffer. Exact meaning is device-
     * and application-dependent. Message is sent before rendering first
     * frame and all one-shot initializations should be done here.
     * Application is allowed to ignore preferred window buffer size.
     *
     * @note: Application is obligated to inform about window buffer size
     *        with AV_APP_TO_DEV_WINDOW_SIZE message.
     *
     * data: AVDeviceRect: preferred size of the window buffer.
     *       NULL: no preferred size of the window buffer.
      }
{*
     * Prepare window buffer message.
     *
     * Device requests to prepare a window buffer for rendering.
     * Exact meaning is device- and application-dependent.
     * Message is sent before rendering of each frame.
     *
     * data: NULL.
      }
{*
     * Display window buffer message.
     *
     * Device requests to display a window buffer.
     * Message is sent when new frame is ready to be displayed.
     * Usually buffers need to be swapped in handler of this message.
     *
     * data: NULL.
      }
{*
     * Destroy window buffer message.
     *
     * Device requests to destroy a window buffer.
     * Message is sent when device is about to be destroyed and window
     * buffer is not required anymore.
     *
     * data: NULL.
      }
{*
     * Buffer fullness status messages.
     *
     * Device signals buffer overflow/underflow.
     *
     * data: NULL.
      }
{*
     * Buffer readable/writable.
     *
     * Device informs that buffer is readable/writable.
     * When possible, device informs how many bytes can be read/write.
     *
     * @warning Device may not inform when number of bytes than can be read/write changes.
     *
     * data: int64_t: amount of bytes available to read/write.
     *       NULL: amount of bytes available to read/write is not known.
      }
{*
     * Mute state change message.
     *
     * Device informs that mute state has changed.
     *
     * data: int: 0 for not muted state, non-zero for muted state.
      }
{*
     * Volume level change message.
     *
     * Device informs that volume level has changed.
     *
     * data: double: new volume with range of 0.0 - 1.0.
      }
type
  TAVDevToAppMessageType =  Longint;
  Const
    AV_DEV_TO_APP_NONE = MKBETAG('N','O','N','E');
    AV_DEV_TO_APP_CREATE_WINDOW_BUFFER = MKBETAG('B','C','R','E');
    AV_DEV_TO_APP_PREPARE_WINDOW_BUFFER = MKBETAG('B','P','R','E');
    AV_DEV_TO_APP_DISPLAY_WINDOW_BUFFER = MKBETAG('B','D','I','S');
    AV_DEV_TO_APP_DESTROY_WINDOW_BUFFER = MKBETAG('B','D','E','S');
    AV_DEV_TO_APP_BUFFER_OVERFLOW = MKBETAG('B','O','F','L');
    AV_DEV_TO_APP_BUFFER_UNDERFLOW = MKBETAG('B','U','F','L');
    AV_DEV_TO_APP_BUFFER_READABLE = MKBETAG('B','R','D',' ');
    AV_DEV_TO_APP_BUFFER_WRITABLE = MKBETAG('B','W','R',' ');
    AV_DEV_TO_APP_MUTE_STATE_CHANGED = MKBETAG('C','M','U','T');
    AV_DEV_TO_APP_VOLUME_LEVEL_CHANGED = MKBETAG('C','V','O','L');

{*
 * Send control message from application to device.
 *
 * @param s         device context.
 * @param type      message type.
 * @param data      message data. Exact type depends on message type.
 * @param data_size size of message data.
 * @return >= 0 on success, negative on error.
 *         AVERROR(ENOSYS) when device doesn't implement handler of the message.
  }

function avdevice_app_to_dev_control_message(s:PAVFormatContext; _type:TAVAppToDevMessageType; data:pointer; data_size:Tsize_t):longint;cdecl;external libavdevice;
{*
 * Send control message from device to application.
 *
 * @param s         device context.
 * @param type      message type.
 * @param data      message data. Can be NULL.
 * @param data_size size of message data.
 * @return >= 0 on success, negative on error.
 *         AVERROR(ENOSYS) when application doesn't implement handler of the message.
  }
function avdevice_dev_to_app_control_message(s:PAVFormatContext; _type:TAVDevToAppMessageType; data:pointer; data_size:Tsize_t):longint;cdecl;external libavdevice;
{*
 * Structure describes basic parameters of the device.
  }
{*< device name, format depends on device  }
{*< human friendly name  }
{*< array indicating what media types(s), if any, a device can provide. If null, cannot provide any  }
{*< length of media_types array, 0 if device cannot provide any media types  }
type
  PAVDeviceInfo = ^TAVDeviceInfo;
  TAVDeviceInfo = record
      device_name : Pchar;
      device_description : Pchar;
      media_types : PAVMediaType;
      nb_media_types : longint;
    end;
{*
 * List of devices.
  }
{*< list of autodetected devices  }
{*< number of autodetected devices  }
{*< index of default device or -1 if no default  }

  PAVDeviceInfoList = ^TAVDeviceInfoList;
  TAVDeviceInfoList = record
      devices : ^PAVDeviceInfo;
      nb_devices : longint;
      default_device : longint;
    end;
{*
 * List devices.
 *
 * Returns available device names and their parameters.
 *
 * @note: Some devices may accept system-dependent device names that cannot be
 *        autodetected. The list returned by this function cannot be assumed to
 *        be always completed.
 *
 * @param s                device context.
 * @param[out] device_list list of autodetected devices.
 * @return count of autodetected devices, negative on error.
  }

function avdevice_list_devices(s:PAVFormatContext; device_list:PPAVDeviceInfoList):longint;cdecl;external libavdevice;
{*
 * Convenient function to free result of avdevice_list_devices().
 *
 * @param device_list device list to be freed.
  }
procedure avdevice_free_list_devices(device_list:PPAVDeviceInfoList);cdecl;external libavdevice;
{*
 * List devices.
 *
 * Returns available device names and their parameters.
 * These are convinient wrappers for avdevice_list_devices().
 * Device context is allocated and deallocated internally.
 *
 * @param device           device format. May be NULL if device name is set.
 * @param device_name      device name. May be NULL if device format is set.
 * @param device_options   An AVDictionary filled with device-private options. May be NULL.
 *                         The same options must be passed later to avformat_write_header() for output
 *                         devices or avformat_open_input() for input devices, or at any other place
 *                         that affects device-private options.
 * @param[out] device_list list of autodetected devices
 * @return count of autodetected devices, negative on error.
 * @note device argument takes precedence over device_name when both are set.
  }
function avdevice_list_input_sources(device:PAVInputFormat; device_name:Pchar; device_options:PAVDictionary; device_list:PPAVDeviceInfoList):longint;cdecl;external libavdevice;
function avdevice_list_output_sinks(device:PAVOutputFormat; device_name:Pchar; device_options:PAVDictionary; device_list:PPAVDeviceInfoList):longint;cdecl;external libavdevice;
{*
 * @
  }
{$endif}
{ AVDEVICE_AVDEVICE_H  }

// === Konventiert am: 22-12-25 19:43:51 ===


implementation



end.
