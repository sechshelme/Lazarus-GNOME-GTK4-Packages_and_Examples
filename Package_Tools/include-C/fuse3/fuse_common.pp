
unit fuse_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from fuse_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fuse_common.h
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
Pfuse_args  = ^fuse_args;
Pfuse_buf  = ^fuse_buf;
Pfuse_buf_copy_flags  = ^fuse_buf_copy_flags;
Pfuse_buf_flags  = ^fuse_buf_flags;
Pfuse_bufvec  = ^fuse_bufvec;
Pfuse_conn_info  = ^fuse_conn_info;
Pfuse_conn_info_opts  = ^fuse_conn_info_opts;
Pfuse_file_info  = ^fuse_file_info;
Pfuse_loop_config  = ^fuse_loop_config;
Pfuse_loop_config_v1  = ^fuse_loop_config_v1;
Pfuse_pollhandle  = ^fuse_pollhandle;
Pfuse_session  = ^fuse_session;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  FUSE: Filesystem in Userspace
  Copyright (C) 2001-2007  Miklos Szeredi <miklos@szeredi.hu>

  This program can be distributed under the terms of the GNU LGPLv2.
  See the file COPYING.LIB.
 }
{* @file  }
{$if !defined(FUSE_H_) && !defined(FUSE_LOWLEVEL_H_)}
{$error "Never include <fuse_common.h> directly; use <fuse.h> or <fuse_lowlevel.h> instead."}
{$endif}
{$ifndef FUSE_COMMON_H_}
{$define FUSE_COMMON_H_}
{$ifdef HAVE_LIBFUSE_PRIVATE_CONFIG_H}
{$include "fuse_config.h"}
{$endif}
{$include "libfuse_config.h"}
{$include "fuse_opt.h"}
{$include "fuse_log.h"}
{$include <stdint.h>}
{$include <sys/types.h>}
{* Major version of FUSE library interface  }

const
  FUSE_MAJOR_VERSION = 3;  
{* Minor version of FUSE library interface  }
  FUSE_MINOR_VERSION = 14;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function FUSE_MAKE_VERSION(maj,min : longint) : longint;

