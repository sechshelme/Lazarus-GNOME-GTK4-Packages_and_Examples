
unit gnuserv;
interface

{
  Automatically converted by H2Pas 1.0.0 from gnuserv.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gnuserv.h
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
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*-C-*-

 Header file for the GNU Emacs server and client C code.

 This file is part of GNU Emacs.

 Copying is permitted under those conditions described by the GNU
 General Public License.

 Copyright (C) 1989 Free Software Foundation, Inc.

 Author: Andy Norman (ange@hplb.hpl.hp.com), based on
         'etc/server.c' and 'etc/emacsclient.c' from the 18.52 GNU
         Emacs distribution.

 Please mail bugs and suggestions to the author at the above address.
 }
{ HISTORY
 * 11-Nov-1990		bristor@simba
 *    Added EOT stuff.
  }
{
 * This file incorporates new features added by Bob Weiner <weiner@mot.com>,
 * Darrell Kindred <dkindred@cmu.edu> and Arup Mukherjee <arup@cmu.edu>.
 * Please see the note at the end of the README file for details.
 *
 * (If gnuserv came bundled with your emacs, the README file is probably
 * ../etc/gnuserv.README relative to the directory containing this file)
  }
{$define NO_SHORTNAMES}

const
  PATCHLEVEL = 2;  
{$define NO_SHORTNAMES}
{ gnuserv should not be compiled using SOCKS  }
{$define DO_NOT_SOCKSIFY}
{$include <glibtop.h>}
{$undef read}
{$undef write}
{$undef open}
{$undef close}
{$undef signal}
{ Define the communication method between server and clients:
 *   You can have either or both kinds of sockets, but you can't mix
 *   sockets with sysv ipc
  }
{$define INTERNET_DOMAIN_SOCKETS}
{$define UNIX_DOMAIN_SOCKETS}
{
 * Define additional authentication protocols to be used. These methods will
 * be tried before falling back to the default gnuserv protocol (based on
 * the GNU_SECURE environment variable). Currently, only MIT-MAGIC-COOKIE-1
 * is also supported.
 *
 * Comment out the next line(s) if you don't want to enable the
 * appropriate authentication protocol.
  }
{$if defined (HAVE_XAUTH)}
{$define AUTH_MAGIC_COOKIE}
{$endif}
{ HAVE_XAUTH  }
{
 * stuff related to supporting MIT-MAGIC-COOKIE-1
  }
{$if 0}
{ screen # to use as the gnuserv cookie  }

const
  MCOOKIE_SCREEN = '42980';  
{$endif}
{ authentication protocol name  }

const
  MCOOKIE_NAME = 'MAGIC-1';  
{ as needed by X  }
  MCOOKIE_X_NAME = 'MIT-MAGIC-COOKIE-1';  
{ name of default auth protocol  }
  DEFAUTH_NAME = 'GNU-SECURE';  
{ # seconds to wait for auth data  }
  AUTH_TIMEOUT = 15;  
{ max allows auth protocol name size  }
  AUTH_NAMESZ = 15;  
{
 * Pick a default communication scheme, if none was specified.
  }
{$if !defined(UNIX_DOMAIN_SOCKETS) && !defined(INTERNET_DOMAIN_SOCKETS)}
{ BSD systems use Unix Domain sockets by default  }
{$ifdef BSD}
{$define UNIX_DOMAIN_SOCKETS}
{$endif}
{$endif}
{ No communication method pre-defined  }
{
 * If you are using SYSV_IPC, you might want to make the buffer size bigger
 * since it limits the size of requests and responses. Don't make it bigger
 * than your system's max message size though (usually a couple of k) or else
 * msgsend will start failing. For sockets, using the system BUFSIZ is usually
 * what you want.
  }
{$if defined(INTERNET_DOMAIN_SOCKETS) || defined(UNIX_DOMAIN_SOCKETS)}
{$include <sys/socket.h>}
{$endif}
{ INTERNET_DOMAIN_SOCKETS || UNIX_DOMAIN_SOCKETS  }
{$ifdef INTERNET_DOMAIN_SOCKETS}
{$include <netdb.h>}
{$include <netinet/in.h>}
{$include <arpa/inet.h>}
{ The number of entries in the hash table  }

const
  TABLE_SIZE = 101;  
{ Rather simplistic hash function  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function HASH(host : longint) : longint;

{ default port number to use is
				 * DEFAULT_PORT + uid  }
const
  DEFAULT_PORT = 21490;  
{$endif}
{ INTERNET_DOMAIN_SOCKETS  }
{$ifdef UNIX_DOMAIN_SOCKETS}
{$include <sys/un.h>}
{ put the unix socket in a protected dir  }
{$define HIDE_UNIX_SOCKET}
{$endif}
{ UNIX_DOMAIN_SOCKETS  }
{ max size of a hostname  }

const
  HOSTNAMSZ = 255;  
{ max size of reply from server to client  }
  REPLYSIZ = 300;  
{$undef FALSE}
  FALSE = 0;  
{$undef TRUE}
  TRUE = 1;  
{ The casts shut Sun's compiler up and are safe in the context these
   are actually used.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function max2(x,y : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function min2(x,y : longint) : longint;

{$ifndef _NFILE            /* rough guess at maximum number of open files */}

const
  _NFILE = 20;  
{$endif}

const
  EOT_STR = '\004';  
  EOT_CHR = '\004';  
{ connection types  }
  CONN_UNIX = 0;  
  CONN_INTERNET = 1;  
  CONN_IPC = 2;  
{ function declarations  }
(* Const before type ignored *)

function glibtop_make_connection(hostarg:Pchar; portarg:longint; s:Plongint):longint;cdecl;external;
{$ifdef INTERNET_DOMAIN_SOCKETS}
(* Const before type ignored *)
function glibtop_internet_addr(host:Pchar):longint;cdecl;external;
{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HASH(host : longint) : longint;
begin
  HASH:=host;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function max2(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if (longint(x))>(longint(y)) then
    if_local1:=x
  else
    if_local1:=y;
  max2:=if_local1;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function min2(x,y : longint) : longint;
var
   if_local1 : longint;
(* result types are not known *)
begin
  if (longint(x))<(longint(y)) then
    if_local1:=x
  else
    if_local1:=y;
  min2:=if_local1;
end;


end.
