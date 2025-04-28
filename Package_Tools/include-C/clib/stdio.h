/* Define ISO C stdio on top of C++ iostreams.
   Copyright (C) 1991-2024 Free Software Foundation, Inc.
   Copyright The GNU Toolchain Authors.
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
   <https://www.gnu.org/licenses/>.  */

/*
 *	ISO C99 Standard: 7.19 Input/output	<stdio.h>
 */

#ifndef _STDIO_H
#define _STDIO_H	1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
#include <bits/libc-header-start.h>


#define __need_size_t
#define __need_NULL
#include <stddef.h>

#define __need___va_list
#include <stdarg.h>

#include <bits/types.h>
#include <bits/types/__fpos_t.h>
#include <bits/types/__fpos64_t.h>
#include <bits/types/__FILE.h>
#include <bits/types/FILE.h>
#include <bits/types/struct_FILE.h>

#ifdef __USE_MISC
# include <bits/types/cookie_io_functions_t.h>
#endif

#if defined __USE_XOPEN || defined __USE_XOPEN2K8
# ifdef __GNUC__
#  ifndef _VA_LIST_DEFINED
typedef __gnuc_va_list va_list;
#   define _VA_LIST_DEFINED
#  endif
# else
#  include <stdarg.h>
# endif
#endif

#if defined __USE_UNIX98 || defined __USE_XOPEN2K
# ifndef __off_t_defined
# ifndef __USE_FILE_OFFSET64
typedef __off_t off_t;
# else
typedef __off64_t off_t;
# endif
# define __off_t_defined
# endif
# if defined __USE_LARGEFILE64 && !defined __off64_t_defined
typedef __off64_t off64_t;
# define __off64_t_defined
# endif
#endif

#ifdef __USE_XOPEN2K8
# ifndef __ssize_t_defined
typedef __ssize_t ssize_t;
# define __ssize_t_defined
# endif
#endif

/* The type of the second argument to `fgetpos' and `fsetpos'.  */
#ifndef __USE_FILE_OFFSET64
typedef __fpos_t fpos_t;
#else
typedef __fpos64_t fpos_t;
#endif
#ifdef __USE_LARGEFILE64
typedef __fpos64_t fpos64_t;
#endif

/* The possibilities for the third argument to `setvbuf'.  */
#define _IOFBF 0		/* Fully buffered.  */
#define _IOLBF 1		/* Line buffered.  */
#define _IONBF 2		/* No buffering.  */


/* Default buffer size.  */
#define BUFSIZ 8192


/* The value returned by fgetc and similar functions to indicate the
   end of the file.  */
#define EOF (-1)


/* The possibilities for the third argument to `fseek'.
   These values should not be changed.  */
#define SEEK_SET	0	/* Seek from beginning of file.  */
#define SEEK_CUR	1	/* Seek from current position.  */
#define SEEK_END	2	/* Seek from end of file.  */
#ifdef __USE_GNU
# define SEEK_DATA	3	/* Seek to next data.  */
# define SEEK_HOLE	4	/* Seek to next hole.  */
#endif


#if defined __USE_MISC || defined __USE_XOPEN
/* Default path prefix for `tempnam' and `tmpnam'.  */
# define P_tmpdir	"/tmp"
#endif

#define L_tmpnam 20
#define TMP_MAX 238328

/* Get the values:
   FILENAME_MAX	Maximum length of a filename.  */
#include <bits/stdio_lim.h>

#ifdef __USE_POSIX
# define L_ctermid 9
# if !defined __USE_XOPEN2K || defined __USE_GNU
#  define L_cuserid 9
# endif
#endif

#undef  FOPEN_MAX
#define FOPEN_MAX 16


#if __GLIBC_USE (ISOC2X)
/* Maximum length of printf output for a NaN.  */
# define _PRINTF_NAN_LEN_MAX 4
#endif


/* Standard streams.  */
extern FILE *stdin;		/* Standard input stream.  */
extern FILE *stdout;		/* Standard output stream.  */
extern FILE *stderr;		/* Standard error output stream.  */
/* C89/C99 say they're macros.  Make them happy.  */
#define stdin stdin
#define stdout stdout
#define stderr stderr

