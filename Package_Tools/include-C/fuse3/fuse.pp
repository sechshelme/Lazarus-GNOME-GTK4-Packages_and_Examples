
unit fuse;
interface

{
  Automatically converted by H2Pas 1.0.0 from fuse.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fuse.h
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
Pdword  = ^dword;
Pflock  = ^flock;
Pfuse  = ^fuse;
Pfuse_args  = ^fuse_args;
Pfuse_bufvec  = ^fuse_bufvec;
Pfuse_config  = ^fuse_config;
Pfuse_conn_info  = ^fuse_conn_info;
Pfuse_context  = ^fuse_context;
Pfuse_file_info  = ^fuse_file_info;
Pfuse_fill_dir_flags  = ^fuse_fill_dir_flags;
Pfuse_fs  = ^fuse_fs;
Pfuse_loop_config  = ^fuse_loop_config;
Pfuse_module_factory_t  = ^fuse_module_factory_t;
Pfuse_operations  = ^fuse_operations;
Pfuse_pollhandle  = ^fuse_pollhandle;
Pfuse_readdir_flags  = ^fuse_readdir_flags;
Pfuse_session  = ^fuse_session;
Pgid_t  = ^gid_t;
Pstat  = ^stat;
Pstatvfs  = ^statvfs;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  FUSE: Filesystem in Userspace
  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>

  This program can be distributed under the terms of the GNU LGPLv2.
  See the file COPYING.LIB.
 }
{$ifndef FUSE_H_}
{$define FUSE_H_}
{* @file
 *
 * This file defines the library interface of FUSE
 *
 * IMPORTANT: you should define FUSE_USE_VERSION before including this header.
  }
{$include "fuse_common.h"}
{$include <fcntl.h>}
{$include <time.h>}
{$include <sys/types.h>}
{$include <sys/stat.h>}
{$include <sys/statvfs.h>}
{$include <sys/uio.h>}
{ C++ extern C conditionnal removed }
{ ----------------------------------------------------------- *
 * Basic FUSE API					       *
 * -----------------------------------------------------------  }
{* Handle for a FUSE filesystem  }
type
  Pfuse = ^Tfuse;
  Tfuse = record
      {undefined structure}
    end;

{*
 * Readdir flags, passed to ->readdir()
  }
{*
	 * "Plus" mode.
	 *
	 * The kernel wants to prefill the inode cache during readdir.  The
	 * filesystem may honour this by filling in the attributes and setting
	 * FUSE_FILL_DIR_FLAGS for the filler function.  The filesystem may also
	 * just ignore this flag completely.
	  }
  Tfuse_readdir_flags =  Longint;
  Const
    FUSE_READDIR_PLUS = 1 shl 0;

{*
 * Readdir flags, passed to fuse_fill_dir_t callback.
  }
{*
	 * "Plus" mode: all file attributes are valid
	 *
	 * The attributes are used by the kernel to prefill the inode cache
	 * during a readdir.
	 *
	 * It is okay to set FUSE_FILL_DIR_PLUS if FUSE_READDIR_PLUS is not set
	 * and vice versa.
	  }
type
  Tfuse_fill_dir_flags =  Longint;
  Const
    FUSE_FILL_DIR_PLUS = 1 shl 1;

