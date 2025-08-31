
unit cuse_lowlevel;
interface

{
  Automatically converted by H2Pas 1.0.0 from cuse_lowlevel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cuse_lowlevel.h
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
Pchar  = ^char;
Pcuse_info  = ^cuse_info;
Pcuse_lowlevel_ops  = ^cuse_lowlevel_ops;
Pfuse_args  = ^fuse_args;
Pfuse_conn_info  = ^fuse_conn_info;
Pfuse_file_info  = ^fuse_file_info;
Pfuse_pollhandle  = ^fuse_pollhandle;
Pfuse_session  = ^fuse_session;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  CUSE: Character device in Userspace
  Copyright (C) 2008-2009  SUSE Linux Products GmbH
  Copyright (C) 2008-2009  Tejun Heo <tj@kernel.org>

  This program can be distributed under the terms of the GNU LGPLv2.
  See the file COPYING.LIB.

  Read example/cusexmp.c for usages.
 }
{$ifndef CUSE_LOWLEVEL_H_}
{$define CUSE_LOWLEVEL_H_}
{$ifndef FUSE_USE_VERSION}

const
  FUSE_USE_VERSION = 29;  
{$endif}
{$include "fuse_lowlevel.h"}
{$include <fcntl.h>}
{$include <sys/types.h>}
{$include <sys/uio.h>}
{ C++ extern C conditionnal removed }
{ use unrestricted ioctl  }

const
  CUSE_UNRESTRICTED_IOCTL = 1 shl 0;  
type
  Pfuse_session = ^Tfuse_session;
  Tfuse_session = record
      {undefined structure}
    end;

(* Const before type ignored *)
  Pcuse_info = ^Tcuse_info;
  Tcuse_info = record
      dev_major : dword;
      dev_minor : dword;
      dev_info_argc : dword;
      dev_info_argv : ^Pchar;
      flags : dword;
    end;

{
 * Most ops behave almost identically to the matching fuse_lowlevel
 * ops except that they don't take @ino.
 *
 * init_done	: called after initialization is complete
 * read/write	: always direct IO, simultaneous operations allowed
 * ioctl	: might be in unrestricted mode depending on ci->flags
  }
(* Const before type ignored *)
(* Const before type ignored *)
  Pcuse_lowlevel_ops = ^Tcuse_lowlevel_ops;
  Tcuse_lowlevel_ops = record
      init : procedure (userdata:pointer; conn:Pfuse_conn_info);cdecl;
      init_done : procedure (userdata:pointer);cdecl;
      destroy : procedure (userdata:pointer);cdecl;
      open : procedure (req:Tfuse_req_t; fi:Pfuse_file_info);cdecl;
      read : procedure (req:Tfuse_req_t; size:Tsize_t; off:Toff_t; fi:Pfuse_file_info);cdecl;
      write : procedure (req:Tfuse_req_t; buf:Pchar; size:Tsize_t; off:Toff_t; fi:Pfuse_file_info);cdecl;
      flush : procedure (req:Tfuse_req_t; fi:Pfuse_file_info);cdecl;
      release : procedure (req:Tfuse_req_t; fi:Pfuse_file_info);cdecl;
      fsync : procedure (req:Tfuse_req_t; datasync:longint; fi:Pfuse_file_info);cdecl;
      ioctl : procedure (req:Tfuse_req_t; cmd:longint; arg:pointer; fi:Pfuse_file_info; flags:dword; 
                    in_buf:pointer; in_bufsz:Tsize_t; out_bufsz:Tsize_t);cdecl;
      poll : procedure (req:Tfuse_req_t; fi:Pfuse_file_info; ph:Pfuse_pollhandle);cdecl;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function cuse_lowlevel_new(args:Pfuse_args; ci:Pcuse_info; clop:Pcuse_lowlevel_ops; userdata:pointer):Pfuse_session;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cuse_lowlevel_setup(argc:longint; argv:PPchar; ci:Pcuse_info; clop:Pcuse_lowlevel_ops; multithreaded:Plongint; 
           userdata:pointer):Pfuse_session;cdecl;external;
procedure cuse_lowlevel_teardown(se:Pfuse_session);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function cuse_lowlevel_main(argc:longint; argv:PPchar; ci:Pcuse_info; clop:Pcuse_lowlevel_ops; userdata:pointer):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ CUSE_LOWLEVEL_H_  }

implementation


end.
