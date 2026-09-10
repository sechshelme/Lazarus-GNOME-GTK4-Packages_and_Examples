
unit apr_file_io;
interface

{
  Automatically converted by H2Pas 1.0.0 from apr_file_io.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    apr_file_io.h
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
Papr_file_t  = ^apr_file_t;
Papr_fileattrs_t  = ^apr_fileattrs_t;
Papr_finfo_t  = ^apr_finfo_t;
Papr_interval_time_t  = ^apr_interval_time_t;
Papr_off_t  = ^apr_off_t;
Papr_pool_t  = ^apr_pool_t;
Papr_seek_where_t  = ^apr_seek_where_t;
Papr_size_t  = ^apr_size_t;
Pchar  = ^char;
Piovec  = ^iovec;
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
{$ifndef APR_FILE_IO_H}
{$define APR_FILE_IO_H}
{*
 * @file apr_file_io.h
 * @brief APR File I/O Handling
  }
{$include "apr.h"}
{$include "apr_pools.h"}
{$include "apr_time.h"}
{$include "apr_errno.h"}
{$include "apr_file_info.h"}
{$include "apr_inherit.h"}
{*< for SEEK_*  }
{$define APR_WANT_STDIO}
{*< for apr_file_writev  }
{$define APR_WANT_IOVEC}
{$include "apr_want.h"}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * @defgroup apr_file_io File I/O Handling Functions
 * @ingroup APR 
 * @
  }
{*
 * @defgroup apr_file_open_flags File Open Flags/Routines
 * @
  }
{ Note to implementors: Values in the range 0x00100000--0x80000000
   are reserved for platform-specific values.  }
{*< Open the file for reading  }