{* Function to add an entry in a readdir() operation
 *
 * The *off* parameter can be any non-zero value that enables the
 * filesystem to identify the current point in the directory
 * stream. It does not need to be the actual physical position. A
 * value of zero is reserved to indicate that seeking in directories
 * is not supported.
 * 
 * @param buf the buffer passed to the readdir() operation
 * @param name the file name of the directory entry
 * @param stbuf file attributes, can be NULL
 * @param off offset of the next entry or zero
 * @param flags fill flags
 * @return 1 if buffer is full, zero otherwise
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tfuse_fill_dir_t = function (buf:pointer; name:Pchar; stbuf:Pstat; off:Toff_t; flags:Tfuse_fill_dir_flags):longint;cdecl;
{*
 * Configuration of the high-level API
 *
 * This structure is initialized from the arguments passed to
 * fuse_new(), and then passed to the file system's init() handler
 * which should ensure that the configuration is compatible with the
 * file system implementation.
  }
{*
	 * If `set_gid` is non-zero, the st_gid attribute of each file
	 * is overwritten with the value of `gid`.
	  }
{*
	 * If `set_uid` is non-zero, the st_uid attribute of each file
	 * is overwritten with the value of `uid`.
	  }
{*
	 * If `set_mode` is non-zero, the any permissions bits set in
	 * `umask` are unset in the st_mode attribute of each file.
	  }
{*
	 * The timeout in seconds for which name lookups will be
	 * cached.
	  }
{*
	 * The timeout in seconds for which a negative lookup will be
	 * cached. This means, that if file did not exist (lookup
	 * returned ENOENT), the lookup will only be redone after the
	 * timeout, and the file/directory will be assumed to not
	 * exist until then. A value of zero means that negative
	 * lookups are not cached.
	  }
{*
	 * The timeout in seconds for which file/directory attributes
	 * (as returned by e.g. the `getattr` handler) are cached.
	  }
{*
	 * Allow requests to be interrupted
	  }
{*
	 * Specify which signal number to send to the filesystem when
	 * a request is interrupted.  The default is hardcoded to
	 * USR1.
	  }
{*
	 * Normally, FUSE assigns inodes to paths only for as long as
	 * the kernel is aware of them. With this option inodes are
	 * instead remembered for at least this many seconds.  This
	 * will require more memory, but may be necessary when using
	 * applications that make use of inode numbers.
	 *
	 * A number of -1 means that inodes will be remembered for the
	 * entire life-time of the file-system process.
	  }
{*
	 * The default behavior is that if an open file is deleted,
	 * the file is renamed to a hidden file (.fuse_hiddenXXX), and
	 * only removed when the file is finally released.  This
	 * relieves the filesystem implementation of having to deal
	 * with this problem. This option disables the hiding
	 * behavior, and files are removed immediately in an unlink
	 * operation (or in a rename operation which overwrites an
	 * existing file).
	 *
	 * It is recommended that you not use the hard_remove
	 * option. When hard_remove is set, the following libc
	 * functions fail on unlinked files (returning errno of
	 * ENOENT): read(2), write(2), fsync(2), close(2), f*xattr(2),
	 * ftruncate(2), fstat(2), fchmod(2), fchown(2)
	  }
{*
	 * Honor the st_ino field in the functions getattr() and
	 * fill_dir(). This value is used to fill in the st_ino field
	 * in the stat(2), lstat(2), fstat(2) functions and the d_ino
	 * field in the readdir(2) function. The filesystem does not
	 * have to guarantee uniqueness, however some applications
	 * rely on this value being unique for the whole filesystem.
	 *
	 * Note that this does *not* affect the inode that libfuse 
	 * and the kernel use internally (also called the "nodeid").
	  }
{*
	 * If use_ino option is not given, still try to fill in the
	 * d_ino field in readdir(2). If the name was previously
	 * looked up, and is still in the cache, the inode number
	 * found there will be used.  Otherwise it will be set to -1.
	 * If use_ino option is given, this option is ignored.
	  }
{*
	 * This option disables the use of page cache (file content cache)
	 * in the kernel for this filesystem. This has several affects:
	 *
	 * 1. Each read(2) or write(2) system call will initiate one
	 *    or more read or write operations, data will not be
	 *    cached in the kernel.
	 *
	 * 2. The return value of the read() and write() system calls
	 *    will correspond to the return values of the read and
	 *    write operations. This is useful for example if the
	 *    file size is not known in advance (before reading it).
	 *
	 * Internally, enabling this option causes fuse to set the
	 * `direct_io` field of `struct fuse_file_info` - overwriting
	 * any value that was put there by the file system.
	  }
{*
	 * This option disables flushing the cache of the file
	 * contents on every open(2).  This should only be enabled on
	 * filesystems where the file data is never changed
	 * externally (not through the mounted FUSE filesystem).  Thus
	 * it is not suitable for network filesystems and other
	 * intermediate filesystems.
	 *
	 * NOTE: if this option is not specified (and neither
	 * direct_io) data is still cached after the open(2), so a
	 * read(2) system call will not always initiate a read
	 * operation.
	 *
	 * Internally, enabling this option causes fuse to set the
	 * `keep_cache` field of `struct fuse_file_info` - overwriting
	 * any value that was put there by the file system.
	  }
{*
	 * This option is an alternative to `kernel_cache`. Instead of
	 * unconditionally keeping cached data, the cached data is
	 * invalidated on open(2) if if the modification time or the
	 * size of the file has changed since it was last opened.
	  }
{*
	 * By default, fuse waits for all pending writes to complete
	 * and calls the FLUSH operation on close(2) of every fuse fd.
	 * With this option, wait and FLUSH are not done for read-only
	 * fuse fd, similar to the behavior of NFS/SMB clients.
	  }
{*
	 * The timeout in seconds for which file attributes are cached
	 * for the purpose of checking if auto_cache should flush the
	 * file data on open.
	  }
{*
	 * If this option is given the file-system handlers for the
	 * following operations will not receive path information:
	 * read, write, flush, release, fallocate, fsync, readdir,
	 * releasedir, fsyncdir, lock, ioctl and poll.
	 *
	 * For the truncate, getattr, chmod, chown and utimens
	 * operations the path will be provided only if the struct
	 * fuse_file_info argument is NULL.
	  }
{*
	 * The remaining options are used by libfuse internally and
	 * should not be touched.
	  }
  Pfuse_config = ^Tfuse_config;
  Tfuse_config = record
      set_gid : longint;cdecl;
      gid : dword;
      set_uid : longint;
      uid : dword;
      set_mode : longint;
      umask : dword;
      entry_timeout : Tdouble;
      negative_timeout : Tdouble;
      attr_timeout : Tdouble;
      intr : longint;
      intr_signal : longint;
      remember : longint;
      hard_remove : longint;
      use_ino : longint;
      readdir_ino : longint;
      direct_io : longint;
      kernel_cache : longint;
      auto_cache : longint;
      no_rofd_flush : longint;
      ac_attr_timeout_set : longint;
      ac_attr_timeout : Tdouble;
      nullpath_ok : longint;
      show_help : longint;
      modules : Pchar;
      debug : longint;
    end;

{*
 * The file system operations:
 *
 * Most of these should work very similarly to the well known UNIX
 * file system operations.  A major exception is that instead of
 * returning an error in 'errno', the operation should return the
 * negated error value (-errno) directly.
 *
 * All methods are optional, but some are essential for a useful
 * filesystem (e.g. getattr).  Open, flush, release, fsync, opendir,
 * releasedir, fsyncdir, access, create, truncate, lock, init and
 * destroy are special purpose methods, without which a full featured
 * filesystem can still be implemented.
 *
 * In general, all methods are expected to perform any necessary
 * permission checking. However, a filesystem may delegate this task
 * to the kernel by passing the `default_permissions` mount option to
 * `fuse_new()`. In this case, methods will only be called if
 * the kernel's permission check has succeeded.
 *
 * Almost all operations take a path which can be of any length.
  }
{* Get file attributes.
	 *
	 * Similar to stat().  The 'st_dev' and 'st_blksize' fields are
	 * ignored. The 'st_ino' field is ignored except if the 'use_ino'
	 * mount option is given. In that case it is passed to userspace,
	 * but libfuse and the kernel will still assign a different
	 * inode for internal use (called the "nodeid").
	 *
	 * `fi` will always be NULL if the file is not currently open, but
	 * may also be NULL if the file is open.
	  }
(* Const before type ignored *)
{* Read the target of a symbolic link
	 *
	 * The buffer should be filled with a null terminated string.  The
	 * buffer size argument includes the space for the terminating
	 * null character.	If the linkname is too long to fit in the
	 * buffer, it should be truncated.	The return value should be 0
	 * for success.
	  }
(* Const before type ignored *)
{* Create a file node
	 *
	 * This is called for creation of all non-directory, non-symlink
	 * nodes.  If the filesystem defines a create() method, then for
	 * regular files that will be called instead.
	  }
(* Const before type ignored *)
{* Create a directory
	 *
	 * Note that the mode argument may not have the type specification
	 * bits set, i.e. S_ISDIR(mode) can be false.  To obtain the
	 * correct directory type bits use  mode|S_IFDIR
	 *  }
(* Const before type ignored *)
{* Remove a file  }
(* Const before type ignored *)
{* Remove a directory  }
(* Const before type ignored *)
{* Create a symbolic link  }
(* Const before type ignored *)
(* Const before type ignored *)
{* Rename a file
	 *
	 * *flags* may be `RENAME_EXCHANGE` or `RENAME_NOREPLACE`. If
	 * RENAME_NOREPLACE is specified, the filesystem must not
	 * overwrite *newname* if it exists and return an error
	 * instead. If `RENAME_EXCHANGE` is specified, the filesystem
	 * must atomically exchange the two files, i.e. both must
	 * exist and neither may be deleted.
	  }
(* Const before type ignored *)
(* Const before type ignored *)
{* Create a hard link to a file  }
(* Const before type ignored *)
(* Const before type ignored *)
{* Change the permission bits of a file
	 *
	 * `fi` will always be NULL if the file is not currently open, but
	 * may also be NULL if the file is open.
	  }
(* Const before type ignored *)
{* Change the owner and group of a file
	 *
	 * `fi` will always be NULL if the file is not currently open, but
	 * may also be NULL if the file is open.
	 *
	 * Unless FUSE_CAP_HANDLE_KILLPRIV is disabled, this method is
	 * expected to reset the setuid and setgid bits.
	  }
(* Const before type ignored *)
{* Change the size of a file
	 *
	 * `fi` will always be NULL if the file is not currently open, but
	 * may also be NULL if the file is open.
	 *
	 * Unless FUSE_CAP_HANDLE_KILLPRIV is disabled, this method is
	 * expected to reset the setuid and setgid bits.
	  }
(* Const before type ignored *)
{* Open a file
	 *
	 * Open flags are available in fi->flags. The following rules
	 * apply.
	 *
	 *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
	 *    filtered out / handled by the kernel.
	 *
	 *  - Access modes (O_RDONLY, O_WRONLY, O_RDWR, O_EXEC, O_SEARCH)
	 *    should be used by the filesystem to check if the operation is
	 *    permitted.  If the ``-o default_permissions`` mount option is
	 *    given, this check is already done by the kernel before calling
	 *    open() and may thus be omitted by the filesystem.
	 *
	 *  - When writeback caching is enabled, the kernel may send
	 *    read requests even for files opened with O_WRONLY. The
	 *    filesystem should be prepared to handle this.
	 *
	 *  - When writeback caching is disabled, the filesystem is
	 *    expected to properly handle the O_APPEND flag and ensure
	 *    that each write is appending to the end of the file.
	 *
	 *  - When writeback caching is enabled, the kernel will
	 *    handle O_APPEND. However, unless all changes to the file
	 *    come through the kernel this will not work reliably. The
	 *    filesystem should thus either ignore the O_APPEND flag
	 *    (and let the kernel handle it), or return an error
	 *    (indicating that reliably O_APPEND is not available).
	 *
	 * Filesystem may store an arbitrary file handle (pointer,
	 * index, etc) in fi->fh, and use this in other all other file
	 * operations (read, write, flush, release, fsync).
	 *
	 * Filesystem may also implement stateless file I/O and not store
	 * anything in fi->fh.
	 *
	 * There are also some flags (direct_io, keep_cache) which the
	 * filesystem may set in fi, to change the way the file is opened.
	 * See fuse_file_info structure in <fuse_common.h> for more details.
	 *
	 * If this request is answered with an error code of ENOSYS
	 * and FUSE_CAP_NO_OPEN_SUPPORT is set in
	 * `fuse_conn_info.capable`, this is treated as success and
	 * future calls to open will also succeed without being send
	 * to the filesystem process.
	 *
	  }
(* Const before type ignored *)
{* Read data from an open file
	 *
	 * Read should return exactly the number of bytes requested except
	 * on EOF or error, otherwise the rest of the data will be
	 * substituted with zeroes.	 An exception to this is when the
	 * 'direct_io' mount option is specified, in which case the return
	 * value of the read system call will reflect the return value of
	 * this operation.
	  }
(* Const before type ignored *)
{* Write data to an open file
	 *
	 * Write should return exactly the number of bytes requested
	 * except on error.	 An exception to this is when the 'direct_io'
	 * mount option is specified (see read operation).
	 *
	 * Unless FUSE_CAP_HANDLE_KILLPRIV is disabled, this method is
	 * expected to reset the setuid and setgid bits.
	  }
(* Const before type ignored *)
(* Const before type ignored *)
{* Get file system statistics
	 *
	 * The 'f_favail', 'f_fsid' and 'f_flag' fields are ignored
	  }
(* Const before type ignored *)
{* Possibly flush cached data
	 *
	 * BIG NOTE: This is not equivalent to fsync().  It's not a
	 * request to sync dirty data.
	 *
	 * Flush is called on each close() of a file descriptor, as opposed to
	 * release which is called on the close of the last file descriptor for
	 * a file.  Under Linux, errors returned by flush() will be passed to 
	 * userspace as errors from close(), so flush() is a good place to write
	 * back any cached dirty data. However, many applications ignore errors 
	 * on close(), and on non-Linux systems, close() may succeed even if flush()
	 * returns an error. For these reasons, filesystems should not assume
	 * that errors returned by flush will ever be noticed or even
	 * delivered.
	 *
	 * NOTE: The flush() method may be called more than once for each
	 * open().  This happens if more than one file descriptor refers to an
	 * open file handle, e.g. due to dup(), dup2() or fork() calls.  It is
	 * not possible to determine if a flush is final, so each flush should
	 * be treated equally.  Multiple write-flush sequences are relatively
	 * rare, so this shouldn't be a problem.
	 *
	 * Filesystems shouldn't assume that flush will be called at any
	 * particular point.  It may be called more times than expected, or not
	 * at all.
	 *
	 * [close]: http://pubs.opengroup.org/onlinepubs/9699919799/functions/close.html
	  }
(* Const before type ignored *)
{* Release an open file
	 *
	 * Release is called when there are no more references to an open
	 * file: all file descriptors are closed and all memory mappings
	 * are unmapped.
	 *
	 * For every open() call there will be exactly one release() call
	 * with the same flags and file handle.  It is possible to
	 * have a file opened more than once, in which case only the last
	 * release will mean, that no more reads/writes will happen on the
	 * file.  The return value of release is ignored.
	  }
(* Const before type ignored *)
{* Synchronize file contents
	 *
	 * If the datasync parameter is non-zero, then only the user data
	 * should be flushed, not the meta data.
	  }
(* Const before type ignored *)
{* Set extended attributes  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{* Get extended attributes  }
(* Const before type ignored *)
(* Const before type ignored *)
{* List extended attributes  }
(* Const before type ignored *)
{* Remove extended attributes  }
(* Const before type ignored *)
(* Const before type ignored *)
{* Open directory
	 *
	 * Unless the 'default_permissions' mount option is given,
	 * this method should check if opendir is permitted for this
	 * directory. Optionally opendir may also return an arbitrary
	 * filehandle in the fuse_file_info structure, which will be
	 * passed to readdir, releasedir and fsyncdir.
	  }
(* Const before type ignored *)
{* Read directory
	 *
	 * The filesystem may choose between two modes of operation:
	 *
	 * 1) The readdir implementation ignores the offset parameter, and
	 * passes zero to the filler function's offset.  The filler
	 * function will not return '1' (unless an error happens), so the
	 * whole directory is read in a single readdir operation.
	 *
	 * 2) The readdir implementation keeps track of the offsets of the
	 * directory entries.  It uses the offset parameter and always
	 * passes non-zero offset to the filler function.  When the buffer
	 * is full (or an error happens) the filler function will return
	 * '1'.
	 *
	 * When FUSE_READDIR_PLUS is not set, only some parameters of the
	 * fill function (the fuse_fill_dir_t parameter) are actually used:
	 * The file type (which is part of stat::st_mode) is used. And if
	 * fuse_config::use_ino is set, the inode (stat::st_ino) is also
	 * used. The other fields are ignored when FUSE_READDIR_PLUS is not
	 * set.
	  }
