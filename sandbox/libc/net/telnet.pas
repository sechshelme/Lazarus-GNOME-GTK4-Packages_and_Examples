unit telnet;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  IAC = 255;
  DONT = 254;
  DO_ = 253;
  WONT = 252;
  WILL = 251;
  SB = 250;
  GA = 249;
  EL = 248;
  EC = 247;
  AYT = 246;
  AO = 245;
  IP = 244;
  BREAK = 243;
  DM = 242;
  NOP = 241;
  SE = 240;
  EOR = 239;
  ABORT = 238;
  SUSP = 237;
  xEOF = 236;
  SYNCH = 242;

const
  telcmds: array[0..20] of pansichar = (
    'EOF', 'SUSP', 'ABORT', 'EOR', 'SE', 'NOP', 'DMARK', 'BRK', 'IP', 'AO', 'AYT', 'EC',
    'EL', 'GA', 'SB', 'WILL', 'WONT', 'DO', 'DONT', 'IAC', nil);

const
  TELCMD_FIRST = xEOF;
  TELCMD_LAST = IAC;

function TELCMD_OK(x: DWord): boolean;
function TELCMD(x: longint): pchar;

const
  TELOPT_BINARY = 0;
  TELOPT_ECHO = 1;
  TELOPT_RCP = 2;
  TELOPT_SGA = 3;
  TELOPT_NAMS = 4;
  TELOPT_STATUS = 5;
  TELOPT_TM = 6;
  TELOPT_RCTE = 7;
  TELOPT_NAOL = 8;
  TELOPT_NAOP = 9;
  TELOPT_NAOCRD = 10;
  TELOPT_NAOHTS = 11;
  TELOPT_NAOHTD = 12;
  TELOPT_NAOFFD = 13;
  TELOPT_NAOVTS = 14;
  TELOPT_NAOVTD = 15;
  TELOPT_NAOLFD = 16;
  TELOPT_XASCII = 17;
  TELOPT_LOGOUT = 18;
  TELOPT_BM = 19;
  TELOPT_DET = 20;
  TELOPT_SUPDUP = 21;
  TELOPT_SUPDUPOUTPUT = 22;
  TELOPT_SNDLOC = 23;
  TELOPT_TTYPE = 24;
  TELOPT_EOR = 25;
  TELOPT_TUID = 26;
  TELOPT_OUTMRK = 27;
  TELOPT_TTYLOC = 28;
  TELOPT_3270REGIME = 29;
  TELOPT_X3PAD = 30;
  TELOPT_NAWS = 31;
  TELOPT_TSPEED = 32;
  TELOPT_LFLOW = 33;
  TELOPT_LINEMODE = 34;
  TELOPT_XDISPLOC = 35;
  TELOPT_OLD_ENVIRON = 36;
  TELOPT_AUTHENTICATION = 37;
  TELOPT_ENCRYPT = 38;
  TELOPT_NEW_ENVIRON = 39;
  TELOPT_EXOPL = 255;
  NTELOPTS = 1 + TELOPT_NEW_ENVIRON;

  telopts: array[0..NTELOPTS] of pansichar = (
    'BINARY', 'ECHO', 'RCP', 'SUPPRESS GO AHEAD', 'NAME', 'STATUS', 'TIMING MARK', 'RCTE',
    'NAOL', 'NAOP', 'NAOCRD', 'NAOHTS', 'NAOHTD', 'NAOFFD', 'NAOVTS', 'NAOVTD', 'NAOLFD',
    'EXTEND ASCII', 'LOGOUT', 'BYTE MACRO', 'DATA ENTRY TERMINAL', 'SUPDUP', 'SUPDUP OUTPUT', 'SEND LOCATION',
    'TERMINAL TYPE', 'END OF RECORD', 'TACACS UID', 'OUTPUT MARKING', 'TTYLOC', '3270 REGIME',
    'X.3 PAD', 'NAWS', 'TSPEED', 'LFLOW', 'LINEMODE', 'XDISPLOC', 'OLD-ENVIRON',
    'AUTHENTICATION', 'ENCRYPT', 'NEW-ENVIRON', nil);
  TELOPT_FIRST = TELOPT_BINARY;
  TELOPT_LAST = TELOPT_NEW_ENVIRON;

function TELOPT_OK(x: DWord): boolean;
function TELOPT(x: longint): pchar;

const
  TELQUAL_IS = 0;
  TELQUAL_SEND = 1;
  TELQUAL_INFO = 2;
  TELQUAL_REPLY = 2;
  TELQUAL_NAME = 3;
  LFLOW_OFF = 0;
  LFLOW_ON = 1;
  LFLOW_RESTART_ANY = 2;
  LFLOW_RESTART_XON = 3;
  LM_MODE = 1;
  LM_FORWARDMASK = 2;
  LM_SLC = 3;
  MODE_EDIT = $01;
  MODE_TRAPSIG = $02;
  MODE_ACK = $04;
  MODE_SOFT_TAB = $08;
  MODE_LIT_ECHO = $10;
  MODE_MASK = $1f;
  MODE_FLOW = $0100;
  MODE_ECHO = $0200;
  MODE_INBIN = $0400;
  MODE_OUTBIN = $0800;
  MODE_FORCE = $1000;
  SLC_SYNCH = 1;
  SLC_BRK = 2;
  SLC_IP = 3;
  SLC_AO = 4;
  SLC_AYT = 5;
  SLC_EOR = 6;
  SLC_ABORT = 7;
  SLC_EOF = 8;
  SLC_SUSP = 9;
  SLC_EC = 10;
  SLC_EL = 11;
  SLC_EW = 12;
  SLC_RP = 13;
  SLC_LNEXT = 14;
  SLC_XON = 15;
  SLC_XOFF = 16;
  SLC_FORW1 = 17;
  SLC_FORW2 = 18;
  NSLC = 18;

