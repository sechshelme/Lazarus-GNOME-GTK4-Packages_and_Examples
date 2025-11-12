unit fp_portmidi;

interface

const
  {$IFDEF Linux}
  libportmidi = 'portmidi';
  {$ENDIF}

  {$IFDEF Windows}
  libportmidi = 'libportmidi.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Pint32_t = ^Tint32_t;
  Tint32_t = int32;

  Puint32_t = ^Tuint32_t;
  Tuint32_t = uint32;

const
  PM_DEFAULT_SYSEX_BUFFER_SIZE = 1024;

type
  PPmError = ^TPmError;
  TPmError = longint;

const
  pmNoError = 0;
  pmNoData = 0;
  pmGotData = 1;
  pmHostError = -(10000);
  pmInvalidDeviceId = (-(10000)) + 1;
  pmInsufficientMemory = (-(10000)) + 2;
  pmBufferTooSmall = (-(10000)) + 3;
  pmBufferOverflow = (-(10000)) + 4;
  pmBadPtr = (-(10000)) + 5;
  pmBadData = (-(10000)) + 6;
  pmInternalError = (-(10000)) + 7;
  pmBufferMaxSize = (-(10000)) + 8;

function Pm_Initialize: TPmError; cdecl; external libportmidi;
function Pm_Terminate: TPmError; cdecl; external libportmidi;

type
  PPortMidiStream = type Pointer;
  PPPortMidiStream = ^PPortMidiStream;

  PPmStream = PPortMidiStream;

function Pm_HasHostError(stream: PPortMidiStream): longint; cdecl; external libportmidi;
function Pm_GetErrorText(errnum: TPmError): pchar; cdecl; external libportmidi;
procedure Pm_GetHostErrorText(msg: pchar; len: dword); cdecl; external libportmidi;

const
  HDRLENGTH = 50;
  PM_HOST_ERROR_MSG_LEN = 256;

type
  PPmDeviceID = ^TPmDeviceID;
  TPmDeviceID = longint;

const
  pmNoDevice = -(1);

type
  TPmDeviceInfo = record
    structVersion: longint;
    interf: pchar;
    name: pchar;
    input: longint;
    output: longint;
    opened: longint;
  end;
  PPmDeviceInfo = ^TPmDeviceInfo;

function Pm_CountDevices: longint; cdecl; external libportmidi;
function Pm_GetDefaultInputDeviceID: TPmDeviceID; cdecl; external libportmidi;
function Pm_GetDefaultOutputDeviceID: TPmDeviceID; cdecl; external libportmidi;

type
  PPmTimestamp = ^TPmTimestamp;
  TPmTimestamp = Tint32_t;

  TPmTimeProcPtr = function(time_info: pointer): TPmTimestamp; cdecl;

function PmBefore(t1, t2: longint): boolean;

function Pm_GetDeviceInfo(id: TPmDeviceID): PPmDeviceInfo; cdecl; external libportmidi;
function Pm_OpenInput(stream: PPPortMidiStream; inputDevice: TPmDeviceID; inputDriverInfo: pointer; bufferSize: Tint32_t; time_proc: TPmTimeProcPtr;
  time_info: pointer): TPmError; cdecl; external libportmidi;
function Pm_OpenOutput(stream: PPPortMidiStream; outputDevice: TPmDeviceID; outputDriverInfo: pointer; bufferSize: Tint32_t; time_proc: TPmTimeProcPtr;
  time_info: pointer; latency: Tint32_t): TPmError; cdecl; external libportmidi;