(* Const before type ignored *)
{* Release directory
	 *
	 * If the directory has been removed after the call to opendir, the
	 * path parameter will be NULL.
	  }
(* Const before type ignored *)
{* Synchronize directory contents
	 *
	 * If the directory has been removed after the call to opendir, the
	 * path parameter will be NULL.
	 *
	 * If the datasync parameter is non-zero, then only the user data
	 * should be flushed, not the meta data
	  }
(* Const before type ignored *)
{*
	 * Initialize filesystem
	 *
	 * The return value will passed in the `private_data` field of
	 * `struct fuse_context` to all file operations, and as a
	 * parameter to the destroy() method. It overrides the initial
	 * value provided to fuse_main() / fuse_new().
	  }
{*
	 * Clean up filesystem
	 *
	 * Called on filesystem exit.
	  }
{*
	 * Check file access permissions
	 *
	 * This will be called for the access() system call.  If the
	 * 'default_permissions' mount option is given, this method is not
	 * called.
	 *
	 * This method is not called under Linux kernel versions 2.4.x
	  }
(* Const before type ignored *)
{*
	 * Create and open a file
	 *
	 * If the file does not exist, first create it with the specified
	 * mode, and then open it.
	 *
	 * If this method is not implemented or under Linux kernel
	 * versions earlier than 2.6.15, the mknod() and open() methods
	 * will be called instead.
	  }
