unit cdk_config;

interface

uses
  ncurses, cdk;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TCDK_CSTRING = pchar;
  PCDK_CSTRING = ^TCDK_CSTRING;
  TCDK_CSTRING2 = PPChar;

const
  CDK_PATCHDATE = 20230201;
  CDK_VERSION = '5.0';
  CDK_HAVE_DIRENT_H = 1;
  CDK_HAVE_GETBEGX = 1;
  CDK_HAVE_GETBEGY = 1;
  CDK_HAVE_GETCWD = 1;
  CDK_HAVE_GETLOGIN = 1;
  CDK_HAVE_GETMAXX = 1;
  CDK_HAVE_GETMAXY = 1;
  CDK_HAVE_GETOPT_H = 1;
  CDK_HAVE_GETOPT_HEADER = 1;
  CDK_HAVE_GRP_H = 1;
  CDK_HAVE_INTTYPES_H = 1;
  CDK_HAVE_LIMITS_H = 1;
  CDK_HAVE_LSTAT = 1;
  CDK_HAVE_MEMORY_H = 1;
  CDK_HAVE_MKTIME = 1;
  CDK_HAVE_NCURSES_H = 1;
  CDK_HAVE_PWD_H = 1;
  CDK_HAVE_SETLOCALE = 1;
  CDK_HAVE_SLEEP = 1;
  CDK_HAVE_START_COLOR = 1;
  CDK_HAVE_STDINT_H = 1;
  CDK_HAVE_STDLIB_H = 1;
  CDK_HAVE_STRDUP = 1;
  CDK_HAVE_STRERROR = 1;
  CDK_HAVE_STRINGS_H = 1;
  CDK_HAVE_STRING_H = 1;
  CDK_HAVE_SYS_STAT_H = 1;
  CDK_HAVE_SYS_TYPES_H = 1;
  CDK_HAVE_TERM_H = 1;
  CDK_HAVE_TYPE_CHTYPE = 1;
  CDK_HAVE_UNCTRL_H = 1;
  CDK_HAVE_UNISTD_H = 1;
  CDK_MIXEDCASE_FILENAMES = 1;
  CDK_NCURSES = 1;
  CDK_PACKAGE = 'cdk';
  CDK_STDC_HEADERS = 1;
  CDK_SYSTEM_NAME = 'linux-gnu';
  CDK_TYPE_CHTYPE_IS_SCALAR = 1;

function setbegyx(win, y, x: longint): longint;
function lstat(f: pansichar; b: PStat): longint;

// === Konventiert am: 30-4-25 17:11:33 ===


implementation


function setbegyx(win, y, x: longint): longint;
begin
  setbegyx := ERR;
end;

function lstat(f: pansichar; b: PStat): longint;
begin
  lstat := stat(f, b);
end;


end.
