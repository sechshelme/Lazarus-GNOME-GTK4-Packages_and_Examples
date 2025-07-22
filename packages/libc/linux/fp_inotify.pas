unit fp_inotify;

interface

uses
  clib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // /usr/include/x86_64-linux-gnu/bits/inotify.h

const
  IN_CLOEXEC = 02000000;
  IN_NONBLOCK = 00004000;


  // /usr/include/x86_64-linux-gnu/sys/inotify.h

type
  Tinotify_event = record
    wd: longint;
    mask: uint32;
    cookie: uint32;
    len: uint32;
    name: array[0..0] of char;
  end;
  Pinotify_event = ^Tinotify_event;

const
  IN_ACCESS = $00000001;
  IN_MODIFY = $00000002;
  IN_ATTRIB = $00000004;
  IN_CLOSE_WRITE = $00000008;
  IN_CLOSE_NOWRITE = $00000010;
  IN_CLOSE = IN_CLOSE_WRITE or IN_CLOSE_NOWRITE;
  IN_OPEN = $00000020;
  IN_MOVED_FROM = $00000040;
  IN_MOVED_TO = $00000080;
  IN_MOVE = IN_MOVED_FROM or IN_MOVED_TO;
  IN_CREATE = $00000100;
  IN_DELETE = $00000200;
  IN_DELETE_SELF = $00000400;
  IN_MOVE_SELF = $00000800;
  IN_UNMOUNT = $00002000;
  IN_Q_OVERFLOW = $00004000;
  IN_IGNORED = $00008000;
  IN_ONLYDIR = $01000000;
  IN_DONT_FOLLOW = $02000000;
  IN_EXCL_UNLINK = $04000000;
  IN_MASK_CREATE = $10000000;
  IN_MASK_ADD = $20000000;
  IN_ISDIR = $40000000;
  IN_ONESHOT = $80000000;
  IN_ALL_EVENTS = IN_ACCESS or IN_MODIFY or IN_ATTRIB or IN_CLOSE_WRITE or IN_CLOSE_NOWRITE or IN_OPEN or IN_MOVED_FROM or IN_MOVED_TO or IN_CREATE or IN_DELETE or IN_DELETE_SELF or IN_MOVE_SELF;

function inotify_init: longint; cdecl; external libc;
function inotify_init1(__flags: longint): longint; cdecl; external libc;
function inotify_add_watch(__fd: longint; __name: pchar; __mask: uint32): longint; cdecl; external libc;
function inotify_rm_watch(__fd: longint; __wd: longint): longint; cdecl; external libc;



// === Konventiert am: 22-7-25 16:33:02 ===


implementation



end.