(* Const before type ignored *)
{*
	 * Perform POSIX file locking operation
	 *
	 * The cmd argument will be either F_GETLK, F_SETLK or F_SETLKW.
	 *
	 * For the meaning of fields in 'struct flock' see the man page
	 * for fcntl(2).  The l_whence field will always be set to
	 * SEEK_SET.
	 *
	 * For checking lock ownership, the 'fuse_file_info->owner'
	 * argument must be used.
	 *
	 * For F_GETLK operation, the library will first check currently
	 * held locks, and if a conflicting lock is found it will return
	 * information without calling this method.	 This ensures, that
	 * for local locks the l_pid field is correctly filled in.	The
	 * results may not be accurate in case of race conditions and in
	 * the presence of hard links, but it's unlikely that an
	 * application would rely on accurate GETLK results in these
	 * cases.  If a conflicting lock is not found, this method will be
	 * called, and the filesystem may fill out l_pid by a meaningful
	 * value, or it may leave this field zero.
	 *
	 * For F_SETLK and F_SETLKW the l_pid field will be set to the pid
	 * of the process performing the locking operation.
	 *
	 * Note: if this method is not implemented, the kernel will still
	 * allow file locking to work locally.  Hence it is only
	 * interesting for network filesystems and similar.
	  }
(* Const before type ignored *)
{*
	 * Change the access and modification times of a file with
	 * nanosecond resolution
	 *
	 * This supersedes the old utime() interface.  New applications
	 * should use this.
	 *
	 * `fi` will always be NULL if the file is not currently open, but
	 * may also be NULL if the file is open.
	 *
	 * See the utimensat(2) man page for details.
	  }
(* Const before type ignored *)
(* Const before type ignored *)
{*
	 * Map block index within file to block index within device
	 *
	 * Note: This makes sense only for block device backed filesystems
	 * mounted with the 'blkdev' option
	  }
(* Const before type ignored *)
{$if FUSE_USE_VERSION < 35}
(* Const before type ignored *)
{$else}
{*
	 * Ioctl
	 *
	 * flags will have FUSE_IOCTL_COMPAT set for 32bit ioctls in
	 * 64bit environment.  The size and direction of data is
	 * determined by _IOC_*() decoding of cmd.  For _IOC_NONE,
	 * data will be NULL, for _IOC_WRITE data is out area, for
	 * _IOC_READ in area and if both are set in/out area.  In all
	 * non-NULL cases, the area is of _IOC_SIZE(cmd) bytes.
	 *
	 * If flags has FUSE_IOCTL_DIR then the fuse_file_info refers to a
	 * directory file handle.
	 *
	 * Note : the unsigned long request submitted by the application
	 * is truncated to 32 bits.
	  }
(* Const before type ignored *)
{$endif}
{*
	 * Poll for IO readiness events
	 *
	 * Note: If ph is non-NULL, the client should notify
	 * when IO readiness events occur by calling
	 * fuse_notify_poll() with the specified ph.
	 *
	 * Regardless of the number of times poll with a non-NULL ph
	 * is received, single notification is enough to clear all.
	 * Notifying more times incurs overhead but doesn't harm
	 * correctness.
	 *
	 * The callee is responsible for destroying ph with
	 * fuse_pollhandle_destroy() when no longer in use.
	  }
(* Const before type ignored *)
{* Write contents of buffer to an open file
	 *
	 * Similar to the write() method, but data is supplied in a
	 * generic buffer.  Use fuse_buf_copy() to transfer data to
	 * the destination.
	 *
	 * Unless FUSE_CAP_HANDLE_KILLPRIV is disabled, this method is
	 * expected to reset the setuid and setgid bits.
	  }
(* Const before type ignored *)
{* Store data from an open file in a buffer
	 *
	 * Similar to the read() method, but data is stored and
	 * returned in a generic buffer.
	 *
	 * No actual copying of data has to take place, the source
	 * file descriptor may simply be stored in the buffer for
	 * later data transfer.
	 *
	 * The buffer must be allocated dynamically and stored at the
	 * location pointed to by bufp.  If the buffer contains memory
	 * regions, they too must be allocated using malloc().  The
	 * allocated memory will be freed by the caller.
	  }
