
unit sftp;
interface

{
  Automatically converted by H2Pas 1.0.0 from sftp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sftp.h
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
Pgid_t  = ^gid_t;
Psftp_attributes  = ^sftp_attributes;
Psftp_attributes_struct  = ^sftp_attributes_struct;
Psftp_client_message  = ^sftp_client_message;
Psftp_client_message_struct  = ^sftp_client_message_struct;
Psftp_dir  = ^sftp_dir;
Psftp_dir_struct  = ^sftp_dir_struct;
Psftp_ext  = ^sftp_ext;
Psftp_ext_struct  = ^sftp_ext_struct;
Psftp_file  = ^sftp_file;
Psftp_file_struct  = ^sftp_file_struct;
Psftp_message  = ^sftp_message;
Psftp_message_struct  = ^sftp_message_struct;
Psftp_packet  = ^sftp_packet;
Psftp_packet_struct  = ^sftp_packet_struct;
Psftp_request_queue  = ^sftp_request_queue;
Psftp_request_queue_struct  = ^sftp_request_queue_struct;
Psftp_session  = ^sftp_session;
Psftp_session_struct  = ^sftp_session_struct;
Psftp_status_message  = ^sftp_status_message;
Psftp_status_message_struct  = ^sftp_status_message_struct;
Psftp_statvfs_struct  = ^sftp_statvfs_struct;
Psftp_statvfs_t  = ^sftp_statvfs_t;
Ptimeval  = ^timeval;
Puid_t  = ^uid_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of the SSH Library
 *
 * Copyright (c) 2003-2008 by Aris Adamantiadis
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{*
 * @defgroup libssh_sftp The libssh SFTP API
 *
 * @brief SFTP handling functions
 *
 * SFTP commands are channeled by the ssh sftp subsystem. Every packet is
 * sent/read using a sftp_packet type structure. Related to these packets,
 * most of the server answers are messages having an ID and a message
 * specific part. It is described by sftp_message when reading a message,
 * the sftp system puts it into the queue, so the process having asked for
 * it can fetch it, while continuing to read for other messages (it is
 * unspecified in which order messages may be sent back to the client
 *
 * @
  }
{$ifndef SFTP_H}
{$define SFTP_H}
{$include <sys/types.h>}
{$include "libssh.h"}
{ C++ extern C conditionnal removed }
{$ifdef _WIN32}
{$ifndef uid_t}
type
  Puid_t = ^Tuid_t;
  Tuid_t = Tuint32_t;
{$endif}
{ uid_t  }
{$ifndef gid_t}
type
  Pgid_t = ^Tgid_t;
  Tgid_t = Tuint32_t;
{$endif}
{ gid_t  }
{$ifdef _MSC_VER}
{$ifndef _SSIZE_T_DEFINED}
{$undef ssize_t}
{$include <BaseTsd.h>}
{   typedef _W64 SSIZE_T ssize_t; }
{$define _SSIZE_T_DEFINED}
{$endif}
{ _SSIZE_T_DEFINED  }
{$endif}
{ _MSC_VER  }
{$endif}
{ _WIN32  }

const
  LIBSFTP_VERSION = 3;  
type
  Psftp_attributes = ^Tsftp_attributes;
  Tsftp_attributes = Psftp_attributes_struct;

  Psftp_client_message = ^Tsftp_client_message;
  Tsftp_client_message = Psftp_client_message_struct;

  Psftp_dir = ^Tsftp_dir;
  Tsftp_dir = Psftp_dir_struct;

  Psftp_ext = ^Tsftp_ext;
  Tsftp_ext = Psftp_ext_struct;

  Psftp_file = ^Tsftp_file;
  Tsftp_file = Psftp_file_struct;

  Psftp_message = ^Tsftp_message;
  Tsftp_message = Psftp_message_struct;

  Psftp_packet = ^Tsftp_packet;
  Tsftp_packet = Psftp_packet_struct;

  Psftp_request_queue = ^Tsftp_request_queue;
  Tsftp_request_queue = Psftp_request_queue_struct;

  Psftp_session = ^Tsftp_session;
  Tsftp_session = Psftp_session_struct;

  Psftp_status_message = ^Tsftp_status_message;
  Tsftp_status_message = Psftp_status_message_struct;

  Psftp_statvfs_t = ^Tsftp_statvfs_t;
  Tsftp_statvfs_t = Psftp_statvfs_struct;
  Psftp_session_struct = ^Tsftp_session_struct;
  Tsftp_session_struct = record
      session : Tssh_session;
      channel : Tssh_channel;
      server_version : longint;
      client_version : longint;
      version : longint;
      queue : Tsftp_request_queue;
      id_counter : Tuint32_t;
      errnum : longint;
      handles : ^pointer;
      ext : Tsftp_ext;
      read_packet : Tsftp_packet;
    end;

  Psftp_packet_struct = ^Tsftp_packet_struct;
  Tsftp_packet_struct = record
      sftp : Tsftp_session;
      _type : Tuint8_t;
      payload : Tssh_buffer;
    end;

{ file handler  }
  Psftp_file_struct = ^Tsftp_file_struct;
  Tsftp_file_struct = record
      sftp : Tsftp_session;
      name : Pchar;
      offset : Tuint64_t;
      handle : Tssh_string;
      eof : longint;
      nonblocking : longint;
    end;

{ handle to directory  }
{ contains raw attributes from server which haven't been parsed  }
{ counts the number of following attributes structures into buffer  }
{ end of directory listing  }
  Psftp_dir_struct = ^Tsftp_dir_struct;
  Tsftp_dir_struct = record
      sftp : Tsftp_session;
      name : Pchar;
      handle : Tssh_string;
      buffer : Tssh_buffer;
      count : Tuint32_t;
      eof : longint;
    end;

  Psftp_message_struct = ^Tsftp_message_struct;
  Tsftp_message_struct = record
      sftp : Tsftp_session;
      packet_type : Tuint8_t;
      payload : Tssh_buffer;
      id : Tuint32_t;
    end;

{ this is a bunch of all data that could be into a message  }
{ can be "path"  }
{ used by sftp_reply_attrs  }
{ can be newpath of rename()  }
{ complete message in case of retransmission }
{ cstring version of data  }
{ for extended messages  }
  Psftp_client_message_struct = ^Tsftp_client_message_struct;
  Tsftp_client_message_struct = record
      sftp : Tsftp_session;
      _type : Tuint8_t;
      id : Tuint32_t;
      filename : Pchar;
      flags : Tuint32_t;
      attr : Tsftp_attributes;
      handle : Tssh_string;
      offset : Tuint64_t;
      len : Tuint32_t;
      attr_num : longint;
      attrbuf : Tssh_buffer;
      data : Tssh_string;
      complete_message : Tssh_buffer;
      str_data : Pchar;
      submessage : Pchar;
    end;

  Psftp_request_queue_struct = ^Tsftp_request_queue_struct;
  Tsftp_request_queue_struct = record
      next : Tsftp_request_queue;
      message : Tsftp_message;
    end;

{ SSH_FXP_MESSAGE described into .7 page 26  }
{ not used anymore  }
{ not used anymore  }
  Psftp_status_message_struct = ^Tsftp_status_message_struct;
  Tsftp_status_message_struct = record
      id : Tuint32_t;
      status : Tuint32_t;
      error_unused : Tssh_string;
      lang_unused : Tssh_string;
      errormsg : Pchar;
      langmsg : Pchar;
    end;

{ ls -l output on openssh, not reliable else  }
{ set if openssh and version 4  }
{ set if openssh and version 4  }
  Psftp_attributes_struct = ^Tsftp_attributes_struct;
  Tsftp_attributes_struct = record
      name : Pchar;
      longname : Pchar;
      flags : Tuint32_t;
      _type : Tuint8_t;
      size : Tuint64_t;
      uid : Tuint32_t;
      gid : Tuint32_t;
      owner : Pchar;
      group : Pchar;
      permissions : Tuint32_t;
      atime64 : Tuint64_t;
      atime : Tuint32_t;
      atime_nseconds : Tuint32_t;
      createtime : Tuint64_t;
      createtime_nseconds : Tuint32_t;
      mtime64 : Tuint64_t;
      mtime : Tuint32_t;
      mtime_nseconds : Tuint32_t;
      acl : Tssh_string;
      extended_count : Tuint32_t;
      extended_type : Tssh_string;
      extended_data : Tssh_string;
    end;

{*
 * @brief SFTP statvfs structure.
  }
{* file system block size  }
{* fundamental fs block size  }
{* number of blocks (unit f_frsize)  }
{* free blocks in file system  }
{* free blocks for non-root  }
{* total file inodes  }
{* free file inodes  }
{* free file inodes for to non-root  }
{* file system id  }
{* bit mask of f_flag values  }
{* maximum filename length  }
  Psftp_statvfs_struct = ^Tsftp_statvfs_struct;
  Tsftp_statvfs_struct = record
      f_bsize : Tuint64_t;
      f_frsize : Tuint64_t;
      f_blocks : Tuint64_t;
      f_bfree : Tuint64_t;
      f_bavail : Tuint64_t;
      f_files : Tuint64_t;
      f_ffree : Tuint64_t;
      f_favail : Tuint64_t;
      f_fsid : Tuint64_t;
      f_flag : Tuint64_t;
      f_namemax : Tuint64_t;
    end;

{*
 * @brief Creates a new sftp session.
 *
 * This function creates a new sftp session and allocates a new sftp channel
 * with the server inside of the provided ssh session. This function call is
 * usually followed by the sftp_init(), which initializes SFTP protocol itself.
 *
 * @param session       The ssh session to use.
 *
 * @return              A new sftp session or NULL on error.
 *
 * @see sftp_free()
 * @see sftp_init()
  }

function sftp_new(session:Tssh_session):Tsftp_session;cdecl;external;
{*
 * @brief Start a new sftp session with an existing channel.
 *
 * @param session       The ssh session to use.
 * @param channel		An open session channel with subsystem already allocated
 *
 * @return              A new sftp session or NULL on error.
 *
 * @see sftp_free()
  }
function sftp_new_channel(session:Tssh_session; channel:Tssh_channel):Tsftp_session;cdecl;external;
{*
 * @brief Close and deallocate a sftp session.
 *
 * @param sftp          The sftp session handle to free.
  }
procedure sftp_free(sftp:Tsftp_session);cdecl;external;
{*
 * @brief Initialize the sftp protocol with the server.
 *
 * This function involves the SFTP protocol initialization (as described
 * in the SFTP specification), including the version and extensions negotiation.
 *
 * @param sftp          The sftp session to initialize.
 *
 * @return              0 on success, < 0 on error with ssh error set.
 *
 * @see sftp_new()
  }
function sftp_init(sftp:Tsftp_session):longint;cdecl;external;
{*
 * @brief Get the last sftp error.
 *
 * Use this function to get the latest error set by a posix like sftp function.
 *
 * @param sftp          The sftp session where the error is saved.
 *
 * @return              The saved error (see server responses), < 0 if an error
 *                      in the function occurred.
 *
 * @see Server responses
  }
function sftp_get_error(sftp:Tsftp_session):longint;cdecl;external;
{*
 * @brief Get the count of extensions provided by the server.
 *
 * @param  sftp         The sftp session to use.
 *
 * @return The count of extensions provided by the server, 0 on error or
 *         not available.
  }
function sftp_extensions_get_count(sftp:Tsftp_session):dword;cdecl;external;
{*
 * @brief Get the name of the extension provided by the server.
 *
 * @param  sftp         The sftp session to use.
 *
 * @param  indexn        The index number of the extension name you want.
 *
 * @return              The name of the extension.
  }
(* Const before type ignored *)
function sftp_extensions_get_name(sftp:Tsftp_session; indexn:dword):Pchar;cdecl;external;
{*
 * @brief Get the data of the extension provided by the server.
 *
 * This is normally the version number of the extension.
 *
 * @param  sftp         The sftp session to use.
 *
 * @param  indexn        The index number of the extension data you want.
 *
 * @return              The data of the extension.
  }
(* Const before type ignored *)
function sftp_extensions_get_data(sftp:Tsftp_session; indexn:dword):Pchar;cdecl;external;
{*
 * @brief Check if the given extension is supported.
 *
 * @param  sftp         The sftp session to use.
 *
 * @param  name         The name of the extension.
 *
 * @param  data         The data of the extension.
 *
 * @return 1 if supported, 0 if not.
 *
 * Example:
 *
 * @code
 * sftp_extension_supported(sftp, "statvfs@openssh.com", "2");
 * @endcode
  }
(* Const before type ignored *)
(* Const before type ignored *)
function sftp_extension_supported(sftp:Tsftp_session; name:Pchar; data:Pchar):longint;cdecl;external;
{*
 * @brief Open a directory used to obtain directory entries.
 *
 * @param session       The sftp session handle to open the directory.
 * @param path          The path of the directory to open.
 *
 * @return              A sftp directory handle or NULL on error with ssh and
 *                      sftp error set.
 *
 * @see                 sftp_readdir
 * @see                 sftp_closedir
  }
(* Const before type ignored *)
function sftp_opendir(session:Tsftp_session; path:Pchar):Tsftp_dir;cdecl;external;
{*
 * @brief Get a single file attributes structure of a directory.
 *
 * @param session      The sftp session handle to read the directory entry.
 * @param dir          The opened sftp directory handle to read from.
 *
 * @return             A file attribute structure or NULL at the end of the
 *                     directory.
 *
 * @see                sftp_opendir()
 * @see                sftp_attribute_free()
 * @see                sftp_closedir()
  }
function sftp_readdir(session:Tsftp_session; dir:Tsftp_dir):Tsftp_attributes;cdecl;external;
{*
 * @brief Tell if the directory has reached EOF (End Of File).
 *
 * @param dir           The sftp directory handle.
 *
 * @return              1 if the directory is EOF, 0 if not.
 *
 * @see                 sftp_readdir()
  }
function sftp_dir_eof(dir:Tsftp_dir):longint;cdecl;external;
{*
 * @brief Get information about a file or directory.
 *
 * @param session       The sftp session handle.
 * @param path          The path to the file or directory to obtain the
 *                      information.
 *
 * @return              The sftp attributes structure of the file or directory,
 *                      NULL on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_stat(session:Tsftp_session; path:Pchar):Tsftp_attributes;cdecl;external;
{*
 * @brief Get information about a file or directory.
 *
 * Identical to sftp_stat, but if the file or directory is a symbolic link,
 * then the link itself is stated, not the file that it refers to.
 *
 * @param session       The sftp session handle.
 * @param path          The path to the file or directory to obtain the
 *                      information.
 *
 * @return              The sftp attributes structure of the file or directory,
 *                      NULL on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_lstat(session:Tsftp_session; path:Pchar):Tsftp_attributes;cdecl;external;
{*
 * @brief Get information about a file or directory from a file handle.
 *
 * @param file          The sftp file handle to get the stat information.
 *
 * @return              The sftp attributes structure of the file or directory,
 *                      NULL on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
function sftp_fstat(file:Tsftp_file):Tsftp_attributes;cdecl;external;
{*
 * @brief Free a sftp attribute structure.
 *
 * @param file          The sftp attribute structure to free.
  }
procedure sftp_attributes_free(file:Tsftp_attributes);cdecl;external;
{*
 * @brief Close a directory handle opened by sftp_opendir().
 *
 * @param dir           The sftp directory handle to close.
 *
 * @return              Returns SSH_NO_ERROR or SSH_ERROR if an error occurred.
  }
function sftp_closedir(dir:Tsftp_dir):longint;cdecl;external;
{*
 * @brief Close an open file handle.
 *
 * @param file          The open sftp file handle to close.
 *
 * @return              Returns SSH_NO_ERROR or SSH_ERROR if an error occurred.
 *
 * @see                 sftp_open()
  }
function sftp_close(file:Tsftp_file):longint;cdecl;external;
{*
 * @brief Open a file on the server.
 *
 * @param session       The sftp session handle.
 *
 * @param file          The file to be opened.
 *
 * @param accesstype    Is one of O_RDONLY, O_WRONLY or O_RDWR which request
 *                      opening  the  file  read-only,write-only or read/write.
 *                      Acesss may also be bitwise-or'd with one or  more of
 *                      the following:
 *                      O_CREAT - If the file does not exist it will be
 *                      created.
 *                      O_EXCL - When  used with O_CREAT, if the file already
 *                      exists it is an error and the open will fail.
 *                      O_TRUNC - If the file already exists it will be
 *                      truncated.
 *
 * @param mode          Mode specifies the permissions to use if a new file is
 *                      created.  It  is  modified  by  the process's umask in
 *                      the usual way: The permissions of the created file are
 *                      (mode & ~umask)
 *
 * @return              A sftp file handle, NULL on error with ssh and sftp
 *                      error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_open(session:Tsftp_session; file:Pchar; accesstype:longint; mode:Tmode_t):Tsftp_file;cdecl;external;
{*
 * @brief Make the sftp communication for this file handle non blocking.
 *
 * @param[in]  handle   The file handle to set non blocking.
  }
procedure sftp_file_set_nonblocking(handle:Tsftp_file);cdecl;external;
{*
 * @brief Make the sftp communication for this file handle blocking.
 *
 * @param[in]  handle   The file handle to set blocking.
  }
procedure sftp_file_set_blocking(handle:Tsftp_file);cdecl;external;
{*
 * @brief Read from a file using an opened sftp file handle.
 *
 * @param file          The opened sftp file handle to be read from.
 *
 * @param buf           Pointer to buffer to receive read data.
 *
 * @param count         Size of the buffer in bytes.
 *
 * @return              Number of bytes written, < 0 on error with ssh and sftp
 *                      error set.
 *
 * @see sftp_get_error()
  }
function sftp_read(file:Tsftp_file; buf:pointer; count:Tsize_t):Tssize_t;cdecl;external;
{*
 * @brief Start an asynchronous read from a file using an opened sftp file handle.
 *
 * Its goal is to avoid the slowdowns related to the request/response pattern
 * of a synchronous read. To do so, you must call 2 functions:
 *
 * sftp_async_read_begin() and sftp_async_read().
 *
 * The first step is to call sftp_async_read_begin(). This function returns a
 * request identifier. The second step is to call sftp_async_read() using the
 * returned identifier.
 *
 * @param file          The opened sftp file handle to be read from.
 *
 * @param len           Size to read in bytes.
 *
 * @return              An identifier corresponding to the sent request, < 0 on
 *                      error.
 *
 * @warning             When calling this function, the internal offset is
 *                      updated corresponding to the len parameter.
 *
 * @warning             A call to sftp_async_read_begin() sends a request to
 *                      the server. When the server answers, libssh allocates
 *                      memory to store it until sftp_async_read() is called.
 *                      Not calling sftp_async_read() will lead to memory
 *                      leaks.
 *
 * @see                 sftp_async_read()
 * @see                 sftp_open()
  }
function sftp_async_read_begin(file:Tsftp_file; len:Tuint32_t):longint;cdecl;external;
{*
 * @brief Wait for an asynchronous read to complete and save the data.
 *
 * @param file          The opened sftp file handle to be read from.
 *
 * @param data          Pointer to buffer to receive read data.
 *
 * @param len           Size of the buffer in bytes. It should be bigger or
 *                      equal to the length parameter of the
 *                      sftp_async_read_begin() call.
 *
 * @param id            The identifier returned by the sftp_async_read_begin()
 *                      function.
 *
 * @return              Number of bytes read, 0 on EOF, SSH_ERROR if an error
 *                      occurred, SSH_AGAIN if the file is opened in nonblocking
 *                      mode and the request hasn't been executed yet.
 *
 * @warning             A call to this function with an invalid identifier
 *                      will never return.
 *
 * @see sftp_async_read_begin()
  }
function sftp_async_read(file:Tsftp_file; data:pointer; len:Tuint32_t; id:Tuint32_t):longint;cdecl;external;
{*
 * @brief Write to a file using an opened sftp file handle.
 *
 * @param file          Open sftp file handle to write to.
 *
 * @param buf           Pointer to buffer to write data.
 *
 * @param count         Size of buffer in bytes.
 *
 * @return              Number of bytes written, < 0 on error with ssh and sftp
 *                      error set.
 *
 * @see                 sftp_open()
 * @see                 sftp_read()
 * @see                 sftp_close()
  }
(* Const before type ignored *)
function sftp_write(file:Tsftp_file; buf:pointer; count:Tsize_t):Tssize_t;cdecl;external;
{*
 * @brief Seek to a specific location in a file.
 *
 * @param file         Open sftp file handle to seek in.
 *
 * @param new_offset   Offset in bytes to seek.
 *
 * @return             0 on success, < 0 on error.
  }
function sftp_seek(file:Tsftp_file; new_offset:Tuint32_t):longint;cdecl;external;
{*
 * @brief Seek to a specific location in a file. This is the
 * 64bit version.
 *
 * @param file         Open sftp file handle to seek in.
 *
 * @param new_offset   Offset in bytes to seek.
 *
 * @return             0 on success, < 0 on error.
  }
function sftp_seek64(file:Tsftp_file; new_offset:Tuint64_t):longint;cdecl;external;
{*
 * @brief Report current byte position in file.
 *
 * @param file          Open sftp file handle.
 *
 * @return              The offset of the current byte relative to the beginning
 *                      of the file associated with the file descriptor. < 0 on
 *                      error.
  }
function sftp_tell(file:Tsftp_file):dword;cdecl;external;
{*
 * @brief Report current byte position in file.
 *
 * @param file          Open sftp file handle.
 *
 * @return              The offset of the current byte relative to the beginning
 *                      of the file associated with the file descriptor. < 0 on
 *                      error.
  }
function sftp_tell64(file:Tsftp_file):Tuint64_t;cdecl;external;
{*
 * @brief Rewinds the position of the file pointer to the beginning of the
 * file.
 *
 * @param file          Open sftp file handle.
  }
procedure sftp_rewind(file:Tsftp_file);cdecl;external;
{*
 * @brief Unlink (delete) a file.
 *
 * @param sftp          The sftp session handle.
 *
 * @param file          The file to unlink/delete.
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_unlink(sftp:Tsftp_session; file:Pchar):longint;cdecl;external;
{*
 * @brief Remove a directory.
 *
 * @param sftp          The sftp session handle.
 *
 * @param directory     The directory to remove.
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_rmdir(sftp:Tsftp_session; directory:Pchar):longint;cdecl;external;
{*
 * @brief Create a directory.
 *
 * @param sftp          The sftp session handle.
 *
 * @param directory     The directory to create.
 *
 * @param mode          Specifies the permissions to use. It is modified by the
 *                      process's umask in the usual way:
 *                      The permissions of the created file are (mode & ~umask)
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_mkdir(sftp:Tsftp_session; directory:Pchar; mode:Tmode_t):longint;cdecl;external;
{*
 * @brief Rename or move a file or directory.
 *
 * @param sftp          The sftp session handle.
 *
 * @param original      The original url (source url) of file or directory to
 *                      be moved.
 *
 * @param newname       The new url (destination url) of the file or directory
 *                      after the move.
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function sftp_rename(sftp:Tsftp_session; original:Pchar; newname:Pchar):longint;cdecl;external;
{*
 * @brief Set file attributes on a file, directory or symbolic link.
 *
 * Note, that this function can only set time values using 32 bit values due to
 * the restrictions in the SFTP protocol version 3 implemented by libssh.
 * The support for 64 bit time values was introduced in SFTP version 5, which is
 * not implemented by libssh nor any major SFTP servers.
 *
 * @param sftp          The sftp session handle.
 *
 * @param file          The file which attributes should be changed.
 *
 * @param attr          The file attributes structure with the attributes set
 *                      which should be changed.
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_setstat(sftp:Tsftp_session; file:Pchar; attr:Tsftp_attributes):longint;cdecl;external;
{*
 * @brief Change the file owner and group
 *
 * @param sftp          The sftp session handle.
 *
 * @param file          The file which owner and group should be changed.
 *
 * @param owner         The new owner which should be set.
 *
 * @param group         The new group which should be set.
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_chown(sftp:Tsftp_session; file:Pchar; owner:Tuid_t; group:Tgid_t):longint;cdecl;external;
{*
 * @brief Change permissions of a file
 *
 * @param sftp          The sftp session handle.
 *
 * @param file          The file which owner and group should be changed.
 *
 * @param mode          Specifies the permissions to use. It is modified by the
 *                      process's umask in the usual way:
 *                      The permissions of the created file are (mode & ~umask)
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_chmod(sftp:Tsftp_session; file:Pchar; mode:Tmode_t):longint;cdecl;external;
{*
 * @brief Change the last modification and access time of a file.
 *
 * @param sftp          The sftp session handle.
 *
 * @param file          The file which owner and group should be changed.
 *
 * @param times         A timeval structure which contains the desired access
 *                      and modification time.
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function sftp_utimes(sftp:Tsftp_session; file:Pchar; times:Ptimeval):longint;cdecl;external;
{*
 * @brief Create a symbolic link.
 *
 * @param  sftp         The sftp session handle.
 *
 * @param  target       Specifies the target of the symlink.
 *
 * @param  dest         Specifies the path name of the symlink to be created.
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function sftp_symlink(sftp:Tsftp_session; target:Pchar; dest:Pchar):longint;cdecl;external;
{*
 * @brief Read the value of a symbolic link.
 *
 * @param  sftp         The sftp session handle.
 *
 * @param  path         Specifies the path name of the symlink to be read.
 *
 * @return              The target of the link, NULL on error.
 *                      The caller needs to free the memory
 *                      using ssh_string_free_char().
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_readlink(sftp:Tsftp_session; path:Pchar):Pchar;cdecl;external;
{*
 * @brief Get information about a mounted file system.
 *
 * @param  sftp         The sftp session handle.
 *
 * @param  path         The pathname of any file within the mounted file system.
 *
 * @return A statvfs structure or NULL on error.
 *
 * @see sftp_get_error()
  }
(* Const before type ignored *)
function sftp_statvfs(sftp:Tsftp_session; path:Pchar):Tsftp_statvfs_t;cdecl;external;
{*
 * @brief Get information about a mounted file system.
 *
 * @param  file         An opened file.
 *
 * @return A statvfs structure or NULL on error.
 *
 * @see sftp_get_error()
  }
function sftp_fstatvfs(file:Tsftp_file):Tsftp_statvfs_t;cdecl;external;
{*
 * @brief Free the memory of an allocated statvfs.
 *
 * @param  statvfs_o      The statvfs to free.
  }
procedure sftp_statvfs_free(statvfs_o:Tsftp_statvfs_t);cdecl;external;
{*
 * @brief Synchronize a file's in-core state with storage device
 *
 * This calls the "fsync@openssh.com" extension. You should check if the
 * extensions is supported using:
 *
 * @code
 * int supported = sftp_extension_supported(sftp, "fsync@openssh.com", "1");
 * @endcode
 *
 * @param file          The opened sftp file handle to sync
 *
 * @return              0 on success, < 0 on error with ssh and sftp error set.
  }
function sftp_fsync(file:Tsftp_file):longint;cdecl;external;
{*
 * @brief Canonicalize a sftp path.
 *
 * @param sftp          The sftp session handle.
 *
 * @param path          The path to be canonicalized.
 *
 * @return              A pointer to the newly allocated canonicalized path,
 *                      NULL on error. The caller needs to free the memory
 *                      using ssh_string_free_char().
  }
(* Const before type ignored *)
function sftp_canonicalize_path(sftp:Tsftp_session; path:Pchar):Pchar;cdecl;external;
{*
 * @brief Get the version of the SFTP protocol supported by the server
 *
 * @param sftp          The sftp session handle.
 *
 * @return              The server version.
  }
function sftp_server_version(sftp:Tsftp_session):longint;cdecl;external;
{$ifdef WITH_SERVER}
{*
 * @brief Create a new sftp server session.
 *
 * @param session       The ssh session to use.
 *
 * @param chan          The ssh channel to use.
 *
 * @return              A new sftp server session.
  }
function sftp_server_new(session:Tssh_session; chan:Tssh_channel):Tsftp_session;cdecl;external;
{*
 * @brief Initialize the sftp server.
 *
 * @param sftp         The sftp session to init.
 *
 * @return             0 on success, < 0 on error.
  }
function sftp_server_init(sftp:Tsftp_session):longint;cdecl;external;
{*
 * @brief Close and deallocate a sftp server session.
 *
 * @param sftp          The sftp session handle to free.
  }
procedure sftp_server_free(sftp:Tsftp_session);cdecl;external;
{$endif}
{ WITH_SERVER  }
{ sftpserver.c  }

function sftp_get_client_message(sftp:Tsftp_session):Tsftp_client_message;cdecl;external;
procedure sftp_client_message_free(msg:Tsftp_client_message);cdecl;external;
function sftp_client_message_get_type(msg:Tsftp_client_message):Tuint8_t;cdecl;external;
(* Const before type ignored *)
function sftp_client_message_get_filename(msg:Tsftp_client_message):Pchar;cdecl;external;
(* Const before type ignored *)
procedure sftp_client_message_set_filename(msg:Tsftp_client_message; newname:Pchar);cdecl;external;
(* Const before type ignored *)
function sftp_client_message_get_data(msg:Tsftp_client_message):Pchar;cdecl;external;
function sftp_client_message_get_flags(msg:Tsftp_client_message):Tuint32_t;cdecl;external;
(* Const before type ignored *)
function sftp_client_message_get_submessage(msg:Tsftp_client_message):Pchar;cdecl;external;
function sftp_send_client_message(sftp:Tsftp_session; msg:Tsftp_client_message):longint;cdecl;external;
(* Const before type ignored *)
function sftp_reply_name(msg:Tsftp_client_message; name:Pchar; attr:Tsftp_attributes):longint;cdecl;external;
function sftp_reply_handle(msg:Tsftp_client_message; handle:Tssh_string):longint;cdecl;external;
function sftp_handle_alloc(sftp:Tsftp_session; info:pointer):Tssh_string;cdecl;external;
function sftp_reply_attr(msg:Tsftp_client_message; attr:Tsftp_attributes):longint;cdecl;external;
function sftp_handle(sftp:Tsftp_session; handle:Tssh_string):pointer;cdecl;external;
(* Const before type ignored *)
function sftp_reply_status(msg:Tsftp_client_message; status:Tuint32_t; message:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sftp_reply_names_add(msg:Tsftp_client_message; file:Pchar; longname:Pchar; attr:Tsftp_attributes):longint;cdecl;external;
function sftp_reply_names(msg:Tsftp_client_message):longint;cdecl;external;
(* Const before type ignored *)
function sftp_reply_data(msg:Tsftp_client_message; data:pointer; len:longint):longint;cdecl;external;
procedure sftp_handle_remove(sftp:Tsftp_session; handle:pointer);cdecl;external;
{ SFTP commands and constants  }
const
  SSH_FXP_INIT = 1;  
  SSH_FXP_VERSION = 2;  
  SSH_FXP_OPEN = 3;  
  SSH_FXP_CLOSE = 4;  
  SSH_FXP_READ = 5;  
  SSH_FXP_WRITE = 6;  
  SSH_FXP_LSTAT = 7;  
  SSH_FXP_FSTAT = 8;  
  SSH_FXP_SETSTAT = 9;  
  SSH_FXP_FSETSTAT = 10;  
  SSH_FXP_OPENDIR = 11;  
  SSH_FXP_READDIR = 12;  
  SSH_FXP_REMOVE = 13;  
  SSH_FXP_MKDIR = 14;  
  SSH_FXP_RMDIR = 15;  
  SSH_FXP_REALPATH = 16;  
  SSH_FXP_STAT = 17;  
  SSH_FXP_RENAME = 18;  
  SSH_FXP_READLINK = 19;  
  SSH_FXP_SYMLINK = 20;  
  SSH_FXP_STATUS = 101;  
  SSH_FXP_HANDLE = 102;  
  SSH_FXP_DATA = 103;  
  SSH_FXP_NAME = 104;  
  SSH_FXP_ATTRS = 105;  
  SSH_FXP_EXTENDED = 200;  
  SSH_FXP_EXTENDED_REPLY = 201;  
{ attributes  }
{ sftp draft is completely braindead : version 3 and 4 have different flags for same constants  }
{ and even worst, version 4 has same flag for 2 different constants  }
{ follow up : i won't develop any sftp4 compliant library before having a clarification  }
  SSH_FILEXFER_ATTR_SIZE = $00000001;  
  SSH_FILEXFER_ATTR_PERMISSIONS = $00000004;  
  SSH_FILEXFER_ATTR_ACCESSTIME = $00000008;  
  SSH_FILEXFER_ATTR_ACMODTIME = $00000008;  
  SSH_FILEXFER_ATTR_CREATETIME = $00000010;  
  SSH_FILEXFER_ATTR_MODIFYTIME = $00000020;  
  SSH_FILEXFER_ATTR_ACL = $00000040;  
  SSH_FILEXFER_ATTR_OWNERGROUP = $00000080;  
  SSH_FILEXFER_ATTR_SUBSECOND_TIMES = $00000100;  
  SSH_FILEXFER_ATTR_EXTENDED = $80000000;  
  SSH_FILEXFER_ATTR_UIDGID = $00000002;  
{ types  }
  SSH_FILEXFER_TYPE_REGULAR = 1;  
  SSH_FILEXFER_TYPE_DIRECTORY = 2;  
  SSH_FILEXFER_TYPE_SYMLINK = 3;  
  SSH_FILEXFER_TYPE_SPECIAL = 4;  
  SSH_FILEXFER_TYPE_UNKNOWN = 5;  
{*
 * @name Server responses
 *
 * @brief Responses returned by the sftp server.
 * @
  }
{* No error  }
  SSH_FX_OK = 0;  
{* End-of-file encountered  }
  SSH_FX_EOF = 1;  
{* File doesn't exist  }
  SSH_FX_NO_SUCH_FILE = 2;  
{* Permission denied  }
  SSH_FX_PERMISSION_DENIED = 3;  
{* Generic failure  }
  SSH_FX_FAILURE = 4;  
{* Garbage received from server  }
  SSH_FX_BAD_MESSAGE = 5;  
{* No connection has been set up  }
  SSH_FX_NO_CONNECTION = 6;  
{* There was a connection, but we lost it  }
  SSH_FX_CONNECTION_LOST = 7;  
{* Operation not supported by the server  }
  SSH_FX_OP_UNSUPPORTED = 8;  
{* Invalid file handle  }
  SSH_FX_INVALID_HANDLE = 9;  
{* No such file or directory path exists  }
  SSH_FX_NO_SUCH_PATH = 10;  
{* An attempt to create an already existing file or directory has been made  }
  SSH_FX_FILE_ALREADY_EXISTS = 11;  
{* We are trying to write on a write-protected filesystem  }
  SSH_FX_WRITE_PROTECT = 12;  
{* No media in remote drive  }
  SSH_FX_NO_MEDIA = 13;  
{* @  }
{ file flags  }
  SSH_FXF_READ = $01;  
  SSH_FXF_WRITE = $02;  
  SSH_FXF_APPEND = $04;  
  SSH_FXF_CREAT = $08;  
  SSH_FXF_TRUNC = $10;  
  SSH_FXF_EXCL = $20;  
  SSH_FXF_TEXT = $40;  
{ file type flags  }
  SSH_S_IFMT = 00170000;  
  SSH_S_IFSOCK = 0140000;  
  SSH_S_IFLNK = 0120000;  
  SSH_S_IFREG = 0100000;  
  SSH_S_IFBLK = 0060000;  
  SSH_S_IFDIR = 0040000;  
  SSH_S_IFCHR = 0020000;  
  SSH_S_IFIFO = 0010000;  
{ rename flags  }
  SSH_FXF_RENAME_OVERWRITE = $00000001;  
  SSH_FXF_RENAME_ATOMIC = $00000002;  
  SSH_FXF_RENAME_NATIVE = $00000004;  
  SFTP_OPEN = SSH_FXP_OPEN;  
  SFTP_CLOSE = SSH_FXP_CLOSE;  
  SFTP_READ = SSH_FXP_READ;  
  SFTP_WRITE = SSH_FXP_WRITE;  
  SFTP_LSTAT = SSH_FXP_LSTAT;  
  SFTP_FSTAT = SSH_FXP_FSTAT;  
  SFTP_SETSTAT = SSH_FXP_SETSTAT;  
  SFTP_FSETSTAT = SSH_FXP_FSETSTAT;  
  SFTP_OPENDIR = SSH_FXP_OPENDIR;  
  SFTP_READDIR = SSH_FXP_READDIR;  
  SFTP_REMOVE = SSH_FXP_REMOVE;  
  SFTP_MKDIR = SSH_FXP_MKDIR;  
  SFTP_RMDIR = SSH_FXP_RMDIR;  
  SFTP_REALPATH = SSH_FXP_REALPATH;  
  SFTP_STAT = SSH_FXP_STAT;  
  SFTP_RENAME = SSH_FXP_RENAME;  
  SFTP_READLINK = SSH_FXP_READLINK;  
  SFTP_SYMLINK = SSH_FXP_SYMLINK;  
  SFTP_EXTENDED = SSH_FXP_EXTENDED;  
{ openssh flags  }
{ read-only  }
  SSH_FXE_STATVFS_ST_RDONLY = $1;  
{ no setuid  }
  SSH_FXE_STATVFS_ST_NOSUID = $2;  
{ C++ end of extern C conditionnal removed }
{$endif}
{ SFTP_H  }
{* @  }

implementation


end.