const
  PM_FILT_ACTIVE = 1 shl $0E;
  PM_FILT_SYSEX = 1 shl $00;
  PM_FILT_CLOCK = 1 shl $08;
  PM_FILT_PLAY = ((1 shl $0A) or (1 shl $0C)) or (1 shl $0B);
  PM_FILT_TICK = 1 shl $09;
  PM_FILT_FD = 1 shl $0D;
  PM_FILT_UNDEFINED = PM_FILT_FD;
  PM_FILT_RESET = 1 shl $0F;
  PM_FILT_REALTIME = (((((PM_FILT_ACTIVE or PM_FILT_SYSEX) or PM_FILT_CLOCK) or PM_FILT_PLAY) or PM_FILT_UNDEFINED) or PM_FILT_RESET) or PM_FILT_TICK;
  PM_FILT_NOTE = (1 shl $19) or (1 shl $18);
  PM_FILT_CHANNEL_AFTERTOUCH = 1 shl $1D;
  PM_FILT_POLY_AFTERTOUCH = 1 shl $1A;
  PM_FILT_AFTERTOUCH = PM_FILT_CHANNEL_AFTERTOUCH or PM_FILT_POLY_AFTERTOUCH;
  PM_FILT_PROGRAM = 1 shl $1C;
  PM_FILT_CONTROL = 1 shl $1B;
  PM_FILT_PITCHBEND = 1 shl $1E;
  PM_FILT_MTC = 1 shl $01;
  PM_FILT_SONG_POSITION = 1 shl $02;
  PM_FILT_SONG_SELECT = 1 shl $03;
  PM_FILT_TUNE = 1 shl $06;
  PM_FILT_SYSTEMCOMMON = PM_FILT_MTC or PM_FILT_SONG_POSITION or PM_FILT_SONG_SELECT or PM_FILT_TUNE;

function Pm_SetFilter(stream: PPortMidiStream; filters: Tint32_t): TPmError; cdecl; external libportmidi;

function Pm_Channel(channel: longint): longint;

function Pm_SetChannelMask(stream: PPortMidiStream; mask: longint): TPmError; cdecl; external libportmidi;
function Pm_Abort(stream: PPortMidiStream): TPmError; cdecl; external libportmidi;
function Pm_Close(stream: PPortMidiStream): TPmError; cdecl; external libportmidi;
function Pm_Synchronize(stream: PPortMidiStream): TPmError; cdecl; external libportmidi;

function Pm_Message(status, data1, data2: DWord): DWord;
function Pm_MessageStatus(msg: DWord): DWord;
function Pm_MessageData1(msg: DWord): DWord;
function Pm_MessageData2(msg: DWord): DWord;

type
  PPmMessage = ^TPmMessage;
  TPmMessage = Tint32_t;

  TPmEvent = record
    message: TPmMessage;
    timestamp: TPmTimestamp;
  end;
  PPmEvent = ^TPmEvent;

function Pm_Read(stream: PPortMidiStream; buffer: PPmEvent; length: Tint32_t): longint; cdecl; external libportmidi;
function Pm_Poll(stream: PPortMidiStream): TPmError; cdecl; external libportmidi;
function Pm_Write(stream: PPortMidiStream; buffer: PPmEvent; length: Tint32_t): TPmError; cdecl; external libportmidi;
function Pm_WriteShort(stream: PPortMidiStream; when: TPmTimestamp; msg: Tint32_t): TPmError; cdecl; external libportmidi;
function Pm_WriteSysEx(stream: PPortMidiStream; when: TPmTimestamp; msg: pbyte): TPmError; cdecl; external libportmidi;

// === Konventiert am: 12-11-25 16:18:47 ===


implementation


function PmBefore(t1, t2: longint): boolean;
begin
  PmBefore := (t1 - t2) < 0;
end;

function Pm_Channel(channel: longint): longint;
begin
  Pm_Channel := 1 shl channel;
end;

function Pm_Message(status, data1, data2: DWord): DWord;
begin
  Pm_Message := (((data2 shl 16) and $FF0000) or ((data1 shl 8) and $FF00)) or (status and ($FF));
end;

function Pm_MessageStatus(msg: DWord): DWord;
begin
  Pm_MessageStatus := msg and $FF;
end;

function Pm_MessageData1(msg: DWord): DWord;
begin
  Pm_MessageData1 := (msg shr 8) and $FF;
end;

function Pm_MessageData2(msg: DWord): DWord;
begin
  Pm_MessageData2 := (msg shr 16) and $FF;
end;


end.
