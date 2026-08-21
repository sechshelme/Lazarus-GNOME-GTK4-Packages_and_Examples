unit H5pubconf;

interface

uses
  fp_hdf5;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  H5_CXX_HAVE_OFFSETOF = 1;  
  H5_DEFAULT_PLUGINDIR = '/usr/lib/x86_64-linux-gnu/hdf5/serial/plugins';
  H5_DEV_T_IS_SCALAR = 1;
  H5_EXAMPLESDIR = '${prefix}/share/hdf5_examples';
  H5_FORTRAN_C_LONG_DOUBLE_IS_UNIQUE = 1;
  H5_FORTRAN_HAVE_C_LONG_DOUBLE = 1;
  H5_FORTRAN_HAVE_C_SIZEOF = 1;
  H5_FORTRAN_HAVE_SIZEOF = 1;
  H5_FORTRAN_HAVE_STORAGE_SIZE = 1;
  H5_FORTRAN_SIZEOF_LONG_DOUBLE = '16';
  H5_Fortran_COMPILER_ID = none;
  H5_HAVE_ALARM = 1;
  H5_HAVE_ARPA_INET_H = 1;
  H5_HAVE_ASPRINTF = 1;
  H5_HAVE_ATTRIBUTE = 1;
  H5_HAVE_C99_DESIGNATED_INITIALIZER = 1;
  H5_HAVE_C99_FUNC = 1;
  H5_HAVE_CLOCK_GETTIME = 1;
  H5_HAVE_CURL_CURL_H = 1;
  H5_HAVE_DIFFTIME = 1;
  H5_HAVE_DIRENT_H = 1;
  H5_HAVE_DLFCN_H = 1;
  H5_HAVE_EMBEDDED_LIBINFO = 1;
  H5_HAVE_FCNTL = 1;
  H5_HAVE_FEATURES_H = 1;
  H5_HAVE_FILTER_DEFLATE = 1;
  H5_HAVE_FILTER_SZIP = 1;
  H5_HAVE_FLOAT128 = 1;
  H5_HAVE_FLOCK = 1;
  H5_HAVE_FORK = 1;
  H5_HAVE_FREXPF = 1;
  H5_HAVE_FREXPL = 1;
  H5_HAVE_FUNCTION = 1;
  H5_HAVE_Fortran_INTEGER_SIZEOF_16 = 1;
  H5_HAVE_GETHOSTNAME = 1;
  H5_HAVE_GETPWUID = 1;
  H5_HAVE_GETRUSAGE = 1;
  H5_HAVE_GETTIMEOFDAY = 1;
  H5_HAVE_INLINE = 1;
  H5_HAVE_INTTYPES_H = 1;
  H5_HAVE_IOCTL = 1;
  H5_HAVE_LIBCRYPTO = 1;
  H5_HAVE_LIBCURL = 1;
  H5_HAVE_LIBDL = 1;
  H5_HAVE_LIBM = 1;
  H5_HAVE_LIBPTHREAD = 1;
  H5_HAVE_LIBSZ = 1;
  H5_HAVE_LIBZ = 1;
  H5_HAVE_LLROUND = 1;
  H5_HAVE_LLROUNDF = 1;
  H5_HAVE_LONGJMP = 1;
  H5_HAVE_LROUND = 1;
  H5_HAVE_LROUNDF = 1;
  H5_HAVE_LSTAT = 1;
  H5_HAVE_NETDB_H = 1;
  H5_HAVE_NETINET_IN_H = 1;
  H5_HAVE_OPENSSL_EVP_H = 1;
  H5_HAVE_OPENSSL_HMAC_H = 1;
  H5_HAVE_OPENSSL_SHA_H = 1;
  H5_HAVE_PREADWRITE = 1;
  H5_HAVE_PTHREAD_H = 1;
  H5_HAVE_PWD_H = 1;
  H5_HAVE_QUADMATH_H = 1;
  H5_HAVE_RANDOM = 1;
  H5_HAVE_RAND_R = 1;
  H5_HAVE_ROS3_VFD = 1;
  H5_HAVE_ROUND = 1;
  H5_HAVE_ROUNDF = 1;
  H5_HAVE_SETJMP = 1;
  H5_HAVE_SETJMP_H = 1;
  H5_HAVE_SIGLONGJMP = 1;
{ Define to 1 if you have the `signal' function.  }
  H5_HAVE_SIGNAL = 1;  
{ Define to 1 if you have the `sigprocmask' function.  }
  H5_HAVE_SIGPROCMASK = 1;  
{ Define to 1 if you have the `sigsetjmp' function.  }
{ #undef H5_HAVE_SIGSETJMP  }
{ Define to 1 if you have the `snprintf' function.  }
  H5_HAVE_SNPRINTF = 1;  
{ Define to 1 if you have the `srandom' function.  }
  H5_HAVE_SRANDOM = 1;  
{ Define if struct stat has the st_blocks field  }
  H5_HAVE_STAT_ST_BLOCKS = 1;  
{ Define to 1 if you have the <stdbool.h> header file.  }
  H5_HAVE_STDBOOL_H = 1;  
{ Define to 1 if you have the <stddef.h> header file.  }
  H5_HAVE_STDDEF_H = 1;  
{ Define to 1 if you have the <stdint.h> header file.  }
  H5_HAVE_STDINT_H = 1;  
{ Define to 1 if you have the <stdio.h> header file.  }
  H5_HAVE_STDIO_H = 1;  
{ Define to 1 if you have the <stdlib.h> header file.  }
  H5_HAVE_STDLIB_H = 1;  
{ Define to 1 if you have the `strdup' function.  }
  H5_HAVE_STRDUP = 1;  
{ Define to 1 if you have the <strings.h> header file.  }
  H5_HAVE_STRINGS_H = 1;  
{ Define to 1 if you have the <string.h> header file.  }
  H5_HAVE_STRING_H = 1;  
{ Define to 1 if you have the `strtoll' function.  }
  H5_HAVE_STRTOLL = 1;  
{ Define to 1 if you have the `strtoull' function.  }
  H5_HAVE_STRTOULL = 1;  
{ Define if struct text_info is defined  }
{ #undef H5_HAVE_STRUCT_TEXT_INFO  }
{ Define if struct videoconfig is defined  }
{ #undef H5_HAVE_STRUCT_VIDEOCONFIG  }
{ Define to 1 if you have the `symlink' function.  }
  H5_HAVE_SYMLINK = 1;  
{ Define to 1 if you have the `system' function.  }
  H5_HAVE_SYSTEM = 1;  
{ Define to 1 if you have the <sys/file.h> header file.  }
  H5_HAVE_SYS_FILE_H = 1;  
{ Define to 1 if you have the <sys/ioctl.h> header file.  }
  H5_HAVE_SYS_IOCTL_H = 1;  
{ Define to 1 if you have the <sys/resource.h> header file.  }
  H5_HAVE_SYS_RESOURCE_H = 1;  
{ Define to 1 if you have the <sys/socket.h> header file.  }
  H5_HAVE_SYS_SOCKET_H = 1;  
{ Define to 1 if you have the <sys/stat.h> header file.  }
  H5_HAVE_SYS_STAT_H = 1;  
{ Define to 1 if you have the <sys/timeb.h> header file.  }
  H5_HAVE_SYS_TIMEB_H = 1;  
{ Define to 1 if you have the <sys/time.h> header file.  }
  H5_HAVE_SYS_TIME_H = 1;  
{ Define to 1 if you have the <sys/types.h> header file.  }
  H5_HAVE_SYS_TYPES_H = 1;  
{ Define to 1 if you have the <szlib.h> header file.  }
  H5_HAVE_SZLIB_H = 1;  
{ Define if we have thread safe support  }
  H5_HAVE_THREADSAFE = 1;  
{ Define if timezone is a global variable  }
  H5_HAVE_TIMEZONE = 1;  
{ Define if the ioctl TIOCGETD is defined  }
  H5_HAVE_TIOCGETD = 1;  
{ Define if the ioctl TIOGWINSZ is defined  }
  H5_HAVE_TIOCGWINSZ = 1;  
{ Define to 1 if you have the `tmpfile' function.  }
  H5_HAVE_TMPFILE = 1;  
{ Define if tm_gmtoff is a member of struct tm  }
  H5_HAVE_TM_GMTOFF = 1;  
{ Define to 1 if you have the <unistd.h> header file.  }
  H5_HAVE_UNISTD_H = 1;  
{ Define to 1 if you have the `vasprintf' function.  }
  H5_HAVE_VASPRINTF = 1;  
{ Define to 1 if you have the `vsnprintf' function.  }
  H5_HAVE_VSNPRINTF = 1;  
{ Define to 1 if you have the `waitpid' function.  }
  H5_HAVE_WAITPID = 1;  
{ Define if your system has window style path name.  }
{ #undef H5_HAVE_WINDOW_PATH  }
{ Define to 1 if you have the <winsock2.h> header file.  }
{ #undef H5_HAVE_WINSOCK2_H  }
{ Define to 1 if you have the <zlib.h> header file.  }
  H5_HAVE_ZLIB_H = 1;  
{ Define to 1 if you have the `_getvideoconfig' function.  }
{ #undef H5_HAVE__GETVIDEOCONFIG  }
{ Define to 1 if you have the `_scrsize' function.  }
{ #undef H5_HAVE__SCRSIZE  }
{ Define if the compiler understands __inline  }
  H5_HAVE___INLINE = 1;  
{ Define if the compiler understands __inline__  }
  H5_HAVE___INLINE__ = 1;  
{ Define if the library will ignore file locks when disabled  }
  H5_IGNORE_DISABLED_FILE_LOCKS = 1;  
{ Define if the high-level library headers should be included in hdf5.h  }
  H5_INCLUDE_HL = 1;  
{ Define if your system can convert long double to (unsigned) long long
   values correctly.  }
  H5_LDOUBLE_TO_LLONG_ACCURATE = 1;  
{ Define if your system converts long double to (unsigned) long values with
   special algorithm.  }
{ #undef H5_LDOUBLE_TO_LONG_SPECIAL  }
{ Define if your system can convert (unsigned) long long to long double
   values correctly.  }
  H5_LLONG_TO_LDOUBLE_CORRECT = 1;  
{ Define if your system can convert (unsigned) long to long double values
   with special algorithm.  }
{ #undef H5_LONG_TO_LDOUBLE_SPECIAL  }
{ Define to the sub-directory where libtool stores uninstalled libraries.  }
  H5_LT_OBJDIR = '.libs/';  
{ Define to enable internal memory allocation sanity checking.  }
{ #undef H5_MEMORY_ALLOC_SANITY_CHECK  }
{ Define if we can violate pointer alignment restrictions  }
{ #undef H5_NO_ALIGNMENT_RESTRICTIONS  }
{ Define if deprecated public API symbols are disabled  }
{ #undef H5_NO_DEPRECATED_SYMBOLS  }
{ Name of package  }
  H5_PACKAGE = 'hdf5';  
{ Define to the address where bug reports for this package should be sent.  }
  H5_PACKAGE_BUGREPORT = 'help@hdfgroup.org';  
{ Define to the full name of this package.  }
  H5_PACKAGE_NAME = 'HDF5';  
{ Define to the full name and version of this package.  }
  H5_PACKAGE_STRING = 'HDF5 1.10.10';  
{ Define to the one symbol short name of this package.  }
  H5_PACKAGE_TARNAME = 'hdf5';  
{ Define to the home page for this package.  }
  H5_PACKAGE_URL = '';  
{ Define to the version of this package.  }
  H5_PACKAGE_VERSION = '1.10.10';  
{ Determine the maximum decimal precision in C  }
  H5_PAC_C_MAX_REAL_PRECISION = 33;  
{ Define Fortran Maximum Real Decimal Precision  }
  H5_PAC_FC_MAX_REAL_PRECISION = 33;  
{ Width for printf() for type `long long' or `__int64', use `ll'  }
  H5_PRINTF_LL_WIDTH = 'll';  
{ The size of `bool', as computed by sizeof.  }
  H5_SIZEOF_BOOL = 1;  
{ The size of `char', as computed by sizeof.  }
  H5_SIZEOF_CHAR = 1;  
{ The size of `double', as computed by sizeof.  }
  H5_SIZEOF_DOUBLE = 8;  
{ The size of `float', as computed by sizeof.  }
  H5_SIZEOF_FLOAT = 4;  
{ The size of `int', as computed by sizeof.  }
  H5_SIZEOF_INT = 4;  
{ The size of `int16_t', as computed by sizeof.  }
  H5_SIZEOF_INT16_T = 2;  
{ The size of `int32_t', as computed by sizeof.  }
  H5_SIZEOF_INT32_T = 4;  
{ The size of `int64_t', as computed by sizeof.  }
  H5_SIZEOF_INT64_T = 8;  
{ The size of `int8_t', as computed by sizeof.  }
  H5_SIZEOF_INT8_T = 1;  
{ The size of `int_fast16_t', as computed by sizeof.  }
  H5_SIZEOF_INT_FAST16_T = 8;  
{ The size of `int_fast32_t', as computed by sizeof.  }
  H5_SIZEOF_INT_FAST32_T = 8;  
{ The size of `int_fast64_t', as computed by sizeof.  }
  H5_SIZEOF_INT_FAST64_T = 8;  
{ The size of `int_fast8_t', as computed by sizeof.  }
  H5_SIZEOF_INT_FAST8_T = 1;  
{ The size of `int_least16_t', as computed by sizeof.  }
  H5_SIZEOF_INT_LEAST16_T = 2;  
{ The size of `int_least32_t', as computed by sizeof.  }
  H5_SIZEOF_INT_LEAST32_T = 4;  
{ The size of `int_least64_t', as computed by sizeof.  }
  H5_SIZEOF_INT_LEAST64_T = 8;  
{ The size of `int_least8_t', as computed by sizeof.  }
  H5_SIZEOF_INT_LEAST8_T = 1;  
{ The size of `long', as computed by sizeof.  }
  H5_SIZEOF_LONG = 8;  
{ The size of `long double', as computed by sizeof.  }
  H5_SIZEOF_LONG_DOUBLE = 16;  
{ The size of `long long', as computed by sizeof.  }
  H5_SIZEOF_LONG_LONG = 8;  
{ The size of `off_t', as computed by sizeof.  }
  H5_SIZEOF_OFF_T = 8;  
{ The size of `ptrdiff_t', as computed by sizeof.  }
  H5_SIZEOF_PTRDIFF_T = 8;  
{ The size of `short', as computed by sizeof.  }
  H5_SIZEOF_SHORT = 2;  
{ The size of `size_t', as computed by sizeof.  }
  H5_SIZEOF_SIZE_T = 8;  
{ The size of `ssize_t', as computed by sizeof.  }
  H5_SIZEOF_SSIZE_T = 8;  
{ The size of `time_t', as computed by sizeof.  }
  H5_SIZEOF_TIME_T = 8;  
{ The size of `uint16_t', as computed by sizeof.  }
  H5_SIZEOF_UINT16_T = 2;  
{ The size of `uint32_t', as computed by sizeof.  }
  H5_SIZEOF_UINT32_T = 4;  
{ The size of `uint64_t', as computed by sizeof.  }
  H5_SIZEOF_UINT64_T = 8;  
{ The size of `uint8_t', as computed by sizeof.  }
  H5_SIZEOF_UINT8_T = 1;  
{ The size of `uint_fast16_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_FAST16_T = 8;  
{ The size of `uint_fast32_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_FAST32_T = 8;  
{ The size of `uint_fast64_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_FAST64_T = 8;  
{ The size of `uint_fast8_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_FAST8_T = 1;  
{ The size of `uint_least16_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_LEAST16_T = 2;  
{ The size of `uint_least32_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_LEAST32_T = 4;  
{ The size of `uint_least64_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_LEAST64_T = 8;  
{ The size of `uint_least8_t', as computed by sizeof.  }
  H5_SIZEOF_UINT_LEAST8_T = 1;  
{ The size of `unsigned', as computed by sizeof.  }
  H5_SIZEOF_UNSIGNED = 4;  
{ The size of `_Quad', as computed by sizeof.  }
  H5_SIZEOF__QUAD = 0;  
{ The size of `__float128', as computed by sizeof.  }
  H5_SIZEOF___FLOAT128 = 16;  
{ The size of `__int64', as computed by sizeof.  }
  H5_SIZEOF___INT64 = 0;  
{ Define to 1 if all of the C90 standard headers exist (not just the ones
   required in a freestanding environment). This macro is provided for
   backward compatibility; new code need not use it.  }
  H5_STDC_HEADERS = 1;  
{ Define if strict file format checks are enabled  }
{ #undef H5_STRICT_FORMAT_CHECKS  }
{ Define if your system supports pthread_attr_setscope(&attribute,
   PTHREAD_SCOPE_SYSTEM) call.  }
  H5_SYSTEM_SCOPE_THREADS = 1;  
{ HDF5 testing intensity level  }
  H5_TEST_EXPRESS_LEVEL_DEFAULT = 3;  
{ Define using v1.10 public API symbols by default  }
{ #undef H5_USE_110_API_DEFAULT  }
{ Define using v1.6 public API symbols by default  }
{ #undef H5_USE_16_API_DEFAULT  }
{ Define using v1.8 public API symbols by default  }
  H5_USE_18_API_DEFAULT = 1;  
{ Define if the library will use file locking  }
  H5_USE_FILE_LOCKING = 1;  
{ Define if a memory checking tool will be used on the library, to cause
   library to be very picky about memory operations and also disable the
   internal free list manager code.  }
{ #undef H5_USING_MEMCHECKER  }
{ Version number of package  }
  H5_VERSION = '1.10.10';  
{ Data accuracy is preferred to speed during data conversions  }
  H5_WANT_DATA_ACCURACY = 1;  
{ Check exception handling functions during data conversions  }
  H5_WANT_DCONV_EXCEPTION = 1;  
{ Define WORDS_BIGENDIAN to 1 if your processor stores words with the most
   significant byte first (like Motorola and SPARC, unlike Intel).  }
{$if defined AC_APPLE_UNIVERSAL_BUILD}
{$if defined __BIG_ENDIAN__}

const
  WORDS_BIGENDIAN = 1;  
{$endif}
{$else}
{$ifndef WORDS_BIGENDIAN}
{ #  undef WORDS_BIGENDIAN  }
{$endif}
{$endif}
{ Number of bits in a file offset, on hosts where this is settable.  }
{ #undef H5__FILE_OFFSET_BITS  }
{ Define for large files, on AIX-style hosts.  }
{ #undef H5__LARGE_FILES  }
{ Define to empty if `const' does not conform to ANSI C.  }
{ #undef H5_const  }
{ Define to `long int' if <sys/types.h> does not define.  }
{ #undef H5_off_t  }
{ Define to `long' if <sys/types.h> does not define.  }
{ #undef H5_ptrdiff_t  }
{ Define to `unsigned long' if <sys/types.h> does not define.  }
{ #undef H5_size_t  }
{ Define to `long' if <sys/types.h> does not define.  }
{ #undef H5_ssize_t  }

// === Konventiert am: 21-8-26 14:40:19 ===


implementation



end.
