unit hwdep;

interface

uses
  fp_asound;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  //const
  //  SND_HWDEP_DLSYM_VERSION = _dlsym_hwdep_001;
type
  Psnd_hwdep_info_t = type Pointer;
  PPsnd_hwdep_info_t = ^Psnd_hwdep_info_t;
  Psnd_hwdep_dsp_status_t = type Pointer;
  PPsnd_hwdep_dsp_status_t = ^Psnd_hwdep_dsp_status_t;
  Psnd_hwdep_dsp_image_t = type Pointer;
  PPsnd_hwdep_dsp_image_t = ^Psnd_hwdep_dsp_image_t;

type
  Psnd_hwdep_iface_t = ^Tsnd_hwdep_iface_t;
  Tsnd_hwdep_iface_t = longint;

const
  SND_HWDEP_IFACE_OPL2 = 0;
  SND_HWDEP_IFACE_OPL3 = 1;
  SND_HWDEP_IFACE_OPL4 = 2;
  SND_HWDEP_IFACE_SB16CSP = 3;
  SND_HWDEP_IFACE_EMU10K1 = 4;
  SND_HWDEP_IFACE_YSS225 = 5;
  SND_HWDEP_IFACE_ICS2115 = 6;
  SND_HWDEP_IFACE_SSCAPE = 7;
  SND_HWDEP_IFACE_VX = 8;
  SND_HWDEP_IFACE_MIXART = 9;
  SND_HWDEP_IFACE_USX2Y = 10;
  SND_HWDEP_IFACE_EMUX_WAVETABLE = 11;
  SND_HWDEP_IFACE_BLUETOOTH = 12;
  SND_HWDEP_IFACE_USX2Y_PCM = 13;
  SND_HWDEP_IFACE_PCXHR = 14;
  SND_HWDEP_IFACE_SB_RC = 15;
  SND_HWDEP_IFACE_HDA = 16;
  SND_HWDEP_IFACE_USB_STREAM = 17;
  SND_HWDEP_IFACE_FW_DICE = 18;
  SND_HWDEP_IFACE_FW_FIREWORKS = 19;
  SND_HWDEP_IFACE_FW_BEBOB = 20;
  SND_HWDEP_IFACE_FW_OXFW = 21;
  SND_HWDEP_IFACE_FW_DIGI00X = 22;
  SND_HWDEP_IFACE_FW_TASCAM = 23;
  SND_HWDEP_IFACE_LINE6 = 24;
  SND_HWDEP_IFACE_FW_MOTU = 25;
  SND_HWDEP_IFACE_FW_FIREFACE = 26;
  SND_HWDEP_IFACE_LAST = SND_HWDEP_IFACE_FW_FIREFACE;

const
  SND_HWDEP_OPEN_READ = O_RDONLY;
  SND_HWDEP_OPEN_WRITE = O_WRONLY;
  SND_HWDEP_OPEN_DUPLEX = O_RDWR;
  SND_HWDEP_OPEN_NONBLOCK = O_NONBLOCK;

type
  Psnd_hwdep_type_t = ^Tsnd_hwdep_type_t;
  Tsnd_hwdep_type_t = longint;

const
  SND_HWDEP_TYPE_HW = 0;
  SND_HWDEP_TYPE_SHM = 1;
  SND_HWDEP_TYPE_INET = 2;

type
  Psnd_hwdep_t = type Pointer;
  PPsnd_hwdep_t = ^Psnd_hwdep_t;