const
  slc_names: array[0..19] of pansichar = (
    '0', 'SYNCH', 'BRK', 'IP', 'AO', 'AYT', 'EOR', 'ABORT', 'EOF', 'SUSP', 'EC',
    'EL', 'EW', 'RP', 'LNEXT', 'XON', 'XOFF', 'FORW1', 'FORW2', nil);

function SLC_NAME_OK(x: DWord): boolean;
function SLC_NAME(x: longint): pchar;

const
  SLC_NOSUPPORT = 0;
  SLC_CANTCHANGE = 1;
  SLC_VARIABLE = 2;
  SLC_DEFAULT = 3;
  SLC_LEVELBITS = $03;
  SLC_FUNC = 0;
  SLC_FLAGS = 1;
  SLC_VALUE = 2;
  SLC_ACK = $80;
  SLC_FLUSHIN = $40;
  SLC_FLUSHOUT = $20;
  OLD_ENV_VAR = 1;
  OLD_ENV_VALUE = 0;
  NEW_ENV_VAR = 0;
  NEW_ENV_VALUE = 1;
  ENV_ESC = 2;
  ENV_USERVAR = 3;
  AUTH_WHO_CLIENT = 0;
  AUTH_WHO_SERVER = 1;
  AUTH_WHO_MASK = 1;
  AUTH_HOW_ONE_WAY = 0;
  AUTH_HOW_MUTUAL = 2;
  AUTH_HOW_MASK = 2;
  AUTHTYPE_NULL = 0;
  AUTHTYPE_KERBEROS_V4 = 1;
  AUTHTYPE_KERBEROS_V5 = 2;
  AUTHTYPE_SPX = 3;
  AUTHTYPE_MINK = 4;
  AUTHTYPE_CNT = 5;
  AUTHTYPE_TEST = 99;

const
  authtype_names: array[0..5] of pansichar = ('NULL', 'KERBEROS_V4', 'KERBEROS_V5', 'SPX', 'MINK', nil);

function AUTHTYPE_NAME_OK(x: DWord): boolean;
function AUTHTYPE_NAME(x: longint): pchar;

const
  ENCRYPT_IS = 0;
  ENCRYPT_SUPPORT = 1;
  ENCRYPT_REPLY = 2;
  ENCRYPT_START = 3;
  ENCRYPT_END = 4;
  ENCRYPT_REQSTART = 5;
  ENCRYPT_REQEND = 6;
  ENCRYPT_ENC_KEYID = 7;
  ENCRYPT_DEC_KEYID = 8;
  ENCRYPT_CNT = 9;
  ENCTYPE_ANY = 0;
  ENCTYPE_DES_CFB64 = 1;
  ENCTYPE_DES_OFB64 = 2;
  ENCTYPE_CNT = 3;

const
  encrypt_names: array[0..9] of pansichar = (
    'IS', 'SUPPORT', 'REPLY', 'START', 'END', 'REQUEST-START', 'REQUEST-END', 'ENC-KEYID', 'DEC-KEYID', nil);
  enctype_names: array[0..3] of pansichar = ('ANY', 'DES_CFB64', 'DES_OFB64', nil);

function ENCRYPT_NAME_OK(x: DWord): boolean;
function ENCRYPT_NAME(x: longint): pchar;
function ENCTYPE_NAME_OK(x: DWord): boolean;
function ENCTYPE_NAME(x: longint): pchar;


// === Konventiert am: 13-8-25 19:42:58 ===


implementation


function TELCMD_OK(x: DWord): boolean;
begin
  TELCMD_OK := (dword(x) <= TELCMD_LAST) and (dword(x) >= TELCMD_FIRST);
end;

function TELCMD(x: longint): pchar;
begin
  TELCMD := telcmds[x - TELCMD_FIRST];
end;

function TELOPT_OK(x: DWord): boolean;
begin
  TELOPT_OK := (dword(x)) <= TELOPT_LAST;
end;

function TELOPT(x: longint): pchar;
begin
  TELOPT := telopts[x - TELOPT_FIRST];
end;

function SLC_NAME_OK(x: DWord): boolean;
begin
  SLC_NAME_OK := (dword(x)) <= NSLC;
end;

function SLC_NAME(x: longint): pchar;
begin
  SLC_NAME := slc_names[x];
end;

function AUTHTYPE_NAME_OK(x: DWord): boolean;
begin
  AUTHTYPE_NAME_OK := (dword(x)) < AUTHTYPE_CNT;
end;

function AUTHTYPE_NAME(x: longint): pchar;
begin
  AUTHTYPE_NAME := authtype_names[x];
end;

function ENCRYPT_NAME_OK(x: DWord): boolean;
begin
  ENCRYPT_NAME_OK := (dword(x)) < ENCRYPT_CNT;
end;

function ENCRYPT_NAME(x: longint): pchar;
begin
  ENCRYPT_NAME := encrypt_names[x];
end;

function ENCTYPE_NAME_OK(x: DWord): boolean;
begin
  ENCTYPE_NAME_OK := (dword(x)) < ENCTYPE_CNT;
end;

function ENCTYPE_NAME(x: longint): pchar;
begin
  ENCTYPE_NAME := enctype_names[x];
end;


end.
