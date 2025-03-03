
unit nanoftp;
interface

{
  Automatically converted by H2Pas 1.0.0 from nanoftp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nanoftp.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: minimal FTP implementation
 * Description: minimal FTP implementation allowing to fetch resources
 *              like external subset.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __NANO_FTP_H__}
{$define __NANO_FTP_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_FTP_ENABLED}
{ Needed for portability to Windows 64 bits  }
{$if defined(_WIN32) && !defined(__CYGWIN__)}
{$include <winsock2.h>}
{$else}
{*
 * SOCKET:
 *
 * macro used to provide portability of code to windows sockets
  }

const
  SOCKET = longint;  
{*
 * INVALID_SOCKET:
 *
 * macro used to provide portability of code to windows sockets
 * the value to be used when the socket is not valid
  }
{$undef  INVALID_SOCKET}
  INVALID_SOCKET = -(1);  
{$endif}
{ C++ extern C conditionnal removed }
{*
 * ftpListCallback:
 * @userData:  user provided data for the callback
 * @filename:  the file name (including "->" when links are shown)
 * @attrib:  the attribute string
 * @owner:  the owner string
 * @group:  the group string
 * @size:  the file size
 * @links:  the link count
 * @year:  the year
 * @month:  the month
 * @day:  the day
 * @hour:  the hour
 * @minute:  the minute
 *
 * A callback for the xmlNanoFTPList command.
 * Note that only one of year and day:minute are specified.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TftpListCallback = procedure (userData:pointer; filename:Pchar; attrib:Pchar; owner:Pchar; group:Pchar; 
                size:dword; links:longint; year:longint; month:Pchar; day:longint; 
                hour:longint; minute:longint);cdecl;
{*
 * ftpDataCallback:
 * @userData: the user provided context
 * @data: the data received
 * @len: its size in bytes
 *
 * A callback for the xmlNanoFTPGet command.
  }
(* Const before type ignored *)

  TftpDataCallback = procedure (userData:pointer; data:Pchar; len:longint);cdecl;
{
 * Init
  }

procedure xmlNanoFTPInit;cdecl;external;
procedure xmlNanoFTPCleanup;cdecl;external;
{
 * Creating/freeing contexts.
  }
(* Const before type ignored *)
function xmlNanoFTPNewCtxt(URL:Pchar):pointer;cdecl;external;
procedure xmlNanoFTPFreeCtxt(ctx:pointer);cdecl;external;
(* Const before type ignored *)
function xmlNanoFTPConnectTo(server:Pchar; port:longint):pointer;cdecl;external;
{
 * Opening/closing session connections.
  }
(* Const before type ignored *)
function xmlNanoFTPOpen(URL:Pchar):pointer;cdecl;external;
function xmlNanoFTPConnect(ctx:pointer):longint;cdecl;external;
function xmlNanoFTPClose(ctx:pointer):longint;cdecl;external;
function xmlNanoFTPQuit(ctx:pointer):longint;cdecl;external;
(* Const before type ignored *)
procedure xmlNanoFTPScanProxy(URL:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlNanoFTPProxy(host:Pchar; port:longint; user:Pchar; passwd:Pchar; _type:longint);cdecl;external;
(* Const before type ignored *)
function xmlNanoFTPUpdateURL(ctx:pointer; URL:Pchar):longint;cdecl;external;
{
 * Rather internal commands.
  }
function xmlNanoFTPGetResponse(ctx:pointer):longint;cdecl;external;
function xmlNanoFTPCheckResponse(ctx:pointer):longint;cdecl;external;
{
 * CD/DIR/GET handlers.
  }
(* Const before type ignored *)
function xmlNanoFTPCwd(ctx:pointer; directory:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlNanoFTPDele(ctx:pointer; file:Pchar):longint;cdecl;external;
function xmlNanoFTPGetConnection(ctx:pointer):TSOCKET;cdecl;external;
function xmlNanoFTPCloseConnection(ctx:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xmlNanoFTPList(ctx:pointer; callback:TftpListCallback; userData:pointer; filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlNanoFTPGetSocket(ctx:pointer; filename:Pchar):TSOCKET;cdecl;external;
(* Const before type ignored *)
function xmlNanoFTPGet(ctx:pointer; callback:TftpDataCallback; userData:pointer; filename:Pchar):longint;cdecl;external;
function xmlNanoFTPRead(ctx:pointer; dest:pointer; len:longint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_FTP_ENABLED  }
{$endif}
{ __NANO_FTP_H__  }

implementation


end.