(* Const before type ignored *)
{*
	 * Perform BSD file locking operation
	 *
	 * The op argument will be either LOCK_SH, LOCK_EX or LOCK_UN
	 *
	 * Nonblocking requests will be indicated by ORing LOCK_NB to
	 * the above operations
	 *
	 * For more information see the flock(2) manual page.
	 *
	 * Additionally fi->owner will be set to a value unique to
	 * this open file.  This same value will be supplied to
	 * ->release() when the file is released.
	 *
	 * Note: if this method is not implemented, the kernel will still
	 * allow file locking to work locally.  Hence it is only
	 * interesting for network filesystems and similar.
	  }
(* Const before type ignored *)
{*
	 * Allocates space for an open file
	 *
	 * This function ensures that required space is allocated for specified
	 * file.  If this function returns success then any subsequent write
	 * request to specified range is guaranteed not to fail because of lack
	 * of space on the file system media.
	  }
(* Const before type ignored *)
{*
	 * Copy a range of data from one file to another
	 *
	 * Performs an optimized copy between two file descriptors without the
	 * additional cost of transferring data through the FUSE kernel module
	 * to user space (glibc) and then back into the FUSE filesystem again.
	 *
	 * In case this method is not implemented, applications are expected to
	 * fall back to a regular file copy.   (Some glibc versions did this
	 * emulation automatically, but the emulation has been removed from all
	 * glibc release branches.)
	  }
(* Const before type ignored *)
(* Const before type ignored *)
{*
	 * Find next data or hole after the specified offset
	  }
(* Const before type ignored *)
type
  Pfuse_operations = ^Tfuse_operations;
  Tfuse_operations = record
      getattr : function (para1:Pchar; para2:Pstat; fi:Pfuse_file_info):longint;cdecl;
      readlink : function (para1:Pchar; para2:Pchar; para3:Tsize_t):longint;cdecl;
      mknod : function (para1:Pchar; para2:Tmode_t; para3:Tdev_t):longint;cdecl;
      mkdir : function (para1:Pchar; para2:Tmode_t):longint;cdecl;
      unlink : function (para1:Pchar):longint;cdecl;
      rmdir : function (para1:Pchar):longint;cdecl;
      symlink : function (para1:Pchar; para2:Pchar):longint;cdecl;
      rename : function (para1:Pchar; para2:Pchar; flags:dword):longint;cdecl;
      link : function (para1:Pchar; para2:Pchar):longint;cdecl;
      chmod : function (para1:Pchar; para2:Tmode_t; fi:Pfuse_file_info):longint;cdecl;
      chown : function (para1:Pchar; para2:Tuid_t; para3:Tgid_t; fi:Pfuse_file_info):longint;cdecl;
      truncate : function (para1:Pchar; para2:Toff_t; fi:Pfuse_file_info):longint;cdecl;
      open : function (para1:Pchar; para2:Pfuse_file_info):longint;cdecl;
      read : function (para1:Pchar; para2:Pchar; para3:Tsize_t; para4:Toff_t; para5:Pfuse_file_info):longint;cdecl;
      write : function (para1:Pchar; para2:Pchar; para3:Tsize_t; para4:Toff_t; para5:Pfuse_file_info):longint;cdecl;
      statfs : function (para1:Pchar; para2:Pstatvfs):longint;cdecl;
      flush : function (para1:Pchar; para2:Pfuse_file_info):longint;cdecl;
      release : function (para1:Pchar; para2:Pfuse_file_info):longint;cdecl;
      fsync : function (para1:Pchar; para2:longint; para3:Pfuse_file_info):longint;cdecl;
      setxattr : function (para1:Pchar; para2:Pchar; para3:Pchar; para4:Tsize_t; para5:longint):longint;cdecl;
      getxattr : function (para1:Pchar; para2:Pchar; para3:Pchar; para4:Tsize_t):longint;cdecl;
      listxattr : function (para1:Pchar; para2:Pchar; para3:Tsize_t):longint;cdecl;
      removexattr : function (para1:Pchar; para2:Pchar):longint;cdecl;
      opendir : function (para1:Pchar; para2:Pfuse_file_info):longint;cdecl;
      readdir : function (para1:Pchar; para2:pointer; para3:Tfuse_fill_dir_t; para4:Toff_t; para5:Pfuse_file_info; 
                   para6:Tfuse_readdir_flags):longint;cdecl;
      releasedir : function (para1:Pchar; para2:Pfuse_file_info):longint;cdecl;
      fsyncdir : function (para1:Pchar; para2:longint; para3:Pfuse_file_info):longint;cdecl;
      init : function (conn:Pfuse_conn_info; cfg:Pfuse_config):pointer;cdecl;
      destroy : procedure (private_data:pointer);cdecl;
      access : function (para1:Pchar; para2:longint):longint;cdecl;
      create : function (para1:Pchar; para2:Tmode_t; para3:Pfuse_file_info):longint;cdecl;
      lock : function (para1:Pchar; para2:Pfuse_file_info; cmd:longint; para4:Pflock):longint;cdecl;
      utimens : function (para1:Pchar; tv:array[0..1] of Ttimespec; fi:Pfuse_file_info):longint;cdecl;
      bmap : function (para1:Pchar; blocksize:Tsize_t; idx:Puint64_t):longint;cdecl;
      ioctl : function (para1:Pchar; cmd:longint; arg:pointer; para4:Pfuse_file_info; flags:dword; 
                   data:pointer):longint;cdecl;
      ioctl : function (para1:Pchar; cmd:dword; arg:pointer; para4:Pfuse_file_info; flags:dword; 
                   data:pointer):longint;cdecl;
      poll : function (para1:Pchar; para2:Pfuse_file_info; ph:Pfuse_pollhandle; reventsp:Pdword):longint;cdecl;
      write_buf : function (para1:Pchar; buf:Pfuse_bufvec; off:Toff_t; para4:Pfuse_file_info):longint;cdecl;
      read_buf : function (para1:Pchar; bufp:PPfuse_bufvec; size:Tsize_t; off:Toff_t; para5:Pfuse_file_info):longint;cdecl;
      flock : function (para1:Pchar; para2:Pfuse_file_info; op:longint):longint;cdecl;
      fallocate : function (para1:Pchar; para2:longint; para3:Toff_t; para4:Toff_t; para5:Pfuse_file_info):longint;cdecl;
      copy_file_range : function (path_in:Pchar; fi_in:Pfuse_file_info; offset_in:Toff_t; path_out:Pchar; fi_out:Pfuse_file_info; 
                   offset_out:Toff_t; size:Tsize_t; flags:longint):Tssize_t;cdecl;
      lseek : function (para1:Pchar; off:Toff_t; whence:longint; para4:Pfuse_file_info):Toff_t;cdecl;
    end;

