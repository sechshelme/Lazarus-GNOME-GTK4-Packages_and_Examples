
unit netdb;
interface

{
  Automatically converted by H2Pas 1.0.0 from netdb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    netdb.h
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
Paddrinfo  = ^addrinfo;
Pchar  = ^char;
Pgaicb  = ^gaicb;
Phostent  = ^hostent;
Plongint  = ^longint;
Pnetent  = ^netent;
Pprotoent  = ^protoent;
Pservent  = ^servent;
Psigevent  = ^sigevent;
Psockaddr  = ^sockaddr;
Ptimespec  = ^timespec;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1996-2024 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <https://www.gnu.org/licenses/>.   }
{ All data returned by the network data base library are supplied in
   host order and returned in network order (suitable for use in
   system calls).   }
{$ifndef	_NETDB_H}

const
  _NETDB_H = 1;  
{$include <features.h>}
{$include <netinet/in.h>}
{$include <bits/stdint-uintn.h>}
{$ifdef __USE_MISC}
{ This is necessary to make this include file properly replace the
   Sun version.   }
{$include <rpc/netdb.h>}
{$endif}
{$ifdef __USE_GNU}
{$include <bits/types/sigevent_t.h>}
{$include <bits/types/struct_timespec.h>}
{$endif}
{$include <bits/netdb.h>}
{ Absolute file name for network data base files.   }

const
  _PATH_HEQUIV = '/etc/hosts.equiv';  
  _PATH_HOSTS = '/etc/hosts';  
  _PATH_NETWORKS = '/etc/networks';  
  _PATH_NSSWITCH_CONF = '/etc/nsswitch.conf';  
  _PATH_PROTOCOLS = '/etc/protocols';  
  _PATH_SERVICES = '/etc/services';  
{$if defined __USE_MISC || !defined __USE_XOPEN2K8}
{ Error status for non-reentrant lookup functions.
   We use a macro to access always the thread-specific `h_errno' variable.   }
{ Function to get address of global `h_errno' variable.   }

function __h_errno_location:Plongint;cdecl;external;
{ Possible values left in `h_errno'.   }
{ Authoritative Answer Host not found.   }
const
  HOST_NOT_FOUND = 1;  
{ Non-Authoritative Host not found,
				   or SERVERFAIL.   }
  TRY_AGAIN = 2;  
{ Non recoverable errors, FORMERR, REFUSED,
				   NOTIMP.   }
  NO_RECOVERY = 3;  
{ Valid name, no data record of requested
				   type.   }
  NO_DATA = 4;  
{$endif}
{$ifdef __USE_MISC}
{ See errno.   }

const
  NETDB_INTERNAL = -(1);  
{ No problem.   }
  NETDB_SUCCESS = 0;  
{ No address, look for MX record.   }
  NO_ADDRESS = NO_DATA;  
{$endif}
{$if defined __USE_XOPEN2K || defined __USE_XOPEN_EXTENDED}
{ Highest reserved Internet port number.   }

const
  IPPORT_RESERVED = 1024;  
{$endif}
{$ifdef __USE_GNU}
{ Scope delimiter for getaddrinfo(), getnameinfo().   }

const
  SCOPE_DELIMITER = '%';  
{$endif}
{$ifdef __USE_MISC}
{ Print error indicated by `h_errno' variable on standard error.  STR
   if non-null is printed before the error string.   }
(* Const before type ignored *)

procedure herror(__str:Pchar);cdecl;external;
{ Return string associated with error ERR_NUM.   }
(* Const before type ignored *)
function hstrerror(__err_num:longint):Pchar;cdecl;external;
{$endif}
{ Description of data base entry for a single host.   }
{ Official name of host.   }
{ Alias list.   }
{ Host address type.   }
{ Length of address.   }
{ List of addresses from name server.   }
type
  Phostent = ^Thostent;
  Thostent = record
      h_name : Pchar;
      h_aliases : ^Pchar;
      h_addrtype : longint;
      h_length : longint;
      h_addr_list : ^Pchar;
    end;

{ Open host data base files and mark them as staying open even after
   a later search if STAY_OPEN is non-zero.

   This function is a possible cancellation point and therefore not
   marked with .   }

procedure sethostent(__stay_open:longint);cdecl;external;
{ Close host data base files and clear `stay open' flag.

   This function is a possible cancellation point and therefore not
   marked with .   }
procedure endhostent;cdecl;external;
{ Get next entry from host data base file.  Open data base if
   necessary.

   This function is a possible cancellation point and therefore not
   marked with .   }
function gethostent:Phostent;cdecl;external;
{ Return entry from host data base which address match ADDR with
   length LEN and type TYPE.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function gethostbyaddr(__addr:pointer; __len:Tsocklen_t; __type:longint):Phostent;cdecl;external;
{ Return entry from host data base for host with NAME.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function gethostbyname(__name:Pchar):Phostent;cdecl;external;
{$ifdef __USE_MISC}
{ Return entry from host data base for host with NAME.  AF must be
   set to the address type which is `AF_INET' for IPv4 or `AF_INET6'
   for IPv6.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
function gethostbyname2(__name:Pchar; __af:longint):Phostent;cdecl;external;
{ Reentrant versions of the functions above.  The additional
   arguments specify a buffer of BUFLEN starting at BUF.  The last
   argument is a pointer to a variable which gets the value which
   would be stored in the global variable `herrno' by the
   non-reentrant functions.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function gethostent_r(__result_buf:Phostent; __buf:Pchar; __buflen:Tsize_t; __result:PPhostent; __h_errnop:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function gethostbyaddr_r(__addr:pointer; __len:Tsocklen_t; __type:longint; __result_buf:Phostent; __buf:Pchar; 
           __buflen:Tsize_t; __result:PPhostent; __h_errnop:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function gethostbyname_r(__name:Pchar; __result_buf:Phostent; __buf:Pchar; __buflen:Tsize_t; __result:PPhostent; 
           __h_errnop:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function gethostbyname2_r(__name:Pchar; __af:longint; __result_buf:Phostent; __buf:Pchar; __buflen:Tsize_t; 
           __result:PPhostent; __h_errnop:Plongint):longint;cdecl;external;
{$endif}
{ misc  }
{ Open network data base files and mark them as staying open even
   after a later search if STAY_OPEN is non-zero.

   This function is a possible cancellation point and therefore not
   marked with .   }

procedure setnetent(__stay_open:longint);cdecl;external;
{ Close network data base files and clear `stay open' flag.

   This function is a possible cancellation point and therefore not
   marked with .   }
procedure endnetent;cdecl;external;
{ Get next entry from network data base file.  Open data base if
   necessary.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getnetent:Pnetent;cdecl;external;
{ Return entry from network data base which address match NET and
   type TYPE.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getnetbyaddr(__net:Tuint32_t; __type:longint):Pnetent;cdecl;external;
{ Return entry from network data base for network with NAME.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function getnetbyname(__name:Pchar):Pnetent;cdecl;external;
{$ifdef __USE_MISC}
{ Reentrant versions of the functions above.  The additional
   arguments specify a buffer of BUFLEN starting at BUF.  The last
   argument is a pointer to a variable which gets the value which
   would be stored in the global variable `herrno' by the
   non-reentrant functions.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function getnetent_r(__result_buf:Pnetent; __buf:Pchar; __buflen:Tsize_t; __result:PPnetent; __h_errnop:Plongint):longint;cdecl;external;
function getnetbyaddr_r(__net:Tuint32_t; __type:longint; __result_buf:Pnetent; __buf:Pchar; __buflen:Tsize_t; 
           __result:PPnetent; __h_errnop:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function getnetbyname_r(__name:Pchar; __result_buf:Pnetent; __buf:Pchar; __buflen:Tsize_t; __result:PPnetent; 
           __h_errnop:Plongint):longint;cdecl;external;
{$endif}
{ misc  }
{ Description of data base entry for a single service.   }
{ Official service name.   }
{ Alias list.   }
{ Port number.   }
{ Protocol to use.   }
type
  Pservent = ^Tservent;
  Tservent = record
      s_name : Pchar;
      s_aliases : ^Pchar;
      s_port : longint;
      s_proto : Pchar;
    end;

{ Open service data base files and mark them as staying open even
   after a later search if STAY_OPEN is non-zero.

   This function is a possible cancellation point and therefore not
   marked with .   }

procedure setservent(__stay_open:longint);cdecl;external;
{ Close service data base files and clear `stay open' flag.

   This function is a possible cancellation point and therefore not
   marked with .   }
procedure endservent;cdecl;external;
{ Get next entry from service data base file.  Open data base if
   necessary.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getservent:Pservent;cdecl;external;
{ Return entry from network data base for network with NAME and
   protocol PROTO.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
function getservbyname(__name:Pchar; __proto:Pchar):Pservent;cdecl;external;
{ Return entry from service data base which matches port PORT and
   protocol PROTO.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function getservbyport(__port:longint; __proto:Pchar):Pservent;cdecl;external;
{$ifdef __USE_MISC}
{ Reentrant versions of the functions above.  The additional
   arguments specify a buffer of BUFLEN starting at BUF.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function getservent_r(__result_buf:Pservent; __buf:Pchar; __buflen:Tsize_t; __result:PPservent):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function getservbyname_r(__name:Pchar; __proto:Pchar; __result_buf:Pservent; __buf:Pchar; __buflen:Tsize_t; 
           __result:PPservent):longint;cdecl;external;
(* Const before type ignored *)
function getservbyport_r(__port:longint; __proto:Pchar; __result_buf:Pservent; __buf:Pchar; __buflen:Tsize_t; 
           __result:PPservent):longint;cdecl;external;
{$endif}
{ misc  }
{ Description of data base entry for a single service.   }
{ Official protocol name.   }
{ Alias list.   }
{ Protocol number.   }
type
  Pprotoent = ^Tprotoent;
  Tprotoent = record
      p_name : Pchar;
      p_aliases : ^Pchar;
      p_proto : longint;
    end;

{ Open protocol data base files and mark them as staying open even
   after a later search if STAY_OPEN is non-zero.

   This function is a possible cancellation point and therefore not
   marked with .   }

procedure setprotoent(__stay_open:longint);cdecl;external;
{ Close protocol data base files and clear `stay open' flag.

   This function is a possible cancellation point and therefore not
   marked with .   }
procedure endprotoent;cdecl;external;
{ Get next entry from protocol data base file.  Open data base if
   necessary.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getprotoent:Pprotoent;cdecl;external;
{ Return entry from protocol data base for network with NAME.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function getprotobyname(__name:Pchar):Pprotoent;cdecl;external;
{ Return entry from protocol data base which number is PROTO.

   This function is a possible cancellation point and therefore not
   marked with .   }
function getprotobynumber(__proto:longint):Pprotoent;cdecl;external;
{$ifdef __USE_MISC}
{ Reentrant versions of the functions above.  The additional
   arguments specify a buffer of BUFLEN starting at BUF.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .   }
function getprotoent_r(__result_buf:Pprotoent; __buf:Pchar; __buflen:Tsize_t; __result:PPprotoent):longint;cdecl;external;
(* Const before type ignored *)
function getprotobyname_r(__name:Pchar; __result_buf:Pprotoent; __buf:Pchar; __buflen:Tsize_t; __result:PPprotoent):longint;cdecl;external;
function getprotobynumber_r(__proto:longint; __result_buf:Pprotoent; __buf:Pchar; __buflen:Tsize_t; __result:PPprotoent):longint;cdecl;external;
{ Establish network group NETGROUP for enumeration.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
function setnetgrent(__netgroup:Pchar):longint;cdecl;external;
{ Free all space allocated by previous `setnetgrent' call.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
procedure endnetgrent;cdecl;external;
{ Get next member of netgroup established by last `setnetgrent' call
   and return pointers to elements in HOSTP, USERP, and DOMAINP.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function getnetgrent(__hostp:PPchar; __userp:PPchar; __domainp:PPchar):longint;cdecl;external;
{ Test whether NETGROUP contains the triple (HOST,USER,DOMAIN).

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function innetgr(__netgroup:Pchar; __host:Pchar; __user:Pchar; __domain:Pchar):longint;cdecl;external;
{ Reentrant version of `getnetgrent' where result is placed in BUFFER.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function getnetgrent_r(__hostp:PPchar; __userp:PPchar; __domainp:PPchar; __buffer:Pchar; __buflen:Tsize_t):longint;cdecl;external;
{$endif}
{ misc  }
{$ifdef __USE_MISC}
{ Call `rshd' at port RPORT on remote machine *AHOST to execute CMD.
   The local user is LOCUSER, on the remote machine the command is
   executed as REMUSER.  In *FD2P the descriptor to the socket for the
   connection is returned.  The caller must have the right to use a
   reserved port.  When the function returns *AHOST contains the
   official host name.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function rcmd(__ahost:PPchar; __rport:word; __locuser:Pchar; __remuser:Pchar; __cmd:Pchar; 
           __fd2p:Plongint):longint;cdecl;external;
{ This is the equivalent function where the protocol can be selected
   and which therefore can be used for IPv6.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function rcmd_af(__ahost:PPchar; __rport:word; __locuser:Pchar; __remuser:Pchar; __cmd:Pchar; 
           __fd2p:Plongint; __af:Tsa_family_t):longint;cdecl;external;
{ Call `rexecd' at port RPORT on remote machine *AHOST to execute
   CMD.  The process runs at the remote machine using the ID of user
   NAME whose cleartext password is PASSWD.  In *FD2P the descriptor
   to the socket for the connection is returned.  When the function
   returns *AHOST contains the official host name.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function rexec(__ahost:PPchar; __rport:longint; __name:Pchar; __pass:Pchar; __cmd:Pchar; 
           __fd2p:Plongint):longint;cdecl;external;
{ This is the equivalent function where the protocol can be selected
   and which therefore can be used for IPv6.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function rexec_af(__ahost:PPchar; __rport:longint; __name:Pchar; __pass:Pchar; __cmd:Pchar; 
           __fd2p:Plongint; __af:Tsa_family_t):longint;cdecl;external;
{ Check whether user REMUSER on system RHOST is allowed to login as LOCUSER.
   If SUSER is not zero the user tries to become superuser.  Return 0 if
   it is possible.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ruserok(__rhost:Pchar; __suser:longint; __remuser:Pchar; __locuser:Pchar):longint;cdecl;external;
{ This is the equivalent function where the protocol can be selected
   and which therefore can be used for IPv6.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ruserok_af(__rhost:Pchar; __suser:longint; __remuser:Pchar; __locuser:Pchar; __af:Tsa_family_t):longint;cdecl;external;
{ Check whether user REMUSER on system indicated by IPv4 address
   RADDR is allowed to login as LOCUSER.  Non-IPv4 (e.g., IPv6) are
   not supported.  If SUSER is not zero the user tries to become
   superuser.  Return 0 if it is possible.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
function iruserok(__raddr:Tuint32_t; __suser:longint; __remuser:Pchar; __locuser:Pchar):longint;cdecl;external;
{ This is the equivalent function where the pfamiliy if the address
   pointed to by RADDR is determined by the value of AF.  It therefore
   can be used for IPv6

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function iruserok_af(__raddr:pointer; __suser:longint; __remuser:Pchar; __locuser:Pchar; __af:Tsa_family_t):longint;cdecl;external;
{ Try to allocate reserved port, returning a descriptor for a socket opened
   at this port or -1 if unsuccessful.  The search for an available port
   will start at ALPORT and continues with lower numbers.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function rresvport(__alport:Plongint):longint;cdecl;external;
{ This is the equivalent function where the protocol can be selected
   and which therefore can be used for IPv6.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
function rresvport_af(__alport:Plongint; __af:Tsa_family_t):longint;cdecl;external;
{$endif}
{ Extension from POSIX.1:2001.   }
{$ifdef __USE_XOPEN2K}
{ Structure to contain information about address of a service provider.   }
{ Input flags.   }
{ Protocol family for socket.   }
{ Socket type.   }
{ Protocol for socket.   }
{ Length of socket address.   }
{ Socket address for socket.   }
{ Canonical name for service location.   }
{ Pointer to next in list.   }
type
  Paddrinfo = ^Taddrinfo;
  Taddrinfo = record
      ai_flags : longint;
      ai_family : longint;
      ai_socktype : longint;
      ai_protocol : longint;
      ai_addrlen : Tsocklen_t;
      ai_addr : Psockaddr;
      ai_canonname : Pchar;
      ai_next : Paddrinfo;
    end;

{$ifdef __USE_GNU}
{ Structure used as control block for asynchronous lookup.   }
(* Const before type ignored *)
{ Name to look up.   }
(* Const before type ignored *)
{ Service name.   }
(* Const before type ignored *)
{ Additional request specification.   }
{ Pointer to result.   }
{ The following are internal elements.   }
type
  Pgaicb = ^Tgaicb;
  Tgaicb = record
      ar_name : Pchar;
      ar_service : Pchar;
      ar_request : Paddrinfo;
      ar_result : Paddrinfo;
      __return : longint;
      __glibc_reserved : array[0..4] of longint;
    end;

{ Lookup mode.   }

const
  GAI_WAIT = 0;  
  GAI_NOWAIT = 1;  
{$endif}
{ Possible values for `ai_flags' field in `addrinfo' structure.   }
{ Socket address is intended for `bind'.   }

const
  AI_PASSIVE = $0001;  
{ Request for canonical name.   }
  AI_CANONNAME = $0002;  
{ Don't use name resolution.   }
  AI_NUMERICHOST = $0004;  
{ IPv4 mapped addresses are acceptable.   }
  AI_V4MAPPED = $0008;  
{ Return IPv4 mapped and IPv6 addresses.   }
  AI_ALL = $0010;  
{ Use configuration of this host to choose
				   returned address type..   }
  AI_ADDRCONFIG = $0020;  
{$ifdef __USE_GNU}
{ IDN encode input (assuming it is encoded
				   in the current locale's character set)
				   before looking it up.  }

const
  AI_IDN = $0040;  
{ Translate canonical name from IDN format.  }
  AI_CANONIDN = $0080;  
{$endif}
{ Don't use name resolution.   }

const
  AI_NUMERICSERV = $0400;  
{ Error values for `getaddrinfo' function.   }
{ Invalid value for `ai_flags' field.   }
  EAI_BADFLAGS = -(1);  
{ NAME or SERVICE is unknown.   }
  EAI_NONAME = -(2);  
{ Temporary failure in name resolution.   }
  EAI_AGAIN = -(3);  
{ Non-recoverable failure in name res.   }
  EAI_FAIL = -(4);  
{ `ai_family' not supported.   }
  EAI_FAMILY = -(6);  
{ `ai_socktype' not supported.   }
  EAI_SOCKTYPE = -(7);  
{ SERVICE not supported for `ai_socktype'.   }
  EAI_SERVICE = -(8);  
{ Memory allocation failure.   }
  EAI_MEMORY = -(10);  
{ System error returned in `errno'.   }
  EAI_SYSTEM = -(11);  
{ Argument buffer overflow.   }
  EAI_OVERFLOW = -(12);  
{$ifdef __USE_GNU}
{ No address associated with NAME.   }

const
  EAI_NODATA = -(5);  
{ Address family for NAME not supported.   }
  EAI_ADDRFAMILY = -(9);  
{ Processing request in progress.   }
  EAI_INPROGRESS = -(100);  
{ Request canceled.   }
  EAI_CANCELED = -(101);  
{ Request not canceled.   }
  EAI_NOTCANCELED = -(102);  
{ All requests done.   }
  EAI_ALLDONE = -(103);  
{ Interrupted by a signal.   }
  EAI_INTR = -(104);  
{ IDN encoding failed.   }
  EAI_IDN_ENCODE = -(105);  
{$endif}
{$ifdef __USE_MISC}

const
  NI_MAXHOST = 1025;  
  NI_MAXSERV = 32;  
{$endif}
{ Don't try to look up hostname.   }

const
  NI_NUMERICHOST = 1;  
{ Don't convert port number to name.   }
  NI_NUMERICSERV = 2;  
{ Only return nodename portion.   }
  NI_NOFQDN = 4;  
{ Don't return numeric addresses.   }
  NI_NAMEREQD = 8;  
{ Look up UDP service rather than TCP.   }
  NI_DGRAM = 16;  
{$ifdef __USE_GNU}
{ Convert name from IDN format.   }

const
  NI_IDN = 32;  
{ Translate name of a service location and/or a service name to set of
   socket addresses.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function getaddrinfo(__name:Pchar; __service:Pchar; __req:Paddrinfo; __pai:PPaddrinfo):longint;cdecl;external;
{ Free `addrinfo' structure AI including associated storage.   }
procedure freeaddrinfo(__ai:Paddrinfo);cdecl;external;
{ Convert error return from getaddrinfo() to a string.   }
(* Const before type ignored *)
function gai_strerror(__ecode:longint):Pchar;cdecl;external;
{ Translate a socket address to a location and service name.

   This function is a possible cancellation point and therefore not
   marked with .   }
(* Const before type ignored *)
function getnameinfo(__sa:Psockaddr; __salen:Tsocklen_t; __host:Pchar; __hostlen:Tsocklen_t; __serv:Pchar; 
           __servlen:Tsocklen_t; __flags:longint):longint;cdecl;external;
{$endif}
{ POSIX  }
{$ifdef __USE_GNU}
{ Enqueue ENT requests from the LIST.  If MODE is GAI_WAIT wait until all
   requests are handled.  If WAIT is GAI_NOWAIT return immediately after
   queueing the requests and signal completion according to SIG.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }

function getaddrinfo_a(__mode:longint; __list:array[0..(_arr)-1] of Pgaicb; __ent:longint; __sig:Psigevent):longint;cdecl;external;
{ Suspend execution of the thread until at least one of the ENT requests
   in LIST is handled.  If TIMEOUT is not a null pointer it specifies the
   longest time the function keeps waiting before returning with an error.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .   }
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)
function gai_suspend(__list:PPgaicb; __ent:longint; __timeout:Ptimespec):longint;cdecl;external;
{$ifdef __USE_TIME_BITS64}
{$if defined(__REDIRECT)}
(* Const before type ignored *)
(* Const before declarator ignored *)
(* Const before type ignored *)

function gai_suspend(__list:PPgaicb; __ent:longint; __timeout:Ptimespec):longint;cdecl;external;
{$else}

const
  gai_suspend = __gai_suspend_time64;  
{$endif}
{$endif}
{ Get the error status of the request REQ.   }

function gai_error(__req:Pgaicb):longint;cdecl;external;
{ Cancel the requests associated with GAICBP.   }
function gai_cancel(__gaicbp:Pgaicb):longint;cdecl;external;
{$endif}
{ GNU  }
{$endif}
{ netdb.h  }

implementation


end.