/* Remove file FILENAME.  */
extern int remove (const char *__filename) ;
/* Rename file OLD to NEW.  */
extern int rename (const char *__old, const char *__new) ;

#ifdef __USE_ATFILE
/* Rename file OLD relative to OLDFD to NEW relative to NEWFD.  */
extern int renameat (int __oldfd, const char *__old, int __newfd,
		     const char *__new) ;
#endif

#ifdef __USE_GNU
/* Flags for renameat2.  */
# define RENAME_NOREPLACE (1 << 0)
# define RENAME_EXCHANGE (1 << 1)
# define RENAME_WHITEOUT (1 << 2)

/* Rename file OLD relative to OLDFD to NEW relative to NEWFD, with
   additional flags.  */
extern int renameat2 (int __oldfd, const char *__old, int __newfd,
		      const char *__new, unsigned int __flags) ;
#endif

/* Close STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fclose (FILE *__stream) ;


/* Create a temporary file and open it read/write.

   This function is a possible cancellation point and therefore not
   marked with .  */
#ifndef __USE_FILE_OFFSET64
extern FILE *tmpfile (void)
    ;
#else
# ifdef 
# else
#  define tmpfile tmpfile64
# endif
#endif

#ifdef __USE_LARGEFILE64
extern FILE *tmpfile64 (void)
     ;
#endif

/* Generate a temporary filename.  */
extern char *tmpnam (char[L_tmpnam])  ;

#ifdef __USE_MISC
/* This is the reentrant variant of `tmpnam'.  The only difference is
   that it does not allow S to be NULL.  */
extern char *tmpnam_r (char __s[L_tmpnam])  ;
#endif


#if defined __USE_MISC || defined __USE_XOPEN
/* Generate a unique temporary filename using up to five characters of PFX
   if it is not NULL.  The directory to put this file in is searched for
   as follows: First the environment variable "TMPDIR" is checked.
   If it contains the name of a writable directory, that directory is used.
   If not and if DIR is not NULL, that value is checked.  If that fails,
   P_tmpdir is tried and finally "/tmp".  The storage for the filename
   is allocated by `malloc'.  */
extern char *tempnam (const char *__dir, const char *__pfx)
      ;
#endif

/* Flush STREAM, or all streams if STREAM is NULL.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fflush (FILE *__stream);

#ifdef __USE_MISC
/* Faster versions when locking is not required.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern int fflush_unlocked (FILE *__stream);
#endif

#ifdef __USE_GNU
/* Close all streams.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern int fcloseall (void);
#endif


#ifndef __USE_FILE_OFFSET64
/* Open a file and create a new stream for it.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern FILE *fopen (const char * __filename,
		    const char * __modes)
    ;
/* Open a file, replacing an existing stream with it.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern FILE *freopen (const char * __filename,
		      const char * __modes,
		      FILE * __stream)  ;
#else
# ifdef 
# else
# endif
#endif
#ifdef __USE_LARGEFILE64
extern FILE *fopen64 (const char * __filename,
		      const char * __modes)
    ;
extern FILE *freopen64 (const char * __filename,
			const char * __modes,
			FILE * __stream)  ;
#endif

#ifdef	__USE_POSIX
/* Create a new stream that refers to an existing system file descriptor.  */
extern FILE *fdopen (int __fd, const char *__modes) 
    ;
#endif

#ifdef	__USE_MISC
/* Create a new stream that refers to the given magic cookie,
   and uses the given functions for input and output.  */
extern FILE *fopencookie (void * __magic_cookie,
			  const char * __modes,
			  cookie_io_functions_t __io_funcs) 
    ;
#endif

#if defined __USE_XOPEN2K8 || __GLIBC_USE (LIB_EXT2)
/* Create a new stream that refers to a memory buffer.  */
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
     ;

/* Open a stream that writes into a malloc'd buffer that is expanded as
   necessary.  *BUFLOC and *SIZELOC are updated with the buffer's location
   and the number of characters written on fflush or fclose.  */
extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) 
    ;

#ifdef _WCHAR_H
/* Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
   a wide character string.  Declared here only to add attribute malloc
   and only if <wchar.h> has been previously #included.  */
extern __FILE *open_wmemstream (wchar_t **__bufloc, size_t *__sizeloc) 
   ;