function snd_hwdep_open(hwdep: PPsnd_hwdep_t; name: pchar; mode: longint): longint; cdecl; external libasound;
function snd_hwdep_close(hwdep: Psnd_hwdep_t): longint; cdecl; external libasound;
function snd_hwdep_poll_descriptors(hwdep: Psnd_hwdep_t; pfds: Ppollfd; space: dword): longint; cdecl; external libasound;
function snd_hwdep_poll_descriptors_count(hwdep: Psnd_hwdep_t): longint; cdecl; external libasound;
function snd_hwdep_poll_descriptors_revents(hwdep: Psnd_hwdep_t; pfds: Ppollfd; nfds: dword; revents: Pword): longint; cdecl; external libasound;
function snd_hwdep_nonblock(hwdep: Psnd_hwdep_t; nonblock: longint): longint; cdecl; external libasound;
function snd_hwdep_info(hwdep: Psnd_hwdep_t; info: Psnd_hwdep_info_t): longint; cdecl; external libasound;
function snd_hwdep_dsp_status(hwdep: Psnd_hwdep_t; status: Psnd_hwdep_dsp_status_t): longint; cdecl; external libasound;
function snd_hwdep_dsp_load(hwdep: Psnd_hwdep_t; block: Psnd_hwdep_dsp_image_t): longint; cdecl; external libasound;
function snd_hwdep_ioctl(hwdep: Psnd_hwdep_t; request: dword; arg: pointer): longint; cdecl; external libasound;
function snd_hwdep_write(hwdep: Psnd_hwdep_t; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_hwdep_read(hwdep: Psnd_hwdep_t; buffer: pointer; size: Tsize_t): Tssize_t; cdecl; external libasound;
function snd_hwdep_info_sizeof: Tsize_t; cdecl; external libasound;

function snd_hwdep_info_malloc(ptr: PPsnd_hwdep_info_t): longint; cdecl; external libasound;
procedure snd_hwdep_info_free(obj: Psnd_hwdep_info_t); cdecl; external libasound;
procedure snd_hwdep_info_copy(dst: Psnd_hwdep_info_t; src: Psnd_hwdep_info_t); cdecl; external libasound;
function snd_hwdep_info_get_device(obj: Psnd_hwdep_info_t): dword; cdecl; external libasound;
function snd_hwdep_info_get_card(obj: Psnd_hwdep_info_t): longint; cdecl; external libasound;
function snd_hwdep_info_get_id(obj: Psnd_hwdep_info_t): pchar; cdecl; external libasound;
function snd_hwdep_info_get_name(obj: Psnd_hwdep_info_t): pchar; cdecl; external libasound;
function snd_hwdep_info_get_iface(obj: Psnd_hwdep_info_t): Tsnd_hwdep_iface_t; cdecl; external libasound;
procedure snd_hwdep_info_set_device(obj: Psnd_hwdep_info_t; val: dword); cdecl; external libasound;
function snd_hwdep_dsp_status_sizeof: Tsize_t; cdecl; external libasound;

function snd_hwdep_dsp_status_malloc(ptr: PPsnd_hwdep_dsp_status_t): longint; cdecl; external libasound;
procedure snd_hwdep_dsp_status_free(obj: Psnd_hwdep_dsp_status_t); cdecl; external libasound;
procedure snd_hwdep_dsp_status_copy(dst: Psnd_hwdep_dsp_status_t; src: Psnd_hwdep_dsp_status_t); cdecl; external libasound;
function snd_hwdep_dsp_status_get_version(obj: Psnd_hwdep_dsp_status_t): dword; cdecl; external libasound;
function snd_hwdep_dsp_status_get_id(obj: Psnd_hwdep_dsp_status_t): pchar; cdecl; external libasound;
function snd_hwdep_dsp_status_get_num_dsps(obj: Psnd_hwdep_dsp_status_t): dword; cdecl; external libasound;
function snd_hwdep_dsp_status_get_dsp_loaded(obj: Psnd_hwdep_dsp_status_t): dword; cdecl; external libasound;
function snd_hwdep_dsp_status_get_chip_ready(obj: Psnd_hwdep_dsp_status_t): dword; cdecl; external libasound;
function snd_hwdep_dsp_image_sizeof: Tsize_t; cdecl; external libasound;

function snd_hwdep_dsp_image_malloc(ptr: PPsnd_hwdep_dsp_image_t): longint; cdecl; external libasound;
procedure snd_hwdep_dsp_image_free(obj: Psnd_hwdep_dsp_image_t); cdecl; external libasound;
procedure snd_hwdep_dsp_image_copy(dst: Psnd_hwdep_dsp_image_t; src: Psnd_hwdep_dsp_image_t); cdecl; external libasound;
function snd_hwdep_dsp_image_get_index(obj: Psnd_hwdep_dsp_image_t): dword; cdecl; external libasound;
function snd_hwdep_dsp_image_get_name(obj: Psnd_hwdep_dsp_image_t): pchar; cdecl; external libasound;
function snd_hwdep_dsp_image_get_image(obj: Psnd_hwdep_dsp_image_t): pointer; cdecl; external libasound;
function snd_hwdep_dsp_image_get_length(obj: Psnd_hwdep_dsp_image_t): Tsize_t; cdecl; external libasound;
procedure snd_hwdep_dsp_image_set_index(obj: Psnd_hwdep_dsp_image_t; _index: dword); cdecl; external libasound;
procedure snd_hwdep_dsp_image_set_name(obj: Psnd_hwdep_dsp_image_t; name: pchar); cdecl; external libasound;
procedure snd_hwdep_dsp_image_set_image(obj: Psnd_hwdep_dsp_image_t; buffer: pointer); cdecl; external libasound;
procedure snd_hwdep_dsp_image_set_length(obj: Psnd_hwdep_dsp_image_t; length: Tsize_t); cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:23 ===


implementation



end.