{* Extra context that may be needed by some filesystems
 *
 * The uid, gid and pid fields are not filled in case of a writepage
 * operation.
  }
{* Pointer to the fuse object  }
{* User ID of the calling process  }
{* Group ID of the calling process  }
{* Process ID of the calling thread  }
{* Private filesystem data  }
{* Umask of the calling process  }
  Pfuse_context = ^Tfuse_context;
  Tfuse_context = record
      fuse : Pfuse;
      uid : Tuid_t;
      gid : Tgid_t;
      pid : Tpid_t;
      private_data : pointer;
      umask : Tmode_t;
    end;

{*
 * Main function of FUSE.
 *
 * This is for the lazy.  This is all that has to be called from the
 * main() function.
 *
 * This function does the following:
 *   - parses command line options, and handles --help and
 *     --version
 *   - installs signal handlers for INT, HUP, TERM and PIPE
 *   - registers an exit handler to unmount the filesystem on program exit
 *   - creates a fuse handle
 *   - registers the operations
 *   - calls either the single-threaded or the multi-threaded event loop
 *
 * Most file systems will have to parse some file-system specific
 * arguments before calling this function. It is recommended to do
 * this with fuse_opt_parse() and a processing function that passes
 * through any unknown options (this can also be achieved by just
 * passing NULL as the processing function). That way, the remaining
 * options can be passed directly to fuse_main().
 *
 * fuse_main() accepts all options that can be passed to
 * fuse_parse_cmdline(), fuse_new(), or fuse_session_new().
 *
 * Option parsing skips argv[0], which is assumed to contain the
 * program name. This element must always be present and is used to
 * construct a basic ``usage: `` message for the --help
 * output. argv[0] may also be set to the empty string. In this case
 * the usage message is suppressed. This can be used by file systems
 * to print their own usage line first. See hello.c for an example of
 * how to do this.
 *
 * Note: this is currently implemented as a macro.
 *
 * The following error codes may be returned from fuse_main():
 *   1: Invalid option arguments
 *   2: No mount point specified
 *   3: FUSE setup failed
 *   4: Mounting failed
 *   5: Failed to daemonize (detach from session)
 *   6: Failed to set up signal handlers
 *   7: An error occurred during the life of the file system
 *
 * @param argc the argument counter passed to the main() function
 * @param argv the argument vector passed to the main() function
 * @param op the file system operation
 * @param private_data Initial value for the `private_data`
 *            field of `struct fuse_context`. May be overridden by the
 *            `struct fuse_operations.init` handler.
 * @return 0 on success, nonzero on failure
 *
 * Example usage, see hello.c
  }
{
  int fuse_main(int argc, char *argv[], const struct fuse_operations *op,
  void *private_data);
 }
{ xxxxxxxxx #define fuse_main(argc, argv, op, private_data)					fuse_main_real(argc, argv, op, sizeof(*(op)), private_data) }
{ ----------------------------------------------------------- *
 * More detailed API					       *
 * -----------------------------------------------------------  }
{*
 * Print available options (high- and low-level) to stdout.  This is
 * not an exhaustive list, but includes only those options that may be
 * of interest to an end-user of a file system.
 *
 * The function looks at the argument vector only to determine if
 * there are additional modules to be loaded (module=foo option),
 * and attempts to call their help functions as well.
 *
 * @param args the argument vector.
  }

procedure fuse_lib_help(args:Pfuse_args);cdecl;external;
{*
 * Create a new FUSE filesystem.
 *
 * This function accepts most file-system independent mount options
 * (like context, nodev, ro - see mount(8)), as well as the
 * FUSE-specific mount options from mount.fuse(8).
 *
 * If the --help option is specified, the function writes a help text
 * to stdout and returns NULL.
 *
 * Option parsing skips argv[0], which is assumed to contain the
 * program name. This element must always be present and is used to
 * construct a basic ``usage: `` message for the --help output. If
 * argv[0] is set to the empty string, no usage message is included in
 * the --help output.
 *
 * If an unknown option is passed in, an error message is written to
 * stderr and the function returns NULL.
 *
 * @param args argument vector
 * @param op the filesystem operations
 * @param op_size the size of the fuse_operations structure
 * @param private_data Initial value for the `private_data`
 *            field of `struct fuse_context`. May be overridden by the
 *            `struct fuse_operations.init` handler.
 * @return the created FUSE handle
  }
{$if FUSE_USE_VERSION == 30}
(* Const before type ignored *)

function fuse_new_30(args:Pfuse_args; op:Pfuse_operations; op_size:Tsize_t; private_data:pointer):Pfuse;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_new(args,op,size,data : longint) : longint;

{$else}
{$if (defined(LIBFUSE_BUILT_WITH_VERSIONED_SYMBOLS))}
(* Const before type ignored *)

function fuse_new(args:Pfuse_args; op:Pfuse_operations; op_size:Tsize_t; private_data:pointer):Pfuse;cdecl;external;
{$else}
{ LIBFUSE_BUILT_WITH_VERSIONED_SYMBOLS  }
(* Const before type ignored *)

function fuse_new_31(args:Pfuse_args; op:Pfuse_operations; op_size:Tsize_t; user_data:pointer):Pfuse;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_new(args,op,size,data : longint) : longint;

{$endif}
{ LIBFUSE_BUILT_WITH_VERSIONED_SYMBOLS  }
{$endif}
{*
 * Mount a FUSE file system.
 *
 * @param mountpoint the mount point path
 * @param f the FUSE handle
 *
 * @return 0 on success, -1 on failure.
 * }
(* Const before type ignored *)

function fuse_mount(f:Pfuse; mountpoint:Pchar):longint;cdecl;external;
{*
 * Unmount a FUSE file system.
 *
 * See fuse_session_unmount() for additional information.
 *
 * @param f the FUSE handle
 * }
procedure fuse_unmount(f:Pfuse);cdecl;external;
{*
 * Destroy the FUSE handle.
 *
 * NOTE: This function does not unmount the filesystem.	 If this is
 * needed, call fuse_unmount() before calling this function.
 *
 * @param f the FUSE handle
  }
procedure fuse_destroy(f:Pfuse);cdecl;external;
{*
 * FUSE event loop.
 *
 * Requests from the kernel are processed, and the appropriate
 * operations are called.
 *
 * For a description of the return value and the conditions when the
 * event loop exits, refer to the documentation of
 * fuse_session_loop().
 *
 * @param f the FUSE handle
 * @return see fuse_session_loop()
 *
 * See also: fuse_loop_mt()
  }
function fuse_loop(f:Pfuse):longint;cdecl;external;
{*
 * Flag session as terminated
 *
 * This function will cause any running event loops to exit on
 * the next opportunity.
 *
 * @param f the FUSE handle
  }
procedure fuse_exit(f:Pfuse);cdecl;external;
{$if FUSE_USE_VERSION < 32}

function fuse_loop_mt_31(f:Pfuse; clone_fd:longint):longint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_loop_mt(f,clone_fd : longint) : longint;

(*** was #elif ****){$else FUSE_USE_VERSION < FUSE_MAKE_VERSION(3, 12)}

function fuse_loop_mt_32(f:Pfuse; config:Pfuse_loop_config):longint;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_loop_mt(f,config : longint) : longint;

{$else}
{*
 * FUSE event loop with multiple threads
 *
 * Requests from the kernel are processed, and the appropriate
 * operations are called.  Request are processed in parallel by
 * distributing them between multiple threads.
 *
 * For a description of the return value and the conditions when the
 * event loop exits, refer to the documentation of
 * fuse_session_loop().
 *
 * Note: using fuse_loop() instead of fuse_loop_mt() means you are running in
 * single-threaded mode, and that you will not have to worry about reentrancy,
 * though you will have to worry about recursive lookups. In single-threaded
 * mode, FUSE will wait for one callback to return before calling another.
 *
 * Enabling multiple threads, by using fuse_loop_mt(), will cause FUSE to make
 * multiple simultaneous calls into the various callback functions given by your
 * fuse_operations record.
 *
 * If you are using multiple threads, you can enjoy all the parallel execution
 * and interactive response benefits of threads, and you get to enjoy all the
 * benefits of race conditions and locking bugs, too. Ensure that any code used
 * in the callback function of fuse_operations is also thread-safe.
 *
 * @param f the FUSE handle
 * @param config loop configuration, may be NULL and defaults will be used then
 * @return see fuse_session_loop()
 *
 * See also: fuse_loop()
  }
{$if (defined(LIBFUSE_BUILT_WITH_VERSIONED_SYMBOLS))}

function fuse_loop_mt(f:Pfuse; config:Pfuse_loop_config):longint;cdecl;external;
{$else}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function fuse_loop_mt(f,config : longint) : longint;

{$endif}
{ LIBFUSE_BUILT_WITH_VERSIONED_SYMBOLS  }
{$endif}
{*
 * Get the current context
 *
 * The context is only valid for the duration of a filesystem
 * operation, and thus must not be stored and used later.
 *
 * @return the context
  }

function fuse_get_context:Pfuse_context;cdecl;external;
{*
 * Get the current supplementary group IDs for the current request
 *
 * Similar to the getgroups(2) system call, except the return value is
 * always the total number of group IDs, even if it is larger than the
 * specified size.
 *
 * The current fuse kernel module in linux (as of 2.6.30) doesn't pass
 * the group list to userspace, hence this function needs to parse
 * "/proc/$TID/task/$TID/status" to get the group IDs.
 *
 * This feature may not be supported on all operating systems.  In
 * such a case this function will return -ENOSYS.
 *
 * @param size size of given array
 * @param list array of group IDs to be filled in
 * @return the total number of supplementary group IDs or -errno on failure
  }
function fuse_getgroups(size:longint; list:Pgid_t):longint;cdecl;external;
{*
 * Check if the current request has already been interrupted
 *
 * @return 1 if the request has been interrupted, 0 otherwise
  }
function fuse_interrupted:longint;cdecl;external;
{*
 * Invalidates cache for the given path.
 *
 * This calls fuse_lowlevel_notify_inval_inode internally.
 *
 * @return 0 on successful invalidation, negative error value otherwise.
 *         This routine may return -ENOENT to indicate that there was
 *         no entry to be invalidated, e.g., because the path has not
 *         been seen before or has been forgotten; this should not be
 *         considered to be an error.
  }
(* Const before type ignored *)
function fuse_invalidate_path(f:Pfuse; path:Pchar):longint;cdecl;external;
{*
 * The real main function
 *
 * Do not call this directly, use fuse_main()
  }
(* Const before type ignored *)
function fuse_main_real(argc:longint; argv:PPchar; op:Pfuse_operations; op_size:Tsize_t; private_data:pointer):longint;cdecl;external;
{*
 * Start the cleanup thread when using option "remember".
 *
 * This is done automatically by fuse_loop_mt()
 * @param fuse struct fuse pointer for fuse instance
 * @return 0 on success and -1 on error
  }
function fuse_start_cleanup_thread(fuse:Pfuse):longint;cdecl;external;
{*
 * Stop the cleanup thread when using option "remember".
 *
 * This is done automatically by fuse_loop_mt()
 * @param fuse struct fuse pointer for fuse instance
  }
procedure fuse_stop_cleanup_thread(fuse:Pfuse);cdecl;external;
{*
 * Iterate over cache removing stale entries
 * use in conjunction with "-oremember"
 *
 * NOTE: This is already done for the standard sessions
 *
 * @param fuse struct fuse pointer for fuse instance
 * @return the number of seconds until the next cleanup
  }
function fuse_clean_cache(fuse:Pfuse):longint;cdecl;external;
{
 * Stacking API
  }
{*
 * Fuse filesystem object
 *
 * This is opaque object represents a filesystem layer
  }
type
  Pfuse_fs = ^Tfuse_fs;
  Tfuse_fs = record
      {undefined structure}
    end;

{
 * These functions call the relevant filesystem operation, and return
 * the result.
 *
 * If the operation is not defined, they return -ENOSYS, with the
 * exception of fuse_fs_open, fuse_fs_release, fuse_fs_opendir,
 * fuse_fs_releasedir and fuse_fs_statfs, which return 0.
  }
(* Const before type ignored *)

function fuse_fs_getattr(fs:Pfuse_fs; path:Pchar; buf:Pstat; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_rename(fs:Pfuse_fs; oldpath:Pchar; newpath:Pchar; flags:dword):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_unlink(fs:Pfuse_fs; path:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_rmdir(fs:Pfuse_fs; path:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_symlink(fs:Pfuse_fs; linkname:Pchar; path:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_link(fs:Pfuse_fs; oldpath:Pchar; newpath:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_release(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_open(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_read(fs:Pfuse_fs; path:Pchar; buf:Pchar; size:Tsize_t; off:Toff_t; 
           fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_read_buf(fs:Pfuse_fs; path:Pchar; bufp:PPfuse_bufvec; size:Tsize_t; off:Toff_t; 
           fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_write(fs:Pfuse_fs; path:Pchar; buf:Pchar; size:Tsize_t; off:Toff_t; 
           fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_write_buf(fs:Pfuse_fs; path:Pchar; buf:Pfuse_bufvec; off:Toff_t; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_fsync(fs:Pfuse_fs; path:Pchar; datasync:longint; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_flush(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_statfs(fs:Pfuse_fs; path:Pchar; buf:Pstatvfs):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_opendir(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_readdir(fs:Pfuse_fs; path:Pchar; buf:pointer; filler:Tfuse_fill_dir_t; off:Toff_t; 
           fi:Pfuse_file_info; flags:Tfuse_readdir_flags):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_fsyncdir(fs:Pfuse_fs; path:Pchar; datasync:longint; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_releasedir(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_create(fs:Pfuse_fs; path:Pchar; mode:Tmode_t; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_lock(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info; cmd:longint; lock:Pflock):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_flock(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info; op:longint):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_chmod(fs:Pfuse_fs; path:Pchar; mode:Tmode_t; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_chown(fs:Pfuse_fs; path:Pchar; uid:Tuid_t; gid:Tgid_t; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_truncate(fs:Pfuse_fs; path:Pchar; size:Toff_t; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_utimens(fs:Pfuse_fs; path:Pchar; tv:array[0..1] of Ttimespec; fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_access(fs:Pfuse_fs; path:Pchar; mask:longint):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_readlink(fs:Pfuse_fs; path:Pchar; buf:Pchar; len:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_mknod(fs:Pfuse_fs; path:Pchar; mode:Tmode_t; rdev:Tdev_t):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_mkdir(fs:Pfuse_fs; path:Pchar; mode:Tmode_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_setxattr(fs:Pfuse_fs; path:Pchar; name:Pchar; value:Pchar; size:Tsize_t; 
           flags:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_getxattr(fs:Pfuse_fs; path:Pchar; name:Pchar; value:Pchar; size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_listxattr(fs:Pfuse_fs; path:Pchar; list:Pchar; size:Tsize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_removexattr(fs:Pfuse_fs; path:Pchar; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_bmap(fs:Pfuse_fs; path:Pchar; blocksize:Tsize_t; idx:Puint64_t):longint;cdecl;external;
{$if FUSE_USE_VERSION < 35}
(* Const before type ignored *)

function fuse_fs_ioctl(fs:Pfuse_fs; path:Pchar; cmd:longint; arg:pointer; fi:Pfuse_file_info; 
           flags:dword; data:pointer):longint;cdecl;external;
{$else}
(* Const before type ignored *)

function fuse_fs_ioctl(fs:Pfuse_fs; path:Pchar; cmd:dword; arg:pointer; fi:Pfuse_file_info; 
           flags:dword; data:pointer):longint;cdecl;external;
{$endif}
(* Const before type ignored *)

function fuse_fs_poll(fs:Pfuse_fs; path:Pchar; fi:Pfuse_file_info; ph:Pfuse_pollhandle; reventsp:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function fuse_fs_fallocate(fs:Pfuse_fs; path:Pchar; mode:longint; offset:Toff_t; length:Toff_t; 
           fi:Pfuse_file_info):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_fs_copy_file_range(fs:Pfuse_fs; path_in:Pchar; fi_in:Pfuse_file_info; off_in:Toff_t; path_out:Pchar; 
           fi_out:Pfuse_file_info; off_out:Toff_t; len:Tsize_t; flags:longint):Tssize_t;cdecl;external;
(* Const before type ignored *)
function fuse_fs_lseek(fs:Pfuse_fs; path:Pchar; off:Toff_t; whence:longint; fi:Pfuse_file_info):Toff_t;cdecl;external;
procedure fuse_fs_init(fs:Pfuse_fs; conn:Pfuse_conn_info; cfg:Pfuse_config);cdecl;external;
procedure fuse_fs_destroy(fs:Pfuse_fs);cdecl;external;
function fuse_notify_poll(ph:Pfuse_pollhandle):longint;cdecl;external;
{*
 * Create a new fuse filesystem object
 *
 * This is usually called from the factory of a fuse module to create
 * a new instance of a filesystem.
 *
 * @param op the filesystem operations
 * @param op_size the size of the fuse_operations structure
 * @param private_data Initial value for the `private_data`
 *            field of `struct fuse_context`. May be overridden by the
 *            `struct fuse_operations.init` handler.
 * @return a new filesystem object
  }
(* Const before type ignored *)
function fuse_fs_new(op:Pfuse_operations; op_size:Tsize_t; private_data:pointer):Pfuse_fs;cdecl;external;
{*
 * Factory for creating filesystem objects
 *
 * The function may use and remove options from 'args' that belong
 * to this module.
 *
 * For now the 'fs' vector always contains exactly one filesystem.
 * This is the filesystem which will be below the newly created
 * filesystem in the stack.
 *
 * @param args the command line arguments
 * @param fs NULL terminated filesystem object vector
 * @return the new filesystem object
  }
type
  Pfuse_module_factory_t = ^Tfuse_module_factory_t;
  Tfuse_module_factory_t = function (args:Pfuse_args; fs:PPfuse_fs):Pfuse_fs;cdecl;
{*
 * Register filesystem module
 *
 * If the "-omodules=*name*_:..." option is present, filesystem
 * objects are created and pushed onto the stack with the *factory_*
 * function.
 *
 * @param name_ the name of this filesystem module
 * @param factory_ the factory function for this filesystem module
  }
{* Get session from fuse object  }

function fuse_get_session(f:Pfuse):Pfuse_session;cdecl;external;
{*
 * Open a FUSE file descriptor and set up the mount for the given
 * mountpoint and flags.
 *
 * @param mountpoint reference to the mount in the file system
 * @param options mount options
 * @return the FUSE file descriptor or -1 upon error
  }
(* Const before type ignored *)
(* Const before type ignored *)
function fuse_open_channel(mountpoint:Pchar; options:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ FUSE_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_new(args,op,size,data : longint) : longint;
begin
  fuse_new:=fuse_new_30(args,op,size,data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_new(args,op,size,data : longint) : longint;
begin
  fuse_new:=fuse_new_31(args,op,size,data);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_loop_mt(f,clone_fd : longint) : longint;
begin
  fuse_loop_mt:=fuse_loop_mt_31(f,clone_fd);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_loop_mt(f,config : longint) : longint;
begin
  fuse_loop_mt:=fuse_loop_mt_32(f,config);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function fuse_loop_mt(f,config : longint) : longint;
begin
  fuse_loop_mt:=fuse_loop_mt_312(f,config);
end;


end.
