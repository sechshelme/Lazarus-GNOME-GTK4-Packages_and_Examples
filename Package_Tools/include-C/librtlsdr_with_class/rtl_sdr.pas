unit rtl_sdr;

interface

// https://github.com/steve-m/librtlsdr/tree/master/include

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF Linux}
  librtlsdr = 'librtlsdr';
  {$ENDIF}

  {$IFDEF mswindows}
  librtlsdr = 'librtlsdr.dll';
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;

  Trtlsdr_dev_t = record
  end;
  Prtlsdr_dev_t = ^Trtlsdr_dev_t;
  PPrtlsdr_dev_t = ^Prtlsdr_dev_t;

function rtlsdr_get_device_count: Tuint32_t; cdecl; external librtlsdr;
function rtlsdr_get_device_name(index: Tuint32_t): pchar; cdecl; external librtlsdr;
function rtlsdr_get_device_usb_strings(index: Tuint32_t; manufact: pchar; product: pchar; serial: pchar): longint; cdecl; external librtlsdr;
function rtlsdr_get_index_by_serial(serial: pchar): longint; cdecl; external librtlsdr;
function rtlsdr_open(dev: PPrtlsdr_dev_t; index: Tuint32_t): longint; cdecl; external librtlsdr;
function rtlsdr_close(dev: Prtlsdr_dev_t): longint; cdecl; external librtlsdr;
function rtlsdr_set_xtal_freq(dev: Prtlsdr_dev_t; rtl_freq: Tuint32_t; tuner_freq: Tuint32_t): longint; cdecl; external librtlsdr;
function rtlsdr_get_xtal_freq(dev: Prtlsdr_dev_t; rtl_freq: Puint32_t; tuner_freq: Puint32_t): longint; cdecl; external librtlsdr;
function rtlsdr_get_usb_strings(dev: Prtlsdr_dev_t; manufact: pchar; product: pchar; serial: pchar): longint; cdecl; external librtlsdr;
function rtlsdr_write_eeprom(dev: Prtlsdr_dev_t; data: Puint8_t; offset: Tuint8_t; len: Tuint16_t): longint; cdecl; external librtlsdr;
function rtlsdr_read_eeprom(dev: Prtlsdr_dev_t; data: Puint8_t; offset: Tuint8_t; len: Tuint16_t): longint; cdecl; external librtlsdr;
function rtlsdr_set_center_freq(dev: Prtlsdr_dev_t; freq: Tuint32_t): longint; cdecl; external librtlsdr;
function rtlsdr_get_center_freq(dev: Prtlsdr_dev_t): Tuint32_t; cdecl; external librtlsdr;
function rtlsdr_set_freq_correction(dev: Prtlsdr_dev_t; ppm: longint): longint; cdecl; external librtlsdr;
function rtlsdr_get_freq_correction(dev: Prtlsdr_dev_t): longint; cdecl; external librtlsdr;

type
  Trtlsdr_tuner = longint;

const
  RTLSDR_TUNER_UNKNOWN = 0;
  RTLSDR_TUNER_E4000 = 1;
  RTLSDR_TUNER_FC0012 = 2;
  RTLSDR_TUNER_FC0013 = 3;
  RTLSDR_TUNER_FC2580 = 4;
  RTLSDR_TUNER_R820T = 5;
  RTLSDR_TUNER_R828D = 6;

function rtlsdr_get_tuner_type(dev: Prtlsdr_dev_t): Trtlsdr_tuner; cdecl; external librtlsdr;
function rtlsdr_get_tuner_gains(dev: Prtlsdr_dev_t; gains: Plongint): longint; cdecl; external librtlsdr;
function rtlsdr_set_tuner_gain(dev: Prtlsdr_dev_t; gain: longint): longint; cdecl; external librtlsdr;
function rtlsdr_set_tuner_bandwidth(dev: Prtlsdr_dev_t; bw: Tuint32_t): longint; cdecl; external librtlsdr;
function rtlsdr_get_tuner_gain(dev: Prtlsdr_dev_t): longint; cdecl; external librtlsdr;
function rtlsdr_set_tuner_if_gain(dev: Prtlsdr_dev_t; stage: longint; gain: longint): longint; cdecl; external librtlsdr;
function rtlsdr_set_tuner_gain_mode(dev: Prtlsdr_dev_t; manual: longint): longint; cdecl; external librtlsdr;
function rtlsdr_set_sample_rate(dev: Prtlsdr_dev_t; rate: Tuint32_t): longint; cdecl; external librtlsdr;
function rtlsdr_get_sample_rate(dev: Prtlsdr_dev_t): Tuint32_t; cdecl; external librtlsdr;
function rtlsdr_set_testmode(dev: Prtlsdr_dev_t; on_: longint): longint; cdecl; external librtlsdr;
function rtlsdr_set_agc_mode(dev: Prtlsdr_dev_t; on_: longint): longint; cdecl; external librtlsdr;
function rtlsdr_set_direct_sampling(dev: Prtlsdr_dev_t; on_: longint): longint; cdecl; external librtlsdr;
function rtlsdr_get_direct_sampling(dev: Prtlsdr_dev_t): longint; cdecl; external librtlsdr;
function rtlsdr_set_offset_tuning(dev: Prtlsdr_dev_t; on_: longint): longint; cdecl; external librtlsdr;
function rtlsdr_get_offset_tuning(dev: Prtlsdr_dev_t): longint; cdecl; external librtlsdr;
function rtlsdr_reset_buffer(dev: Prtlsdr_dev_t): longint; cdecl; external librtlsdr;
function rtlsdr_read_sync(dev: Prtlsdr_dev_t; buf: pointer; len: longint; n_read: Plongint): longint; cdecl; external librtlsdr;

type
  Trtlsdr_read_async_cb_t = procedure(buf: pbyte; len: Tuint32_t; ctx: pointer); cdecl;

function rtlsdr_wait_async(dev: Prtlsdr_dev_t; cb: Trtlsdr_read_async_cb_t; ctx: pointer): longint; cdecl; external librtlsdr;
function rtlsdr_read_async(dev: Prtlsdr_dev_t; cb: Trtlsdr_read_async_cb_t; ctx: pointer; buf_num: Tuint32_t; buf_len: Tuint32_t): longint; cdecl; external librtlsdr;
function rtlsdr_cancel_async(dev: Prtlsdr_dev_t): longint; cdecl; external librtlsdr;
function rtlsdr_set_bias_tee(dev: Prtlsdr_dev_t; on_: longint): longint; cdecl; external librtlsdr;
function rtlsdr_set_bias_tee_gpio(dev: Prtlsdr_dev_t; gpio: longint; on_: longint): longint; cdecl; external librtlsdr;

// === Konventiert am: 8-6-25 13:39:52 ===


implementation



end.
