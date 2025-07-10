
unit curl;
interface

{
  Automatically converted by H2Pas 1.0.0 from curl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    curl.h
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
PCURL  = ^CURL;
Pcurl_calloc_callback  = ^curl_calloc_callback;
Pcurl_certinfo  = ^curl_certinfo;
Pcurl_closepolicy  = ^curl_closepolicy;
Pcurl_fileinfo  = ^curl_fileinfo;
Pcurl_forms  = ^curl_forms;
Pcurl_ftpauth  = ^curl_ftpauth;
Pcurl_ftpccc  = ^curl_ftpccc;
Pcurl_ftpcreatedir  = ^curl_ftpcreatedir;
Pcurl_ftpmethod  = ^curl_ftpmethod;
Pcurl_hstsentry  = ^curl_hstsentry;
Pcurl_httppost  = ^curl_httppost;
Pcurl_index  = ^curl_index;
Pcurl_infotype  = ^curl_infotype;
Pcurl_khkey  = ^curl_khkey;
Pcurl_khmatch  = ^curl_khmatch;
Pcurl_khstat  = ^curl_khstat;
Pcurl_khtype  = ^curl_khtype;
Pcurl_lock_access  = ^curl_lock_access;
Pcurl_lock_data  = ^curl_lock_data;
Pcurl_malloc_callback  = ^curl_malloc_callback;
Pcurl_mime  = ^curl_mime;
Pcurl_mimepart  = ^curl_mimepart;
PCURL_NETRC_OPTION  = ^CURL_NETRC_OPTION;
Pcurl_proxytype  = ^curl_proxytype;
Pcurl_realloc_callback  = ^curl_realloc_callback;
Pcurl_slist  = ^curl_slist;
Pcurl_sockaddr  = ^curl_sockaddr;
Pcurl_socket_t  = ^curl_socket_t;
Pcurl_ssl_backend  = ^curl_ssl_backend;
Pcurl_sslbackend  = ^curl_sslbackend;
Pcurl_strdup_callback  = ^curl_strdup_callback;
Pcurl_TimeCond  = ^curl_TimeCond;
PCURL_TLSAUTH  = ^CURL_TLSAUTH;
Pcurl_tlssessioninfo  = ^curl_tlssessioninfo;
Pcurl_usessl  = ^curl_usessl;
Pcurl_version_info_data  = ^curl_version_info_data;
PCURLcode  = ^CURLcode;
Pcurlfiletype  = ^curlfiletype;
PCURLFORMcode  = ^CURLFORMcode;
PCURLformoption  = ^CURLformoption;
PCURLINFO  = ^CURLINFO;
Pcurliocmd  = ^curliocmd;
Pcurlioerr  = ^curlioerr;
PCURLoption  = ^CURLoption;
PCURLproxycode  = ^CURLproxycode;
PCURLSH  = ^CURLSH;
PCURLSHcode  = ^CURLSHcode;
PCURLSHoption  = ^CURLSHoption;
Pcurlsocktype  = ^curlsocktype;
PCURLsslset  = ^CURLsslset;
PCURLSTScode  = ^CURLSTScode;
PCURLversion  = ^CURLversion;
Plongint  = ^longint;
Ptime_t  = ^time_t;
Pxxxxxxx  = ^xxxxxxx;
Pxxxxxxxxx  = ^xxxxxxxxx;
Pxxxxxxxxxxx  = ^xxxxxxxxxxx;
Pxxxxxxxxxxxxxx  = ^xxxxxxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef CURLINC_CURL_H}
{$define CURLINC_CURL_H}
{**************************************************************************
 *                                  _   _ ____  _
 *  Project                     ___| | | |  _ \| |
 *                             / __| | | | |_) | |
 *                            | (__| |_| |  _ <| |___
 *                             \___|\___/|_| \_\_____|
 *
 * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
 *
 * This software is licensed as described in the file COPYING, which
 * you should have received as part of this distribution. The terms
 * are also available at https://curl.se/docs/copyright.html.
 *
 * You may opt to use, copy, modify, merge, publish, distribute and/or sell
 * copies of the Software, and permit persons to whom the Software is
 * furnished to do so, under the terms of the COPYING file.
 *
 * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
 * KIND, either express or implied.
 *
 * SPDX-License-Identifier: curl
 *
 ************************************************************************** }
{
 * If you have libcurl problems, all docs and details are found here:
 *   https://curl.se/libcurl/
  }
{$include "curlver.h"         /* libcurl version defines   */}
{$include "system.h"          /* determine things run-time */}
{$include <stdio.h>}
{$include <limits.h>}
{ C++ extern C conditionnal removed }
{$if defined(BUILDING_LIBCURL) || defined(CURL_STRICTER)}
type
  TCurl_easy = TCURL;
  TCurl_share = TCURLSH;
{$else}
type
  PCURL = ^TCURL;
  TCURL = pointer;

  PCURLSH = ^TCURLSH;
  TCURLSH = pointer;
{$endif}
{
 * libcurl external API function linkage decorations.
  }
{$ifndef curl_socket_typedef}
{ socket typedef  }
{$if defined(_WIN32) && !defined(__LWIP_OPT_H__) && !defined(LWIP_HDR_OPT_H)}
type
  Pcurl_socket_t = ^Tcurl_socket_t;
  Tcurl_socket_t = TSOCKET;

const
  CURL_SOCKET_BAD = INVALID_SOCKET;  
{$else}
type
  Pcurl_socket_t = ^Tcurl_socket_t;
  Tcurl_socket_t = longint;

const
  CURL_SOCKET_BAD = -(1);  
{$endif}
{$define curl_socket_typedef}
{$endif}
{ curl_socket_typedef  }
{ enum for the different supported SSL backends  }
{ Was QSOSSL.  }
type
  Pcurl_sslbackend = ^Tcurl_sslbackend;
  Tcurl_sslbackend =  Longint;
  Const
    CURLSSLBACKEND_NONE = 0;
    CURLSSLBACKEND_OPENSSL = 1;
    CURLSSLBACKEND_GNUTLS = 2;
    CURLSSLBACKEND_NSS = 3;
    CURLSSLBACKEND_OBSOLETE4 = 4;
    CURLSSLBACKEND_GSKIT = 5;
    CURLSSLBACKEND_POLARSSL = 6;
    CURLSSLBACKEND_WOLFSSL = 7;
    CURLSSLBACKEND_SCHANNEL = 8;
    CURLSSLBACKEND_SECURETRANSPORT = 9;
    CURLSSLBACKEND_AXTLS = 10;
    CURLSSLBACKEND_MBEDTLS = 11;
    CURLSSLBACKEND_MESALINK = 12;
    CURLSSLBACKEND_BEARSSL = 13;
    CURLSSLBACKEND_RUSTLS = 14;
;
{ aliases for library clones and renames  }
  CURLSSLBACKEND_AWSLC = CURLSSLBACKEND_OPENSSL;  
  CURLSSLBACKEND_BORINGSSL = CURLSSLBACKEND_OPENSSL;  
  CURLSSLBACKEND_LIBRESSL = CURLSSLBACKEND_OPENSSL;  
{ deprecated names:  }
  CURLSSLBACKEND_CYASSL = CURLSSLBACKEND_WOLFSSL;  
  CURLSSLBACKEND_DARWINSSL = CURLSSLBACKEND_SECURETRANSPORT;  
{ next entry in the list  }
{ pointer to allocated name  }
{ length of name length  }
{ pointer to allocated data contents  }
{ length of contents field, see also
                                       CURL_HTTPPOST_LARGE  }
{ pointer to allocated buffer contents  }
{ length of buffer field  }
{ Content-Type  }
{ list of extra headers for this form  }
{ if one field name has more than one
                                       file, this link should link to following
                                       files  }
{ as defined below  }
{ The file name to show. If not set, the
                                       actual file name will be used (if this
                                       is a file part)  }
{ custom pointer used for
                                       HTTPPOST_CALLBACK posts  }
{ alternative length of contents
                                       field. Used if CURL_HTTPPOST_LARGE is
                                       set. Added in 7.46.0  }
type
  Pcurl_httppost = ^Tcurl_httppost;
  Tcurl_httppost = record
      next : Pcurl_httppost;
      name : Pchar;
      namelength : longint;
      contents : Pchar;
      contentslength : longint;
      buffer : Pchar;
      bufferlength : longint;
      contenttype : Pchar;
      contentheader : Pcurl_slist;
      more : Pcurl_httppost;
      flags : longint;
      showfilename : Pchar;
      userp : pointer;
      contentlen : Tcurl_off_t;
    end;

{ specified content is a file name  }

const
  CURL_HTTPPOST_FILENAME = 1 shl 0;  
{ specified content is a file name  }
  CURL_HTTPPOST_READFILE = 1 shl 1;  
{ name is only stored pointer do not free in formfree  }
  CURL_HTTPPOST_PTRNAME = 1 shl 2;  
{ contents is only stored pointer do not free in formfree  }
  CURL_HTTPPOST_PTRCONTENTS = 1 shl 3;  
{ upload file from buffer  }
  CURL_HTTPPOST_BUFFER = 1 shl 4;  
{ upload file from pointer contents  }
  CURL_HTTPPOST_PTRBUFFER = 1 shl 5;  
{ upload file contents by using the regular read callback to get the data and
   pass the given pointer as custom pointer  }
  CURL_HTTPPOST_CALLBACK = 1 shl 6;  
{ use size in 'contentlen', added in 7.46.0  }
  CURL_HTTPPOST_LARGE = 1 shl 7;  
{ This is a return code for the progress callback that, when returned, will
   signal libcurl to continue executing the default progress function  }
  CURL_PROGRESSFUNC_CONTINUE = $10000001;  
{ This is the CURLOPT_PROGRESSFUNCTION callback prototype. It is now
   considered deprecated but was the only choice up until 7.31.0  }
type

  Tcurl_progress_callback = function (clientp:pointer; dltotal:Tdouble; dlnow:Tdouble; ultotal:Tdouble; ulnow:Tdouble):longint;cdecl;
{ This is the CURLOPT_XFERINFOFUNCTION callback prototype. It was introduced
   in 7.32.0, avoids the use of floating point numbers and provides more
   detailed information.  }

  Tcurl_xferinfo_callback = function (clientp:pointer; dltotal:Tcurl_off_t; dlnow:Tcurl_off_t; ultotal:Tcurl_off_t; ulnow:Tcurl_off_t):longint;cdecl;
{$ifndef CURL_MAX_READ_SIZE}
{ The maximum receive buffer size configurable via CURLOPT_BUFFERSIZE.  }

const
  CURL_MAX_READ_SIZE = (10*1024)*1024;  
{$endif}
{$ifndef CURL_MAX_WRITE_SIZE}
{ Tests have proven that 20K is a very bad buffer size for uploads on
     Windows, while 16K for some odd reason performed a lot better.
     We do the ifndef check to allow this value to easier be changed at build
     time for those who feel adventurous. The practical minimum is about
     400 bytes since libcurl uses a buffer of this size as a scratch area
     (unrelated to network send operations).  }

const
  CURL_MAX_WRITE_SIZE = 16384;  
{$endif}
{$ifndef CURL_MAX_HTTP_HEADER}
{ The only reason to have a max limit for this is to avoid the risk of a bad
   server feeding libcurl with a never-ending header that will cause reallocs
   infinitely  }

const
  CURL_MAX_HTTP_HEADER = 100*1024;  
{$endif}
{ This is a magic return code for the write callback that, when returned,
   will signal libcurl to pause receiving on the current transfer.  }

const
  CURL_WRITEFUNC_PAUSE = $10000001;  
{ This is a magic return code for the write callback that, when returned,
   will signal an error from the callback.  }
  CURL_WRITEFUNC_ERROR = $FFFFFFFF;  
type

  Tcurl_write_callback = function (buffer:Pchar; size:Tsize_t; nitems:Tsize_t; outstream:pointer):Tsize_t;cdecl;
{ This callback will be called when a new resolver request is made  }

  Tcurl_resolver_start_callback = function (resolver_state:pointer; reserved:pointer; userdata:pointer):longint;cdecl;
{ enumeration of file types  }
{ is possible only on Sun Solaris now  }
{ should never occur  }

  Pcurlfiletype = ^Tcurlfiletype;
  Tcurlfiletype =  Longint;
  Const
    CURLFILETYPE_FILE = 0;
    CURLFILETYPE_DIRECTORY = 1;
    CURLFILETYPE_SYMLINK = 2;
    CURLFILETYPE_DEVICE_BLOCK = 3;
    CURLFILETYPE_DEVICE_CHAR = 4;
    CURLFILETYPE_NAMEDPIPE = 5;
    CURLFILETYPE_SOCKET = 6;
    CURLFILETYPE_DOOR = 7;
    CURLFILETYPE_UNKNOWN = 8;
;
  CURLFINFOFLAG_KNOWN_FILENAME = 1 shl 0;  
  CURLFINFOFLAG_KNOWN_FILETYPE = 1 shl 1;  
  CURLFINFOFLAG_KNOWN_TIME = 1 shl 2;  
  CURLFINFOFLAG_KNOWN_PERM = 1 shl 3;  
  CURLFINFOFLAG_KNOWN_UID = 1 shl 4;  
  CURLFINFOFLAG_KNOWN_GID = 1 shl 5;  
  CURLFINFOFLAG_KNOWN_SIZE = 1 shl 6;  
  CURLFINFOFLAG_KNOWN_HLINKCOUNT = 1 shl 7;  
{ Information about a single file, used when doing FTP wildcard matching  }
{ always zero!  }
{ If some of these fields is not NULL, it is a pointer to b_data.  }
{ pointer to the target filename of a symlink  }
{ These are libcurl private struct fields. Previously used by libcurl, so
     they must never be interfered with.  }
type
  Pcurl_fileinfo = ^Tcurl_fileinfo;
  Tcurl_fileinfo = record
      filename : Pchar;
      filetype : Tcurlfiletype;
      time : Ttime_t;
      perm : dword;
      uid : longint;
      gid : longint;
      size : Tcurl_off_t;
      hardlinks : longint;
      strings : record
          time : Pchar;
          perm : Pchar;
          user : Pchar;
          group : Pchar;
          target : Pchar;
        end;
      flags : dword;
      b_data : Pchar;
      b_size : Tsize_t;
      b_used : Tsize_t;
    end;

{ return codes for CURLOPT_CHUNK_BGN_FUNCTION  }

const
  CURL_CHUNK_BGN_FUNC_OK = 0;  
{ tell the lib to end the task  }
  CURL_CHUNK_BGN_FUNC_FAIL = 1;  
{ skip this chunk over  }
  CURL_CHUNK_BGN_FUNC_SKIP = 2;  
{ if splitting of data transfer is enabled, this callback is called before
   download of an individual chunk started. Note that parameter "remains" works
   only for FTP wildcard downloading (for now), otherwise is not used  }
(* Const before type ignored *)
type

  Tcurl_chunk_bgn_callback = function (transfer_info:pointer; ptr:pointer; remains:longint):longint;cdecl;
{ return codes for CURLOPT_CHUNK_END_FUNCTION  }

const
  CURL_CHUNK_END_FUNC_OK = 0;  
{ tell the lib to end the task  }
  CURL_CHUNK_END_FUNC_FAIL = 1;  
{ If splitting of data transfer is enabled this callback is called after
   download of an individual chunk finished.
   Note! After this callback was set then it have to be called FOR ALL chunks.
   Even if downloading of this chunk was skipped in CHUNK_BGN_FUNC.
   This is the reason why we don't need "transfer_info" parameter in this
   callback and we are not interested in "remains" parameter too.  }
type

  Tcurl_chunk_end_callback = function (ptr:pointer):longint;cdecl;
{ return codes for FNMATCHFUNCTION  }
{ string corresponds to the pattern  }

