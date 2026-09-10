
unit apr_errno;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_errno.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_errno.h
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
Papr_status_t  = ^apr_status_t;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$ifndef APR_ERRNO_H}
{$define APR_ERRNO_H}
{*
 * @file apr_errno.h
 * @brief APR Error Codes
  }
{$include "apr.h"}
{$if APR_HAVE_ERRNO_H}
{$include <errno.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_errno Error Codes
 * @ingroup APR
 * @
  }
{*
 * Type for specifying an error or status code.
  }
type
  Papr_status_t = ^Tapr_status_t;
  Tapr_status_t = longint;
{*
 * Return a human readable string describing the specified error.
 * @param statcode The error code to get a string for.
 * @param buf A buffer to hold the error string.
 * @param bufsize Size of the buffer to hold the string.
  }

function apr_strerror(statcode:Tapr_status_t; buf:Pchar; bufsize:Tapr_size_t):Pchar;cdecl;external;
{*
 * APR_OS_START_ERROR is where the APR specific error values start.
  }
const
  APR_OS_START_ERROR = 20000;  
{*
 * APR_OS_ERRSPACE_SIZE is the maximum number of errors you can fit
 *    into one of the error/status ranges below -- except for
 *    APR_OS_START_USERERR, which see.
  }
  APR_OS_ERRSPACE_SIZE = 50000;  
{*
 * APR_UTIL_ERRSPACE_SIZE is the size of the space that is reserved for
 * use within apr-util. This space is reserved above that used by APR
 * internally.
 * @note This number MUST be smaller than APR_OS_ERRSPACE_SIZE by a
 *       large enough amount that APR has sufficient room for its
 *       codes.
  }
  APR_UTIL_ERRSPACE_SIZE = 20000;  
{*
 * APR_OS_START_STATUS is where the APR specific status codes start.
  }
  APR_OS_START_STATUS = APR_OS_START_ERROR+APR_OS_ERRSPACE_SIZE;  
{*
 * APR_UTIL_START_STATUS is where APR-Util starts defining its
 * status codes.
  }
  APR_UTIL_START_STATUS = APR_OS_START_STATUS+(APR_OS_ERRSPACE_SIZE-APR_UTIL_ERRSPACE_SIZE);  
{*
 * APR_OS_START_USERERR are reserved for applications that use APR that
 *     layer their own error codes along with APR's.  Note that the
 *     error immediately following this one is set ten times farther
 *     away than usual, so that users of apr have a lot of room in
 *     which to declare custom error codes.
 *
 * In general applications should try and create unique error codes. To try
 * and assist in finding suitable ranges of numbers to use, the following
 * ranges are known to be used by the listed applications. If your
 * application defines error codes please advise the range of numbers it
 * uses to dev@apr.apache.org for inclusion in this list.
 *
 * Ranges shown are in relation to APR_OS_START_USERERR
 *
 * Subversion - Defined ranges, of less than 100, at intervals of 5000
 *              starting at an offset of 5000, e.g.
 *               +5000 to 5100,  +10000 to 10100
 *
 * Apache HTTPD - +2000 to 2999
  }
  APR_OS_START_USERERR = APR_OS_START_STATUS+APR_OS_ERRSPACE_SIZE;  
{*
 * APR_OS_START_USEERR is obsolete, defined for compatibility only.
 * Use APR_OS_START_USERERR instead.
  }
  APR_OS_START_USEERR = APR_OS_START_USERERR;  
{*xxxxxxx
#define APR_OS_START_CANONERR  (APR_OS_START_USERERR \
                                 + (APR_OS_ERRSPACE_SIZE * 10))
  }
{*
 * APR_OS_START_EAIERR folds EAI_ error codes from getaddrinfo() into
 *     apr_status_t values.
  }
  APR_OS_START_EAIERR = APR_OS_START_CANONERR+APR_OS_ERRSPACE_SIZE;  
{*
 * APR_OS_START_SYSERR folds platform-specific system error values into
 *     apr_status_t values.
  }
  APR_OS_START_SYSERR = APR_OS_START_EAIERR+APR_OS_ERRSPACE_SIZE;  
{*
 * @defgroup APR_ERROR_map APR Error Space
 * <PRE>
 * The following attempts to show the relation of the various constants
 * used for mapping APR Status codes.
 *
 *       0
 *
 *  20,000     APR_OS_START_ERROR
 *
 *         + APR_OS_ERRSPACE_SIZE (50,000)
 *
 *  70,000      APR_OS_START_STATUS
 *
 *         + APR_OS_ERRSPACE_SIZE - APR_UTIL_ERRSPACE_SIZE (30,000)
 *
 * 100,000      APR_UTIL_START_STATUS
 *
 *         + APR_UTIL_ERRSPACE_SIZE (20,000)
 *
 * 120,000      APR_OS_START_USERERR
 *
 *         + 10 x APR_OS_ERRSPACE_SIZE (50,000 * 10)
 *
 * 620,000      APR_OS_START_CANONERR
 *
 *         + APR_OS_ERRSPACE_SIZE (50,000)
 *
 * 670,000      APR_OS_START_EAIERR
 *
 *         + APR_OS_ERRSPACE_SIZE (50,000)
 *
 * 720,000      APR_OS_START_SYSERR
 *
 * </PRE>
  }
{* no error.  }
  APR_SUCCESS = 0;  
{*
 * @defgroup APR_Error APR Error Values
 * <PRE>
 * <b>APR ERROR VALUES</b>
 * APR_ENOSTAT      APR was unable to perform a stat on the file
 * APR_ENOPOOL      APR was not provided a pool with which to allocate memory
 * APR_EBADDATE     APR was given an invalid date
 * APR_EINVALSOCK   APR was given an invalid socket
 * APR_ENOPROC      APR was not given a process structure
 * APR_ENOTIME      APR was not given a time structure
 * APR_ENODIR       APR was not given a directory structure
 * APR_ENOLOCK      APR was not given a lock structure
 * APR_ENOPOLL      APR was not given a poll structure
 * APR_ENOSOCKET    APR was not given a socket
 * APR_ENOTHREAD    APR was not given a thread structure
 * APR_ENOTHDKEY    APR was not given a thread key structure
 * APR_ENOSHMAVAIL  There is no more shared memory available
 * APR_EDSOOPEN     APR was unable to open the dso object.  For more
 *                  information call apr_dso_error().
 * APR_EGENERAL     General failure (specific information not available)
 * APR_EBADIP       The specified IP address is invalid
 * APR_EBADMASK     The specified netmask is invalid
 * APR_ESYMNOTFOUND Could not find the requested symbol
 * APR_ENOTENOUGHENTROPY Not enough entropy to continue
 * </PRE>
 *
 * <PRE>
 * <b>APR STATUS VALUES</b>
 * APR_INCHILD        Program is currently executing in the child
 * APR_INPARENT       Program is currently executing in the parent
 * APR_DETACH         The thread is detached
 * APR_NOTDETACH      The thread is not detached
 * APR_CHILD_DONE     The child has finished executing
 * APR_CHILD_NOTDONE  The child has not finished executing
 * APR_TIMEUP         The operation did not finish before the timeout
 * APR_INCOMPLETE     The operation was incomplete although some processing
 *                    was performed and the results are partially valid
 * APR_BADCH          Getopt found an option not in the option string
 * APR_BADARG         Getopt found an option that is missing an argument
 *                    and an argument was specified in the option string
 * APR_EOF            APR has encountered the end of the file
 * APR_NOTFOUND       APR was unable to find the socket in the poll structure
 * APR_ANONYMOUS      APR is using anonymous shared memory
 * APR_FILEBASED      APR is using a file name as the key to the shared memory
 * APR_KEYBASED       APR is using a shared key as the key to the shared memory
 * APR_EINIT          Ininitalizer value.  If no option has been found, but
 *                    the status variable requires a value, this should be used
 * APR_ENOTIMPL       The APR function has not been implemented on this
 *                    platform, either because nobody has gotten to it yet,
 *                    or the function is impossible on this platform.
 * APR_EMISMATCH      Two passwords do not match.
 * APR_EABSOLUTE      The given path was absolute.
 * APR_ERELATIVE      The given path was relative.
 * APR_EINCOMPLETE    The given path was neither relative nor absolute.
 * APR_EABOVEROOT     The given path was above the root path.
 * APR_EBUSY          The given lock was busy.
 * APR_EPROC_UNKNOWN  The given process wasn't recognized by APR
 * </PRE>
 * @
  }
{ These can't sit in a private header, so in spite of the extra size,
 * they need to be made available here.
  }
  SOCBASEERR = 10000;  
{ Not owner  }
  SOCEPERM = SOCBASEERR+1;  
{ No such process  }
  SOCESRCH = SOCBASEERR+3;  
{ Interrupted system call  }
  SOCEINTR = SOCBASEERR+4;  
{ No such device or address  }
  SOCENXIO = SOCBASEERR+6;  
{ Bad file number  }
  SOCEBADF = SOCBASEERR+9;  
{ Permission denied  }
  SOCEACCES = SOCBASEERR+13;  
{ Bad address  }
  SOCEFAULT = SOCBASEERR+14;  
{ Invalid argument  }
  SOCEINVAL = SOCBASEERR+22;  
{ Too many open files  }
  SOCEMFILE = SOCBASEERR+24;  
{ Broken pipe  }
  SOCEPIPE = SOCBASEERR+32;  
{ OS/2 Error  }
  SOCEOS2ERR = SOCBASEERR+100;  
{ Operation would block  }
  SOCEWOULDBLOCK = SOCBASEERR+35;  
{ Operation now in progress  }
  SOCEINPROGRESS = SOCBASEERR+36;  
{ Operation already in progress  }
  SOCEALREADY = SOCBASEERR+37;  
{ Socket operation on non-socket  }
  SOCENOTSOCK = SOCBASEERR+38;  
{ Destination address required  }
  SOCEDESTADDRREQ = SOCBASEERR+39;  
{ Message too long  }
  SOCEMSGSIZE = SOCBASEERR+40;  
{ Protocol wrong type for socket  }
  SOCEPROTOTYPE = SOCBASEERR+41;  
{ Protocol not available  }
  SOCENOPROTOOPT = SOCBASEERR+42;  
{ Protocol not supported  }
  SOCEPROTONOSUPPORT = SOCBASEERR+43;  
{ Socket type not supported  }
  SOCESOCKTNOSUPPORT = SOCBASEERR+44;  
{ Operation not supported on socket  }
  SOCEOPNOTSUPP = SOCBASEERR+45;  
{ Protocol family not supported  }
  SOCEPFNOSUPPORT = SOCBASEERR+46;  
{ Address family not supported by protocol family  }
  SOCEAFNOSUPPORT = SOCBASEERR+47;  
{ Address already in use  }
  SOCEADDRINUSE = SOCBASEERR+48;  
{ Can't assign requested address  }
  SOCEADDRNOTAVAIL = SOCBASEERR+49;  
{ Network is down  }
  SOCENETDOWN = SOCBASEERR+50;  
{ Network is unreachable  }
  SOCENETUNREACH = SOCBASEERR+51;  
{ Network dropped connection on reset  }
  SOCENETRESET = SOCBASEERR+52;  
{ Software caused connection abort  }
  SOCECONNABORTED = SOCBASEERR+53;  
{ Connection reset by peer  }
  SOCECONNRESET = SOCBASEERR+54;  
{ No buffer space available  }
  SOCENOBUFS = SOCBASEERR+55;  
{ Socket is already connected  }
  SOCEISCONN = SOCBASEERR+56;  
{ Socket is not connected  }
  SOCENOTCONN = SOCBASEERR+57;  
{ Can't send after socket shutdown  }
  SOCESHUTDOWN = SOCBASEERR+58;  
{ Too many references: can't splice  }
  SOCETOOMANYREFS = SOCBASEERR+59;  
{ Connection timed out  }
  SOCETIMEDOUT = SOCBASEERR+60;  
{ Connection refused  }
  SOCECONNREFUSED = SOCBASEERR+61;  
{ Too many levels of symbolic links  }
  SOCELOOP = SOCBASEERR+62;  
{ File name too long  }
  SOCENAMETOOLONG = SOCBASEERR+63;  
{ Host is down  }
  SOCEHOSTDOWN = SOCBASEERR+64;  
{ No route to host  }
  SOCEHOSTUNREACH = SOCBASEERR+65;  
{ Directory not empty  }
  SOCENOTEMPTY = SOCBASEERR+66;  

implementation


end.