const
  APR_FOPEN_READ = $00001;  
{*< Open the file for writing  }
  APR_FOPEN_WRITE = $00002;  
{*< Create the file if not there  }
  APR_FOPEN_CREATE = $00004;  
{*< Append to the end of the file  }
  APR_FOPEN_APPEND = $00008;  
{*< Open the file and truncate
                                         to 0 length  }
  APR_FOPEN_TRUNCATE = $00010;  
{*< Open the file in binary mode
				         (This flag is ignored on UNIX 
					 because it has no meaning) }
  APR_FOPEN_BINARY = $00020;  
{*< Open should fail if #APR_FOPEN_CREATE
                                         and file exists.  }
  APR_FOPEN_EXCL = $00040;  
{*< Open the file for buffered I/O  }
  APR_FOPEN_BUFFERED = $00080;  
{*< Delete the file after close  }
  APR_FOPEN_DELONCLOSE = $00100;  
{*< Platform dependent tag to open
                                         the file for use across multiple
                                         threads  }
  APR_FOPEN_XTHREAD = $00200;  
{*< Platform dependent support for
                                         higher level locked read/write
                                         access to support writes across
                                         process/machines  }
  APR_FOPEN_SHARELOCK = $00400;  
{*< Do not register a cleanup
                                         when the file is opened. The
					 apr_os_file_t handle in apr_file_t
					 will not be closed when the pool
					 is destroyed.  }
  APR_FOPEN_NOCLEANUP = $00800;  
{*< Advisory flag that this
                                             file should support
                                             apr_socket_sendfile operation  }
  APR_FOPEN_SENDFILE_ENABLED = $01000;  
{*< Platform dependent flag to enable
                                       * large file support, see WARNING below
                                        }
  APR_FOPEN_LARGEFILE = $04000;  
{*< Platform dependent flag to enable
                                       * sparse file support, see WARNING below
                                        }
  APR_FOPEN_SPARSE = $08000;  
{*< Platform dependent flag to enable
                                       * non blocking file io  }
  APR_FOPEN_NONBLOCK = $40000;  
{ backcompat  }
{*< @deprecated @see APR_FOPEN_READ  }
  APR_READ = APR_FOPEN_READ;  
{*< @deprecated @see APR_FOPEN_WRITE  }  APR_WRITE = APR_FOPEN_WRITE;  
{*< @deprecated @see APR_FOPEN_CREATE  }  APR_CREATE = APR_FOPEN_CREATE;  
{*< @deprecated @see APR_FOPEN_APPEND  }  APR_APPEND = APR_FOPEN_APPEND;  
{*< @deprecated @see APR_FOPEN_TRUNCATE  }  APR_TRUNCATE = APR_FOPEN_TRUNCATE;  
{*< @deprecated @see APR_FOPEN_BINARY  }  APR_BINARY = APR_FOPEN_BINARY;  
{*< @deprecated @see APR_FOPEN_EXCL  }  APR_EXCL = APR_FOPEN_EXCL;  
{*< @deprecated @see APR_FOPEN_BUFFERED  }  APR_BUFFERED = APR_FOPEN_BUFFERED;  
{*< @deprecated @see APR_FOPEN_DELONCLOSE  }  APR_DELONCLOSE = APR_FOPEN_DELONCLOSE;  
{*< @deprecated @see APR_FOPEN_XTHREAD  }  APR_XTHREAD = APR_FOPEN_XTHREAD;  
{*< @deprecated @see APR_FOPEN_SHARELOCK  }  APR_SHARELOCK = APR_FOPEN_SHARELOCK;  
{*< @deprecated @see APR_FOPEN_NOCLEANUP  }  APR_FILE_NOCLEANUP = APR_FOPEN_NOCLEANUP;  
{*< @deprecated @see APR_FOPEN_SENDFILE_ENABLED  }  APR_SENDFILE_ENABLED = APR_FOPEN_SENDFILE_ENABLED;  
{*< @deprecated @see APR_FOPEN_LARGEFILE  }  APR_LARGEFILE = APR_FOPEN_LARGEFILE;  
{* @def APR_FOPEN_LARGEFILE 
 * @warning APR_FOPEN_LARGEFILE flag only has effect on some
 * platforms where sizeof(apr_off_t) == 4.  Where implemented, it
 * allows opening and writing to a file which exceeds the size which
 * can be represented by apr_off_t (2 gigabytes).  When a file's size
 * does exceed 2Gb, apr_file_info_get() will fail with an error on the
 * descriptor, likewise apr_stat()/apr_lstat() will fail on the
 * filename.  apr_dir_read() will fail with #APR_INCOMPLETE on a
 * directory entry for a large file depending on the particular
 * APR_FINFO_* flags.  Generally, it is not recommended to use this
 * flag.
 *
 * @def APR_FOPEN_SPARSE
 * @warning APR_FOPEN_SPARSE may, depending on platform, convert a
 * normal file to a sparse file.  Some applications may be unable
 * to decipher a sparse file, so it's critical that the sparse file
 * flag should only be used for files accessed only by APR or other
 * applications known to be able to decipher them.  APR does not
 * guarantee that it will compress the file into sparse segments
 * if it was previously created and written without the sparse flag.
 * On platforms which do not understand, or on file systems which
 * cannot handle sparse files, the flag is ignored by apr_file_open().
 *
 * @def APR_FOPEN_NONBLOCK
 * @warning APR_FOPEN_NONBLOCK is not implemented on all platforms.
 * Callers should be prepared for it to fail with #APR_ENOTIMPL.
  }
{* @  }
{*
 * @defgroup apr_file_seek_flags File Seek Flags
 * @
  }
{ flags for apr_file_seek  }
{* Set the file position  }
  APR_SET = SEEK_SET;  
{* Current  }
  APR_CUR = SEEK_CUR;  
{* Go to end of file  }
  APR_END = SEEK_END;  
{* @  }
{*
 * @defgroup apr_file_attrs_set_flags File Attribute Flags
 * @
  }
{ flags for apr_file_attrs_set  }
{*< File is read-only  }
  APR_FILE_ATTR_READONLY = $01;  
{*< File is executable  }
  APR_FILE_ATTR_EXECUTABLE = $02;  
{*< File is hidden  }
  APR_FILE_ATTR_HIDDEN = $04;  
{* @  }
{*
 * @defgroup apr_file_writev_full max iovec size
 * @
  }
{$if defined(DOXYGEN)}
{*< System dependent maximum 
                                                    size of an iovec array  }

const
  APR_MAX_IOVEC_SIZE = 1024;  