const
  CURL_FNMATCHFUNC_MATCH = 0;  
{ pattern doesn't match the string  }
  CURL_FNMATCHFUNC_NOMATCH = 1;  
{ an error occurred  }
  CURL_FNMATCHFUNC_FAIL = 2;  
{ callback type for wildcard downloading pattern matching. If the
   string matches the pattern, return CURL_FNMATCHFUNC_MATCH value, etc.  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tcurl_fnmatch_callback = function (ptr:pointer; pattern:Pchar; _string:Pchar):longint;cdecl;
{ These are the return codes for the seek callbacks  }

const
  CURL_SEEKFUNC_OK = 0;  
{ fail the entire transfer  }
  CURL_SEEKFUNC_FAIL = 1;  
{ tell libcurl seeking can't be done, so
                                    libcurl might try other means instead  }
  CURL_SEEKFUNC_CANTSEEK = 2;  
type

  Tcurl_seek_callback = function (instream:pointer; offset:Tcurl_off_t; origin:longint):longint;cdecl;
{ 'whence'  }
{ This is a return code for the read callback that, when returned, will
   signal libcurl to immediately abort the current transfer.  }

const
  CURL_READFUNC_ABORT = $10000000;  
{ This is a return code for the read callback that, when returned, will
   signal libcurl to pause sending data on the current transfer.  }
  CURL_READFUNC_PAUSE = $10000001;  
{ Return code for when the trailing headers' callback has terminated
   without any errors  }
  CURL_TRAILERFUNC_OK = 0;  
{ Return code for when was an error in the trailing header's list and we
  want to abort the request  }
  CURL_TRAILERFUNC_ABORT = 1;  
type

  Tcurl_read_callback = function (buffer:Pchar; size:Tsize_t; nitems:Tsize_t; instream:pointer):Tsize_t;cdecl;

  Tcurl_trailer_callback = function (list:PPcurl_slist; userdata:pointer):longint;cdecl;
{ socket created for a specific IP connection  }
{ socket created by accept() call  }
{ never use  }

  Pcurlsocktype = ^Tcurlsocktype;
  Tcurlsocktype =  Longint;
  Const
    CURLSOCKTYPE_IPCXN = 0;
    CURLSOCKTYPE_ACCEPT = 1;
    CURLSOCKTYPE_LAST = 2;
;
{ The return code from the sockopt_callback can signal information back
   to libcurl:  }
  CURL_SOCKOPT_OK = 0;  
{ causes libcurl to abort and return
                                CURLE_ABORTED_BY_CALLBACK  }
  CURL_SOCKOPT_ERROR = 1;  
  CURL_SOCKOPT_ALREADY_CONNECTED = 2;  
type

  Tcurl_sockopt_callback = function (clientp:pointer; curlfd:Tcurl_socket_t; purpose:Tcurlsocktype):longint;cdecl;
{ addrlen was a socklen_t type before 7.18.0 but it
                           turned really ugly and painful on the systems that
                           lack this type  }
  Pcurl_sockaddr = ^Tcurl_sockaddr;
  Tcurl_sockaddr = record
      family : longint;cdecl;
      socktype : longint;
      protocol : longint;
      addrlen : dword;
      addr : Tsockaddr;
    end;


  Tcurl_opensocket_callback = function (clientp:pointer; purpose:Tcurlsocktype; address:Pcurl_sockaddr):Tcurl_socket_t;cdecl;

  Tcurl_closesocket_callback = function (clientp:pointer; item:Tcurl_socket_t):longint;cdecl;
{ I/O operation successful  }
{ command was unknown to callback  }
{ failed to restart the read  }
{ never use  }

  Pcurlioerr = ^Tcurlioerr;
  Tcurlioerr =  Longint;
  Const
    CURLIOE_OK = 0;
    CURLIOE_UNKNOWNCMD = 1;
    CURLIOE_FAILRESTART = 2;
    CURLIOE_LAST = 3;
;
{ no operation  }
{ restart the read stream from start  }
{ never use  }
type
  Pcurliocmd = ^Tcurliocmd;
  Tcurliocmd =  Longint;
  Const
    CURLIOCMD_NOP = 0;
    CURLIOCMD_RESTARTREAD = 1;
    CURLIOCMD_LAST = 2;
;
type

  Tcurl_ioctl_callback = function (handle:PCURL; cmd:longint; clientp:pointer):Tcurlioerr;cdecl;
{$ifndef CURL_DID_MEMORY_FUNC_TYPEDEFS}
{
 * The following typedef's are signatures of malloc, free, realloc, strdup and
 * calloc respectively.  Function pointers of these types can be passed to the
 * curl_global_init_mem() function to set user defined memory management
 * callback routines.
  }
type
  Pcurl_malloc_callback = ^Tcurl_malloc_callback;
  Tcurl_malloc_callback = function (size:Tsize_t):pointer;cdecl;

  Tcurl_free_callback = procedure (ptr:pointer);cdecl;

  Pcurl_realloc_callback = ^Tcurl_realloc_callback;
  Tcurl_realloc_callback = function (ptr:pointer; size:Tsize_t):pointer;cdecl;
(* Const before type ignored *)

  Pcurl_strdup_callback = ^Tcurl_strdup_callback;
  Tcurl_strdup_callback = function (str:Pchar):Pchar;cdecl;

  Pcurl_calloc_callback = ^Tcurl_calloc_callback;
  Tcurl_calloc_callback = function (nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;
{$define CURL_DID_MEMORY_FUNC_TYPEDEFS}
{$endif}
{ the kind of data that is passed to information_callback  }
{ 1  }
{ 2  }
{ 3  }
{ 4  }
{ 5  }
{ 6  }
type
  Pcurl_infotype = ^Tcurl_infotype;
  Tcurl_infotype =  Longint;
  Const
    CURLINFO_TEXT = 0;
    CURLINFO_HEADER_IN = 1;
    CURLINFO_HEADER_OUT = 2;
    CURLINFO_DATA_IN = 3;
    CURLINFO_DATA_OUT = 4;
    CURLINFO_SSL_DATA_IN = 5;
    CURLINFO_SSL_DATA_OUT = 6;
    CURLINFO_END = 7;
;
{ the handle/transfer this concerns  }
{ what kind of data  }
{ points to the data  }
{ size of the data pointed to  }
type

  Tcurl_debug_callback = function (handle:PCURL; _type:Tcurl_infotype; data:Pchar; size:Tsize_t; userptr:pointer):longint;cdecl;
{ whatever the user please  }
{ This is the CURLOPT_PREREQFUNCTION callback prototype.  }

  Tcurl_prereq_callback = function (clientp:pointer; conn_primary_ip:Pchar; conn_local_ip:Pchar; conn_primary_port:longint; conn_local_port:longint):longint;cdecl;
{ Return code for when the pre-request callback has terminated without
   any errors  }

const
  CURL_PREREQFUNC_OK = 0;  
{ Return code for when the pre-request callback wants to abort the
   request  }
  CURL_PREREQFUNC_ABORT = 1;  
{ All possible error codes from all sorts of curl functions. Future versions
   may return other values, stay prepared.

   Always add new return codes last. Never *EVER* remove any. The return
   codes must remain the same!
  }
{ 1  }
{ 2  }
{ 3  }
{ 4 - [was obsoleted in August 2007 for
                                    7.17.0, reused in April 2011 for 7.21.5]  }
{ 5  }
{ 6  }
{ 7  }
{ 8  }
{ 9 a service was denied by the server
                                    due to lack of access - when login fails
                                    this is not returned.  }
{ 10 - [was obsoleted in April 2006 for
                                    7.15.4, reused in Dec 2011 for 7.24.0] }
{ 11  }
{ 12 - timeout occurred accepting server
                                    [was obsoleted in August 2007 for 7.17.0,
                                    reused in Dec 2011 for 7.24.0] }
{ 13  }
{ 14  }
{ 15  }
{ 16 - A problem in the http2 framing layer.
                                    [was obsoleted in August 2007 for 7.17.0,
                                    reused in July 2014 for 7.38.0]  }
{ 17  }
{ 18  }
{ 19  }
{ 20 - NOT USED  }
{ 21 - quote command failure  }
{ 22  }
{ 23  }
{ 24 - NOT USED  }
{ 25 - failed upload "command"  }
{ 26 - couldn't open/read from file  }
{ 27  }
{ 28 - the timeout time was reached  }
{ 29 - NOT USED  }
{ 30 - FTP PORT operation failed  }
{ 31 - the REST command failed  }
{ 32 - NOT USED  }
{ 33 - RANGE "command" didn't work  }
{ 34  }
{ 35 - wrong when connecting with SSL  }
{ 36 - couldn't resume download  }
{ 37  }
{ 38  }
{ 39  }
{ 40 - NOT USED  }
{ 41 - NOT USED starting with 7.53.0  }
{ 42  }
{ 43  }
{ 44 - NOT USED  }
{ 45 - CURLOPT_INTERFACE failed  }
{ 46 - NOT USED  }
{ 47 - catch endless re-direct loops  }
{ 48 - User specified an unknown option  }
{ 49 - Malformed setopt option  }
{ 50 - NOT USED  }
{ 51 - NOT USED  }
{ 52 - when this is a specific error  }
{ 53 - SSL crypto engine not found  }
{ 54 - can not set SSL crypto engine as
                                    default  }
{ 55 - failed sending network data  }
{ 56 - failure in receiving network data  }
{ 57 - NOT IN USE  }
{ 58 - problem with the local certificate  }
{ 59 - couldn't use specified cipher  }
{ 60 - peer's certificate or fingerprint
                                     wasn't verified fine  }
{ 61 - Unrecognized/bad encoding  }
{ 62 - NOT IN USE since 7.82.0  }
{ 63 - Maximum file size exceeded  }
{ 64 - Requested FTP SSL level failed  }
{ 65 - Sending the data requires a rewind
                                    that failed  }
{ 66 - failed to initialise ENGINE  }
{ 67 - user, password or similar was not
                                    accepted and we failed to login  }
{ 68 - file not found on server  }
{ 69 - permission problem on server  }
{ 70 - out of disk space on server  }
{ 71 - Illegal TFTP operation  }
{ 72 - Unknown transfer ID  }
{ 73 - File already exists  }
{ 74 - No such user  }
{ 75 - NOT IN USE since 7.82.0  }
{ 76 - NOT IN USE since 7.82.0  }
{ 77 - could not load CACERT file, missing
                                    or wrong format  }
{ 78 - remote file not found  }
{ 79 - error from the SSH layer, somewhat
                                    generic so the error message will be of
                                    interest when this has happened  }
{ 80 - Failed to shut down the SSL
                                    connection  }
{ 81 - socket is not ready for send/recv,
                                    wait till it's ready and try again (Added
                                    in 7.18.2)  }
{ 82 - could not load CRL file, missing or
                                    wrong format (Added in 7.19.0)  }
{ 83 - Issuer check failed.  (Added in
                                    7.19.0)  }
{ 84 - a PRET command failed  }
{ 85 - mismatch of RTSP CSeq numbers  }
{ 86 - mismatch of RTSP Session Ids  }
{ 87 - unable to parse FTP file list  }
{ 88 - chunk callback reported error  }
{ 89 - No connection available, the
                                    session will be queued  }
{ 90 - specified pinned public key did not
                                     match  }
{ 91 - invalid certificate status  }
{ 92 - stream error in HTTP/2 framing layer
                                     }
{ 93 - an api function was called from
                                    inside a callback  }
{ 94 - an authentication function returned an
                                    error  }
{ 95 - An HTTP/3 layer problem  }
{ 96 - QUIC connection error  }
{ 97 - proxy handshake error  }
{ 98 - client-side certificate required  }
{ 99 - poll/select returned fatal error  }
{ never use!  }
type
  PCURLcode = ^TCURLcode;
  TCURLcode =  Longint;
  Const
    CURLE_OK = 0;
    CURLE_UNSUPPORTED_PROTOCOL = 1;
    CURLE_FAILED_INIT = 2;
    CURLE_URL_MALFORMAT = 3;
    CURLE_NOT_BUILT_IN = 4;
    CURLE_COULDNT_RESOLVE_PROXY = 5;
    CURLE_COULDNT_RESOLVE_HOST = 6;
    CURLE_COULDNT_CONNECT = 7;
    CURLE_WEIRD_SERVER_REPLY = 8;
    CURLE_REMOTE_ACCESS_DENIED = 9;
    CURLE_FTP_ACCEPT_FAILED = 10;
    CURLE_FTP_WEIRD_PASS_REPLY = 11;
    CURLE_FTP_ACCEPT_TIMEOUT = 12;
    CURLE_FTP_WEIRD_PASV_REPLY = 13;
    CURLE_FTP_WEIRD_227_FORMAT = 14;
    CURLE_FTP_CANT_GET_HOST = 15;
    CURLE_HTTP2 = 16;
    CURLE_FTP_COULDNT_SET_TYPE = 17;
    CURLE_PARTIAL_FILE = 18;
    CURLE_FTP_COULDNT_RETR_FILE = 19;
    CURLE_OBSOLETE20 = 20;
    CURLE_QUOTE_ERROR = 21;
    CURLE_HTTP_RETURNED_ERROR = 22;
    CURLE_WRITE_ERROR = 23;
    CURLE_OBSOLETE24 = 24;
    CURLE_UPLOAD_FAILED = 25;
    CURLE_READ_ERROR = 26;
    CURLE_OUT_OF_MEMORY = 27;
    CURLE_OPERATION_TIMEDOUT = 28;
    CURLE_OBSOLETE29 = 29;
    CURLE_FTP_PORT_FAILED = 30;
    CURLE_FTP_COULDNT_USE_REST = 31;
    CURLE_OBSOLETE32 = 32;
    CURLE_RANGE_ERROR = 33;
    CURLE_HTTP_POST_ERROR = 34;
    CURLE_SSL_CONNECT_ERROR = 35;
    CURLE_BAD_DOWNLOAD_RESUME = 36;
    CURLE_FILE_COULDNT_READ_FILE = 37;
    CURLE_LDAP_CANNOT_BIND = 38;
    CURLE_LDAP_SEARCH_FAILED = 39;
    CURLE_OBSOLETE40 = 40;
    CURLE_FUNCTION_NOT_FOUND = 41;
    CURLE_ABORTED_BY_CALLBACK = 42;
    CURLE_BAD_FUNCTION_ARGUMENT = 43;
    CURLE_OBSOLETE44 = 44;
    CURLE_INTERFACE_FAILED = 45;
    CURLE_OBSOLETE46 = 46;
    CURLE_TOO_MANY_REDIRECTS = 47;
    CURLE_UNKNOWN_OPTION = 48;
    CURLE_SETOPT_OPTION_SYNTAX = 49;
    CURLE_OBSOLETE50 = 50;
    CURLE_OBSOLETE51 = 51;
    CURLE_GOT_NOTHING = 52;
    CURLE_SSL_ENGINE_NOTFOUND = 53;
    CURLE_SSL_ENGINE_SETFAILED = 54;
    CURLE_SEND_ERROR = 55;
    CURLE_RECV_ERROR = 56;
    CURLE_OBSOLETE57 = 57;
    CURLE_SSL_CERTPROBLEM = 58;
    CURLE_SSL_CIPHER = 59;
    CURLE_PEER_FAILED_VERIFICATION = 60;
    CURLE_BAD_CONTENT_ENCODING = 61;
    CURLE_OBSOLETE62 = 62;
    CURLE_FILESIZE_EXCEEDED = 63;
    CURLE_USE_SSL_FAILED = 64;
    CURLE_SEND_FAIL_REWIND = 65;
    CURLE_SSL_ENGINE_INITFAILED = 66;
    CURLE_LOGIN_DENIED = 67;
    CURLE_TFTP_NOTFOUND = 68;
    CURLE_TFTP_PERM = 69;
    CURLE_REMOTE_DISK_FULL = 70;
    CURLE_TFTP_ILLEGAL = 71;
    CURLE_TFTP_UNKNOWNID = 72;
    CURLE_REMOTE_FILE_EXISTS = 73;
    CURLE_TFTP_NOSUCHUSER = 74;
    CURLE_OBSOLETE75 = 75;
    CURLE_OBSOLETE76 = 76;
    CURLE_SSL_CACERT_BADFILE = 77;
    CURLE_REMOTE_FILE_NOT_FOUND = 78;
    CURLE_SSH = 79;
    CURLE_SSL_SHUTDOWN_FAILED = 80;
    CURLE_AGAIN = 81;
    CURLE_SSL_CRL_BADFILE = 82;
    CURLE_SSL_ISSUER_ERROR = 83;
    CURLE_FTP_PRET_FAILED = 84;
    CURLE_RTSP_CSEQ_ERROR = 85;
    CURLE_RTSP_SESSION_ERROR = 86;
    CURLE_FTP_BAD_FILE_LIST = 87;
    CURLE_CHUNK_FAILED = 88;
    CURLE_NO_CONNECTION_AVAILABLE = 89;
    CURLE_SSL_PINNEDPUBKEYNOTMATCH = 90;
    CURLE_SSL_INVALIDCERTSTATUS = 91;
    CURLE_HTTP2_STREAM = 92;
    CURLE_RECURSIVE_API_CALL = 93;
    CURLE_AUTH_ERROR = 94;
    CURLE_HTTP3 = 95;
    CURLE_QUIC_CONNECT_ERROR = 96;
    CURLE_PROXY = 97;
    CURLE_SSL_CLIENTCERT = 98;
    CURLE_UNRECOVERABLE_POLL = 99;
    CURL_LAST = 100;
;
{ Previously obsolete error code reused in 7.38.0  }
  CURLE_OBSOLETE16 = CURLE_HTTP2;  
{ Previously obsolete error codes reused in 7.24.0  }
  CURLE_OBSOLETE10 = CURLE_FTP_ACCEPT_FAILED;  
  CURLE_OBSOLETE12 = CURLE_FTP_ACCEPT_TIMEOUT;  
{  compatibility with older names  }
  CURLOPT_ENCODING = CURLOPT_ACCEPT_ENCODING;  
  CURLE_FTP_WEIRD_SERVER_REPLY = CURLE_WEIRD_SERVER_REPLY;  
{ The following were added in 7.62.0  }
  CURLE_SSL_CACERT = CURLE_PEER_FAILED_VERIFICATION;  
{ The following were added in 7.21.5, April 2011  }
  CURLE_UNKNOWN_TELNET_OPTION = CURLE_UNKNOWN_OPTION;  
{ Added for 7.78.0  }
  CURLE_TELNET_OPTION_SYNTAX = CURLE_SETOPT_OPTION_SYNTAX;  
{ The following were added in 7.17.1  }
{ These are scheduled to disappear by 2009  }
  CURLE_SSL_PEER_CERTIFICATE = CURLE_PEER_FAILED_VERIFICATION;  
{ The following were added in 7.17.0  }
{ These are scheduled to disappear by 2009  }
{ no one should be using this!  }
  CURLE_OBSOLETE = CURLE_OBSOLETE50;  
  CURLE_BAD_PASSWORD_ENTERED = CURLE_OBSOLETE46;  
  CURLE_BAD_CALLING_ORDER = CURLE_OBSOLETE44;  
  CURLE_FTP_USER_PASSWORD_INCORRECT = CURLE_OBSOLETE10;  
  CURLE_FTP_CANT_RECONNECT = CURLE_OBSOLETE16;  
  CURLE_FTP_COULDNT_GET_SIZE = CURLE_OBSOLETE32;  
  CURLE_FTP_COULDNT_SET_ASCII = CURLE_OBSOLETE29;  
  CURLE_FTP_WEIRD_USER_REPLY = CURLE_OBSOLETE12;  
  CURLE_FTP_WRITE_ERROR = CURLE_OBSOLETE20;  
  CURLE_LIBRARY_NOT_FOUND = CURLE_OBSOLETE40;  
  CURLE_MALFORMAT_USER = CURLE_OBSOLETE24;  
  CURLE_SHARE_IN_USE = CURLE_OBSOLETE57;  
  CURLE_URL_MALFORMAT_USER = CURLE_NOT_BUILT_IN;  
  CURLE_FTP_ACCESS_DENIED = CURLE_REMOTE_ACCESS_DENIED;  
  CURLE_FTP_COULDNT_SET_BINARY = CURLE_FTP_COULDNT_SET_TYPE;  
  CURLE_FTP_QUOTE_ERROR = CURLE_QUOTE_ERROR;  
  CURLE_TFTP_DISKFULL = CURLE_REMOTE_DISK_FULL;  
  CURLE_TFTP_EXISTS = CURLE_REMOTE_FILE_EXISTS;  
  CURLE_HTTP_RANGE_ERROR = CURLE_RANGE_ERROR;  
  CURLE_FTP_SSL_FAILED = CURLE_USE_SSL_FAILED;  
{ The following were added earlier  }
  CURLE_OPERATION_TIMEOUTED = CURLE_OPERATION_TIMEDOUT;  
  CURLE_HTTP_NOT_FOUND = CURLE_HTTP_RETURNED_ERROR;  
  CURLE_HTTP_PORT_FAILED = CURLE_INTERFACE_FAILED;  
  CURLE_FTP_COULDNT_STOR_FILE = CURLE_UPLOAD_FAILED;  
  CURLE_FTP_PARTIAL_FILE = CURLE_PARTIAL_FILE;  
  CURLE_FTP_BAD_DOWNLOAD_RESUME = CURLE_BAD_DOWNLOAD_RESUME;  
  CURLE_LDAP_INVALID_URL = CURLE_OBSOLETE62;  
  CURLE_CONV_REQD = CURLE_OBSOLETE76;  
  CURLE_CONV_FAILED = CURLE_OBSOLETE75;  
{ This was the error code 50 in 7.7.3 and a few earlier versions, this
   is no longer used by libcurl but is instead #defined here only to not
   make programs break  }
  CURLE_ALREADY_COMPLETE = 99999;  
{ Provide defines for really old option names  }
{ name changed in 7.9.7  }
  CURLOPT_FILE = CURLOPT_WRITEDATA;  
{ name changed in 7.9.7  }
  CURLOPT_INFILE = CURLOPT_READDATA;  
  CURLOPT_WRITEHEADER = CURLOPT_HEADERDATA;  
{ Since long deprecated options with no code in the lib that does anything
   with them.  }
  CURLOPT_WRITEINFO = CURLOPT_OBSOLETE40;  
  CURLOPT_CLOSEPOLICY = CURLOPT_OBSOLETE72;  
{$endif}
{ !CURL_NO_OLDIES  }
{
 * Proxy error codes. Returned in CURLINFO_PROXY_ERROR if CURLE_PROXY was
 * return for the transfers.
  }
{ never use  }
type
  PCURLproxycode = ^TCURLproxycode;
  TCURLproxycode =  Longint;
  Const
    CURLPX_OK = 0;
    CURLPX_BAD_ADDRESS_TYPE = 1;
    CURLPX_BAD_VERSION = 2;
    CURLPX_CLOSED = 3;
    CURLPX_GSSAPI = 4;
    CURLPX_GSSAPI_PERMSG = 5;
    CURLPX_GSSAPI_PROTECTION = 6;
    CURLPX_IDENTD = 7;
    CURLPX_IDENTD_DIFFER = 8;
    CURLPX_LONG_HOSTNAME = 9;
    CURLPX_LONG_PASSWD = 10;
    CURLPX_LONG_USER = 11;
    CURLPX_NO_AUTH = 12;
    CURLPX_RECV_ADDRESS = 13;
    CURLPX_RECV_AUTH = 14;
    CURLPX_RECV_CONNECT = 15;
    CURLPX_RECV_REQACK = 16;
    CURLPX_REPLY_ADDRESS_TYPE_NOT_SUPPORTED = 17;
    CURLPX_REPLY_COMMAND_NOT_SUPPORTED = 18;
    CURLPX_REPLY_CONNECTION_REFUSED = 19;
    CURLPX_REPLY_GENERAL_SERVER_FAILURE = 20;
    CURLPX_REPLY_HOST_UNREACHABLE = 21;
    CURLPX_REPLY_NETWORK_UNREACHABLE = 22;
    CURLPX_REPLY_NOT_ALLOWED = 23;
    CURLPX_REPLY_TTL_EXPIRED = 24;
    CURLPX_REPLY_UNASSIGNED = 25;
    CURLPX_REQUEST_FAILED = 26;
    CURLPX_RESOLVE_HOST = 27;
    CURLPX_SEND_AUTH = 28;
    CURLPX_SEND_CONNECT = 29;
    CURLPX_SEND_REQUEST = 30;
    CURLPX_UNKNOWN_FAIL = 31;
    CURLPX_UNKNOWN_MODE = 32;
    CURLPX_USER_REJECTED = 33;
    CURLPX_LAST = 34;
;
{ This prototype applies to all conversion callbacks  }
type

  Tcurl_conv_callback = function (buffer:Pchar; length:Tsize_t):TCURLcode;cdecl;
{ easy handle  }
{ actually an OpenSSL
                                                            or WolfSSL SSL_CTX,
                                                            or an mbedTLS
                                                          mbedtls_ssl_config  }

  Tcurl_ssl_ctx_callback = function (curl:PCURL; ssl_ctx:pointer; userptr:pointer):TCURLcode;cdecl;
{ added in 7.10, new in 7.19.4 default is to use
                           CONNECT HTTP/1.1  }
{ added in 7.19.4, force to use CONNECT
                               HTTP/1.0   }
{ HTTPS but stick to HTTP/1 added in 7.52.0  }
{ HTTPS and attempt HTTP/2 added in 8.2.0  }
{ support added in 7.15.2, enum existed already
                           in 7.10  }
{ added in 7.10  }
{ added in 7.18.0  }
{ Use the SOCKS5 protocol but pass along the
                                   host name rather than the IP address. added
                                   in 7.18.0  }

  Pcurl_proxytype = ^Tcurl_proxytype;
  Tcurl_proxytype =  Longint;
  Const
    CURLPROXY_HTTP = 0;
    CURLPROXY_HTTP_1_0 = 1;
    CURLPROXY_HTTPS = 2;
    CURLPROXY_HTTPS2 = 3;
    CURLPROXY_SOCKS4 = 4;
    CURLPROXY_SOCKS5 = 5;
    CURLPROXY_SOCKS4A = 6;
    CURLPROXY_SOCKS5_HOSTNAME = 7;
;
{ this enum was added in 7.10  }
{
 * Bitmasks for CURLOPT_HTTPAUTH and CURLOPT_PROXYAUTH options:
 *
 * CURLAUTH_NONE         - No HTTP authentication
 * CURLAUTH_BASIC        - HTTP Basic authentication (default)
 * CURLAUTH_DIGEST       - HTTP Digest authentication
 * CURLAUTH_NEGOTIATE    - HTTP Negotiate (SPNEGO) authentication
 * CURLAUTH_GSSNEGOTIATE - Alias for CURLAUTH_NEGOTIATE (deprecated)
 * CURLAUTH_NTLM         - HTTP NTLM authentication
 * CURLAUTH_DIGEST_IE    - HTTP Digest authentication with IE flavour
 * CURLAUTH_NTLM_WB      - HTTP NTLM authentication delegated to winbind helper
 * CURLAUTH_BEARER       - HTTP Bearer token authentication
 * CURLAUTH_ONLY         - Use together with a single other type to force no
 *                         authentication or just that single type
 * CURLAUTH_ANY          - All fine types set
 * CURLAUTH_ANYSAFE      - All fine types except Basic
  }

{ was #define dname def_expr }
function CURLAUTH_NONE : dword;  

{ was #define dname def_expr }
function CURLAUTH_BASIC : longint; { return type might be wrong }

{ was #define dname def_expr }
function CURLAUTH_DIGEST : longint; { return type might be wrong }

{ was #define dname def_expr }
function CURLAUTH_NEGOTIATE : longint; { return type might be wrong }

{ Deprecated since the advent of CURLAUTH_NEGOTIATE  }
const
  CURLAUTH_GSSNEGOTIATE = CURLAUTH_NEGOTIATE;  
{ Used for CURLOPT_SOCKS5_AUTH to stay terminologically correct  }
  CURLAUTH_GSSAPI = CURLAUTH_NEGOTIATE;  

{ was #define dname def_expr }
function CURLAUTH_NTLM : longint; { return type might be wrong }

{ was #define dname def_expr }
function CURLAUTH_DIGEST_IE : longint; { return type might be wrong }

{ was #define dname def_expr }
function CURLAUTH_NTLM_WB : longint; { return type might be wrong }

{ was #define dname def_expr }
function CURLAUTH_BEARER : longint; { return type might be wrong }

{ was #define dname def_expr }
function CURLAUTH_AWS_SIGV4 : longint; { return type might be wrong }

{ was #define dname def_expr }
function CURLAUTH_ONLY : longint; { return type might be wrong }

const
  CURLAUTH_ANY =  not (CURLAUTH_DIGEST_IE);  
  CURLAUTH_ANYSAFE =  not (CURLAUTH_BASIC or CURLAUTH_DIGEST_IE);  
{ all types supported by the server  }
  CURLSSH_AUTH_ANY =  not (0);  
{ none allowed, silly but complete  }
  CURLSSH_AUTH_NONE = 0;  
{ public/private key files  }
  CURLSSH_AUTH_PUBLICKEY = 1 shl 0;  
{ password  }
  CURLSSH_AUTH_PASSWORD = 1 shl 1;  
{ host key files  }
  CURLSSH_AUTH_HOST = 1 shl 2;  
{ keyboard interactive  }
  CURLSSH_AUTH_KEYBOARD = 1 shl 3;  
{ agent (ssh-agent, pageant...)  }
  CURLSSH_AUTH_AGENT = 1 shl 4;  
{ gssapi (kerberos, ...)  }
  CURLSSH_AUTH_GSSAPI = 1 shl 5;  
  CURLSSH_AUTH_DEFAULT = CURLSSH_AUTH_ANY;  
{ no delegation (default)  }
  CURLGSSAPI_DELEGATION_NONE = 0;  
{ if permitted by policy  }
  CURLGSSAPI_DELEGATION_POLICY_FLAG = 1 shl 0;  
{ delegate always  }
  CURLGSSAPI_DELEGATION_FLAG = 1 shl 1;  
  CURL_ERROR_SIZE = 256;  
type
  Tcurl_khtype =  Longint;
  Const
    CURLKHTYPE_UNKNOWN = 0;
    CURLKHTYPE_RSA1 = 1;
    CURLKHTYPE_RSA = 2;
    CURLKHTYPE_DSS = 3;
    CURLKHTYPE_ECDSA = 4;
    CURLKHTYPE_ED25519 = 5;

(* Const before type ignored *)
{ points to a null-terminated string encoded with base64
                      if len is zero, otherwise to the "raw" data  }
type
  Pcurl_khkey = ^Tcurl_khkey;
  Tcurl_khkey = record
      key : Pchar;
      len : Tsize_t;
      keytype : Tcurl_khtype;
    end;

{ this is the set of return values expected from the curl_sshkeycallback
   callback  }
{ reject the connection, return an error  }
{ do not accept it, but we can't answer right now.
                        Causes a CURLE_PEER_FAILED_VERIFICATION error but the
                        connection will be left intact etc  }
{ accept and replace the wrong key  }
{ not for use, only a marker for last-in-list  }
  Tcurl_khstat =  Longint;
  Const
    CURLKHSTAT_FINE_ADD_TO_FILE = 0;
    CURLKHSTAT_FINE = 1;
    CURLKHSTAT_REJECT = 2;
    CURLKHSTAT_DEFER = 3;
    CURLKHSTAT_FINE_REPLACE = 4;
    CURLKHSTAT_LAST = 5;

{ this is the set of status codes pass in to the callback  }
{ match  }
{ host found, key mismatch!  }
{ no matching host/key found  }
{ not for use, only a marker for last-in-list  }
type
  Tcurl_khmatch =  Longint;
  Const
    CURLKHMATCH_OK = 0;
    CURLKHMATCH_MISMATCH = 1;
    CURLKHMATCH_MISSING = 2;
    CURLKHMATCH_LAST = 3;

{ easy handle  }
(* Const before type ignored *)
{ known  }
(* Const before type ignored *)
{ found  }
{ libcurl's view on the keys  }
type

  Tcurl_sshkeycallback = function (easy:PCURL; knownkey:Pcurl_khkey; foundkey:Pcurl_khkey; para4:Tcurl_khmatch; clientp:pointer):longint;cdecl;
{ custom pointer passed with  }
{ CURLOPT_SSH_KEYDATA  }
{ custom pointer passed  }
{ with CURLOPT_SSH_HOSTKEYDATA  }
{ CURLKHTYPE  }
(* Const before type ignored *)
{ hostkey to check  }

  Tcurl_sshhostkeycallback = function (clientp:pointer; keytype:longint; key:Pchar; keylen:Tsize_t):longint;cdecl;
{ length of the key  }
{ return CURLE_OK to accept  }
{ or something else to refuse  }
{ parameter for the CURLOPT_USE_SSL option  }
{ do not attempt to use SSL  }
{ try using SSL, proceed anyway otherwise  }
{ SSL for the control connection or fail  }
{ SSL for all communication or fail  }
{ not an option, never use  }

  Pcurl_usessl = ^Tcurl_usessl;
  Tcurl_usessl =  Longint;
  Const
    CURLUSESSL_NONE = 0;
    CURLUSESSL_TRY = 1;
    CURLUSESSL_CONTROL = 2;
    CURLUSESSL_ALL = 3;
    CURLUSESSL_LAST = 4;
;
{ Definition of bits for the CURLOPT_SSL_OPTIONS argument:  }
{ - ALLOW_BEAST tells libcurl to allow the BEAST SSL vulnerability in the
   name of improving interoperability with older servers. Some SSL libraries
   have introduced work-arounds for this flaw but those work-arounds sometimes
   make the SSL communication fail. To regain functionality with those broken
   servers, a user can this way allow the vulnerability back.  }
  CURLSSLOPT_ALLOW_BEAST = 1 shl 0;  
{ - NO_REVOKE tells libcurl to disable certificate revocation checks for those
   SSL backends where such behavior is present.  }
  CURLSSLOPT_NO_REVOKE = 1 shl 1;  
{ - NO_PARTIALCHAIN tells libcurl to *NOT* accept a partial certificate chain
   if possible. The OpenSSL backend has this ability.  }
  CURLSSLOPT_NO_PARTIALCHAIN = 1 shl 2;  
{ - REVOKE_BEST_EFFORT tells libcurl to ignore certificate revocation offline
   checks and ignore missing revocation list for those SSL backends where such
   behavior is present.  }
  CURLSSLOPT_REVOKE_BEST_EFFORT = 1 shl 3;  
{ - CURLSSLOPT_NATIVE_CA tells libcurl to use standard certificate store of
   operating system. Currently implemented under MS-Windows.  }
  CURLSSLOPT_NATIVE_CA = 1 shl 4;  
{ - CURLSSLOPT_AUTO_CLIENT_CERT tells libcurl to automatically locate and use
   a client certificate for authentication. (Schannel)  }
  CURLSSLOPT_AUTO_CLIENT_CERT = 1 shl 5;  
{ The default connection attempt delay in milliseconds for happy eyeballs.
   CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS.3 and happy-eyeballs-timeout-ms.d document
   this value, keep them in sync.  }
  CURL_HET_DEFAULT = 200;  
{ The default connection upkeep interval in milliseconds.  }
  CURL_UPKEEP_INTERVAL_DEFAULT = 60000;  
  CURLFTPSSL_NONE = CURLUSESSL_NONE;  
  CURLFTPSSL_TRY = CURLUSESSL_TRY;  
  CURLFTPSSL_CONTROL = CURLUSESSL_CONTROL;  
  CURLFTPSSL_ALL = CURLUSESSL_ALL;  
  CURLFTPSSL_LAST = CURLUSESSL_LAST;  
  curl_ftpssl = curl_usessl;  
{ parameter for the CURLOPT_FTP_SSL_CCC option  }
{ do not send CCC  }
{ Let the server initiate the shutdown  }
{ Initiate the shutdown  }
{ not an option, never use  }
type
  Pcurl_ftpccc = ^Tcurl_ftpccc;
  Tcurl_ftpccc =  Longint;
  Const
    CURLFTPSSL_CCC_NONE = 0;
    CURLFTPSSL_CCC_PASSIVE = 1;
    CURLFTPSSL_CCC_ACTIVE = 2;
    CURLFTPSSL_CCC_LAST = 3;
;
{ parameter for the CURLOPT_FTPSSLAUTH option  }
{ let libcurl decide  }
{ use "AUTH SSL"  }
{ use "AUTH TLS"  }
{ not an option, never use  }
type
  Pcurl_ftpauth = ^Tcurl_ftpauth;
  Tcurl_ftpauth =  Longint;
  Const
    CURLFTPAUTH_DEFAULT = 0;
    CURLFTPAUTH_SSL = 1;
    CURLFTPAUTH_TLS = 2;
    CURLFTPAUTH_LAST = 3;
;
{ parameter for the CURLOPT_FTP_CREATE_MISSING_DIRS option  }
{ do NOT create missing dirs!  }
{ (FTP/SFTP) if CWD fails, try MKD and then CWD
                               again if MKD succeeded, for SFTP this does
                               similar magic  }
{ (FTP only) if CWD fails, try MKD and then CWD
                               again even if MKD failed!  }
{ not an option, never use  }
type
  Pcurl_ftpcreatedir = ^Tcurl_ftpcreatedir;
  Tcurl_ftpcreatedir =  Longint;
  Const
    CURLFTP_CREATE_DIR_NONE = 0;
    CURLFTP_CREATE_DIR = 1;
    CURLFTP_CREATE_DIR_RETRY = 2;
    CURLFTP_CREATE_DIR_LAST = 3;
;
{ parameter for the CURLOPT_FTP_FILEMETHOD option  }
{ let libcurl pick  }
{ single CWD operation for each path part  }
{ no CWD at all  }
{ one CWD to full dir, then work on file  }
{ not an option, never use  }
type
  Pcurl_ftpmethod = ^Tcurl_ftpmethod;
  Tcurl_ftpmethod =  Longint;
  Const
    CURLFTPMETHOD_DEFAULT = 0;
    CURLFTPMETHOD_MULTICWD = 1;
    CURLFTPMETHOD_NOCWD = 2;
    CURLFTPMETHOD_SINGLECWD = 3;
    CURLFTPMETHOD_LAST = 4;
;
{ bitmask defines for CURLOPT_HEADEROPT  }
  CURLHEADER_UNIFIED = 0;  
  CURLHEADER_SEPARATE = 1 shl 0;  
{ CURLALTSVC_* are bits for the CURLOPT_ALTSVC_CTRL option  }
  CURLALTSVC_READONLYFILE = 1 shl 2;  
  CURLALTSVC_H1 = 1 shl 3;  
  CURLALTSVC_H2 = 1 shl 4;  
  CURLALTSVC_H3 = 1 shl 5;  
{ YYYYMMDD HH:MM:SS [null-terminated]  }
type
  Pcurl_hstsentry = ^Tcurl_hstsentry;
  Tcurl_hstsentry = record
      name : Pchar;
      namelen : Tsize_t;
      flag0 : word;
      expire : array[0..17] of char;
    end;


const
  bm_Tcurl_hstsentry_includeSubDomains = $1;
  bp_Tcurl_hstsentry_includeSubDomains = 0;

function includeSubDomains(var a : Tcurl_hstsentry) : dword;
procedure set_includeSubDomains(var a : Tcurl_hstsentry; __includeSubDomains : dword);
{ the provided entry's "index" or count  }
{ total number of entries to save  }
type
  Pcurl_index = ^Tcurl_index;
  Tcurl_index = record
      index : Tsize_t;
      total : Tsize_t;
    end;


  PCURLSTScode = ^TCURLSTScode;
  TCURLSTScode =  Longint;
  Const
    CURLSTS_OK = 0;
    CURLSTS_DONE = 1;
    CURLSTS_FAIL = 2;
;
type

  Tcurl_hstsread_callback = function (easy:PCURL; e:Pcurl_hstsentry; userp:pointer):TCURLSTScode;cdecl;

  Tcurl_hstswrite_callback = function (easy:PCURL; e:Pcurl_hstsentry; i:Pcurl_index; userp:pointer):TCURLSTScode;cdecl;
{ CURLHSTS_* are bits for the CURLOPT_HSTS option  }

{ was #define dname def_expr }
function CURLHSTS_ENABLE : longint;  

{ was #define dname def_expr }
function CURLHSTS_READONLYFILE : longint;  

{ The CURLPROTO_ defines below are for the **deprecated** CURLOPT_*PROTOCOLS
   options. Do not use.  }
const
  CURLPROTO_HTTP = 1 shl 0;  
  CURLPROTO_HTTPS = 1 shl 1;  
  CURLPROTO_FTP = 1 shl 2;  
  CURLPROTO_FTPS = 1 shl 3;  
  CURLPROTO_SCP = 1 shl 4;  
  CURLPROTO_SFTP = 1 shl 5;  
  CURLPROTO_TELNET = 1 shl 6;  
  CURLPROTO_LDAP = 1 shl 7;  
  CURLPROTO_LDAPS = 1 shl 8;  
  CURLPROTO_DICT = 1 shl 9;  
  CURLPROTO_FILE = 1 shl 10;  
  CURLPROTO_TFTP = 1 shl 11;  
  CURLPROTO_IMAP = 1 shl 12;  
  CURLPROTO_IMAPS = 1 shl 13;  
  CURLPROTO_POP3 = 1 shl 14;  
  CURLPROTO_POP3S = 1 shl 15;  
  CURLPROTO_SMTP = 1 shl 16;  
  CURLPROTO_SMTPS = 1 shl 17;  
  CURLPROTO_RTSP = 1 shl 18;  
  CURLPROTO_RTMP = 1 shl 19;  
  CURLPROTO_RTMPT = 1 shl 20;  
  CURLPROTO_RTMPE = 1 shl 21;  
  CURLPROTO_RTMPTE = 1 shl 22;  
  CURLPROTO_RTMPS = 1 shl 23;  
  CURLPROTO_RTMPTS = 1 shl 24;  
  CURLPROTO_GOPHER = 1 shl 25;  
  CURLPROTO_SMB = 1 shl 26;  
  CURLPROTO_SMBS = 1 shl 27;  
  CURLPROTO_MQTT = 1 shl 28;  
  CURLPROTO_GOPHERS = 1 shl 29;  
{ enable everything  }
  CURLPROTO_ALL =  not (0);  
{ long may be 32 or 64 bits, but we should never depend on anything else
   but 32  }
  CURLOPTTYPE_LONG = 0;  
  CURLOPTTYPE_OBJECTPOINT = 10000;  
  CURLOPTTYPE_FUNCTIONPOINT = 20000;  
  CURLOPTTYPE_OFF_T = 30000;  
  CURLOPTTYPE_BLOB = 40000;  
{ *STRINGPOINT is an alias for OBJECTPOINT to allow tools to extract the
   string options from the header file  }
{ CURLOPT aliases that make no run-time difference  }
{ 'char *' argument to a string with a trailing zero  }
  CURLOPTTYPE_STRINGPOINT = CURLOPTTYPE_OBJECTPOINT;  
{ 'struct curl_slist *' argument  }
  CURLOPTTYPE_SLISTPOINT = CURLOPTTYPE_OBJECTPOINT;  
{ 'void *' argument passed untouched to callback  }
  CURLOPTTYPE_CBPOINT = CURLOPTTYPE_OBJECTPOINT;  
{ 'long' argument with a set of values/bitmask  }
  CURLOPTTYPE_VALUES = CURLOPTTYPE_LONG;  
{
 * All CURLOPT_* values.
  }
{ xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
type
  PCURLoption = ^TCURLoption;
  TCURLoption =  Longint;
  Const
    CURLOPT_WRITEDATA = CURLOPTTYPE_CBPOINT+1;
    CURLOPT_URL = CURLOPTTYPE_STRINGPOINT+2;
    CURLOPT_PORT = CURLOPTTYPE_LONG+3;
    CURLOPT_PROXY = CURLOPTTYPE_STRINGPOINT+4;
    CURLOPT_USERPWD = CURLOPTTYPE_STRINGPOINT+5;
    CURLOPT_PROXYUSERPWD = CURLOPTTYPE_STRINGPOINT+6;
    CURLOPT_RANGE = CURLOPTTYPE_STRINGPOINT+7;
    CURLOPT_READDATA = CURLOPTTYPE_CBPOINT+9;
    CURLOPT_ERRORBUFFER = CURLOPTTYPE_OBJECTPOINT+10;
    CURLOPT_WRITEFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+11;
    CURLOPT_READFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+12;
    CURLOPT_TIMEOUT = CURLOPTTYPE_LONG+13;
    CURLOPT_INFILESIZE = CURLOPTTYPE_LONG+14;
    CURLOPT_POSTFIELDS = CURLOPTTYPE_OBJECTPOINT+15;
    CURLOPT_REFERER = CURLOPTTYPE_STRINGPOINT+16;
    CURLOPT_FTPPORT = CURLOPTTYPE_STRINGPOINT+17;
    CURLOPT_USERAGENT = CURLOPTTYPE_STRINGPOINT+18;
    CURLOPT_LOW_SPEED_LIMIT = CURLOPTTYPE_LONG+19;
    CURLOPT_LOW_SPEED_TIME = CURLOPTTYPE_LONG+20;
    CURLOPT_RESUME_FROM = CURLOPTTYPE_LONG+21;
    CURLOPT_COOKIE = CURLOPTTYPE_STRINGPOINT+22;
    CURLOPT_HTTPHEADER = CURLOPTTYPE_SLISTPOINT+23;
    CURLOPT_HTTPPOST = CURLOPTTYPE_OBJECTPOINT+24;
    CURLOPT_SSLCERT = CURLOPTTYPE_STRINGPOINT+25;
    CURLOPT_KEYPASSWD = CURLOPTTYPE_STRINGPOINT+26;
    CURLOPT_CRLF = CURLOPTTYPE_LONG+27;
    CURLOPT_QUOTE = CURLOPTTYPE_SLISTPOINT+28;
    CURLOPT_HEADERDATA = CURLOPTTYPE_CBPOINT+29;
    CURLOPT_COOKIEFILE = CURLOPTTYPE_STRINGPOINT+31;
    CURLOPT_SSLVERSION = CURLOPTTYPE_VALUES+32;
    CURLOPT_TIMECONDITION = CURLOPTTYPE_VALUES+33;
    CURLOPT_TIMEVALUE = CURLOPTTYPE_LONG+34;
    CURLOPT_CUSTOMREQUEST = CURLOPTTYPE_STRINGPOINT+36;
    CURLOPT_STDERR = CURLOPTTYPE_OBJECTPOINT+37;
    CURLOPT_POSTQUOTE = CURLOPTTYPE_SLISTPOINT+39;
    CURLOPT_OBSOLETE40 = CURLOPTTYPE_OBJECTPOINT+40;
    CURLOPT_VERBOSE = CURLOPTTYPE_LONG+41;
    CURLOPT_HEADER = CURLOPTTYPE_LONG+42;
    CURLOPT_NOPROGRESS = CURLOPTTYPE_LONG+43;
    CURLOPT_NOBODY = CURLOPTTYPE_LONG+44;
    CURLOPT_FAILONERROR = CURLOPTTYPE_LONG+45;
    CURLOPT_UPLOAD = CURLOPTTYPE_LONG+46;
    CURLOPT_POST = CURLOPTTYPE_LONG+47;
    CURLOPT_DIRLISTONLY = CURLOPTTYPE_LONG+48;
    CURLOPT_APPEND = CURLOPTTYPE_LONG+50;
    CURLOPT_NETRC = CURLOPTTYPE_VALUES+51;
    CURLOPT_FOLLOWLOCATION = CURLOPTTYPE_LONG+52;
    CURLOPT_TRANSFERTEXT = CURLOPTTYPE_LONG+53;
    CURLOPT_PUT = CURLOPTTYPE_LONG+54;
    CURLOPT_PROGRESSFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+56;
    CURLOPT_XFERINFODATA = CURLOPTTYPE_CBPOINT+57;
    CURLOPT_AUTOREFERER = CURLOPTTYPE_LONG+58;
    CURLOPT_PROXYPORT = CURLOPTTYPE_LONG+59;
    CURLOPT_POSTFIELDSIZE = CURLOPTTYPE_LONG+60;
    CURLOPT_HTTPPROXYTUNNEL = CURLOPTTYPE_LONG+61;
    CURLOPT_INTERFACE = CURLOPTTYPE_STRINGPOINT+62;
    CURLOPT_KRBLEVEL = CURLOPTTYPE_STRINGPOINT+63;
    CURLOPT_SSL_VERIFYPEER = CURLOPTTYPE_LONG+64;
    CURLOPT_CAINFO = CURLOPTTYPE_STRINGPOINT+65;
    CURLOPT_MAXREDIRS = CURLOPTTYPE_LONG+68;
    CURLOPT_FILETIME = CURLOPTTYPE_LONG+69;
    CURLOPT_TELNETOPTIONS = CURLOPTTYPE_SLISTPOINT+70;
    CURLOPT_MAXCONNECTS = CURLOPTTYPE_LONG+71;
    CURLOPT_OBSOLETE72 = CURLOPTTYPE_LONG+72;
    CURLOPT_FRESH_CONNECT = CURLOPTTYPE_LONG+74;
    CURLOPT_FORBID_REUSE = CURLOPTTYPE_LONG+75;
    CURLOPT_RANDOM_FILE = CURLOPTTYPE_STRINGPOINT+76;
    CURLOPT_EGDSOCKET = CURLOPTTYPE_STRINGPOINT+77;
    CURLOPT_CONNECTTIMEOUT = CURLOPTTYPE_LONG+78;
    CURLOPT_HEADERFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+79;
    CURLOPT_HTTPGET = CURLOPTTYPE_LONG+80;
    CURLOPT_SSL_VERIFYHOST = CURLOPTTYPE_LONG+81;
    CURLOPT_COOKIEJAR = CURLOPTTYPE_STRINGPOINT+82;
    CURLOPT_SSL_CIPHER_LIST = CURLOPTTYPE_STRINGPOINT+83;
    CURLOPT_HTTP_VERSION = CURLOPTTYPE_VALUES+84;
    CURLOPT_FTP_USE_EPSV = CURLOPTTYPE_LONG+85;
    CURLOPT_SSLCERTTYPE = CURLOPTTYPE_STRINGPOINT+86;
    CURLOPT_SSLKEY = CURLOPTTYPE_STRINGPOINT+87;
    CURLOPT_SSLKEYTYPE = CURLOPTTYPE_STRINGPOINT+88;
    CURLOPT_SSLENGINE = CURLOPTTYPE_STRINGPOINT+89;
    CURLOPT_SSLENGINE_DEFAULT = CURLOPTTYPE_LONG+90;
    CURLOPT_DNS_USE_GLOBAL_CACHE = CURLOPTTYPE_LONG+91;
    CURLOPT_DNS_CACHE_TIMEOUT = CURLOPTTYPE_LONG+92;
    CURLOPT_PREQUOTE = CURLOPTTYPE_SLISTPOINT+93;
    CURLOPT_DEBUGFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+94;
    CURLOPT_DEBUGDATA = CURLOPTTYPE_CBPOINT+95;
    CURLOPT_COOKIESESSION = CURLOPTTYPE_LONG+96;
    CURLOPT_CAPATH = CURLOPTTYPE_STRINGPOINT+97;
    CURLOPT_BUFFERSIZE = CURLOPTTYPE_LONG+98;
    CURLOPT_NOSIGNAL = CURLOPTTYPE_LONG+99;
    CURLOPT_SHARE = CURLOPTTYPE_OBJECTPOINT+100;
    CURLOPT_PROXYTYPE = CURLOPTTYPE_VALUES+101;
    CURLOPT_ACCEPT_ENCODING = CURLOPTTYPE_STRINGPOINT+102;
    CURLOPT_PRIVATE = CURLOPTTYPE_OBJECTPOINT+103;
    CURLOPT_HTTP200ALIASES = CURLOPTTYPE_SLISTPOINT+104;
    CURLOPT_UNRESTRICTED_AUTH = CURLOPTTYPE_LONG+105;
    CURLOPT_FTP_USE_EPRT = CURLOPTTYPE_LONG+106;
    CURLOPT_HTTPAUTH = CURLOPTTYPE_VALUES+107;
    CURLOPT_SSL_CTX_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+108;
    CURLOPT_SSL_CTX_DATA = CURLOPTTYPE_CBPOINT+109;
    CURLOPT_FTP_CREATE_MISSING_DIRS = CURLOPTTYPE_LONG+110;
    CURLOPT_PROXYAUTH = CURLOPTTYPE_VALUES+111;
    CURLOPT_SERVER_RESPONSE_TIMEOUT = CURLOPTTYPE_LONG+112;
    CURLOPT_IPRESOLVE = CURLOPTTYPE_VALUES+113;
    CURLOPT_MAXFILESIZE = CURLOPTTYPE_LONG+114;
    CURLOPT_INFILESIZE_LARGE = CURLOPTTYPE_OFF_T+115;
    CURLOPT_RESUME_FROM_LARGE = CURLOPTTYPE_OFF_T+116;
    CURLOPT_MAXFILESIZE_LARGE = CURLOPTTYPE_OFF_T+117;
    CURLOPT_NETRC_FILE = CURLOPTTYPE_STRINGPOINT+118;
    CURLOPT_USE_SSL = CURLOPTTYPE_VALUES+119;
    CURLOPT_POSTFIELDSIZE_LARGE = CURLOPTTYPE_OFF_T+120;
    CURLOPT_TCP_NODELAY = CURLOPTTYPE_LONG+121;
    CURLOPT_FTPSSLAUTH = CURLOPTTYPE_VALUES+129;
    CURLOPT_IOCTLFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+130;
    CURLOPT_IOCTLDATA = CURLOPTTYPE_CBPOINT+131;
    CURLOPT_FTP_ACCOUNT = CURLOPTTYPE_STRINGPOINT+134;
    CURLOPT_COOKIELIST = CURLOPTTYPE_STRINGPOINT+135;
    CURLOPT_IGNORE_CONTENT_LENGTH = CURLOPTTYPE_LONG+136;
    CURLOPT_FTP_SKIP_PASV_IP = CURLOPTTYPE_LONG+137;
    CURLOPT_FTP_FILEMETHOD = CURLOPTTYPE_VALUES+138;
    CURLOPT_LOCALPORT = CURLOPTTYPE_LONG+139;
    CURLOPT_LOCALPORTRANGE = CURLOPTTYPE_LONG+140;
    CURLOPT_CONNECT_ONLY = CURLOPTTYPE_LONG+141;
    CURLOPT_CONV_FROM_NETWORK_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+142;
    CURLOPT_CONV_TO_NETWORK_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+143;
    CURLOPT_CONV_FROM_UTF8_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+144;
    CURLOPT_MAX_SEND_SPEED_LARGE = CURLOPTTYPE_OFF_T+145;
    CURLOPT_MAX_RECV_SPEED_LARGE = CURLOPTTYPE_OFF_T+146;
    CURLOPT_FTP_ALTERNATIVE_TO_USER = CURLOPTTYPE_STRINGPOINT+147;
    CURLOPT_SOCKOPTFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+148;
    CURLOPT_SOCKOPTDATA = CURLOPTTYPE_CBPOINT+149;
    CURLOPT_SSL_SESSIONID_CACHE = CURLOPTTYPE_LONG+150;
    CURLOPT_SSH_AUTH_TYPES = CURLOPTTYPE_VALUES+151;
    CURLOPT_SSH_PUBLIC_KEYFILE = CURLOPTTYPE_STRINGPOINT+152;
    CURLOPT_SSH_PRIVATE_KEYFILE = CURLOPTTYPE_STRINGPOINT+153;
    CURLOPT_FTP_SSL_CCC = CURLOPTTYPE_LONG+154;
    CURLOPT_TIMEOUT_MS = CURLOPTTYPE_LONG+155;
    CURLOPT_CONNECTTIMEOUT_MS = CURLOPTTYPE_LONG+156;
    CURLOPT_HTTP_TRANSFER_DECODING = CURLOPTTYPE_LONG+157;
    CURLOPT_HTTP_CONTENT_DECODING = CURLOPTTYPE_LONG+158;
    CURLOPT_NEW_FILE_PERMS = CURLOPTTYPE_LONG+159;
    CURLOPT_NEW_DIRECTORY_PERMS = CURLOPTTYPE_LONG+160;
    CURLOPT_POSTREDIR = CURLOPTTYPE_VALUES+161;
    CURLOPT_SSH_HOST_PUBLIC_KEY_MD5 = CURLOPTTYPE_STRINGPOINT+162;
    CURLOPT_OPENSOCKETFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+163;
    CURLOPT_OPENSOCKETDATA = CURLOPTTYPE_CBPOINT+164;
    CURLOPT_COPYPOSTFIELDS = CURLOPTTYPE_OBJECTPOINT+165;
    CURLOPT_PROXY_TRANSFER_MODE = CURLOPTTYPE_LONG+166;
    CURLOPT_SEEKFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+167;
    CURLOPT_SEEKDATA = CURLOPTTYPE_CBPOINT+168;
    CURLOPT_CRLFILE = CURLOPTTYPE_STRINGPOINT+169;
    CURLOPT_ISSUERCERT = CURLOPTTYPE_STRINGPOINT+170;
    CURLOPT_ADDRESS_SCOPE = CURLOPTTYPE_LONG+171;
    CURLOPT_CERTINFO = CURLOPTTYPE_LONG+172;
    CURLOPT_USERNAME = CURLOPTTYPE_STRINGPOINT+173;
    CURLOPT_PASSWORD = CURLOPTTYPE_STRINGPOINT+174;
    CURLOPT_PROXYUSERNAME = CURLOPTTYPE_STRINGPOINT+175;
    CURLOPT_PROXYPASSWORD = CURLOPTTYPE_STRINGPOINT+176;
    CURLOPT_NOPROXY = CURLOPTTYPE_STRINGPOINT+177;
    CURLOPT_TFTP_BLKSIZE = CURLOPTTYPE_LONG+178;
    CURLOPT_SOCKS5_GSSAPI_SERVICE = CURLOPTTYPE_STRINGPOINT+179;
    CURLOPT_SOCKS5_GSSAPI_NEC = CURLOPTTYPE_LONG+180;
    CURLOPT_PROTOCOLS = CURLOPTTYPE_LONG+181;
    CURLOPT_REDIR_PROTOCOLS = CURLOPTTYPE_LONG+182;
    CURLOPT_SSH_KNOWNHOSTS = CURLOPTTYPE_STRINGPOINT+183;
    CURLOPT_SSH_KEYFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+184;
    CURLOPT_SSH_KEYDATA = CURLOPTTYPE_CBPOINT+185;
    CURLOPT_MAIL_FROM = CURLOPTTYPE_STRINGPOINT+186;
    CURLOPT_MAIL_RCPT = CURLOPTTYPE_SLISTPOINT+187;
    CURLOPT_FTP_USE_PRET = CURLOPTTYPE_LONG+188;
    CURLOPT_RTSP_REQUEST = CURLOPTTYPE_VALUES+189;
    CURLOPT_RTSP_SESSION_ID = CURLOPTTYPE_STRINGPOINT+190;
    CURLOPT_RTSP_STREAM_URI = CURLOPTTYPE_STRINGPOINT+191;
    CURLOPT_RTSP_TRANSPORT = CURLOPTTYPE_STRINGPOINT+192;
    CURLOPT_RTSP_CLIENT_CSEQ = CURLOPTTYPE_LONG+193;
    CURLOPT_RTSP_SERVER_CSEQ = CURLOPTTYPE_LONG+194;
    CURLOPT_INTERLEAVEDATA = CURLOPTTYPE_CBPOINT+195;
    CURLOPT_INTERLEAVEFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+196;
    CURLOPT_WILDCARDMATCH = CURLOPTTYPE_LONG+197;
    CURLOPT_CHUNK_BGN_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+198;
    CURLOPT_CHUNK_END_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+199;
    CURLOPT_FNMATCH_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+200;
    CURLOPT_CHUNK_DATA = CURLOPTTYPE_CBPOINT+201;
    CURLOPT_FNMATCH_DATA = CURLOPTTYPE_CBPOINT+202;
    CURLOPT_RESOLVE = CURLOPTTYPE_SLISTPOINT+203;
    CURLOPT_TLSAUTH_USERNAME = CURLOPTTYPE_STRINGPOINT+204;
    CURLOPT_TLSAUTH_PASSWORD = CURLOPTTYPE_STRINGPOINT+205;
    CURLOPT_TLSAUTH_TYPE = CURLOPTTYPE_STRINGPOINT+206;
    CURLOPT_TRANSFER_ENCODING = CURLOPTTYPE_LONG+207;
    CURLOPT_CLOSESOCKETFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+208;
    CURLOPT_CLOSESOCKETDATA = CURLOPTTYPE_CBPOINT+209;
    CURLOPT_GSSAPI_DELEGATION = CURLOPTTYPE_VALUES+210;
    CURLOPT_DNS_SERVERS = CURLOPTTYPE_STRINGPOINT+211;
    CURLOPT_ACCEPTTIMEOUT_MS = CURLOPTTYPE_LONG+212;
    CURLOPT_TCP_KEEPALIVE = CURLOPTTYPE_LONG+213;
    CURLOPT_TCP_KEEPIDLE = CURLOPTTYPE_LONG+214;
    CURLOPT_TCP_KEEPINTVL = CURLOPTTYPE_LONG+215;
    CURLOPT_SSL_OPTIONS = CURLOPTTYPE_VALUES+216;
    CURLOPT_MAIL_AUTH = CURLOPTTYPE_STRINGPOINT+217;
    CURLOPT_SASL_IR = CURLOPTTYPE_LONG+218;
    CURLOPT_XFERINFOFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+219;
    CURLOPT_XOAUTH2_BEARER = CURLOPTTYPE_STRINGPOINT+220;
    CURLOPT_DNS_INTERFACE = CURLOPTTYPE_STRINGPOINT+221;
    CURLOPT_DNS_LOCAL_IP4 = CURLOPTTYPE_STRINGPOINT+222;
    CURLOPT_DNS_LOCAL_IP6 = CURLOPTTYPE_STRINGPOINT+223;
    CURLOPT_LOGIN_OPTIONS = CURLOPTTYPE_STRINGPOINT+224;
    CURLOPT_SSL_ENABLE_NPN = CURLOPTTYPE_LONG+225;
    CURLOPT_SSL_ENABLE_ALPN = CURLOPTTYPE_LONG+226;
    CURLOPT_EXPECT_100_TIMEOUT_MS = CURLOPTTYPE_LONG+227;
    CURLOPT_PROXYHEADER = CURLOPTTYPE_SLISTPOINT+228;
    CURLOPT_HEADEROPT = CURLOPTTYPE_VALUES+229;
    CURLOPT_PINNEDPUBLICKEY = CURLOPTTYPE_STRINGPOINT+230;
    CURLOPT_UNIX_SOCKET_PATH = CURLOPTTYPE_STRINGPOINT+231;
    CURLOPT_SSL_VERIFYSTATUS = CURLOPTTYPE_LONG+232;
    CURLOPT_SSL_FALSESTART = CURLOPTTYPE_LONG+233;
    CURLOPT_PATH_AS_IS = CURLOPTTYPE_LONG+234;
    CURLOPT_PROXY_SERVICE_NAME = CURLOPTTYPE_STRINGPOINT+235;
    CURLOPT_SERVICE_NAME = CURLOPTTYPE_STRINGPOINT+236;
    CURLOPT_PIPEWAIT = CURLOPTTYPE_LONG+237;
    CURLOPT_DEFAULT_PROTOCOL = CURLOPTTYPE_STRINGPOINT+238;
    CURLOPT_STREAM_WEIGHT = CURLOPTTYPE_LONG+239;
    CURLOPT_STREAM_DEPENDS = CURLOPTTYPE_OBJECTPOINT+240;
    CURLOPT_STREAM_DEPENDS_E = CURLOPTTYPE_OBJECTPOINT+241;
    CURLOPT_TFTP_NO_OPTIONS = CURLOPTTYPE_LONG+242;
    CURLOPT_CONNECT_TO = CURLOPTTYPE_SLISTPOINT+243;
    CURLOPT_TCP_FASTOPEN = CURLOPTTYPE_LONG+244;
    CURLOPT_KEEP_SENDING_ON_ERROR = CURLOPTTYPE_LONG+245;
    CURLOPT_PROXY_CAINFO = CURLOPTTYPE_STRINGPOINT+246;
    CURLOPT_PROXY_CAPATH = CURLOPTTYPE_STRINGPOINT+247;
    CURLOPT_PROXY_SSL_VERIFYPEER = CURLOPTTYPE_LONG+248;
    CURLOPT_PROXY_SSL_VERIFYHOST = CURLOPTTYPE_LONG+249;
    CURLOPT_PROXY_SSLVERSION = CURLOPTTYPE_VALUES+250;
    CURLOPT_PROXY_TLSAUTH_USERNAME = CURLOPTTYPE_STRINGPOINT+251;
    CURLOPT_PROXY_TLSAUTH_PASSWORD = CURLOPTTYPE_STRINGPOINT+252;
    CURLOPT_PROXY_TLSAUTH_TYPE = CURLOPTTYPE_STRINGPOINT+253;
    CURLOPT_PROXY_SSLCERT = CURLOPTTYPE_STRINGPOINT+254;
    CURLOPT_PROXY_SSLCERTTYPE = CURLOPTTYPE_STRINGPOINT+255;
    CURLOPT_PROXY_SSLKEY = CURLOPTTYPE_STRINGPOINT+256;
    CURLOPT_PROXY_SSLKEYTYPE = CURLOPTTYPE_STRINGPOINT+257;
    CURLOPT_PROXY_KEYPASSWD = CURLOPTTYPE_STRINGPOINT+258;
    CURLOPT_PROXY_SSL_CIPHER_LIST = CURLOPTTYPE_STRINGPOINT+259;
    CURLOPT_PROXY_CRLFILE = CURLOPTTYPE_STRINGPOINT+260;
    CURLOPT_PROXY_SSL_OPTIONS = CURLOPTTYPE_LONG+261;
    CURLOPT_PRE_PROXY = CURLOPTTYPE_STRINGPOINT+262;
    CURLOPT_PROXY_PINNEDPUBLICKEY = CURLOPTTYPE_STRINGPOINT+263;
    CURLOPT_ABSTRACT_UNIX_SOCKET = CURLOPTTYPE_STRINGPOINT+264;
    CURLOPT_SUPPRESS_CONNECT_HEADERS = CURLOPTTYPE_LONG+265;
    CURLOPT_REQUEST_TARGET = CURLOPTTYPE_STRINGPOINT+266;
    CURLOPT_SOCKS5_AUTH = CURLOPTTYPE_LONG+267;
    CURLOPT_SSH_COMPRESSION = CURLOPTTYPE_LONG+268;
    CURLOPT_MIMEPOST = CURLOPTTYPE_OBJECTPOINT+269;
    CURLOPT_TIMEVALUE_LARGE = CURLOPTTYPE_OFF_T+270;
    CURLOPT_HAPPY_EYEBALLS_TIMEOUT_MS = CURLOPTTYPE_LONG+271;
    CURLOPT_RESOLVER_START_FUNCTION = CURLOPTTYPE_FUNCTIONPOINT+272;
    CURLOPT_RESOLVER_START_DATA = CURLOPTTYPE_CBPOINT+273;
    CURLOPT_HAPROXYPROTOCOL = CURLOPTTYPE_LONG+274;
    CURLOPT_DNS_SHUFFLE_ADDRESSES = CURLOPTTYPE_LONG+275;
    CURLOPT_TLS13_CIPHERS = CURLOPTTYPE_STRINGPOINT+276;
    CURLOPT_PROXY_TLS13_CIPHERS = CURLOPTTYPE_STRINGPOINT+277;
    CURLOPT_DISALLOW_USERNAME_IN_URL = CURLOPTTYPE_LONG+278;
    CURLOPT_DOH_URL = CURLOPTTYPE_STRINGPOINT+279;
    CURLOPT_UPLOAD_BUFFERSIZE = CURLOPTTYPE_LONG+280;
    CURLOPT_UPKEEP_INTERVAL_MS = CURLOPTTYPE_LONG+281;
    CURLOPT_CURLU = CURLOPTTYPE_OBJECTPOINT+282;
    CURLOPT_TRAILERFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+283;
    CURLOPT_TRAILERDATA = CURLOPTTYPE_CBPOINT+284;
    CURLOPT_HTTP09_ALLOWED = CURLOPTTYPE_LONG+285;
    CURLOPT_ALTSVC_CTRL = CURLOPTTYPE_LONG+286;
    CURLOPT_ALTSVC = CURLOPTTYPE_STRINGPOINT+287;
    CURLOPT_MAXAGE_CONN = CURLOPTTYPE_LONG+288;
    CURLOPT_SASL_AUTHZID = CURLOPTTYPE_STRINGPOINT+289;
    CURLOPT_MAIL_RCPT_ALLOWFAILS = CURLOPTTYPE_LONG+290;
    CURLOPT_SSLCERT_BLOB = CURLOPTTYPE_BLOB+291;
    CURLOPT_SSLKEY_BLOB = CURLOPTTYPE_BLOB+292;
    CURLOPT_PROXY_SSLCERT_BLOB = CURLOPTTYPE_BLOB+293;
    CURLOPT_PROXY_SSLKEY_BLOB = CURLOPTTYPE_BLOB+294;
    CURLOPT_ISSUERCERT_BLOB = CURLOPTTYPE_BLOB+295;
    CURLOPT_PROXY_ISSUERCERT = CURLOPTTYPE_STRINGPOINT+296;
    CURLOPT_PROXY_ISSUERCERT_BLOB = CURLOPTTYPE_BLOB+297;
    CURLOPT_SSL_EC_CURVES = CURLOPTTYPE_STRINGPOINT+298;
    CURLOPT_HSTS_CTRL = CURLOPTTYPE_LONG+299;
    CURLOPT_HSTS = CURLOPTTYPE_STRINGPOINT+300;
    CURLOPT_HSTSREADFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+301;
    CURLOPT_HSTSREADDATA = CURLOPTTYPE_CBPOINT+302;
    CURLOPT_HSTSWRITEFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+303;
    CURLOPT_HSTSWRITEDATA = CURLOPTTYPE_CBPOINT+304;
    CURLOPT_AWS_SIGV4 = CURLOPTTYPE_STRINGPOINT+305;
    CURLOPT_DOH_SSL_VERIFYPEER = CURLOPTTYPE_LONG+306;
    CURLOPT_DOH_SSL_VERIFYHOST = CURLOPTTYPE_LONG+307;
    CURLOPT_DOH_SSL_VERIFYSTATUS = CURLOPTTYPE_LONG+308;
    CURLOPT_CAINFO_BLOB = CURLOPTTYPE_BLOB+309;
    CURLOPT_PROXY_CAINFO_BLOB = CURLOPTTYPE_BLOB+310;
    CURLOPT_SSH_HOST_PUBLIC_KEY_SHA256 = CURLOPTTYPE_STRINGPOINT+311;
    CURLOPT_PREREQFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+312;
    CURLOPT_PREREQDATA = CURLOPTTYPE_CBPOINT+313;
    CURLOPT_MAXLIFETIME_CONN = CURLOPTTYPE_LONG+314;
    CURLOPT_MIME_OPTIONS = CURLOPTTYPE_LONG+315;
    CURLOPT_SSH_HOSTKEYFUNCTION = CURLOPTTYPE_FUNCTIONPOINT+316;
    CURLOPT_SSH_HOSTKEYDATA = CURLOPTTYPE_CBPOINT+317;
    CURLOPT_PROTOCOLS_STR = CURLOPTTYPE_STRINGPOINT+318;
    CURLOPT_REDIR_PROTOCOLS_STR = CURLOPTTYPE_STRINGPOINT+319;
    CURLOPT_WS_OPTIONS = CURLOPTTYPE_LONG+320;
    CURLOPT_CA_CACHE_TIMEOUT = CURLOPTTYPE_LONG+321;
    CURLOPT_QUICK_EXIT = CURLOPTTYPE_LONG+322;
    CURLOPT_HAPROXY_CLIENT_IP = CURLOPTTYPE_STRINGPOINT+323;
    CURLOPT_LASTENTRY = (CURLOPTTYPE_STRINGPOINT+323)+1;
;
{ xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
  CURLOPT_PROGRESSDATA = CURLOPT_XFERINFODATA;  
{ Backwards compatibility with older names  }
{ These are scheduled to disappear by 2011  }
{ This was added in version 7.19.1  }
  CURLOPT_POST301 = CURLOPT_POSTREDIR;  
{ These are scheduled to disappear by 2009  }
{ The following were added in 7.17.0  }
  CURLOPT_SSLKEYPASSWD = CURLOPT_KEYPASSWD;  
  CURLOPT_FTPAPPEND = CURLOPT_APPEND;  
  CURLOPT_FTPLISTONLY = CURLOPT_DIRLISTONLY;  
  CURLOPT_FTP_SSL = CURLOPT_USE_SSL;  
{ The following were added earlier  }
  CURLOPT_SSLCERTPASSWD = CURLOPT_KEYPASSWD;  
  CURLOPT_KRB4LEVEL = CURLOPT_KRBLEVEL;  
{  }
  CURLOPT_FTP_RESPONSE_TIMEOUT = CURLOPT_SERVER_RESPONSE_TIMEOUT;  
{ Added in 8.2.0  }
  CURLOPT_MAIL_RCPT_ALLLOWFAILS = CURLOPT_MAIL_RCPT_ALLOWFAILS;  
{$else}
{ This is set if CURL_NO_OLDIES is defined at compile-time  }
{$undef CURLOPT_DNS_USE_GLOBAL_CACHE /* soon obsolete */}
{$endif}
{ Below here follows defines for the CURLOPT_IPRESOLVE option. If a host
     name resolves addresses using more than one IP protocol version, this
     option might be handy to force libcurl to use a specific IP version.  }
{ default, uses addresses to all IP
                                     versions that your system allows  }

const
  CURL_IPRESOLVE_WHATEVER = 0;  
{ uses only IPv4 addresses/connections  }
  CURL_IPRESOLVE_V4 = 1;  
{ uses only IPv6 addresses/connections  }
  CURL_IPRESOLVE_V6 = 2;  
{ Convenient "aliases"  }
  CURLOPT_RTSPHEADER = CURLOPT_HTTPHEADER;  
{ These enums are for use with the CURLOPT_HTTP_VERSION option.  }
{ setting this means we don't care, and that we'd
                             like the library to choose the best possible
                             for us!  }
{ please use HTTP 1.0 in the request  }
{ please use HTTP 1.1 in the request  }
{ please use HTTP 2 in the request  }
{ use version 2 for HTTPS, version 1.1 for HTTP  }
{ please use HTTP 2 without HTTP/1.1
                                           Upgrade  }
{ Use HTTP/3, fallback to HTTP/2 or HTTP/1 if
                               needed. For HTTPS only. For HTTP, this option
                               makes libcurl return error.  }
{ Use HTTP/3 without fallback. For HTTPS
                                   only. For HTTP, this makes libcurl
                                   return error.  }
{ *ILLEGAL* http version  }
type
  Txxxxxxxxxxx =  Longint;
  Const
    CURL_HTTP_VERSION_NONE = 0;
    CURL_HTTP_VERSION_1_0 = 1;
    CURL_HTTP_VERSION_1_1 = 2;
    CURL_HTTP_VERSION_2_0 = 3;
    CURL_HTTP_VERSION_2TLS = 4;
    CURL_HTTP_VERSION_2_PRIOR_KNOWLEDGE = 5;
    CURL_HTTP_VERSION_3 = 30;
    CURL_HTTP_VERSION_3ONLY = 31;
    CURL_HTTP_VERSION_LAST = 32;

{ Convenience definition simple because the name of the version is HTTP/2 and
   not 2.0. The 2_0 version of the enum name was set while the version was
   still planned to be 2.0 and we stick to it for compatibility.  }
  CURL_HTTP_VERSION_2 = CURL_HTTP_VERSION_2_0;  
{
 * Public API enums for RTSP requests
  }
{ first in list  }
{ last in list  }
type
  Txxxxxxxxxxxxxx =  Longint;
  Const
    CURL_RTSPREQ_NONE = 0;
    CURL_RTSPREQ_OPTIONS = 1;
    CURL_RTSPREQ_DESCRIBE = 2;
    CURL_RTSPREQ_ANNOUNCE = 3;
    CURL_RTSPREQ_SETUP = 4;
    CURL_RTSPREQ_PLAY = 5;
    CURL_RTSPREQ_PAUSE = 6;
    CURL_RTSPREQ_TEARDOWN = 7;
    CURL_RTSPREQ_GET_PARAMETER = 8;
    CURL_RTSPREQ_SET_PARAMETER = 9;
    CURL_RTSPREQ_RECORD = 10;
    CURL_RTSPREQ_RECEIVE = 11;
    CURL_RTSPREQ_LAST = 12;

{ These enums are for use with the CURLOPT_NETRC option.  }
{ The .netrc will never be read.
                           * This is the default.  }
{ A user:password in the URL will be preferred
                           * to one in the .netrc.  }
{ A user:password in the URL will be ignored.
                           * Unless one is set programmatically, the .netrc
                           * will be queried.  }
type
  TCURL_NETRC_OPTION =  Longint;
  Const
    CURL_NETRC_IGNORED = 0;
    CURL_NETRC_OPTIONAL = 1;
    CURL_NETRC_REQUIRED = 2;
    CURL_NETRC_LAST = 3;

{ TLS 1.x  }
{ never use, keep last  }
type
  Txxxxxxx =  Longint;
  Const
    CURL_SSLVERSION_DEFAULT = 0;
    CURL_SSLVERSION_TLSv1 = 1;
    CURL_SSLVERSION_SSLv2 = 2;
    CURL_SSLVERSION_SSLv3 = 3;
    CURL_SSLVERSION_TLSv1_0 = 4;
    CURL_SSLVERSION_TLSv1_1 = 5;
    CURL_SSLVERSION_TLSv1_2 = 6;
    CURL_SSLVERSION_TLSv1_3 = 7;
    CURL_SSLVERSION_LAST = 8;

{ never use, keep last  }
type
  Txxxxxxxxx =  Longint;
  Const
    CURL_SSLVERSION_MAX_NONE = 0;
    CURL_SSLVERSION_MAX_DEFAULT = CURL_SSLVERSION_TLSv1 shl 16;
    CURL_SSLVERSION_MAX_TLSv1_0 = CURL_SSLVERSION_TLSv1_0 shl 16;
    CURL_SSLVERSION_MAX_TLSv1_1 = CURL_SSLVERSION_TLSv1_1 shl 16;
    CURL_SSLVERSION_MAX_TLSv1_2 = CURL_SSLVERSION_TLSv1_2 shl 16;
    CURL_SSLVERSION_MAX_TLSv1_3 = CURL_SSLVERSION_TLSv1_3 shl 16;
    CURL_SSLVERSION_MAX_LAST = CURL_SSLVERSION_LAST shl 16;

{ never use, keep last  }
type
  TCURL_TLSAUTH =  Longint;
  Const
    CURL_TLSAUTH_NONE = 0;
    CURL_TLSAUTH_SRP = 1;
    CURL_TLSAUTH_LAST = 2;

{ symbols to use with CURLOPT_POSTREDIR.
   CURL_REDIR_POST_301, CURL_REDIR_POST_302 and CURL_REDIR_POST_303
   can be bitwise ORed so that CURL_REDIR_POST_301 | CURL_REDIR_POST_302
   | CURL_REDIR_POST_303 == CURL_REDIR_POST_ALL  }
  CURL_REDIR_GET_ALL = 0;  
  CURL_REDIR_POST_301 = 1;  
  CURL_REDIR_POST_302 = 2;  
  CURL_REDIR_POST_303 = 4;  
  CURL_REDIR_POST_ALL = (CURL_REDIR_POST_301 or CURL_REDIR_POST_302) or CURL_REDIR_POST_303;  
type
  Pcurl_TimeCond = ^Tcurl_TimeCond;
  Tcurl_TimeCond =  Longint;
  Const
    CURL_TIMECOND_NONE = 0;
    CURL_TIMECOND_IFMODSINCE = 1;
    CURL_TIMECOND_IFUNMODSINCE = 2;
    CURL_TIMECOND_LASTMOD = 3;
    CURL_TIMECOND_LAST = 4;
;
{ Special size_t value signaling a null-terminated string.  }

{ was #define dname def_expr }
function CURL_ZERO_TERMINATED : Tsize_t;  

{ curl_strequal() and curl_strnequal() are subject for removal in a future
   release  }
(* Const before type ignored *)
(* Const before type ignored *)
function curl_strequal(s1:Pchar; s2:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function curl_strnequal(s1:Pchar; s2:Pchar; n:Tsize_t):longint;cdecl;external;
{ Mime/form handling support.  }
type
{ Mime context.  }
{ Mime part context.  }
{ CURLMIMEOPT_ defines are for the CURLOPT_MIME_OPTIONS option.  }
{ Use backslash-escaping for forms.  }

const
  CURLMIMEOPT_FORMESCAPE = 1 shl 0;  
{
 * NAME curl_mime_init()
 *
 * DESCRIPTION
 *
 * Create a mime context and return its handle. The easy parameter is the
 * target handle.
  }

function curl_mime_init(easy:PCURL):Pcurl_mime;cdecl;external;
{
 * NAME curl_mime_free()
 *
 * DESCRIPTION
 *
 * release a mime handle and its substructures.
  }
procedure curl_mime_free(mime:Pcurl_mime);cdecl;external;
{
 * NAME curl_mime_addpart()
 *
 * DESCRIPTION
 *
 * Append a new empty part to the given mime context and return a handle to
 * the created part.
  }
function curl_mime_addpart(mime:Pcurl_mime):Pcurl_mimepart;cdecl;external;
{
 * NAME curl_mime_name()
 *
 * DESCRIPTION
 *
 * Set mime/form part name.
  }
(* Const before type ignored *)
function curl_mime_name(part:Pcurl_mimepart; name:Pchar):TCURLcode;cdecl;external;
{
 * NAME curl_mime_filename()
 *
 * DESCRIPTION
 *
 * Set mime part remote file name.
  }
(* Const before type ignored *)
function curl_mime_filename(part:Pcurl_mimepart; filename:Pchar):TCURLcode;cdecl;external;
{
 * NAME curl_mime_type()
 *
 * DESCRIPTION
 *
 * Set mime part type.
  }
(* Const before type ignored *)
function curl_mime_type(part:Pcurl_mimepart; mimetype:Pchar):TCURLcode;cdecl;external;
{
 * NAME curl_mime_encoder()
 *
 * DESCRIPTION
 *
 * Set mime data transfer encoder.
  }
(* Const before type ignored *)
function curl_mime_encoder(part:Pcurl_mimepart; encoding:Pchar):TCURLcode;cdecl;external;
{
 * NAME curl_mime_data()
 *
 * DESCRIPTION
 *
 * Set mime part data source from memory data,
  }
(* Const before type ignored *)
function curl_mime_data(part:Pcurl_mimepart; data:Pchar; datasize:Tsize_t):TCURLcode;cdecl;external;
{
 * NAME curl_mime_filedata()
 *
 * DESCRIPTION
 *
 * Set mime part data source from named file.
  }
(* Const before type ignored *)
function curl_mime_filedata(part:Pcurl_mimepart; filename:Pchar):TCURLcode;cdecl;external;
{
 * NAME curl_mime_data_cb()
 *
 * DESCRIPTION
 *
 * Set mime part data source from callback function.
  }
function curl_mime_data_cb(part:Pcurl_mimepart; datasize:Tcurl_off_t; readfunc:Tcurl_read_callback; seekfunc:Tcurl_seek_callback; freefunc:Tcurl_free_callback; 
           arg:pointer):TCURLcode;cdecl;external;
{
 * NAME curl_mime_subparts()
 *
 * DESCRIPTION
 *
 * Set mime part data source from subparts.
  }
function curl_mime_subparts(part:Pcurl_mimepart; subparts:Pcurl_mime):TCURLcode;cdecl;external;
{
 * NAME curl_mime_headers()
 *
 * DESCRIPTION
 *
 * Set mime part headers.
  }
function curl_mime_headers(part:Pcurl_mimepart; headers:Pcurl_slist; take_ownership:longint):TCURLcode;cdecl;external;
{******** the first one is unused *********** }
{ the last unused  }
type
  Pxxxxxxxxx = ^Txxxxxxxxx;
  Txxxxxxxxx =  Longint;
  Const
    CURLFORM_NOTHING = 0;
    CURLFORM_COPYNAME = 1;
    CURLFORM_PTRNAME = 2;
    CURLFORM_NAMELENGTH = 3;
    CURLFORM_COPYCONTENTS = 4;
    CURLFORM_PTRCONTENTS = 5;
    CURLFORM_CONTENTSLENGTH = 6;
    CURLFORM_FILECONTENT = 7;
    CURLFORM_ARRAY = 8;
    CURLFORM_OBSOLETE = 9;
    CURLFORM_FILE = 10;
    CURLFORM_BUFFER = 11;
    CURLFORM_BUFFERPTR = 12;
    CURLFORM_BUFFERLENGTH = 13;
    CURLFORM_CONTENTTYPE = 14;
    CURLFORM_CONTENTHEADER = 15;
    CURLFORM_FILENAME = 16;
    CURLFORM_END = 17;
    CURLFORM_OBSOLETE2 = 18;
    CURLFORM_STREAM = 19;
    CURLFORM_CONTENTLEN = 20;
    CURLFORM_LASTENTRY = 21;
;
  TCURLformoption = Txxxxxxxxx;
  PCURLformoption = ^TCURLformoption;
{ structure to be used as parameter for CURLFORM_ARRAY  }
(* Const before type ignored *)
type
  Pcurl_forms = ^Tcurl_forms;
  Tcurl_forms = record
      option : TCURLformoption;
      value : Pchar;
    end;

{ use this for multipart formpost building  }
{ Returns code for curl_formadd()
 *
 * Returns:
 * CURL_FORMADD_OK             on success
 * CURL_FORMADD_MEMORY         if the FormInfo allocation fails
 * CURL_FORMADD_OPTION_TWICE   if one option is given twice for one Form
 * CURL_FORMADD_NULL           if a null pointer was given for a char
 * CURL_FORMADD_MEMORY         if the allocation of a FormInfo struct failed
 * CURL_FORMADD_UNKNOWN_OPTION if an unknown option was used
 * CURL_FORMADD_INCOMPLETE     if the some FormInfo is not complete (or error)
 * CURL_FORMADD_MEMORY         if a curl_httppost struct cannot be allocated
 * CURL_FORMADD_MEMORY         if some allocation for string copying failed.
 * CURL_FORMADD_ILLEGAL_ARRAY  if an illegal option is used in an array
 *
 ************************************************************************** }
{ libcurl was built with form api disabled  }
{ last  }

  PCURLFORMcode = ^TCURLFORMcode;
  TCURLFORMcode =  Longint;
  Const
    CURL_FORMADD_OK = 0;
    CURL_FORMADD_MEMORY = 1;
    CURL_FORMADD_OPTION_TWICE = 2;
    CURL_FORMADD_NULL = 3;
    CURL_FORMADD_UNKNOWN_OPTION = 4;
    CURL_FORMADD_INCOMPLETE = 5;
    CURL_FORMADD_ILLEGAL_ARRAY = 6;
    CURL_FORMADD_DISABLED = 7;
    CURL_FORMADD_LAST = 8;
;
{
 * NAME curl_formadd()
 *
 * DESCRIPTION
 *
 * Pretty advanced function for building multi-part formposts. Each invoke
 * adds one part that together construct a full post. Then use
 * CURLOPT_HTTPPOST to send it off to libcurl.
  }
{CURL_DEPRECATED(7.56.0, "Use curl_mime_init()") }

function curl_formadd(httppost:PPcurl_httppost; last_post:PPcurl_httppost; args:array of const):TCURLFORMcode;cdecl;external;
function curl_formadd(httppost:PPcurl_httppost; last_post:PPcurl_httppost):TCURLFORMcode;cdecl;external;
{
 * callback function for curl_formget()
 * The void *arg pointer will be the one passed as second argument to
 *   curl_formget().
 * The character buffer passed to it must not be freed.
 * Should return the buffer length passed to it as the argument "len" on
 *   success.
  }
(* Const before type ignored *)
type

  Tcurl_formget_callback = function (arg:pointer; buf:Pchar; len:Tsize_t):Tsize_t;cdecl;
{
 * NAME curl_formget()
 *
 * DESCRIPTION
 *
 * Serialize a curl_httppost struct built with curl_formadd().
 * Accepts a void pointer as second argument which will be passed to
 * the curl_formget_callback function.
 * Returns 0 on success.
  }
{CURL_DEPRECATED(7.56.0, "") }

function curl_formget(form:Pcurl_httppost; arg:pointer; append:Tcurl_formget_callback):longint;cdecl;external;
{
 * NAME curl_formfree()
 *
 * DESCRIPTION
 *
 * Free a multipart formpost previously built with curl_formadd().
  }
{CURL_DEPRECATED(7.56.0, "Use curl_mime_free()") }
procedure curl_formfree(form:Pcurl_httppost);cdecl;external;
{
 * NAME curl_getenv()
 *
 * DESCRIPTION
 *
 * Returns a malloc()'ed string that MUST be curl_free()ed after usage is
 * complete. DEPRECATED - see lib/README.curlx
  }
(* Const before type ignored *)
function curl_getenv(variable:Pchar):Pchar;cdecl;external;
{
 * NAME curl_version()
 *
 * DESCRIPTION
 *
 * Returns a static ascii string of the libcurl version.
  }
function curl_version:Pchar;cdecl;external;
{
 * NAME curl_easy_escape()
 *
 * DESCRIPTION
 *
 * Escapes URL strings (converts all letters consider illegal in URLs to their
 * %XX versions). This function returns a new allocated string or NULL if an
 * error occurred.
  }
(* Const before type ignored *)
function curl_easy_escape(handle:PCURL; _string:Pchar; length:longint):Pchar;cdecl;external;
{ the previous version:  }
(* Const before type ignored *)
function curl_escape(_string:Pchar; length:longint):Pchar;cdecl;external;
{
 * NAME curl_easy_unescape()
 *
 * DESCRIPTION
 *
 * Unescapes URL encoding in strings (converts all %XX codes to their 8bit
 * versions). This function returns a new allocated string or NULL if an error
 * occurred.
 * Conversion Note: On non-ASCII platforms the ASCII %XX codes are
 * converted into the host encoding.
  }
(* Const before type ignored *)
function curl_easy_unescape(handle:PCURL; _string:Pchar; length:longint; outlength:Plongint):Pchar;cdecl;external;
{ the previous version  }
(* Const before type ignored *)
function curl_unescape(_string:Pchar; length:longint):Pchar;cdecl;external;
{
 * NAME curl_free()
 *
 * DESCRIPTION
 *
 * Provided for de-allocation in the same translation unit that did the
 * allocation. Added in libcurl 7.10
  }
procedure curl_free(p:pointer);cdecl;external;
{
 * NAME curl_global_init()
 *
 * DESCRIPTION
 *
 * curl_global_init() should be invoked exactly once for each application that
 * uses libcurl and before any call of other libcurl functions.

 * This function is thread-safe if CURL_VERSION_THREADSAFE is set in the
 * curl_version_info_data.features flag (fetch by curl_version_info()).

  }
function curl_global_init(flags:longint):TCURLcode;cdecl;external;
{
 * NAME curl_global_init_mem()
 *
 * DESCRIPTION
 *
 * curl_global_init() or curl_global_init_mem() should be invoked exactly once
 * for each application that uses libcurl.  This function can be used to
 * initialize libcurl and set user defined memory management callback
 * functions.  Users can implement memory management routines to check for
 * memory leaks, check for mis-use of the curl library etc.  User registered
 * callback routines will be invoked by this library instead of the system
 * memory management routines like malloc, free etc.
  }
function curl_global_init_mem(flags:longint; m:Tcurl_malloc_callback; f:Tcurl_free_callback; r:Tcurl_realloc_callback; s:Tcurl_strdup_callback; 
           c:Tcurl_calloc_callback):TCURLcode;cdecl;external;
{
 * NAME curl_global_cleanup()
 *
 * DESCRIPTION
 *
 * curl_global_cleanup() should be invoked exactly once for each application
 * that uses libcurl
  }
procedure curl_global_cleanup;cdecl;external;
{
 * NAME curl_global_trace()
 *
 * DESCRIPTION
 *
 * curl_global_trace() can be invoked at application start to
 * configure which components in curl should participate in tracing.

 * This function is thread-safe if CURL_VERSION_THREADSAFE is set in the
 * curl_version_info_data.features flag (fetch by curl_version_info()).

  }
(* Const before type ignored *)
function curl_global_trace(config:Pchar):TCURLcode;cdecl;external;
{ linked-list structure for the CURLOPT_QUOTE option (and other)  }
type
  Pcurl_slist = ^Tcurl_slist;
  Tcurl_slist = record
      data : Pchar;cdecl;
      next : Pcurl_slist;
    end;

{
 * NAME curl_global_sslset()
 *
 * DESCRIPTION
 *
 * When built with multiple SSL backends, curl_global_sslset() allows to
 * choose one. This function can only be called once, and it must be called
 * *before* curl_global_init().
 *
 * The backend can be identified by the id (e.g. CURLSSLBACKEND_OPENSSL). The
 * backend can also be specified via the name parameter (passing -1 as id).
 * If both id and name are specified, the name will be ignored. If neither id
 * nor name are specified, the function will fail with
 * CURLSSLSET_UNKNOWN_BACKEND and set the "avail" pointer to the
 * NULL-terminated list of available backends.
 *
 * Upon success, the function returns CURLSSLSET_OK.
 *
 * If the specified SSL backend is not available, the function returns
 * CURLSSLSET_UNKNOWN_BACKEND and sets the "avail" pointer to a NULL-terminated
 * list of available SSL backends.
 *
 * The SSL backend can be set only once. If it has already been set, a
 * subsequent attempt to change it will result in a CURLSSLSET_TOO_LATE.
  }
(* Const before type ignored *)
  Pcurl_ssl_backend = ^Tcurl_ssl_backend;
  Tcurl_ssl_backend = record
      id : Tcurl_sslbackend;
      name : Pchar;
    end;

{ libcurl was built without any SSL support  }

  PCURLsslset = ^TCURLsslset;
  TCURLsslset =  Longint;
  Const
    CURLSSLSET_OK = 0;
    CURLSSLSET_UNKNOWN_BACKEND = 1;
    CURLSSLSET_TOO_LATE = 2;
    CURLSSLSET_NO_BACKENDS = 3;
;
(* Const before type ignored *)
(* Const before type ignored *)

function curl_global_sslset(id:Tcurl_sslbackend; name:Pchar; avail:PPPcurl_ssl_backend):TCURLsslset;cdecl;external;
{
 * NAME curl_slist_append()
 *
 * DESCRIPTION
 *
 * Appends a string to a linked list. If no list exists, it will be created
 * first. Returns the new list, after appending.
  }
(* Const before type ignored *)
function curl_slist_append(list:Pcurl_slist; data:Pchar):Pcurl_slist;cdecl;external;
{
 * NAME curl_slist_free_all()
 *
 * DESCRIPTION
 *
 * free a previously built curl_slist.
  }
procedure curl_slist_free_all(list:Pcurl_slist);cdecl;external;
{
 * NAME curl_getdate()
 *
 * DESCRIPTION
 *
 * Returns the time, in seconds since 1 Jan 1970 of the time string given in
 * the first argument. The time argument in the second parameter is unused
 * and should be set to NULL.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function curl_getdate(p:Pchar; unused:Ptime_t):Ttime_t;cdecl;external;
{ info about the certificate chain, for SSL backends that support it. Asked
   for with CURLOPT_CERTINFO / CURLINFO_CERTINFO  }
{ number of certificates with information  }
{ for each index in this array, there's a
                                   linked list with textual information for a
                                   certificate in the format "name:content".
                                   eg "Subject:foo", "Issuer:bar", etc.  }
type
  Pcurl_certinfo = ^Tcurl_certinfo;
  Tcurl_certinfo = record
      num_of_certs : longint;
      certinfo : ^Pcurl_slist;
    end;

{ Information about the SSL library used and the respective internal SSL
   handle, which can be used to obtain further information regarding the
   connection. Asked for with CURLINFO_TLS_SSL_PTR or CURLINFO_TLS_SESSION.  }
  Pcurl_tlssessioninfo = ^Tcurl_tlssessioninfo;
  Tcurl_tlssessioninfo = record
      backend : Tcurl_sslbackend;
      internals : pointer;
    end;


const
  CURLINFO_STRING = $100000;  
  CURLINFO_LONG = $200000;  
  CURLINFO_DOUBLE = $300000;  
  CURLINFO_SLIST = $400000;  
{ same as SLIST  }
  CURLINFO_PTR = $400000;  
  CURLINFO_SOCKET = $500000;  
  CURLINFO_OFF_T = $600000;  
  CURLINFO_MASK = $0fffff;  
  CURLINFO_TYPEMASK = $f00000;  
{ first, never use this  }
type
  PCURLINFO = ^TCURLINFO;
  TCURLINFO =  Longint;
  Const
    CURLINFO_NONE = 0;
    CURLINFO_EFFECTIVE_URL = CURLINFO_STRING+1;
    CURLINFO_RESPONSE_CODE = CURLINFO_LONG+2;
    CURLINFO_TOTAL_TIME = CURLINFO_DOUBLE+3;
    CURLINFO_NAMELOOKUP_TIME = CURLINFO_DOUBLE+4;
    CURLINFO_CONNECT_TIME = CURLINFO_DOUBLE+5;
    CURLINFO_PRETRANSFER_TIME = CURLINFO_DOUBLE+6;
    CURLINFO_SIZE_UPLOAD = CURLINFO_DOUBLE+7;
    CURLINFO_SIZE_UPLOAD_T = CURLINFO_OFF_T+7;
    CURLINFO_SIZE_DOWNLOAD = CURLINFO_DOUBLE+8;
    CURLINFO_SIZE_DOWNLOAD_T = CURLINFO_OFF_T+8;
    CURLINFO_SPEED_DOWNLOAD = CURLINFO_DOUBLE+9;
    CURLINFO_SPEED_DOWNLOAD_T = CURLINFO_OFF_T+9;
    CURLINFO_SPEED_UPLOAD = CURLINFO_DOUBLE+10;
    CURLINFO_SPEED_UPLOAD_T = CURLINFO_OFF_T+10;
    CURLINFO_HEADER_SIZE = CURLINFO_LONG+11;
    CURLINFO_REQUEST_SIZE = CURLINFO_LONG+12;
    CURLINFO_SSL_VERIFYRESULT = CURLINFO_LONG+13;
    CURLINFO_FILETIME = CURLINFO_LONG+14;
    CURLINFO_FILETIME_T = CURLINFO_OFF_T+14;
    CURLINFO_CONTENT_LENGTH_DOWNLOAD = CURLINFO_DOUBLE+15;
    CURLINFO_CONTENT_LENGTH_DOWNLOAD_T = CURLINFO_OFF_T+15;
    CURLINFO_CONTENT_LENGTH_UPLOAD = CURLINFO_DOUBLE+16;
    CURLINFO_CONTENT_LENGTH_UPLOAD_T = CURLINFO_OFF_T+16;
    CURLINFO_STARTTRANSFER_TIME = CURLINFO_DOUBLE+17;
    CURLINFO_CONTENT_TYPE = CURLINFO_STRING+18;
    CURLINFO_REDIRECT_TIME = CURLINFO_DOUBLE+19;
    CURLINFO_REDIRECT_COUNT = CURLINFO_LONG+20;
    CURLINFO_PRIVATE = CURLINFO_STRING+21;
    CURLINFO_HTTP_CONNECTCODE = CURLINFO_LONG+22;
    CURLINFO_HTTPAUTH_AVAIL = CURLINFO_LONG+23;
    CURLINFO_PROXYAUTH_AVAIL = CURLINFO_LONG+24;
    CURLINFO_OS_ERRNO = CURLINFO_LONG+25;
    CURLINFO_NUM_CONNECTS = CURLINFO_LONG+26;
    CURLINFO_SSL_ENGINES = CURLINFO_SLIST+27;
    CURLINFO_COOKIELIST = CURLINFO_SLIST+28;
    CURLINFO_LASTSOCKET = CURLINFO_LONG+29;
    CURLINFO_FTP_ENTRY_PATH = CURLINFO_STRING+30;
    CURLINFO_REDIRECT_URL = CURLINFO_STRING+31;
    CURLINFO_PRIMARY_IP = CURLINFO_STRING+32;
    CURLINFO_APPCONNECT_TIME = CURLINFO_DOUBLE+33;
    CURLINFO_CERTINFO = CURLINFO_PTR+34;
    CURLINFO_CONDITION_UNMET = CURLINFO_LONG+35;
    CURLINFO_RTSP_SESSION_ID = CURLINFO_STRING+36;
    CURLINFO_RTSP_CLIENT_CSEQ = CURLINFO_LONG+37;
    CURLINFO_RTSP_SERVER_CSEQ = CURLINFO_LONG+38;
    CURLINFO_RTSP_CSEQ_RECV = CURLINFO_LONG+39;
    CURLINFO_PRIMARY_PORT = CURLINFO_LONG+40;
    CURLINFO_LOCAL_IP = CURLINFO_STRING+41;
    CURLINFO_LOCAL_PORT = CURLINFO_LONG+42;
    CURLINFO_TLS_SESSION = CURLINFO_PTR+43;
    CURLINFO_ACTIVESOCKET = CURLINFO_SOCKET+44;
    CURLINFO_TLS_SSL_PTR = CURLINFO_PTR+45;
    CURLINFO_HTTP_VERSION = CURLINFO_LONG+46;
    CURLINFO_PROXY_SSL_VERIFYRESULT = CURLINFO_LONG+47;
    CURLINFO_PROTOCOL = CURLINFO_LONG+48;
    CURLINFO_SCHEME = CURLINFO_STRING+49;
    CURLINFO_TOTAL_TIME_T = CURLINFO_OFF_T+50;
    CURLINFO_NAMELOOKUP_TIME_T = CURLINFO_OFF_T+51;
    CURLINFO_CONNECT_TIME_T = CURLINFO_OFF_T+52;
    CURLINFO_PRETRANSFER_TIME_T = CURLINFO_OFF_T+53;
    CURLINFO_STARTTRANSFER_TIME_T = CURLINFO_OFF_T+54;
    CURLINFO_REDIRECT_TIME_T = CURLINFO_OFF_T+55;
    CURLINFO_APPCONNECT_TIME_T = CURLINFO_OFF_T+56;
    CURLINFO_RETRY_AFTER = CURLINFO_OFF_T+57;
    CURLINFO_EFFECTIVE_METHOD = CURLINFO_STRING+58;
    CURLINFO_PROXY_ERROR = CURLINFO_LONG+59;
    CURLINFO_REFERER = CURLINFO_STRING+60;
    CURLINFO_CAINFO = CURLINFO_STRING+61;
    CURLINFO_CAPATH = CURLINFO_STRING+62;
    CURLINFO_XFER_ID = CURLINFO_OFF_T+63;
    CURLINFO_CONN_ID = CURLINFO_OFF_T+64;
    CURLINFO_LASTONE = 64;
;
{ CURLINFO_RESPONSE_CODE is the new name for the option previously known as
   CURLINFO_HTTP_CODE  }
  CURLINFO_HTTP_CODE = CURLINFO_RESPONSE_CODE;  
{ first, never use this  }
{ last, never use this  }
type
  Pcurl_closepolicy = ^Tcurl_closepolicy;
  Tcurl_closepolicy =  Longint;
  Const
    CURLCLOSEPOLICY_NONE = 0;
    CURLCLOSEPOLICY_OLDEST = 1;
    CURLCLOSEPOLICY_LEAST_RECENTLY_USED = 2;
    CURLCLOSEPOLICY_LEAST_TRAFFIC = 3;
    CURLCLOSEPOLICY_SLOWEST = 4;
    CURLCLOSEPOLICY_CALLBACK = 5;
    CURLCLOSEPOLICY_LAST = 6;
;
{ no purpose since 7.57.0  }
  CURL_GLOBAL_SSL = 1 shl 0;  
  CURL_GLOBAL_WIN32 = 1 shl 1;  
  CURL_GLOBAL_ALL = CURL_GLOBAL_SSL or CURL_GLOBAL_WIN32;  
  CURL_GLOBAL_NOTHING = 0;  
  CURL_GLOBAL_DEFAULT = CURL_GLOBAL_ALL;  
  CURL_GLOBAL_ACK_EINTR = 1 shl 2;  
{****************************************************************************
 * Setup defines, protos etc for the sharing stuff.
  }
{ Different data locks for a single share  }
{  CURL_LOCK_DATA_SHARE is used internally to say that
   *  the locking is just made to change the internal state of the share
   *  itself.
    }
type
  Pcurl_lock_data = ^Tcurl_lock_data;
  Tcurl_lock_data =  Longint;
  Const
    CURL_LOCK_DATA_NONE = 0;
    CURL_LOCK_DATA_SHARE = 1;
    CURL_LOCK_DATA_COOKIE = 2;
    CURL_LOCK_DATA_DNS = 3;
    CURL_LOCK_DATA_SSL_SESSION = 4;
    CURL_LOCK_DATA_CONNECT = 5;
    CURL_LOCK_DATA_PSL = 6;
    CURL_LOCK_DATA_HSTS = 7;
    CURL_LOCK_DATA_LAST = 8;
;
{ Different lock access types  }
{ unspecified action  }
{ for read perhaps  }
{ for write perhaps  }
{ never use  }
type
  Pcurl_lock_access = ^Tcurl_lock_access;
  Tcurl_lock_access =  Longint;
  Const
    CURL_LOCK_ACCESS_NONE = 0;
    CURL_LOCK_ACCESS_SHARED = 1;
    CURL_LOCK_ACCESS_SINGLE = 2;
    CURL_LOCK_ACCESS_LAST = 3;
;
type

  Tcurl_lock_function = procedure (handle:PCURL; data:Tcurl_lock_data; locktype:Tcurl_lock_access; userptr:pointer);cdecl;

  Tcurl_unlock_function = procedure (handle:PCURL; data:Tcurl_lock_data; userptr:pointer);cdecl;
{ all is fine  }
{ 1  }
{ 2  }
{ 3  }
{ 4 out of memory  }
{ 5 feature not present in lib  }
{ never use  }

  PCURLSHcode = ^TCURLSHcode;
  TCURLSHcode =  Longint;
  Const
    CURLSHE_OK = 0;
    CURLSHE_BAD_OPTION = 1;
    CURLSHE_IN_USE = 2;
    CURLSHE_INVALID = 3;
    CURLSHE_NOMEM = 4;
    CURLSHE_NOT_BUILT_IN = 5;
    CURLSHE_LAST = 6;
;
{ don't use  }
{ specify a data type to share  }
{ specify which data type to stop sharing  }
{ pass in a 'curl_lock_function' pointer  }
{ pass in a 'curl_unlock_function' pointer  }
{ pass in a user data pointer used in the lock/unlock
                           callback functions  }
{ never use  }
type
  PCURLSHoption = ^TCURLSHoption;
  TCURLSHoption =  Longint;
  Const
    CURLSHOPT_NONE = 0;
    CURLSHOPT_SHARE = 1;
    CURLSHOPT_UNSHARE = 2;
    CURLSHOPT_LOCKFUNC = 3;
    CURLSHOPT_UNLOCKFUNC = 4;
    CURLSHOPT_USERDATA = 5;
    CURLSHOPT_LAST = 6;
;

function curl_share_init:PCURLSH;cdecl;external;
function curl_share_setopt(share:PCURLSH; option:TCURLSHoption; args:array of const):TCURLSHcode;cdecl;external;
function curl_share_setopt(share:PCURLSH; option:TCURLSHoption):TCURLSHcode;cdecl;external;
function curl_share_cleanup(share:PCURLSH):TCURLSHcode;cdecl;external;
{***************************************************************************
 * Structures for querying information about the curl library at runtime.
  }
{ never actually use this  }
type
  PCURLversion = ^TCURLversion;
  TCURLversion =  Longint;
  Const
    CURLVERSION_FIRST = 0;
    CURLVERSION_SECOND = 1;
    CURLVERSION_THIRD = 2;
    CURLVERSION_FOURTH = 3;
    CURLVERSION_FIFTH = 4;
    CURLVERSION_SIXTH = 5;
    CURLVERSION_SEVENTH = 6;
    CURLVERSION_EIGHTH = 7;
    CURLVERSION_NINTH = 8;
    CURLVERSION_TENTH = 9;
    CURLVERSION_ELEVENTH = 10;
    CURLVERSION_LAST = 11;
;
{ The 'CURLVERSION_NOW' is the symbolic name meant to be used by
   basically all programs ever that want to get version information. It is
   meant to be a built-in version number for what kind of struct the caller
   expects. If the struct ever changes, we redefine the NOW to another enum
   from above.  }
  CURLVERSION_NOW = CURLVERSION_ELEVENTH;  
{ age of the returned struct  }
(* Const before type ignored *)
{ LIBCURL_VERSION  }
{ LIBCURL_VERSION_NUM  }
(* Const before type ignored *)
{ OS/host/cpu/machine when configured  }
{ bitmask, see defines below  }
(* Const before type ignored *)
{ human readable string  }
{ not used anymore, always 0  }
(* Const before type ignored *)
{ human readable string  }
{ protocols is terminated by an entry with a NULL protoname  }
(* Const before type ignored *)
(* Const before declarator ignored *)
{ The fields below this were added in CURLVERSION_SECOND  }
(* Const before type ignored *)
{ This field was added in CURLVERSION_THIRD  }
(* Const before type ignored *)
{ These field were added in CURLVERSION_FOURTH  }
{ Same as '_libiconv_version' if built with HAVE_ICONV  }
(* Const before type ignored *)
{ human readable string  }
{ These fields were added in CURLVERSION_FIFTH  }
{ Numeric Brotli version
                                  (MAJOR << 24) | (MINOR << 12) | PATCH  }
(* Const before type ignored *)
{ human readable string.  }
{ These fields were added in CURLVERSION_SIXTH  }
{ Numeric nghttp2 version
                                   (MAJOR << 16) | (MINOR << 8) | PATCH  }
(* Const before type ignored *)
{ human readable string.  }
(* Const before type ignored *)
{ human readable quic (+ HTTP/3) library +
                                  version or NULL  }
{ These fields were added in CURLVERSION_SEVENTH  }
(* Const before type ignored *)
{ the built-in default CURLOPT_CAINFO, might
                                  be NULL  }
(* Const before type ignored *)
{ the built-in default CURLOPT_CAPATH, might
                                  be NULL  }
{ These fields were added in CURLVERSION_EIGHTH  }
{ Numeric Zstd version
                                  (MAJOR << 24) | (MINOR << 12) | PATCH  }
(* Const before type ignored *)
{ human readable string.  }
{ These fields were added in CURLVERSION_NINTH  }
(* Const before type ignored *)
{ human readable string.  }
{ These fields were added in CURLVERSION_TENTH  }
(* Const before type ignored *)
{ human readable string.  }
{ These fields were added in CURLVERSION_ELEVENTH  }
{ feature_names is terminated by an entry with a NULL feature name  }
(* Const before type ignored *)
(* Const before declarator ignored *)
type
  Pcurl_version_info_data = ^Tcurl_version_info_data;
  Tcurl_version_info_data = record
      age : TCURLversion;
      version : Pchar;
      version_num : dword;
      host : Pchar;
      features : longint;
      ssl_version : Pchar;
      ssl_version_num : longint;
      libz_version : Pchar;
      protocols : ^Pchar;
      ares : Pchar;
      ares_num : longint;
      libidn : Pchar;
      iconv_ver_num : longint;
      libssh_version : Pchar;
      brotli_ver_num : dword;
      brotli_version : Pchar;
      nghttp2_ver_num : dword;
      nghttp2_version : Pchar;
      quic_version : Pchar;
      cainfo : Pchar;
      capath : Pchar;
      zstd_ver_num : dword;
      zstd_version : Pchar;
      hyper_version : Pchar;
      gsasl_version : Pchar;
      feature_names : ^Pchar;
    end;

{ IPv6-enabled  }

const
  CURL_VERSION_IPV6 = 1 shl 0;  
{ Kerberos V4 auth is supported
                                             (deprecated)  }
  CURL_VERSION_KERBEROS4 = 1 shl 1;  
{ SSL options are present  }
  CURL_VERSION_SSL = 1 shl 2;  
{ libz features are present  }
  CURL_VERSION_LIBZ = 1 shl 3;  
{ NTLM auth is supported  }
  CURL_VERSION_NTLM = 1 shl 4;  
{ Negotiate auth is supported
                                             (deprecated)  }
  CURL_VERSION_GSSNEGOTIATE = 1 shl 5;  
{ Built with debug capabilities  }
  CURL_VERSION_DEBUG = 1 shl 6;  
{ Asynchronous DNS resolves  }
  CURL_VERSION_ASYNCHDNS = 1 shl 7;  
{ SPNEGO auth is supported  }
  CURL_VERSION_SPNEGO = 1 shl 8;  
{ Supports files larger than 2GB  }
  CURL_VERSION_LARGEFILE = 1 shl 9;  
{ Internationized Domain Names are
                                             supported  }
  CURL_VERSION_IDN = 1 shl 10;  
{ Built against Windows SSPI  }
  CURL_VERSION_SSPI = 1 shl 11;  
{ Character conversions supported  }
  CURL_VERSION_CONV = 1 shl 12;  
{ Debug memory tracking supported  }
  CURL_VERSION_CURLDEBUG = 1 shl 13;  
{ TLS-SRP auth is supported  }
  CURL_VERSION_TLSAUTH_SRP = 1 shl 14;  
{ NTLM delegation to winbind helper
                                             is supported  }
  CURL_VERSION_NTLM_WB = 1 shl 15;  
{ HTTP2 support built-in  }
  CURL_VERSION_HTTP2 = 1 shl 16;  
{ Built against a GSS-API library  }
  CURL_VERSION_GSSAPI = 1 shl 17;  
{ Kerberos V5 auth is supported  }
  CURL_VERSION_KERBEROS5 = 1 shl 18;  
{ Unix domain sockets support  }
  CURL_VERSION_UNIX_SOCKETS = 1 shl 19;  
{ Mozilla's Public Suffix List, used
                                             for cookie domain verification  }
  CURL_VERSION_PSL = 1 shl 20;  
{ HTTPS-proxy support built-in  }
  CURL_VERSION_HTTPS_PROXY = 1 shl 21;  
{ Multiple SSL backends available  }
  CURL_VERSION_MULTI_SSL = 1 shl 22;  
{ Brotli features are present.  }
  CURL_VERSION_BROTLI = 1 shl 23;  
{ Alt-Svc handling built-in  }
  CURL_VERSION_ALTSVC = 1 shl 24;  
{ HTTP3 support built-in  }
  CURL_VERSION_HTTP3 = 1 shl 25;  
{ zstd features are present  }
  CURL_VERSION_ZSTD = 1 shl 26;  
{ Unicode support on Windows  }
  CURL_VERSION_UNICODE = 1 shl 27;  
{ HSTS is supported  }
  CURL_VERSION_HSTS = 1 shl 28;  
{ libgsasl is supported  }
  CURL_VERSION_GSASL = 1 shl 29;  
{ libcurl API is thread-safe  }
  CURL_VERSION_THREADSAFE = 1 shl 30;  
{
 * NAME curl_version_info()
 *
 * DESCRIPTION
 *
 * This function returns a pointer to a static copy of the version info
 * struct. See above.
  }

function curl_version_info(para1:TCURLversion):Pcurl_version_info_data;cdecl;external;
{
 * NAME curl_easy_strerror()
 *
 * DESCRIPTION
 *
 * The curl_easy_strerror function may be used to turn a CURLcode value
 * into the equivalent human readable error string.  This is useful
 * for printing meaningful error messages.
  }
(* Const before type ignored *)
function curl_easy_strerror(para1:TCURLcode):Pchar;cdecl;external;
{
 * NAME curl_share_strerror()
 *
 * DESCRIPTION
 *
 * The curl_share_strerror function may be used to turn a CURLSHcode value
 * into the equivalent human readable error string.  This is useful
 * for printing meaningful error messages.
  }
(* Const before type ignored *)
function curl_share_strerror(para1:TCURLSHcode):Pchar;cdecl;external;
{
 * NAME curl_easy_pause()
 *
 * DESCRIPTION
 *
 * The curl_easy_pause function pauses or unpauses transfers. Select the new
 * state by setting the bitmask, use the convenience defines below.
 *
  }
function curl_easy_pause(handle:PCURL; bitmask:longint):TCURLcode;cdecl;external;
const
  CURLPAUSE_RECV = 1 shl 0;  
  CURLPAUSE_RECV_CONT = 0;  
  CURLPAUSE_SEND = 1 shl 2;  
  CURLPAUSE_SEND_CONT = 0;  
  CURLPAUSE_ALL = CURLPAUSE_RECV or CURLPAUSE_SEND;  
  CURLPAUSE_CONT = CURLPAUSE_RECV_CONT or CURLPAUSE_SEND_CONT;  
{ unfortunately, the easy.h and multi.h include files need options and info
  stuff before they can be included!  }
{$include "easy.h" /* nothing in curl is fun without the easy stuff */}
{$include "multi.h"}
{$include "urlapi.h"}
{$include "options.h"}
{$include "header.h"}
{$include "websockets.h"}
{$include "mprintf.h"}
{$else}
{$if defined(__STDC__) && (__STDC__ >= 1)}
{ This preprocessor magic that replaces a call with the exact same call is
   only done to make sure application authors pass exactly three arguments
   to these functions.  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function curl_easy_setopt(handle,opt,param : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_easy_getinfo(handle,info,arg : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_share_setopt(share,opt,param : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_multi_setopt(handle,opt,param : longint) : longint;

{$endif}
{ gcc >= 4.3 && !__cplusplus && !CURL_DISABLE_TYPECHECK  }
{$endif}
{ CURLINC_CURL_H  }

implementation

{ was #define dname def_expr }
function CURLAUTH_NONE : dword;
  begin
    CURLAUTH_NONE:=dword(0);
  end;

{ was #define dname def_expr }
function CURLAUTH_BASIC : longint; { return type might be wrong }
  begin
    CURLAUTH_BASIC:=(dword(1)) shl 0;
  end;

{ was #define dname def_expr }
function CURLAUTH_DIGEST : longint; { return type might be wrong }
  begin
    CURLAUTH_DIGEST:=(dword(1)) shl 1;
  end;

{ was #define dname def_expr }
function CURLAUTH_NEGOTIATE : longint; { return type might be wrong }
  begin
    CURLAUTH_NEGOTIATE:=(dword(1)) shl 2;
  end;

{ was #define dname def_expr }
function CURLAUTH_NTLM : longint; { return type might be wrong }
  begin
    CURLAUTH_NTLM:=(dword(1)) shl 3;
  end;

{ was #define dname def_expr }
function CURLAUTH_DIGEST_IE : longint; { return type might be wrong }
  begin
    CURLAUTH_DIGEST_IE:=(dword(1)) shl 4;
  end;

{ was #define dname def_expr }
function CURLAUTH_NTLM_WB : longint; { return type might be wrong }
  begin
    CURLAUTH_NTLM_WB:=(dword(1)) shl 5;
  end;

{ was #define dname def_expr }
function CURLAUTH_BEARER : longint; { return type might be wrong }
  begin
    CURLAUTH_BEARER:=(dword(1)) shl 6;
  end;

{ was #define dname def_expr }
function CURLAUTH_AWS_SIGV4 : longint; { return type might be wrong }
  begin
    CURLAUTH_AWS_SIGV4:=(dword(1)) shl 7;
  end;

{ was #define dname def_expr }
function CURLAUTH_ONLY : longint; { return type might be wrong }
  begin
    CURLAUTH_ONLY:=(dword(1)) shl 31;
  end;

function includeSubDomains(var a : Tcurl_hstsentry) : dword;
begin
  includeSubDomains:=(a.flag0 and bm_Tcurl_hstsentry_includeSubDomains) shr bp_Tcurl_hstsentry_includeSubDomains;
end;

procedure set_includeSubDomains(var a : Tcurl_hstsentry; __includeSubDomains : dword);
begin
  a.flag0:=a.flag0 or ((__includeSubDomains shl bp_Tcurl_hstsentry_includeSubDomains) and bm_Tcurl_hstsentry_includeSubDomains);
end;

{ was #define dname def_expr }
function CURLHSTS_ENABLE : longint;
  begin
    CURLHSTS_ENABLE:=longint(1 shl 0);
  end;

{ was #define dname def_expr }
function CURLHSTS_READONLYFILE : longint;
  begin
    CURLHSTS_READONLYFILE:=longint(1 shl 1);
  end;

{ was #define dname def_expr }
function CURL_ZERO_TERMINATED : Tsize_t;
  begin
    CURL_ZERO_TERMINATED:=Tsize_t(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_easy_setopt(handle,opt,param : longint) : longint;
begin
  curl_easy_setopt:=curl_easy_setopt(handle,opt,param);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_easy_getinfo(handle,info,arg : longint) : longint;
begin
  curl_easy_getinfo:=curl_easy_getinfo(handle,info,arg);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_share_setopt(share,opt,param : longint) : longint;
begin
  curl_share_setopt:=curl_share_setopt(share,opt,param);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function curl_multi_setopt(handle,opt,param : longint) : longint;
begin
  curl_multi_setopt:=curl_multi_setopt(handle,opt,param);
end;


end.