# endif
#endif

/* If BUF is NULL, make STREAM unbuffered.
   Else make it use buffer BUF, of size BUFSIZ.  */
extern void setbuf (FILE * __stream, char * __buf) 
  ;
/* Make STREAM use buffering mode MODE.
   If BUF is not NULL, use N bytes of it for buffering;
   else allocate an internal buffer N bytes long.  */
extern int setvbuf (FILE * __stream, char * __buf,
		    int __modes, size_t __n)  ;

#ifdef	__USE_MISC
/* If BUF is NULL, make STREAM unbuffered.
   Else make it use SIZE bytes of BUF for buffering.  */
extern void setbuffer (FILE * __stream, char * __buf,
		       size_t __size)  ;

/* Make STREAM line-buffered.  */
extern void setlinebuf (FILE *__stream)  ;
#endif


/* Write formatted output to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fprintf (FILE * __stream,
		    const char * __format, ...) ;
/* Write formatted output to stdout.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int printf (const char * __format, ...);
/* Write formatted output to S.  */
extern int sprintf (char * __s,
		    const char * __format, ...) ;

/* Write formatted output to S from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vfprintf (FILE * __s, const char * __format,
		     __gnuc_va_list __arg) ;
/* Write formatted output to stdout from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vprintf (const char * __format, __gnuc_va_list __arg);
/* Write formatted output to S from argument list ARG.  */
extern int vsprintf (char * __s, const char * __format,
		     __gnuc_va_list __arg) ;

#if defined __USE_ISOC99 || defined __USE_UNIX98
/* Maximum chars of output to write in MAXLEN.  */
extern int snprintf (char * __s, size_t __maxlen,
		     const char * __format, ...)
      ;

extern int vsnprintf (char * __s, size_t __maxlen,
		      const char * __format, __gnuc_va_list __arg)
      ;
#endif

#if defined (__USE_MISC) || __GLIBC_USE (LIB_EXT2)
/* Write formatted output to a string dynamically allocated with `malloc'.
   Store the address of the string in *PTR.  */
extern int vasprintf (char ** __ptr, const char * __f,
		      __gnuc_va_list __arg)
     ;
extern int __asprintf (char ** __ptr,
		       const char * __fmt, ...)
     ;
extern int asprintf (char ** __ptr,
		     const char * __fmt, ...)
      ;
#endif

#ifdef __USE_XOPEN2K8
/* Write formatted output to a file descriptor.  */
extern int vdprintf (int __fd, const char * __fmt,
		     __gnuc_va_list __arg)
    ;
extern int dprintf (int __fd, const char * __fmt, ...)
    ;
#endif


/* Read formatted input from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fscanf (FILE * __stream,
		   const char * __format, ...)  ;
/* Read formatted input from stdin.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int scanf (const char * __format, ...) ;
/* Read formatted input from S.  */
extern int sscanf (const char * __s,
		   const char * __format, ...) ;

/* For historical reasons, the C99-compliant versions of the scanf
   functions are at alternative names.  When __LDBL_COMPAT or
   __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI are in effect, this is handled in
   bits/stdio-ldbl.h.  */
#include <bits/floatn.h>
#  else
#  ifdef 

#ifdef	__USE_ISOC99
/* Read formatted input from S into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vfscanf (FILE * __s, const char * __format,
		    __gnuc_va_list __arg)
  ;

/* Read formatted input from stdin into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vscanf (const char * __format, __gnuc_va_list __arg)
  ;

/* Read formatted input from S into argument list ARG.  */
extern int vsscanf (const char * __s,
		    const char * __format, __gnuc_va_list __arg)
  ;


/* Read a character from STREAM.

   These functions are possible cancellation points and therefore not
   marked with .  */
extern int fgetc (FILE *__stream) ;
extern int getc (FILE *__stream) ;

/* Read a character from stdin.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int getchar (void);

#ifdef __USE_POSIX199506
/* These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with .  */
extern int getc_unlocked (FILE *__stream) ;
extern int getchar_unlocked (void);
#endif /* Use POSIX.  */

#ifdef __USE_MISC
/* Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern int fgetc_unlocked (FILE *__stream) ;
#endif /* Use MISC.  */


