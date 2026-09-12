{$IFDEF read_interface}


const
  APR_HAVE_ARPA_INET_H = 1;
  APR_HAVE_CONIO_H = 0;
  APR_HAVE_CRYPT_H = 1;
  APR_HAVE_CTYPE_H = 1;
  APR_HAVE_DIRENT_H = 1;
  APR_HAVE_ERRNO_H = 1;
  APR_HAVE_FCNTL_H = 1;
  APR_HAVE_IO_H = 0;
  APR_HAVE_LIMITS_H = 1;
  APR_HAVE_NETDB_H = 1;
  APR_HAVE_NETINET_IN_H = 1;
  APR_HAVE_NETINET_SCTP_H = 1;
  APR_HAVE_NETINET_SCTP_UIO_H = 0;
  APR_HAVE_NETINET_TCP_H = 1;
  APR_HAVE_PROCESS_H = 0;
  APR_HAVE_PTHREAD_H = 1;
  APR_HAVE_SEMAPHORE_H = 1;
  APR_HAVE_SIGNAL_H = 1;
  APR_HAVE_STDARG_H = 1;
  APR_HAVE_STDINT_H = 1;
  APR_HAVE_STDIO_H = 1;
  APR_HAVE_STDLIB_H = 1;
  APR_HAVE_STRING_H = 1;
  APR_HAVE_STRINGS_H = 1;
  APR_HAVE_INTTYPES_H = 1;
  APR_HAVE_SYS_IOCTL_H = 1;
  APR_HAVE_SYS_SENDFILE_H = 1;
  APR_HAVE_SYS_SIGNAL_H = 1;
  APR_HAVE_SYS_SOCKET_H = 1;
  APR_HAVE_SYS_SOCKIO_H = 0;
  APR_HAVE_SYS_SYSLIMITS_H = 0;
  APR_HAVE_SYS_TIME_H = 1;
  APR_HAVE_SYS_TYPES_H = 1;
  APR_HAVE_SYS_UIO_H = 1;
  APR_HAVE_SYS_UN_H = 1;
  APR_HAVE_SYS_WAIT_H = 1;
  APR_HAVE_TIME_H = 1;
  APR_HAVE_UNISTD_H = 1;
  APR_HAVE_WINDOWS_H = 0;
  APR_HAVE_WINSOCK2_H = 0;

const
  _WIN32_WINNT = $0501;
  SW_HIDE = 0;

const
  APR_HAVE_SHMEM_MMAP_TMP = 1;
  APR_HAVE_SHMEM_MMAP_SHM = 1;
  APR_HAVE_SHMEM_MMAP_ZERO = 1;
  APR_HAVE_SHMEM_SHMGET_ANON = 1;
  APR_HAVE_SHMEM_SHMGET = 1;
  APR_HAVE_SHMEM_MMAP_ANON = 1;
  APR_HAVE_SHMEM_BEOS = 0;
  APR_USE_SHMEM_MMAP_TMP = 0;
  APR_USE_SHMEM_MMAP_SHM = 1;
  APR_USE_SHMEM_MMAP_ZERO = 0;
  APR_USE_SHMEM_SHMGET_ANON = 0;
  APR_USE_SHMEM_SHMGET = 0;
  APR_USE_SHMEM_MMAP_ANON = 1;
  APR_USE_SHMEM_BEOS = 0;
  APR_USE_FLOCK_SERIALIZE = 0;
  APR_USE_SYSVSEM_SERIALIZE = 0;
  APR_USE_POSIXSEM_SERIALIZE = 0;
  APR_USE_FCNTL_SERIALIZE = 0;
  APR_USE_PROC_PTHREAD_SERIALIZE = 1;
  APR_USE_PTHREAD_SERIALIZE = 1;
  APR_HAS_FLOCK_SERIALIZE = 1;
  APR_HAS_SYSVSEM_SERIALIZE = 1;
  APR_HAS_POSIXSEM_SERIALIZE = 1;
  APR_HAS_FCNTL_SERIALIZE = 1;
  APR_HAS_PROC_PTHREAD_SERIALIZE = 1;
  APR_PROCESS_LOCK_IS_GLOBAL = 0;
  APR_HAVE_CORKABLE_TCP = 1;
  APR_HAVE_GETRLIMIT = 1;
  APR_HAVE_IN_ADDR = 1;
  APR_HAVE_INET_ADDR = 1;
  APR_HAVE_INET_NETWORK = 1;
  APR_HAVE_IPV6 = 1;
  APR_HAVE_SOCKADDR_UN = 1;
  APR_HAVE_MEMMOVE = 1;
  APR_HAVE_SETRLIMIT = 1;
  APR_HAVE_SIGACTION = 1;
  APR_HAVE_SIGSUSPEND = 1;
  APR_HAVE_SIGWAIT = 1;
  APR_HAVE_SA_STORAGE = 1;
  APR_HAVE_STRCASECMP = 1;
  APR_HAVE_STRDUP = 1;
  APR_HAVE_STRICMP = 0;
  APR_HAVE_STRNCASECMP = 1;
  APR_HAVE_STRNICMP = 0;
  APR_HAVE_STRSTR = 1;
  APR_HAVE_MEMCHR = 1;
  APR_HAVE_STRUCT_RLIMIT = 1;
  APR_HAVE_UNION_SEMUN = 0;
  APR_HAVE_SCTP = 1;
  APR_HAVE_IOVEC = 1;

  APR_HAS_SHARED_MEMORY = 1;
  APR_HAS_THREADS = 1;
  APR_HAS_SENDFILE = 1;
  APR_HAS_MMAP = 1;
  APR_HAS_FORK = 1;
  APR_HAS_RANDOM = 1;
  APR_HAS_OTHER_CHILD = 1;
  APR_HAS_DSO = 1;
  APR_HAS_SO_ACCEPTFILTER = 0;
  APR_HAS_UNICODE_FS = 0;
  APR_HAS_PROC_INVOKED = 0;
  APR_HAS_USER = 1;
  APR_HAS_LARGE_FILES = 0;
  APR_HAS_XTHREAD_FILES = 0;
  APR_HAS_OS_UUID = 1;
  APR_HAS_TIMEDLOCKS = 1;
  APR_PROCATTR_USER_SET_REQUIRES_PASSWORD = 0;

  APR_FILES_AS_SOCKETS = 1;
  APR_CHARSET_EBCDIC = 0;
  //  APR_TCP_NOPUSH_FLAG = TCP_CORK;
  APR_TCP_NODELAY_INHERITED = 1;
  APR_O_NONBLOCK_INHERITED = 0;