(*** was #elif ****){$else defined(IOV_MAX)}

const
  APR_MAX_IOVEC_SIZE = IOV_MAX;  
(*** was #elif ****){$else defined(MAX_IOVEC)}

const
  APR_MAX_IOVEC_SIZE = MAX_IOVEC;  
{$else}

const
  APR_MAX_IOVEC_SIZE = 1024;  
{$endif}
{* @  }
{* File attributes  }
type
  Papr_fileattrs_t = ^Tapr_fileattrs_t;
  Tapr_fileattrs_t = Tapr_uint32_t;
{* Type to pass as whence argument to apr_file_seek.  }

  Papr_seek_where_t = ^Tapr_seek_where_t;
  Tapr_seek_where_t = longint;
{*
 * Structure for referencing files.
  }
{ File lock types/flags  }
{*
 * @defgroup apr_file_lock_types File Lock Types
 * @
  }
{*< Shared lock. More than one process
                                           or thread can hold a shared lock
                                           at any given time. Essentially,
                                           this is a "read lock", preventing
                                           writers from establishing an
                                           exclusive lock.  }

const
  APR_FLOCK_SHARED = 1;  
{*< Exclusive lock. Only one process
                                           may hold an exclusive lock at any
                                           given time. This is analogous to
                                           a "write lock".  }
  APR_FLOCK_EXCLUSIVE = 2;  
{*< mask to extract lock type  }
  APR_FLOCK_TYPEMASK = $000F;  
{*< do not block while acquiring the
                                           file lock  }
  APR_FLOCK_NONBLOCK = $0010;  
{* @  }
{*
 * Open the specified file.
 * @param newf The opened file descriptor.
 * @param fname The full path to the file (using / on all systems)
 * @param flag Or'ed value of:
 * @li #APR_FOPEN_READ           open for reading
 * @li #APR_FOPEN_WRITE          open for writing
 * @li #APR_FOPEN_CREATE         create the file if not there
 * @li #APR_FOPEN_APPEND         file ptr is set to end prior to all writes
 * @li #APR_FOPEN_TRUNCATE       set length to zero if file exists
 * @li #APR_FOPEN_BINARY         not a text file
 * @li #APR_FOPEN_BUFFERED       buffer the data.  Default is non-buffered
 * @li #APR_FOPEN_EXCL           return error if #APR_FOPEN_CREATE and file exists
 * @li #APR_FOPEN_DELONCLOSE     delete the file after closing
 * @li #APR_FOPEN_XTHREAD        Platform dependent tag to open the file
 *                               for use across multiple threads
 * @li #APR_FOPEN_SHARELOCK      Platform dependent support for higher
 *                               level locked read/write access to support
 *                               writes across process/machines
 * @li #APR_FOPEN_NOCLEANUP      Do not register a cleanup with the pool 
 *                               passed in on the @a pool argument (see below)
 * @li #APR_FOPEN_SENDFILE_ENABLED  Open with appropriate platform semantics
 *                               for sendfile operations.  Advisory only,
 *                               apr_socket_sendfile does not check this flag
 * @li #APR_FOPEN_LARGEFILE      Platform dependent flag to enable large file
 *                               support, see WARNING below 
 * @li #APR_FOPEN_SPARSE         Platform dependent flag to enable sparse file
 *                               support, see WARNING below
 * @li #APR_FOPEN_NONBLOCK       Platform dependent flag to enable
 *                               non blocking file io
 * @param perm Access permissions for file.
 * @param pool The pool to use.
 * @remark If perm is #APR_FPROT_OS_DEFAULT and the file is being created,
 * appropriate default permissions will be used.
 * @remark By default, the returned file descriptor will not be
 * inherited by child processes created by apr_proc_create().  This
 * can be changed using apr_file_inherit_set().
  }
(* Const before type ignored *)

function apr_file_open(newf:PPapr_file_t; fname:Pchar; flag:Tapr_int32_t; perm:Tapr_fileperms_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Close the specified file.
 * @param file The file descriptor to close.
  }
function apr_file_close(file:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Delete the specified file.
 * @param path The full path to the file (using / on all systems)
 * @param pool The pool to use.
 * @remark If the file is open, it won't be removed until all
 * instances are closed.
  }
(* Const before type ignored *)
function apr_file_remove(path:Pchar; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Rename the specified file.
 * @param from_path The full path to the original file (using / on all systems)
 * @param to_path The full path to the new file (using / on all systems)
 * @param pool The pool to use.
 * @warning If a file exists at the new location, then it will be
 * overwritten.  Moving files or directories across devices may not be
 * possible.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_file_rename(from_path:Pchar; to_path:Pchar; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Create a hard link to the specified file.
 * @param from_path The full path to the original file (using / on all systems)
 * @param to_path The full path to the new file (using / on all systems)
 * @remark Both files must reside on the same device.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_file_link(from_path:Pchar; to_path:Pchar):Tapr_status_t;cdecl;external;
{*
 * Copy the specified file to another file.
 * @param from_path The full path to the original file (using / on all systems)
 * @param to_path The full path to the new file (using / on all systems)
 * @param perms Access permissions for the new file if it is created.
 *     In place of the usual or'd combination of file permissions, the
 *     value #APR_FPROT_FILE_SOURCE_PERMS may be given, in which case the source
 *     file's permissions are copied.
 * @param pool The pool to use.
 * @remark The new file does not need to exist, it will be created if required.
 * @warning If the new file already exists, its contents will be overwritten.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_file_copy(from_path:Pchar; to_path:Pchar; perms:Tapr_fileperms_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Append the specified file to another file.
 * @param from_path The full path to the source file (use / on all systems)
 * @param to_path The full path to the destination file (use / on all systems)
 * @param perms Access permissions for the destination file if it is created.
 *     In place of the usual or'd combination of file permissions, the
 *     value #APR_FPROT_FILE_SOURCE_PERMS may be given, in which case the source
 *     file's permissions are copied.
 * @param pool The pool to use.
 * @remark The new file does not need to exist, it will be created if required.
 * @remark Note that advanced filesystem permissions such as ACLs are not
 * duplicated by this API. The target permissions (including duplicating the
 * source file permissions) are assigned only when the target file does not yet
 * exist.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function apr_file_append(from_path:Pchar; to_path:Pchar; perms:Tapr_fileperms_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Are we at the end of the file
 * @param fptr The apr file we are testing.
 * @remark Returns #APR_EOF if we are at the end of file, #APR_SUCCESS otherwise.
  }
function apr_file_eof(fptr:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Open standard error as an apr file pointer.
 * @param thefile The apr file to use as stderr.
 * @param pool The pool to allocate the file out of.
 * 
 * @remark The only reason that the apr_file_open_std* functions exist
 * is that you may not always have a stderr/out/in on Windows.  This
 * is generally a problem with newer versions of Windows and services.
 * 
 * @remark The other problem is that the C library functions generally work
 * differently on Windows and Unix.  So, by using apr_file_open_std*
 * functions, you can get a handle to an APR struct that works with
 * the APR functions which are supposed to work identically on all
 * platforms.
  }
function apr_file_open_stderr(thefile:PPapr_file_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * open standard output as an apr file pointer.
 * @param thefile The apr file to use as stdout.
 * @param pool The pool to allocate the file out of.
 * 
 * @remark See remarks for apr_file_open_stderr().
  }
function apr_file_open_stdout(thefile:PPapr_file_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * open standard input as an apr file pointer.
 * @param thefile The apr file to use as stdin.
 * @param pool The pool to allocate the file out of.
 * 
 * @remark See remarks for apr_file_open_stderr().
  }
function apr_file_open_stdin(thefile:PPapr_file_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * open standard error as an apr file pointer, with flags.
 * @param thefile The apr file to use as stderr.
 * @param flags The flags to open the file with. Only the 
 *              @li #APR_FOPEN_EXCL
 *              @li #APR_FOPEN_BUFFERED
 *              @li #APR_FOPEN_XTHREAD
 *              @li #APR_FOPEN_SHARELOCK 
 *              @li #APR_FOPEN_SENDFILE_ENABLED
 *              @li #APR_FOPEN_LARGEFILE
 *
 *              flags should be used. The #APR_FOPEN_WRITE flag will
 *              be set unconditionally.
 * @param pool The pool to allocate the file out of.
 * 
 * @remark See remarks for apr_file_open_stderr().
  }
function apr_file_open_flags_stderr(thefile:PPapr_file_t; flags:Tapr_int32_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * open standard output as an apr file pointer, with flags.
 * @param thefile The apr file to use as stdout.
 * @param flags The flags to open the file with. Only the 
 *              @li #APR_FOPEN_EXCL
 *              @li #APR_FOPEN_BUFFERED
 *              @li #APR_FOPEN_XTHREAD
 *              @li #APR_FOPEN_SHARELOCK 
 *              @li #APR_FOPEN_SENDFILE_ENABLED
 *              @li #APR_FOPEN_LARGEFILE
 *
 *              flags should be used. The #APR_FOPEN_WRITE flag will
 *              be set unconditionally.
 * @param pool The pool to allocate the file out of.
 * 
 * @remark See remarks for apr_file_open_stderr().
  }
function apr_file_open_flags_stdout(thefile:PPapr_file_t; flags:Tapr_int32_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * open standard input as an apr file pointer, with flags.
 * @param thefile The apr file to use as stdin.
 * @param flags The flags to open the file with. Only the 
 *              @li #APR_FOPEN_EXCL
 *              @li #APR_FOPEN_BUFFERED
 *              @li #APR_FOPEN_XTHREAD
 *              @li #APR_FOPEN_SHARELOCK 
 *              @li #APR_FOPEN_SENDFILE_ENABLED
 *              @li #APR_FOPEN_LARGEFILE
 *
 *              flags should be used. The #APR_FOPEN_WRITE flag will
 *              be set unconditionally.
 * @param pool The pool to allocate the file out of.
 * 
 * @remark See remarks for apr_file_open_stderr().
  }
function apr_file_open_flags_stdin(thefile:PPapr_file_t; flags:Tapr_int32_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Read data from the specified file.
 * @param thefile The file descriptor to read from.
 * @param buf The buffer to store the data to.
 * @param nbytes On entry, the number of bytes to read; on exit, the number
 * of bytes read.
 *
 * @remark apr_file_read() will read up to the specified number of
 * bytes, but never more.  If there isn't enough data to fill that
 * number of bytes, all of the available data is read.  The third
 * argument is modified to reflect the number of bytes read.  If a
 * char was put back into the stream via ungetc, it will be the first
 * character returned.
 *
 * @remark It is not possible for both bytes to be read and an #APR_EOF
 * or other error to be returned.  #APR_EINTR is never returned.
  }
function apr_file_read(thefile:Papr_file_t; buf:pointer; nbytes:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Write data to the specified file.
 * @param thefile The file descriptor to write to.
 * @param buf The buffer which contains the data.
 * @param nbytes On entry, the number of bytes to write; on exit, the number 
 *               of bytes written.
 *
 * @remark apr_file_write() will write up to the specified number of
 * bytes, but never more.  If the OS cannot write that many bytes, it
 * will write as many as it can.  The third argument is modified to
 * reflect the * number of bytes written.
 *
 * @remark It is possible for both bytes to be written and an error to
 * be returned.  #APR_EINTR is never returned.
  }
(* Const before type ignored *)
function apr_file_write(thefile:Papr_file_t; buf:pointer; nbytes:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Write data from iovec array to the specified file.
 * @param thefile The file descriptor to write to.
 * @param vec The array from which to get the data to write to the file.
 * @param nvec The number of elements in the struct iovec array. This must 
 *             be smaller than #APR_MAX_IOVEC_SIZE.  If it isn't, the function 
 *             will fail with #APR_EINVAL.
 * @param nbytes The number of bytes written.
 *
 * @remark It is possible for both bytes to be written and an error to
 * be returned.  #APR_EINTR is never returned.
 *
 * @remark apr_file_writev() is available even if the underlying
 * operating system doesn't provide writev().
  }
(* Const before type ignored *)
function apr_file_writev(thefile:Papr_file_t; vec:Piovec; nvec:Tapr_size_t; nbytes:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Read data from the specified file, ensuring that the buffer is filled
 * before returning.
 * @param thefile The file descriptor to read from.
 * @param buf The buffer to store the data to.
 * @param nbytes The number of bytes to read.
 * @param bytes_read If non-NULL, this will contain the number of bytes read.
 *
 * @remark apr_file_read_full() will read up to the specified number of
 * bytes, but never more.  If there isn't enough data to fill that
 * number of bytes, then the process/thread will block until it is
 * available or EOF is reached.  If a char was put back into the
 * stream via ungetc, it will be the first character returned.
 *
 * @remark It is possible for both bytes to be read and an error to be
 * returned.  And if *bytes_read is less than nbytes, an accompanying
 * error is _always_ returned.
 *
 * @remark #APR_EINTR is never returned.
  }
function apr_file_read_full(thefile:Papr_file_t; buf:pointer; nbytes:Tapr_size_t; bytes_read:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Write data to the specified file, ensuring that all of the data is
 * written before returning.
 * @param thefile The file descriptor to write to.
 * @param buf The buffer which contains the data.
 * @param nbytes The number of bytes to write.
 * @param bytes_written If non-NULL, set to the number of bytes written.
 * 
 * @remark apr_file_write_full() will write up to the specified number of
 * bytes, but never more.  If the OS cannot write that many bytes, the
 * process/thread will block until they can be written. Exceptional
 * error such as "out of space" or "pipe closed" will terminate with
 * an error.
 *
 * @remark It is possible for both bytes to be written and an error to
 * be returned.  And if *bytes_written is less than nbytes, an
 * accompanying error is _always_ returned.
 *
 * @remark #APR_EINTR is never returned.
  }
(* Const before type ignored *)
function apr_file_write_full(thefile:Papr_file_t; buf:pointer; nbytes:Tapr_size_t; bytes_written:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Write data from iovec array to the specified file, ensuring that all of the
 * data is written before returning.
 * @param thefile The file descriptor to write to.
 * @param vec The array from which to get the data to write to the file.
 * @param nvec The number of elements in the struct iovec array. This must 
 *             be smaller than #APR_MAX_IOVEC_SIZE.  If it isn't, the function 
 *             will fail with #APR_EINVAL.
 * @param nbytes The number of bytes written.
 *
 * @remark apr_file_writev_full() is available even if the underlying
 * operating system doesn't provide writev().
  }
(* Const before type ignored *)
function apr_file_writev_full(thefile:Papr_file_t; vec:Piovec; nvec:Tapr_size_t; nbytes:Papr_size_t):Tapr_status_t;cdecl;external;
{*
 * Write a character into the specified file.
 * @param ch The character to write.
 * @param thefile The file descriptor to write to
  }
function apr_file_putc(ch:char; thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Read a character from the specified file.
 * @param ch The character to read into
 * @param thefile The file descriptor to read from
  }
function apr_file_getc(ch:Pchar; thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Put a character back onto a specified stream.
 * @param ch The character to write.
 * @param thefile The file descriptor to write to
  }
function apr_file_ungetc(ch:char; thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Read a line from the specified file
 * @param str The buffer to store the string in. 
 * @param len The length of the string
 * @param thefile The file descriptor to read from
 * @remark The buffer will be NUL-terminated if any characters are stored.
 *         The newline at the end of the line will not be stripped.
  }
function apr_file_gets(str:Pchar; len:longint; thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Write the string into the specified file.
 * @param str The string to write. 
 * @param thefile The file descriptor to write to
  }
(* Const before type ignored *)
function apr_file_puts(str:Pchar; thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Flush the file's buffer.
 * @param thefile The file descriptor to flush
  }
function apr_file_flush(thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Transfer all file modified data and metadata to disk.
 * @param thefile The file descriptor to sync
  }
function apr_file_sync(thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Transfer all file modified data to disk.
 * @param thefile The file descriptor to sync
  }
function apr_file_datasync(thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Duplicate the specified file descriptor.
 * @param new_file The structure to duplicate into. 
 * @param old_file The file to duplicate.
 * @param p The pool to use for the new file.
 * @remark *new_file must point to a valid apr_file_t, or point to NULL.
  }function apr_file_dup(new_file:PPapr_file_t; old_file:Papr_file_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Duplicate the specified file descriptor and close the original
 * @param new_file The old file that is to be closed and reused
 * @param old_file The file to duplicate
 * @param p        The pool to use for the new file
 *
 * @remark new_file MUST point at a valid apr_file_t. It cannot be NULL.
  }
function apr_file_dup2(new_file:Papr_file_t; old_file:Papr_file_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Move the specified file descriptor to a new pool
 * @param new_file Pointer in which to return the new apr_file_t
 * @param old_file The file to move
 * @param p        The pool to which the descriptor is to be moved
 * @remark Unlike apr_file_dup2(), this function doesn't do an
 *         OS dup() operation on the underlying descriptor; it just
 *         moves the descriptor's apr_file_t wrapper to a new pool.
 * @remark The new pool need not be an ancestor of old_file's pool.
 * @remark After calling this function, old_file may not be used
  }
function apr_file_setaside(new_file:PPapr_file_t; old_file:Papr_file_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Give the specified apr file handle a new buffer 
 * @param thefile  The file handle that is to be modified
 * @param buffer   The buffer
 * @param bufsize  The size of the buffer
 * @remark It is possible to add a buffer to previously unbuffered
 *         file handles, the #APR_FOPEN_BUFFERED flag will be added to
 *         the file handle's flags. Likewise, with buffer=NULL and
 *         bufsize=0 arguments it is possible to make a previously
 *         buffered file handle unbuffered.
  }
function apr_file_buffer_set(thefile:Papr_file_t; buffer:Pchar; bufsize:Tapr_size_t):Tapr_status_t;cdecl;external;
{*
 * Get the size of any buffer for the specified apr file handle 
 * @param thefile  The file handle 
  }
function apr_file_buffer_size_get(thefile:Papr_file_t):Tapr_size_t;cdecl;external;
{*
 * Move the read/write file offset to a specified byte within a file.
 * @param thefile The file descriptor
 * @param where How to move the pointer, one of:
 *              @li #APR_SET  --  set the offset to offset
 *              @li #APR_CUR  --  add the offset to the current position 
 *              @li #APR_END  --  add the offset to the current file size 
 * @param offset The offset to move the pointer to.
 * @remark The third argument is modified to be the offset the pointer
          was actually moved to.
  }
function apr_file_seek(thefile:Papr_file_t; where:Tapr_seek_where_t; offset:Papr_off_t):Tapr_status_t;cdecl;external;
{*
 * Create an anonymous pipe.
 * @param in The newly created pipe's file for reading.
 * @param out The newly created pipe's file for writing.
 * @param pool The pool to operate on.
 * @remark By default, the returned file descriptors will be inherited
 * by child processes created using apr_proc_create().  This can be
 * changed using apr_file_inherit_unset().
 * @bug  Some platforms cannot toggle between blocking and nonblocking,
 * and when passing a pipe as a standard handle to an application which
 * does not expect it, a non-blocking stream will fluxor the client app.
 * @deprecated @see apr_file_pipe_create_pools()
  }
function apr_file_pipe_create(in:PPapr_file_t; out:PPapr_file_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Create an anonymous pipe which portably supports async timeout options.
 * @param in The newly created pipe's file for reading.
 * @param out The newly created pipe's file for writing.
 * @param blocking one of these values defined in apr_thread_proc.h;
 *                 @li #APR_FULL_BLOCK
 *                 @li #APR_READ_BLOCK
 *                 @li #APR_WRITE_BLOCK
 *                 @li #APR_FULL_NONBLOCK
 * @param pool The pool to operate on.
 * @remark By default, the returned file descriptors will be inherited
 * by child processes created using apr_proc_create().  This can be
 * changed using apr_file_inherit_unset().
 * @remark Some platforms cannot toggle between blocking and nonblocking,
 * and when passing a pipe as a standard handle to an application which
 * does not expect it, a non-blocking stream will fluxor the client app.
 * Use this function rather than apr_file_pipe_create() to create pipes 
 * where one or both ends require non-blocking semantics.
 * @deprecated @see apr_file_pipe_create_pools()
  }
function apr_file_pipe_create_ex(in:PPapr_file_t; out:PPapr_file_t; blocking:Tapr_int32_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Create an anonymous pipe which portably supports async timeout options,
 * placing each side of the pipe in a different pool.
 * @param in The newly created pipe's file for reading.
 * @param out The newly created pipe's file for writing.
 * @param blocking one of these values defined in apr_thread_proc.h;
 *                 @li #APR_FULL_BLOCK
 *                 @li #APR_READ_BLOCK
 *                 @li #APR_WRITE_BLOCK
 *                 @li #APR_FULL_NONBLOCK
 * @param pool_in The pool for the reading pipe.
 * @param pool_out The pool for the writing pipe.
 * @remark By default, the returned file descriptors will be inherited
 * by child processes created using apr_proc_create().  This can be
 * changed using apr_file_inherit_unset().
 * @remark Some platforms cannot toggle between blocking and nonblocking,
 * and when passing a pipe as a standard handle to an application which
 * does not expect it, a non-blocking stream will fluxor the client app.
 * Use this function rather than apr_file_pipe_create() to create pipes
 * where one or both ends require non-blocking semantics.
  }
function apr_file_pipe_create_pools(in:PPapr_file_t; out:PPapr_file_t; blocking:Tapr_int32_t; pool_in:Papr_pool_t; pool_out:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Create a named pipe.
 * @param filename The filename of the named pipe
 * @param perm The permissions for the newly created pipe.
 * @param pool The pool to operate on.
  }
(* Const before type ignored *)
function apr_file_namedpipe_create(filename:Pchar; perm:Tapr_fileperms_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Get the timeout value for a pipe or manipulate the blocking state.
 * @param thepipe The pipe we are getting a timeout for.
 * @param timeout The current timeout value in microseconds. 
  }
function apr_file_pipe_timeout_get(thepipe:Papr_file_t; timeout:Papr_interval_time_t):Tapr_status_t;cdecl;external;
{*
 * Set the timeout value for a pipe or manipulate the blocking state.
 * @param thepipe The pipe we are setting a timeout on.
 * @param timeout The timeout value in microseconds.  Values < 0 mean wait 
 *        forever, 0 means do not wait at all.
  }
function apr_file_pipe_timeout_set(thepipe:Papr_file_t; timeout:Tapr_interval_time_t):Tapr_status_t;cdecl;external;
{* file (un)locking functions.  }
{*
 * Establish a lock on the specified, open file. The lock may be advisory
 * or mandatory, at the discretion of the platform. The lock applies to
 * the file as a whole, rather than a specific range. Locks are established
 * on a per-thread/process basis; a second lock by the same thread will not
 * block.
 * @param thefile The file to lock.
 * @param type The type of lock to establish on the file.
  }
function apr_file_lock(thefile:Papr_file_t; _type:longint):Tapr_status_t;cdecl;external;
{*
 * Remove any outstanding locks on the file.
 * @param thefile The file to unlock.
  }
function apr_file_unlock(thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*accessor and general file_io functions.  }
{*
 * return the file name of the current file.
 * @param new_path The path of the file.  
 * @param thefile The currently open file.
  }(* Const before type ignored *)
function apr_file_name_get(new_path:PPchar; thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Return the data associated with the current file.
 * @param data The user data associated with the file.  
 * @param key The key to use for retrieving data associated with this file.
 * @param file The currently open file.
  }(* Const before type ignored *)
function apr_file_data_get(data:Ppointer; key:Pchar; file:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Set the data associated with the current file.
 * @param file The currently open file.
 * @param data The user data to associate with the file.  
 * @param key The key to use for associating data with the file.
 * @param cleanup The cleanup routine to use when the file is destroyed.
  }(* Const before type ignored *)
function apr_file_data_set(file:Papr_file_t; data:pointer; key:Pchar; cleanup:function (para1:pointer):Tapr_status_t):Tapr_status_t;cdecl;external;
{*
 * Write a string to a file using a printf format.
 * @param fptr The file to write to.
 * @param format The format string
 * @param ... The values to substitute in the format string
 * @return The number of bytes written
  }(* Const before type ignored *)
function apr_file_printf(fptr:Papr_file_t; format:Pchar; args:array of const):longint;cdecl;external;
function apr_file_printf(fptr:Papr_file_t; format:Pchar):longint;cdecl;external;
{*
 * set the specified file's permission bits.
 * @param fname The file (name) to apply the permissions to.
 * @param perms The permission bits to apply to the file.
 *
 * @warning Some platforms may not be able to apply all of the
 * available permission bits; #APR_INCOMPLETE will be returned if some
 * permissions are specified which could not be set.
 *
 * @warning Platforms which do not implement this feature will return
 * #APR_ENOTIMPL.
  }
(* Const before type ignored *)
function apr_file_perms_set(fname:Pchar; perms:Tapr_fileperms_t):Tapr_status_t;cdecl;external;
{*
 * Set attributes of the specified file.
 * @param fname The full path to the file (using / on all systems)
 * @param attributes Or'd combination of
 *            @li #APR_FILE_ATTR_READONLY   - make the file readonly
 *            @li #APR_FILE_ATTR_EXECUTABLE - make the file executable
 *            @li #APR_FILE_ATTR_HIDDEN     - make the file hidden
 * @param attr_mask Mask of valid bits in attributes.
 * @param pool the pool to use.
 * @remark This function should be used in preference to explicit manipulation
 *      of the file permissions, because the operations to provide these
 *      attributes are platform specific and may involve more than simply
 *      setting permission bits.
 * @warning Platforms which do not implement this feature will return
 *      #APR_ENOTIMPL.
  }
(* Const before type ignored *)
function apr_file_attrs_set(fname:Pchar; attributes:Tapr_fileattrs_t; attr_mask:Tapr_fileattrs_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Set the mtime of the specified file.
 * @param fname The full path to the file (using / on all systems)
 * @param mtime The mtime to apply to the file.
 * @param pool The pool to use.
 * @warning Platforms which do not implement this feature will return
 *      #APR_ENOTIMPL.
  }
(* Const before type ignored *)
function apr_file_mtime_set(fname:Pchar; mtime:Tapr_time_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Create a new directory on the file system.
 * @param path the path for the directory to be created. (use / on all systems)
 * @param perm Permissions for the new directory.
 * @param pool the pool to use.
  }(* Const before type ignored *)
function apr_dir_make(path:Pchar; perm:Tapr_fileperms_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{* Creates a new directory on the file system, but behaves like
 * 'mkdir -p'. Creates intermediate directories as required. No error
 * will be reported if PATH already exists.
 * @param path the path for the directory to be created. (use / on all systems)
 * @param perm Permissions for the new directory.
 * @param pool the pool to use.
  }
(* Const before type ignored *)
function apr_dir_make_recursive(path:Pchar; perm:Tapr_fileperms_t; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Remove directory from the file system.
 * @param path the path for the directory to be removed. (use / on all systems)
 * @param pool the pool to use.
 * @remark Removing a directory which is in-use (e.g., the current working
 * directory, or during apr_dir_read, or with an open file) is not portable.
  }(* Const before type ignored *)
function apr_dir_remove(path:Pchar; pool:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * get the specified file's stats.
 * @param finfo Where to store the information about the file.
 * @param wanted The desired apr_finfo_t fields, as a bit flag of APR_FINFO_* values 
 * @param thefile The file to get information about.
  }function apr_file_info_get(finfo:Papr_finfo_t; wanted:Tapr_int32_t; thefile:Papr_file_t):Tapr_status_t;cdecl;external;
{*
 * Truncate the file's length to the specified offset
 * @param fp The file to truncate
 * @param offset The offset to truncate to.
 * @remark The read/write file offset is repositioned to offset.
  }
function apr_file_trunc(fp:Papr_file_t; offset:Tapr_off_t):Tapr_status_t;cdecl;external;
{*
 * Retrieve the flags that were passed into apr_file_open()
 * when the file was opened.
 * @return apr_int32_t the flags
  }
function apr_file_flags_get(f:Papr_file_t):Tapr_int32_t;cdecl;external;
{*
 * Get the pool used by the file.
  }
  var
    file : TAPR_POOL_DECLARE_ACCESSOR;cvar;public;
{*
 * Set a file to be inherited by child processes.
 *
  }
    file : TAPR_DECLARE_INHERIT_SET;cvar;public;
{*
 * Unset a file from being inherited by child processes.
  }
    file : TAPR_DECLARE_INHERIT_UNSET;cvar;public;
{*
 * Open a temporary file
 * @param fp The apr file to use as a temporary file.
 * @param templ The template to use when creating a temp file.
 * @param flags The flags to open the file with. If this is zero,
 *              the file is opened with 
 *              #APR_FOPEN_CREATE | #APR_FOPEN_READ | #APR_FOPEN_WRITE |
 *              #APR_FOPEN_EXCL | #APR_FOPEN_DELONCLOSE
 * @param p The pool to allocate the file out of.
 * @remark   
 * This function  generates  a unique temporary file name from template.  
 * The last six characters of template must be XXXXXX and these are replaced 
 * with a string that makes the filename unique. Since it will  be  modified,
 * template must not be a string constant, but should be declared as a character
 * array.  
 *
  }

function apr_file_mktemp(fp:PPapr_file_t; templ:Pchar; flags:Tapr_int32_t; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{*
 * Find an existing directory suitable as a temporary storage location.
 * @param temp_dir The temp directory.
 * @param p The pool to use for any necessary allocations.
 * @remark   
 * This function uses an algorithm to search for a directory that an
 * an application can use for temporary storage.
 *
  }
(* Const before type ignored *)
function apr_temp_dir_get(temp_dir:PPchar; p:Papr_pool_t):Tapr_status_t;cdecl;external;
{* @  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! APR_FILE_IO_H  }

implementation


end.