/* Write a character to STREAM.

   These functions are possible cancellation points and therefore not
   marked with .

   These functions is a possible cancellation point and therefore not
   marked with .  */
extern int fputc (int __c, FILE *__stream) ;
extern int putc (int __c, FILE *__stream) ;

/* Write a character to stdout.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int putchar (int __c);

#ifdef __USE_MISC
/* Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern int fputc_unlocked (int __c, FILE *__stream) ;
#endif /* Use MISC.  */

#ifdef __USE_POSIX199506
/* These are defined in POSIX.1:1996.

   These functions are possible cancellation points and therefore not
   marked with .  */
extern int putc_unlocked (int __c, FILE *__stream) ;
extern int putchar_unlocked (int __c);
#endif /* Use POSIX.  */


extern int getw (FILE *__stream) ;

/* Write a word (int) to STREAM.  */
extern int putw (int __w, FILE *__stream) ;
#endif


/* Get a newline-terminated string of finite length from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern char *fgets (char * __s, int __n, FILE * __stream)
   ;

#if __GLIBC_USE (DEPRECATED_GETS)
/* Get a newline-terminated string from stdin, removing the newline.

   This function is impossible to use safely.  It has been officially
   removed from ISO C11 and ISO C++14, and we have also removed it
   from the _GNU_SOURCE feature list.  It remains available when
   explicitly using an old ISO C, Unix, or POSIX standard.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern char *gets (char *__s) ;
#endif

#ifdef __USE_GNU
/* This function does the same as `fgets' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern char *fgets_unlocked (char * __s, int __n,
			     FILE * __stream) ;
/* Read up to (and including) a DELIMITER from STREAM into *LINEPTR
   (and null-terminate it). *LINEPTR is a pointer returned from malloc (or
   NULL), pointing to *N characters of space.  It is realloc'd as
   necessary.  Returns the number of characters read (not including the
   null terminator), or -1 on error or EOF.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .  */
extern __ssize_t __getdelim (char ** __lineptr,
                             size_t * __n, int __delimiter,
                             FILE * __stream) ;
extern __ssize_t getdelim (char ** __lineptr,
                           size_t * __n, int __delimiter,
                           FILE * __stream)  ;

/* Like `getdelim', but reads up to a newline.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern __ssize_t getline (char ** __lineptr,
                          size_t * __n,
                          FILE * __stream)  ;
#endif


/* Write a string to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fputs (const char * __s, FILE * __stream)
  ;

/* Write a string, followed by a newline, to stdout.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int puts (const char *__s);


/* Push a character back onto the input buffer of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int ungetc (int __c, FILE *__stream) ;


/* Read chunks of generic data from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern size_t fread (void * __ptr, size_t __size,
		     size_t __n, FILE * __stream) 
  ;
/* Write chunks of generic data to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern size_t fwrite (const void * __ptr, size_t __size,
		      size_t __n, FILE * __s) ;

#ifdef __USE_GNU
/* This function does the same as `fputs' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern int fputs_unlocked (const char * __s,
			   FILE * __stream) ;
#endif

#ifdef __USE_MISC
/* Faster versions when locking is not necessary.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .  */
extern size_t fread_unlocked (void * __ptr, size_t __size,
			      size_t __n, FILE * __stream) 
  ;
extern size_t fwrite_unlocked (const void * __ptr, size_t __size,
			       size_t __n, FILE * __stream)
  ;
#endif


/* Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fseek (FILE *__stream, long int __off, int __whence)
  ;
/* Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern long int ftell (FILE *__stream)  ;
/* Rewind to the beginning of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern void rewind (FILE *__stream) ;

/* The Single Unix Specification, Version 2, specifies an alternative,
   more adequate interface for the two functions above which deal with
   file offset.  `long int' is not the right type.  These definitions
   are originally defined in the Large File Support API.  */