type
  Papr_byte_t = ^Tapr_byte_t;
  Tapr_byte_t = byte;

  Papr_int16_t = ^Tapr_int16_t;
  Tapr_int16_t = smallint;

  Papr_uint16_t = ^Tapr_uint16_t;
  Tapr_uint16_t = word;

  Papr_int32_t = ^Tapr_int32_t;
  Tapr_int32_t = longint;

  Papr_uint32_t = ^Tapr_uint32_t;
  Tapr_uint32_t = dword;

const
  APR_SIZEOF_VOIDP = 8;

type
  Papr_int64_t = ^Tapr_int64_t;
  Tapr_int64_t = int64;

  Papr_uint64_t = ^Tapr_uint64_t;
  Tapr_uint64_t = uint64;

  Papr_size_t = ^Tapr_size_t;
  Tapr_size_t = SizeUInt;

  Papr_ssize_t = ^Tapr_ssize_t;
  Tapr_ssize_t = SizeInt;

  Papr_off_t = ^Tapr_off_t;
  Tapr_off_t = int64;

  Papr_socklen_t = ^Tapr_socklen_t;
  Tapr_socklen_t = int32;

  Papr_ino_t = ^Tapr_ino_t;
  Tapr_ino_t = int64;

type
  Papr_uintptr_t = ^Tapr_uintptr_t;
  Tapr_uintptr_t = Tapr_uint64_t;

const
  APR_IS_BIGENDIAN = 0;

const
  APR_INT16_MIN = (-($7fff)) - 1;
  APR_INT16_MAX = $7fff;

  APR_UINT16_MAX = $ffff;
  APR_INT32_MIN = (-($7fffffff)) - 1;

  APR_INT32_MAX = $7fffffff;
  APR_UINT32_MAX = $ffffffff;

  APR_INT64_MIN = -$7fffffffffffffff - 1;
  APR_INT64_MAX = $7fffffffffffffff;
  APR_UINT64_MAX = $ffffffffffffffff;
  APR_SIZE_MAX = not (Tapr_size_t(0));

type
  Papr_wait_t = ^Tapr_wait_t;
  Tapr_wait_t = longint;

const
  APR_DSOPATH = 'LD_LIBRARY_PATH';

type
  Ppid_t = ^Tpid_t;
  Tpid_t = longint;
type
  Puid_t = ^Tuid_t;
  Tuid_t = uint32;

  Pgid_t = ^Tgid_t;
  Tgid_t = longint;

  // === Konventiert am: 10-9-26 14:34:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