{ was #define dname def_expr }
function FUSE_VERSION : longint; { return type might be wrong }

{ C++ extern C conditionnal removed }
{*
 * Information about an open file.
 *
 * File Handles are created by the open, opendir, and create methods and closed
 * by the release and releasedir methods.  Multiple file handles may be
 * concurrently open for the same file.  Generally, a client will create one
 * file handle per file descriptor, though in some cases multiple file
 * descriptors can share a single file handle.
  }
{* Open flags.	 Available in open() and release()  }
{* In case of a write operation indicates if this was caused
	    by a delayed write from the page cache. If so, then the
	    context's pid, uid, and gid fields will not be valid, and
	    the *fh* value may not match the *fh* value that would
	    have been sent with the corresponding individual write
	    requests if write caching had been disabled.  }
{* Can be filled in by open, to use direct I/O on this file.  }
{* Can be filled in by open. It signals the kernel that any
	    currently cached file data (ie., data that the filesystem
	    provided the last time the file was open) need not be
	    invalidated. Has no effect when set in other contexts (in
	    particular it does nothing when set by opendir()).  }
{* Indicates a flush operation.  Set in flush operation, also
	    maybe set in highlevel lock operation and lowlevel release
	    operation.  }
{* Can be filled in by open, to indicate that the file is not
	    seekable.  }
{ Indicates that flock locks for this file should be
	   released.  If set, lock_owner shall contain a valid value.
	   May only be set in ->release().  }
{* Can be filled in by opendir. It signals the kernel to
	    enable caching of entries returned by readdir().  Has no
	    effect when set in other contexts (in particular it does
	    nothing when set by open()).  }
{* Can be filled in by open, to indicate that flush is not needed
	    on close.  }
{* Padding.  Reserved for future use }
{* File handle id.  May be filled in by filesystem in create,
	 * open, and opendir().  Available in most other file operations on the
	 * same file handle.  }
{* Lock owner id.  Available in locking operations and flush  }
{* Requested poll events.  Available in ->poll.  Only set on kernels
	    which support it.  If unsupported, this field is set to zero.  }
type
  Pfuse_file_info = ^Tfuse_file_info;
  Tfuse_file_info = record
      flags : longint;
      flag0 : longint;
      flag1 : longint;
      fh : Tuint64_t;
      lock_owner : Tuint64_t;
      poll_events : Tuint32_t;
    end;


const
  bm_Tfuse_file_info_writepage = $1;
  bp_Tfuse_file_info_writepage = 0;
  bm_Tfuse_file_info_direct_io = $2;
  bp_Tfuse_file_info_direct_io = 1;
  bm_Tfuse_file_info_keep_cache = $4;
  bp_Tfuse_file_info_keep_cache = 2;
  bm_Tfuse_file_info_flush = $8;
  bp_Tfuse_file_info_flush = 3;
  bm_Tfuse_file_info_nonseekable = $10;
  bp_Tfuse_file_info_nonseekable = 4;
  bm_Tfuse_file_info_flock_release = $20;
  bp_Tfuse_file_info_flock_release = 5;
  bm_Tfuse_file_info_cache_readdir = $40;
  bp_Tfuse_file_info_cache_readdir = 6;
  bm_Tfuse_file_info_noflush = $80;
  bp_Tfuse_file_info_noflush = 7;
  bm_Tfuse_file_info_padding = $FFFFFF00;
  bp_Tfuse_file_info_padding = 8;
  bm_Tfuse_file_info_padding2 = $FFFFFFFF;
  bp_Tfuse_file_info_padding2 = 0;

function writepage(var a : Tfuse_file_info) : dword;
procedure set_writepage(var a : Tfuse_file_info; __writepage : dword);
function direct_io(var a : Tfuse_file_info) : dword;
procedure set_direct_io(var a : Tfuse_file_info; __direct_io : dword);
function keep_cache(var a : Tfuse_file_info) : dword;
procedure set_keep_cache(var a : Tfuse_file_info; __keep_cache : dword);
function flush(var a : Tfuse_file_info) : dword;
procedure set_flush(var a : Tfuse_file_info; __flush : dword);
function nonseekable(var a : Tfuse_file_info) : dword;
procedure set_nonseekable(var a : Tfuse_file_info; __nonseekable : dword);
function flock_release(var a : Tfuse_file_info) : dword;
procedure set_flock_release(var a : Tfuse_file_info; __flock_release : dword);
function cache_readdir(var a : Tfuse_file_info) : dword;
procedure set_cache_readdir(var a : Tfuse_file_info; __cache_readdir : dword);
function noflush(var a : Tfuse_file_info) : dword;
procedure set_noflush(var a : Tfuse_file_info; __noflush : dword);
function padding(var a : Tfuse_file_info) : dword;
procedure set_padding(var a : Tfuse_file_info; __padding : dword);
function padding2(var a : Tfuse_file_info) : dword;
procedure set_padding2(var a : Tfuse_file_info; __padding2 : dword);
{*
 * Configuration parameters passed to fuse_session_loop_mt() and
 * fuse_loop_mt().
 * Deprecated and replaced by a newer private struct in FUSE API
 * version 312 (FUSE_MAKE_VERSION(3, 12)
  }
{*
	 * whether to use separate device fds for each thread
	 * (may increase performance)
	  }
{*
	 * The maximum number of available worker threads before they
	 * start to get deleted when they become idle. If not
	 * specified, the default is 10.
	 *
	 * Adjusting this has performance implications; a very small number
	 * of threads in the pool will cause a lot of thread creation and
	 * deletion overhead and performance may suffer. When set to 0, a new
	 * thread will be created to service every operation.
	  }
type
  Pfuse_loop_config_v1 = ^Tfuse_loop_config_v1;
  Tfuse_loop_config_v1 = record
      clone_fd : longint;
      max_idle_threads : dword;
    end;

{*************************************************************************
 * Capability bits for 'fuse_conn_info.capable' and 'fuse_conn_info.want' *
 ************************************************************************* }
{*
 * Indicates that the filesystem supports asynchronous read requests.
 *
 * If this capability is not requested/available, the kernel will
 * ensure that there is at most one pending read request per
 * file-handle at any time, and will attempt to order read requests by
 * increasing offset.
 *
 * This feature is enabled by default when supported by the kernel.
  }

const
  FUSE_CAP_ASYNC_READ = 1 shl 0;  
{*
 * Indicates that the filesystem supports "remote" locking.
 *
 * This feature is enabled by default when supported by the kernel,
 * and if getlk() and setlk() handlers are implemented.
  }
  FUSE_CAP_POSIX_LOCKS = 1 shl 1;  
{*
 * Indicates that the filesystem supports the O_TRUNC open flag.  If
 * disabled, and an application specifies O_TRUNC, fuse first calls
 * truncate() and then open() with O_TRUNC filtered out.
 *
 * This feature is enabled by default when supported by the kernel.
  }
  FUSE_CAP_ATOMIC_O_TRUNC = 1 shl 3;  
{*
 * Indicates that the filesystem supports lookups of "." and "..".
 *
 * This feature is disabled by default.
  }
  FUSE_CAP_EXPORT_SUPPORT = 1 shl 4;  
{*
 * Indicates that the kernel should not apply the umask to the
 * file mode on create operations.
 *
 * This feature is disabled by default.
  }
  FUSE_CAP_DONT_MASK = 1 shl 6;  
{*
 * Indicates that libfuse should try to use splice() when writing to
 * the fuse device. This may improve performance.
 *
 * This feature is disabled by default.
  }
  FUSE_CAP_SPLICE_WRITE = 1 shl 7;  
{*
 * Indicates that libfuse should try to move pages instead of copying when
 * writing to / reading from the fuse device. This may improve performance.
 *
 * This feature is disabled by default.
  }
  FUSE_CAP_SPLICE_MOVE = 1 shl 8;  
{*
 * Indicates that libfuse should try to use splice() when reading from
 * the fuse device. This may improve performance.
 *
 * This feature is enabled by default when supported by the kernel and
 * if the filesystem implements a write_buf() handler.
  }
  FUSE_CAP_SPLICE_READ = 1 shl 9;  
{*
 * If set, the calls to flock(2) will be emulated using POSIX locks and must
 * then be handled by the filesystem's setlock() handler.
 *
 * If not set, flock(2) calls will be handled by the FUSE kernel module
 * internally (so any access that does not go through the kernel cannot be taken
 * into account).
 *
 * This feature is enabled by default when supported by the kernel and
 * if the filesystem implements a flock() handler.
  }
  FUSE_CAP_FLOCK_LOCKS = 1 shl 10;  
{*
 * Indicates that the filesystem supports ioctl's on directories.
 *
 * This feature is enabled by default when supported by the kernel.
  }
  FUSE_CAP_IOCTL_DIR = 1 shl 11;  
{*
 * Traditionally, while a file is open the FUSE kernel module only
 * asks the filesystem for an update of the file's attributes when a
 * client attempts to read beyond EOF. This is unsuitable for
 * e.g. network filesystems, where the file contents may change
 * without the kernel knowing about it.
 *
 * If this flag is set, FUSE will check the validity of the attributes
 * on every read. If the attributes are no longer valid (i.e., if the
 * *attr_timeout* passed to fuse_reply_attr() or set in `struct
 * fuse_entry_param` has passed), it will first issue a `getattr`
 * request. If the new mtime differs from the previous value, any
 * cached file *contents* will be invalidated as well.
 *
 * This flag should always be set when available. If all file changes
 * go through the kernel, *attr_timeout* should be set to a very large
 * number to avoid unnecessary getattr() calls.
 *
 * This feature is enabled by default when supported by the kernel.
  }
  FUSE_CAP_AUTO_INVAL_DATA = 1 shl 12;  
{*
 * Indicates that the filesystem supports readdirplus.
 *
 * This feature is enabled by default when supported by the kernel and if the
 * filesystem implements a readdirplus() handler.
  }
  FUSE_CAP_READDIRPLUS = 1 shl 13;  
{*
 * Indicates that the filesystem supports adaptive readdirplus.
 *
 * If FUSE_CAP_READDIRPLUS is not set, this flag has no effect.
 *
 * If FUSE_CAP_READDIRPLUS is set and this flag is not set, the kernel
 * will always issue readdirplus() requests to retrieve directory
 * contents.
 *
 * If FUSE_CAP_READDIRPLUS is set and this flag is set, the kernel
 * will issue both readdir() and readdirplus() requests, depending on
 * how much information is expected to be required.
 *
 * As of Linux 4.20, the algorithm is as follows: when userspace
 * starts to read directory entries, issue a READDIRPLUS request to
 * the filesystem. If any entry attributes have been looked up by the
 * time userspace requests the next batch of entries continue with
 * READDIRPLUS, otherwise switch to plain READDIR.  This will reasult
 * in eg plain "ls" triggering READDIRPLUS first then READDIR after
 * that because it doesn't do lookups.  "ls -l" should result in all
 * READDIRPLUS, except if dentries are already cached.
 *
 * This feature is enabled by default when supported by the kernel and
 * if the filesystem implements both a readdirplus() and a readdir()
 * handler.
  }
  FUSE_CAP_READDIRPLUS_AUTO = 1 shl 14;  
{*
 * Indicates that the filesystem supports asynchronous direct I/O submission.
 *
 * If this capability is not requested/available, the kernel will ensure that
 * there is at most one pending read and one pending write request per direct
 * I/O file-handle at any time.
 *
 * This feature is enabled by default when supported by the kernel.
  }
  FUSE_CAP_ASYNC_DIO = 1 shl 15;  
{*
 * Indicates that writeback caching should be enabled. This means that
 * individual write request may be buffered and merged in the kernel
 * before they are send to the filesystem.
 *
 * This feature is disabled by default.
  }
  FUSE_CAP_WRITEBACK_CACHE = 1 shl 16;  
{*
 * Indicates support for zero-message opens. If this flag is set in
 * the `capable` field of the `fuse_conn_info` structure, then the
 * filesystem may return `ENOSYS` from the open() handler to indicate
 * success. Further attempts to open files will be handled in the
 * kernel. (If this flag is not set, returning ENOSYS will be treated
 * as an error and signaled to the caller).
 *
 * Setting (or unsetting) this flag in the `want` field has *no
 * effect*.
  }
  FUSE_CAP_NO_OPEN_SUPPORT = 1 shl 17;  
{*
 * Indicates support for parallel directory operations. If this flag
 * is unset, the FUSE kernel module will ensure that lookup() and
 * readdir() requests are never issued concurrently for the same
 * directory.
 *
 * This feature is enabled by default when supported by the kernel.
  }
  FUSE_CAP_PARALLEL_DIROPS = 1 shl 18;  
{*
 * Indicates support for POSIX ACLs.
 *
 * If this feature is enabled, the kernel will cache and have
 * responsibility for enforcing ACLs. ACL will be stored as xattrs and
 * passed to userspace, which is responsible for updating the ACLs in
 * the filesystem, keeping the file mode in sync with the ACL, and
 * ensuring inheritance of default ACLs when new filesystem nodes are
 * created. Note that this requires that the file system is able to
 * parse and interpret the xattr representation of ACLs.
 *
 * Enabling this feature implicitly turns on the
 * ``default_permissions`` mount option (even if it was not passed to
 * mount(2)).
 *
 * This feature is disabled by default.
  }
  FUSE_CAP_POSIX_ACL = 1 shl 19;  
{*
 * Indicates that the filesystem is responsible for unsetting
 * setuid and setgid bits when a file is written, truncated, or
 * its owner is changed.
 *
 * This feature is enabled by default when supported by the kernel.
  }
  FUSE_CAP_HANDLE_KILLPRIV = 1 shl 20;  
{*
 * Indicates that the kernel supports caching symlinks in its page cache.
 *
 * When this feature is enabled, symlink targets are saved in the page cache.
 * You can invalidate a cached link by calling:
 * `fuse_lowlevel_notify_inval_inode(se, ino, 0, 0);`
 *
 * This feature is disabled by default.
 * If the kernel supports it (>= 4.20), you can enable this feature by
 * setting this flag in the `want` field of the `fuse_conn_info` structure.
  }
  FUSE_CAP_CACHE_SYMLINKS = 1 shl 23;  
{*
 * Indicates support for zero-message opendirs. If this flag is set in
 * the `capable` field of the `fuse_conn_info` structure, then the filesystem
 * may return `ENOSYS` from the opendir() handler to indicate success. Further
 * opendir and releasedir messages will be handled in the kernel. (If this
 * flag is not set, returning ENOSYS will be treated as an error and signalled
 * to the caller.)
 *
 * Setting (or unsetting) this flag in the `want` field has *no effect*.
  }
  FUSE_CAP_NO_OPENDIR_SUPPORT = 1 shl 24;  
{*
 * Indicates support for invalidating cached pages only on explicit request.
 *
 * If this flag is set in the `capable` field of the `fuse_conn_info` structure,
 * then the FUSE kernel module supports invalidating cached pages only on
 * explicit request by the filesystem through fuse_lowlevel_notify_inval_inode()
 * or fuse_invalidate_path().
 *
 * By setting this flag in the `want` field of the `fuse_conn_info` structure,
 * the filesystem is responsible for invalidating cached pages through explicit
 * requests to the kernel.
 *
 * Note that setting this flag does not prevent the cached pages from being
 * flushed by OS itself and/or through user actions.
 *
 * Note that if both FUSE_CAP_EXPLICIT_INVAL_DATA and FUSE_CAP_AUTO_INVAL_DATA
 * are set in the `capable` field of the `fuse_conn_info` structure then
 * FUSE_CAP_AUTO_INVAL_DATA takes precedence.
 *
 * This feature is disabled by default.
  }
  FUSE_CAP_EXPLICIT_INVAL_DATA = 1 shl 25;  
{*
 * Indicates support that dentries can be expired or invalidated.
 * 
 * Expiring dentries, instead of invalidating them, makes a difference for 
 * overmounted dentries, where plain invalidation would detach all submounts 
 * before dropping the dentry from the cache. If only expiry is set on the 
 * dentry, then any overmounts are left alone and until ->d_revalidate() 
 * is called.
 * 
 * Note: ->d_revalidate() is not called for the case of following a submount,
 * so invalidation will only be triggered for the non-overmounted case. 
 * The dentry could also be mounted in a different mount instance, in which case
 * any submounts will still be detached.
 }
  FUSE_CAP_EXPIRE_ONLY = 1 shl 26;  
{*
 * Ioctl flags
 *
 * FUSE_IOCTL_COMPAT: 32bit compat ioctl on 64bit machine
 * FUSE_IOCTL_UNRESTRICTED: not restricted to well-formed ioctls, retry allowed
 * FUSE_IOCTL_RETRY: retry with new iovecs
 * FUSE_IOCTL_DIR: is a directory
 *
 * FUSE_IOCTL_MAX_IOV: maximum of in_iovecs + out_iovecs
  }
  FUSE_IOCTL_COMPAT = 1 shl 0;  
  FUSE_IOCTL_UNRESTRICTED = 1 shl 1;  
  FUSE_IOCTL_RETRY = 1 shl 2;  
  FUSE_IOCTL_DIR = 1 shl 4;  
  FUSE_IOCTL_MAX_IOV = 256;  
{*
 * Connection information, passed to the ->init() method
 *
 * Some of the elements are read-write, these can be changed to
 * indicate the value requested by the filesystem.  The requested
 * value must usually be smaller than the indicated value.
  }
{*
	 * Major version of the protocol (read-only)
	  }
{*
	 * Minor version of the protocol (read-only)
	  }
{*
	 * Maximum size of the write buffer
	  }
{*
	 * Maximum size of read requests. A value of zero indicates no
	 * limit. However, even if the filesystem does not specify a
	 * limit, the maximum size of read requests will still be
	 * limited by the kernel.
	 *
	 * NOTE: For the time being, the maximum size of read requests
	 * must be set both here *and* passed to fuse_session_new()
	 * using the ``-o max_read=<n>`` mount option. At some point
	 * in the future, specifying the mount option will no longer
	 * be necessary.
	  }
{*
	 * Maximum readahead
	  }
{*
	 * Capability flags that the kernel supports (read-only)
	  }
{*
	 * Capability flags that the filesystem wants to enable.
	 *
	 * libfuse attempts to initialize this field with
	 * reasonable default values before calling the init() handler.
	  }
{*
	 * Maximum number of pending "background" requests. A
	 * background request is any type of request for which the
	 * total number is not limited by other means. As of kernel
	 * 4.8, only two types of requests fall into this category:
	 *
	 *   1. Read-ahead requests
	 *   2. Asynchronous direct I/O requests
	 *
	 * Read-ahead requests are generated (if max_readahead is
	 * non-zero) by the kernel to preemptively fill its caches
	 * when it anticipates that userspace will soon read more
	 * data.
	 *
	 * Asynchronous direct I/O requests are generated if
	 * FUSE_CAP_ASYNC_DIO is enabled and userspace submits a large
	 * direct I/O request. In this case the kernel will internally
	 * split it up into multiple smaller requests and submit them
	 * to the filesystem concurrently.
	 *
	 * Note that the following requests are *not* background
	 * requests: writeback requests (limited by the kernel's
	 * flusher algorithm), regular (i.e., synchronous and
	 * buffered) userspace read/write requests (limited to one per
	 * thread), asynchronous read requests (Linux's io_submit(2)
	 * call actually blocks, so these are also limited to one per
	 * thread).
	  }
{*
	 * Kernel congestion threshold parameter. If the number of pending
	 * background requests exceeds this number, the FUSE kernel module will
	 * mark the filesystem as "congested". This instructs the kernel to
	 * expect that queued requests will take some time to complete, and to
	 * adjust its algorithms accordingly (e.g. by putting a waiting thread
	 * to sleep instead of using a busy-loop).
	  }
{*
	 * When FUSE_CAP_WRITEBACK_CACHE is enabled, the kernel is responsible
	 * for updating mtime and ctime when write requests are received. The
	 * updated values are passed to the filesystem with setattr() requests.
	 * However, if the filesystem does not support the full resolution of
	 * the kernel timestamps (nanoseconds), the mtime and ctime values used
	 * by kernel and filesystem will differ (and result in an apparent
	 * change of times after a cache flush).
	 *
	 * To prevent this problem, this variable can be used to inform the
	 * kernel about the timestamp granularity supported by the file-system.
	 * The value should be power of 10.  The default is 1, i.e. full
	 * nano-second resolution. Filesystems supporting only second resolution
	 * should set this to 1000000000.
	  }
{*
	 * For future use.
	  }
type
  Pfuse_conn_info = ^Tfuse_conn_info;
  Tfuse_conn_info = record
      proto_major : dword;
      proto_minor : dword;
      max_write : dword;
      max_read : dword;
      max_readahead : dword;
      capable : dword;
      want : dword;
      max_background : dword;
      congestion_threshold : dword;
      time_gran : dword;
      reserved : array[0..21] of dword;
    end;

  Pfuse_session = ^Tfuse_session;
  Tfuse_session = record
      {undefined structure}
    end;

  Pfuse_pollhandle = ^Tfuse_pollhandle;
  Tfuse_pollhandle = record
      {undefined structure}
    end;

  Pfuse_conn_info_opts = ^Tfuse_conn_info_opts;
  Tfuse_conn_info_opts = record
      {undefined structure}
    end;

{*
 * This function parses several command-line options that can be used
 * to override elements of struct fuse_conn_info. The pointer returned
 * by this function should be passed to the
 * fuse_apply_conn_info_opts() method by the file system's init()
 * handler.
 *
 * Before using this function, think twice if you really want these
 * parameters to be adjustable from the command line. In most cases,
 * they should be determined by the file system internally.
 *
 * The following options are recognized:
 *
 *   -o max_write=N         sets conn->max_write
 *   -o max_readahead=N     sets conn->max_readahead
 *   -o max_background=N    sets conn->max_background
 *   -o congestion_threshold=N  sets conn->congestion_threshold
 *   -o async_read          sets FUSE_CAP_ASYNC_READ in conn->want
 *   -o sync_read           unsets FUSE_CAP_ASYNC_READ in conn->want
 *   -o atomic_o_trunc      sets FUSE_CAP_ATOMIC_O_TRUNC in conn->want
 *   -o no_remote_lock      Equivalent to -o no_remote_flock,no_remote_posix_lock
 *   -o no_remote_flock     Unsets FUSE_CAP_FLOCK_LOCKS in conn->want
 *   -o no_remote_posix_lock  Unsets FUSE_CAP_POSIX_LOCKS in conn->want
 *   -o [no_]splice_write     (un-)sets FUSE_CAP_SPLICE_WRITE in conn->want
 *   -o [no_]splice_move      (un-)sets FUSE_CAP_SPLICE_MOVE in conn->want
 *   -o [no_]splice_read      (un-)sets FUSE_CAP_SPLICE_READ in conn->want
 *   -o [no_]auto_inval_data  (un-)sets FUSE_CAP_AUTO_INVAL_DATA in conn->want
 *   -o readdirplus=no        unsets FUSE_CAP_READDIRPLUS in conn->want
 *   -o readdirplus=yes       sets FUSE_CAP_READDIRPLUS and unsets
 *                            FUSE_CAP_READDIRPLUS_AUTO in conn->want
 *   -o readdirplus=auto      sets FUSE_CAP_READDIRPLUS and
 *                            FUSE_CAP_READDIRPLUS_AUTO in conn->want
 *   -o [no_]async_dio        (un-)sets FUSE_CAP_ASYNC_DIO in conn->want
 *   -o [no_]writeback_cache  (un-)sets FUSE_CAP_WRITEBACK_CACHE in conn->want
 *   -o time_gran=N           sets conn->time_gran
 *
 * Known options will be removed from *args*, unknown options will be
 * passed through unchanged.
 *
 * @param args argument vector (input+output)
 * @return parsed options
 * }

function fuse_parse_conn_info_opts(args:Pfuse_args):Pfuse_conn_info_opts;cdecl;external;
{*
 * This function applies the (parsed) parameters in *opts* to the
 * *conn* pointer. It may modify the following fields: wants,
 * max_write, max_readahead, congestion_threshold, max_background,
 * time_gran. A field is only set (or unset) if the corresponding
 * option has been explicitly set.
  }
procedure fuse_apply_conn_info_opts(opts:Pfuse_conn_info_opts; conn:Pfuse_conn_info);cdecl;external;
{*
 * Go into the background
 *
 * @param foreground if true, stay in the foreground
 * @return 0 on success, -1 on failure
  }
function fuse_daemonize(foreground:longint):longint;cdecl;external;
{*
 * Get the version of the library
 *
 * @return the version
  }
function fuse_version:longint;cdecl;external;
{*
 * Get the full package version string of the library
 *
 * @return the package version
  }
(* Const before type ignored *)
function fuse_pkgversion:Pchar;cdecl;external;
{*
 * Destroy poll handle
 *
 * @param ph the poll handle
  }
procedure fuse_pollhandle_destroy(ph:Pfuse_pollhandle);cdecl;external;
{ ----------------------------------------------------------- *
 * Data buffer						       *
 * -----------------------------------------------------------  }
{*
 * Buffer flags
  }
{*
	 * Buffer contains a file descriptor
	 *
	 * If this flag is set, the .fd field is valid, otherwise the
	 * .mem fields is valid.
	  }
{*
	 * Seek on the file descriptor
	 *
	 * If this flag is set then the .pos field is valid and is
	 * used to seek to the given offset before performing
	 * operation on file descriptor.
	  }
{*
	 * Retry operation on file descriptor
	 *
	 * If this flag is set then retry operation on file descriptor
	 * until .size bytes have been copied or an error or EOF is
	 * detected.
	  }
type
  Tfuse_buf_flags =  Longint;
  Const
    FUSE_BUF_IS_FD = 1 shl 1;
    FUSE_BUF_FD_SEEK = 1 shl 2;
    FUSE_BUF_FD_RETRY = 1 shl 3;

{*
 * Buffer copy flags
  }
{*
	 * Don't use splice(2)
	 *
	 * Always fall back to using read and write instead of
	 * splice(2) to copy data from one file descriptor to another.
	 *
	 * If this flag is not set, then only fall back if splice is
	 * unavailable.
	  }
{*
	 * Force splice
	 *
	 * Always use splice(2) to copy data from one file descriptor
	 * to another.  If splice is not available, return -EINVAL.
	  }
{*
	 * Try to move data with splice.
	 *
	 * If splice is used, try to move pages from the source to the
	 * destination instead of copying.  See documentation of
	 * SPLICE_F_MOVE in splice(2) man page.
	  }
{*
	 * Don't block on the pipe when copying data with splice
	 *
	 * Makes the operations on the pipe non-blocking (if the pipe
	 * is full or empty).  See SPLICE_F_NONBLOCK in the splice(2)
	 * man page.
	  }
type
  Tfuse_buf_copy_flags =  Longint;
  Const
    FUSE_BUF_NO_SPLICE = 1 shl 1;
    FUSE_BUF_FORCE_SPLICE = 1 shl 2;
    FUSE_BUF_SPLICE_MOVE = 1 shl 3;
    FUSE_BUF_SPLICE_NONBLOCK = 1 shl 4;

{*
 * Single data buffer
 *
 * Generic data buffer for I/O, extended attributes, etc...  Data may
 * be supplied as a memory pointer or as a file descriptor
  }
{*
	 * Size of data in bytes
	  }
{*
	 * Buffer flags
	  }
{*
	 * Memory pointer
	 *
	 * Used unless FUSE_BUF_IS_FD flag is set.
	  }
{*
	 * File descriptor
	 *
	 * Used if FUSE_BUF_IS_FD flag is set.
	  }
{*
	 * File position
	 *
	 * Used if FUSE_BUF_FD_SEEK flag is set.
	  }
type
  Pfuse_buf = ^Tfuse_buf;
  Tfuse_buf = record
      size : Tsize_t;
      flags : Tfuse_buf_flags;
      mem : pointer;
      fd : longint;
      pos : Toff_t;
    end;

{*
 * Data buffer vector
 *
 * An array of data buffers, each containing a memory pointer or a
 * file descriptor.
 *
 * Allocate dynamically to add more than one buffer.
  }
{*
	 * Number of buffers in the array
	  }
{*
	 * Index of current buffer within the array
	  }
{*
	 * Current offset within the current buffer
	  }
{*
	 * Array of buffers
	  }
  Pfuse_bufvec = ^Tfuse_bufvec;
  Tfuse_bufvec = record
      count : Tsize_t;
      idx : Tsize_t;
      off : Tsize_t;
      buf : array[0..0] of Tfuse_buf;
    end;

{ Initialize bufvec with a single buffer of given size  }
{*
 * Get total size of data in a fuse buffer vector
 *
 * @param bufv buffer vector
 * @return size of data
  }
(* Const before type ignored *)

function fuse_buf_size(bufv:Pfuse_bufvec):Tsize_t;cdecl;external;
{*
 * Copy data from one buffer vector to another
 *
 * @param dst destination buffer vector
 * @param src source buffer vector
 * @param flags flags controlling the copy
 * @return actual number of bytes copied or -errno on error
  }
function fuse_buf_copy(dst:Pfuse_bufvec; src:Pfuse_bufvec; flags:Tfuse_buf_copy_flags):Tssize_t;cdecl;external;
{ ----------------------------------------------------------- *
 * Signal handling					       *
 * -----------------------------------------------------------  }
{*
 * Exit session on HUP, TERM and INT signals and ignore PIPE signal
 *
 * Stores session in a global variable.	 May only be called once per
 * process until fuse_remove_signal_handlers() is called.
 *
 * Once either of the POSIX signals arrives, the signal handler calls
 * fuse_session_exit().
 *
 * @param se the session to exit
 * @return 0 on success, -1 on failure
 *
 * See also:
 * fuse_remove_signal_handlers()
  }
function fuse_set_signal_handlers(se:Pfuse_session):longint;cdecl;external;
{*
 * Restore default signal handlers
 *
 * Resets global session.  After this fuse_set_signal_handlers() may
 * be called again.
 *
 * @param se the same session as given in fuse_set_signal_handlers()
 *
 * See also:
 * fuse_set_signal_handlers()
  }
procedure fuse_remove_signal_handlers(se:Pfuse_session);cdecl;external;
{*
 * Create and set default config for fuse_session_loop_mt and fuse_loop_mt.
 *
 * @return anonymous config struct
  }
function fuse_loop_cfg_create:Pfuse_loop_config;cdecl;external;
{*
 * Free the config data structure
  }
procedure fuse_loop_cfg_destroy(config:Pfuse_loop_config);cdecl;external;
{*
 * fuse_loop_config setter to set the number of max idle threads.
  }
procedure fuse_loop_cfg_set_idle_threads(config:Pfuse_loop_config; value:dword);cdecl;external;
{*
 * fuse_loop_config setter to set the number of max threads.
  }
procedure fuse_loop_cfg_set_max_threads(config:Pfuse_loop_config; value:dword);cdecl;external;
{*
 * fuse_loop_config setter to enable the clone_fd feature
  }
procedure fuse_loop_cfg_set_clone_fd(config:Pfuse_loop_config; value:dword);cdecl;external;
{*
 * Convert old config to more recernt fuse_loop_config2
 *
 * @param config current config2 type
 * @param v1_conf older config1 type (below FUSE API 312)
  }
procedure fuse_loop_cfg_convert(config:Pfuse_loop_config; v1_conf:Pfuse_loop_config_v1);cdecl;external;
{ ----------------------------------------------------------- *
 * Compatibility stuff					       *
 * -----------------------------------------------------------  }
{$if !defined(FUSE_USE_VERSION) || FUSE_USE_VERSION < 30}
{$error only API version 30 or greater is supported}
{$endif}
{ C++ end of extern C conditionnal removed }
{
 * This interface uses 64 bit off_t.
 *
 * On 32bit systems please add -D_FILE_OFFSET_BITS=64 to your compile flags!
  }
{$endif}
{ FUSE_COMMON_H_  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function FUSE_MAKE_VERSION(maj,min : longint) : longint;
begin
  FUSE_MAKE_VERSION:=(maj*100)+min;
end;

{ was #define dname def_expr }
function FUSE_VERSION : longint; { return type might be wrong }
  begin
    FUSE_VERSION:=FUSE_MAKE_VERSION(FUSE_MAJOR_VERSION,FUSE_MINOR_VERSION);
  end;

function writepage(var a : Tfuse_file_info) : dword;
begin
  writepage:=(a.flag0 and bm_Tfuse_file_info_writepage) shr bp_Tfuse_file_info_writepage;
end;

procedure set_writepage(var a : Tfuse_file_info; __writepage : dword);
begin
  a.flag0:=a.flag0 or ((__writepage shl bp_Tfuse_file_info_writepage) and bm_Tfuse_file_info_writepage);
end;

function direct_io(var a : Tfuse_file_info) : dword;
begin
  direct_io:=(a.flag0 and bm_Tfuse_file_info_direct_io) shr bp_Tfuse_file_info_direct_io;
end;

procedure set_direct_io(var a : Tfuse_file_info; __direct_io : dword);
begin
  a.flag0:=a.flag0 or ((__direct_io shl bp_Tfuse_file_info_direct_io) and bm_Tfuse_file_info_direct_io);
end;

function keep_cache(var a : Tfuse_file_info) : dword;
begin
  keep_cache:=(a.flag0 and bm_Tfuse_file_info_keep_cache) shr bp_Tfuse_file_info_keep_cache;
end;

procedure set_keep_cache(var a : Tfuse_file_info; __keep_cache : dword);
begin
  a.flag0:=a.flag0 or ((__keep_cache shl bp_Tfuse_file_info_keep_cache) and bm_Tfuse_file_info_keep_cache);
end;

function flush(var a : Tfuse_file_info) : dword;
begin
  flush:=(a.flag0 and bm_Tfuse_file_info_flush) shr bp_Tfuse_file_info_flush;
end;

procedure set_flush(var a : Tfuse_file_info; __flush : dword);
begin
  a.flag0:=a.flag0 or ((__flush shl bp_Tfuse_file_info_flush) and bm_Tfuse_file_info_flush);
end;

function nonseekable(var a : Tfuse_file_info) : dword;
begin
  nonseekable:=(a.flag0 and bm_Tfuse_file_info_nonseekable) shr bp_Tfuse_file_info_nonseekable;
end;

procedure set_nonseekable(var a : Tfuse_file_info; __nonseekable : dword);
begin
  a.flag0:=a.flag0 or ((__nonseekable shl bp_Tfuse_file_info_nonseekable) and bm_Tfuse_file_info_nonseekable);
end;

function flock_release(var a : Tfuse_file_info) : dword;
begin
  flock_release:=(a.flag0 and bm_Tfuse_file_info_flock_release) shr bp_Tfuse_file_info_flock_release;
end;

procedure set_flock_release(var a : Tfuse_file_info; __flock_release : dword);
begin
  a.flag0:=a.flag0 or ((__flock_release shl bp_Tfuse_file_info_flock_release) and bm_Tfuse_file_info_flock_release);
end;

function cache_readdir(var a : Tfuse_file_info) : dword;
begin
  cache_readdir:=(a.flag0 and bm_Tfuse_file_info_cache_readdir) shr bp_Tfuse_file_info_cache_readdir;
end;

procedure set_cache_readdir(var a : Tfuse_file_info; __cache_readdir : dword);
begin
  a.flag0:=a.flag0 or ((__cache_readdir shl bp_Tfuse_file_info_cache_readdir) and bm_Tfuse_file_info_cache_readdir);
end;

function noflush(var a : Tfuse_file_info) : dword;
begin
  noflush:=(a.flag0 and bm_Tfuse_file_info_noflush) shr bp_Tfuse_file_info_noflush;
end;

procedure set_noflush(var a : Tfuse_file_info; __noflush : dword);
begin
  a.flag0:=a.flag0 or ((__noflush shl bp_Tfuse_file_info_noflush) and bm_Tfuse_file_info_noflush);
end;

function padding(var a : Tfuse_file_info) : dword;
begin
  padding:=(a.flag0 and bm_Tfuse_file_info_padding) shr bp_Tfuse_file_info_padding;
end;

procedure set_padding(var a : Tfuse_file_info; __padding : dword);
begin
  a.flag0:=a.flag0 or ((__padding shl bp_Tfuse_file_info_padding) and bm_Tfuse_file_info_padding);
end;

function padding2(var a : Tfuse_file_info) : dword;
begin
  padding2:=(a.flag0 and bm_Tfuse_file_info_padding2) shr bp_Tfuse_file_info_padding2;
end;

procedure set_padding2(var a : Tfuse_file_info; __padding2 : dword);
begin
  a.flag0:=a.flag0 or ((__padding2 shl bp_Tfuse_file_info_padding2) and bm_Tfuse_file_info_padding2);
end;


end.