#if defined __USE_LARGEFILE || defined __USE_XOPEN2K
# ifndef __USE_FILE_OFFSET64
/* Seek to a certain position on STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fseeko (FILE *__stream, __off_t __off, int __whence)
  ;
/* Return the current position of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern __off_t ftello (FILE *__stream)  ;

#ifndef __USE_FILE_OFFSET64
/* Get STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fgetpos (FILE * __stream, fpos_t * __pos)
  ;
/* Set STREAM's position.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fsetpos (FILE *__stream, const fpos_t *__pos) ;

#ifdef __USE_LARGEFILE64
extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence)
  ;
extern __off64_t ftello64 (FILE *__stream)  ;
extern int fgetpos64 (FILE * __stream, fpos64_t * __pos)
  ;
extern int fsetpos64 (FILE *__stream, const fpos64_t *__pos) ;
#endif

/* Clear the error and EOF indicators for STREAM.  */
extern void clearerr (FILE *__stream)  ;
/* Return the EOF indicator for STREAM.  */
extern int feof (FILE *__stream)   ;
/* Return the error indicator for STREAM.  */
extern int ferror (FILE *__stream)   ;

#ifdef __USE_MISC
/* Faster versions when locking is not required.  */
extern void clearerr_unlocked (FILE *__stream)  ;
extern int feof_unlocked (FILE *__stream)   ;
extern int ferror_unlocked (FILE *__stream)   ;
#endif


/* Print a message describing the meaning of the value of errno.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern void perror (const char *__s) ;


#ifdef	__USE_POSIX
/* Return the system file descriptor for STREAM.  */
extern int fileno (FILE *__stream)   ;
#endif /* Use POSIX.  */

#ifdef __USE_MISC
/* Faster version when locking is not required.  */
extern int fileno_unlocked (FILE *__stream)   ;
#endif


#ifdef __USE_POSIX2
/* Close a stream opened by popen and return the status of its child.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int pclose (FILE *__stream) ;

/* Create a new stream connected to a pipe running the given command.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern FILE *popen (const char *__command, const char *__modes)
 ;

#endif


#ifdef	__USE_POSIX
/* Return the name of the controlling terminal.  */
extern char *ctermid (char *__s) 
;
#endif /* Use POSIX.  */


#if (defined __USE_XOPEN && !defined __USE_XOPEN2K) || defined __USE_GNU
/* Return the name of the current user.  */
extern char *cuserid (char *__s)
;
#endif /* Use X/Open, but not issue 6.  */


#ifdef	__USE_GNU
struct obstack;			/* See <obstack.h>.  */

/* Write formatted output to an obstack.  */
extern int obstack_printf (struct obstack * __obstack,
			   const char * __format, ...)
   ;
extern int obstack_vprintf (struct obstack * __obstack,
			    const char * __format,
			    __gnuc_va_list __args)
   ;
#endif /* Use GNU.  */


#ifdef __USE_POSIX199506
/* These are defined in POSIX.1:1996.  */

/* Acquire ownership of STREAM.  */
extern void flockfile (FILE *__stream)  ;

/* Try to acquire ownership of STREAM but do not block if it is not
   possible.  */
extern int ftrylockfile (FILE *__stream)   ;

/* Relinquish the ownership granted for STREAM.  */
extern void funlockfile (FILE *__stream)  ;
#endif /* POSIX */

#if defined __USE_XOPEN && !defined __USE_XOPEN2K && !defined __USE_GNU
/*  X/Open Issues 1-5 required getopt to be declared in this
   header.  It was removed in Issue 6.  GNU follows Issue 6.  */
# include <bits/getopt_posix.h>
#endif

/* Slow-path routines used by the optimized inline functions in
   bits/stdio.h.  */
extern int __uflow (FILE *);
extern int __overflow (FILE *, int);

#if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function
/* Declare all functions from bits/stdio2-decl.h first.  */
# include <bits/stdio2-decl.h>
#endif

/* The following headers provide asm redirections.  These redirections must
   appear before the first usage of these functions, e.g. in bits/stdio.h.  */
#if defined __LDBL_COMPAT || __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI == 1
# include <bits/stdio-ldbl.h>
#endif

/* If we are compiling with optimizing read this file.  It contains
   several optimizing inline functions and macros.  */
#ifdef __USE_EXTERN_INLINES
# include <bits/stdio.h>
#endif
#if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function
/* Now include the function definitions and redirects too.  */
# include <bits/stdio2.h>
#endif


#endif /* <stdio.h> included.  */
