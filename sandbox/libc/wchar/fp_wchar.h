/* Copyright (C) 1995-2024 Free Software Foundation, Inc.
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
 *      ISO C99 Standard: 7.24
 *	Extended multibyte and wide character utilities	<wchar.h>
 */

#ifndef _WCHAR_H
#define _WCHAR_H 1

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
#include <bits/libc-header-start.h>

/* Gather machine dependent type support.  */
#include <bits/floatn.h>

#define __need_size_t
#define __need_wchar_t
#define __need_NULL
#include <stddef.h>

#define __need___va_list
#include <stdarg.h>

#if defined __USE_XOPEN2K || defined __USE_XOPEN2K8
# ifdef __GNUC__
#  ifndef _VA_LIST_DEFINED
typedef __gnuc_va_list va_list;
#   define _VA_LIST_DEFINED
#  endif
# else
#  include <stdarg.h>
# endif
#endif

#include <bits/wchar.h>
#include <bits/types/wint_t.h>
#include <bits/types/mbstate_t.h>
#include <bits/types/__FILE.h>

#if defined __USE_UNIX98 || defined __USE_XOPEN2K
# include <bits/types/FILE.h>
#endif
#ifdef __USE_XOPEN2K8
# include <bits/types/locale_t.h>
#endif

/* Tell the caller that we provide correct C++ prototypes.  */
#if defined __cplusplus && __GNUC_PREREQ (4, 4)
# define __CORRECT_ISO_CPP_WCHAR_H_PROTO
#endif

#ifndef WCHAR_MIN
/* These constants might also be defined in <inttypes.h>.  */
# define WCHAR_MIN __WCHAR_MIN
# define WCHAR_MAX __WCHAR_MAX
#endif

#ifndef WEOF
# define WEOF (0xffffffffu)
#endif

/* All versions of XPG prior to the publication of ISO C99 required
   the bulk of <wctype.h>'s declarations to appear in this header
   (because <wctype.h> did not exist prior to C99).  In POSIX.1-2001
   those declarations were marked as XSI extensions; in -2008 they
   were additionally marked as obsolescent.  _GNU_SOURCE mode
   anticipates the removal of these declarations in the next revision
   of POSIX.  */
#endif

/* This incomplete type is defined in <time.h> but needed here because
   of `wcsftime'.  */
struct tm;


/* Copy SRC to DEST.  */
extern wchar_t *wcscpy (wchar_t * __dest,
			const wchar_t * __src)
      ;

/* Copy no more than N wide-characters of SRC to DEST.  */
extern wchar_t *wcsncpy (wchar_t * __dest,
			 const wchar_t * __src, size_t __n)
      ;

#ifdef __USE_MISC
/* Copy at most N - 1 characters from SRC to DEST.  */
extern size_t wcslcpy (wchar_t * __dest,
		       const wchar_t * __src, size_t __n);

/* Append SRC to DEST, possibly with truncation to keep the total size
   below N.  */
extern size_t wcslcat (wchar_t * __dest,
		       const wchar_t * __src, size_t __n);
#endif

/* Append SRC onto DEST.  */
extern wchar_t *wcscat (wchar_t * __dest,
			const wchar_t * __src)
      ;
/* Append no more than N wide-characters of SRC onto DEST.  */
extern wchar_t *wcsncat (wchar_t * __dest,
			 const wchar_t * __src, size_t __n)
      ;

/* Compare S1 and S2.  */
extern int wcscmp (const wchar_t *__s1, const wchar_t *__s2)
       ;
/* Compare N wide-characters of S1 and S2.  */
extern int wcsncmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
       ;

#ifdef __USE_XOPEN2K8
/* Compare S1 and S2, ignoring case.  */
extern int wcscasecmp (const wchar_t *__s1, const wchar_t *__s2) ;

/* Compare no more than N chars of S1 and S2, ignoring case.  */
extern int wcsncasecmp (const wchar_t *__s1, const wchar_t *__s2,
			size_t __n) ;

/* Similar to the two functions above but take the information from
   the provided locale and not the global locale.  */
extern int wcscasecmp_l (const wchar_t *__s1, const wchar_t *__s2,
			 locale_t __loc) ;

extern int wcsncasecmp_l (const wchar_t *__s1, const wchar_t *__s2,
			  size_t __n, locale_t __loc) ;
#endif

/* Compare S1 and S2, both interpreted as appropriate to the
   LC_COLLATE category of the current locale.  */
extern int wcscoll (const wchar_t *__s1, const wchar_t *__s2) ;
/* Transform S2 into array pointed to by S1 such that if wcscmp is
   applied to two transformed strings the result is the as applying
   `wcscoll' to the original strings.  */
extern size_t wcsxfrm (wchar_t * __s1,
		       const wchar_t * __s2, size_t __n) ;

#ifdef __USE_XOPEN2K8
/* Similar to the two functions above but take the information from
   the provided locale and not the global locale.  */

/* Compare S1 and S2, both interpreted as appropriate to the
   LC_COLLATE category of the given locale.  */
extern int wcscoll_l (const wchar_t *__s1, const wchar_t *__s2,
		      locale_t __loc) ;

/* Transform S2 into array pointed to by S1 such that if wcscmp is
   applied to two transformed strings the result is the as applying
   `wcscoll' to the original strings.  */
extern size_t wcsxfrm_l (wchar_t *__s1, const wchar_t *__s2,
			 size_t __n, locale_t __loc) ;

/* Duplicate S, returning an identical malloc'd string.  */
extern wchar_t *wcsdup (const wchar_t *__s);
#endif

/* Find the first occurrence of WC in WCS.  */
#ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO
#else
extern wchar_t *wcschr (const wchar_t *__wcs, wchar_t __wc)
      ;
#endif
/* Find the last occurrence of WC in WCS.  */
#ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO
#else
extern wchar_t *wcsrchr (const wchar_t *__wcs, wchar_t __wc)
      ;
#endif

#ifdef __USE_GNU
/* This function is similar to `wcschr'.  But it returns a pointer to
   the closing NUL wide character in case C is not found in S.  */
extern wchar_t *wcschrnul (const wchar_t *__s, wchar_t __wc)
      ;
#endif

/* Return the length of the initial segmet of WCS which
   consists entirely of wide characters not in REJECT.  */
extern size_t wcscspn (const wchar_t *__wcs, const wchar_t *__reject)
      ;
/* Return the length of the initial segmet of WCS which
   consists entirely of wide characters in  ACCEPT.  */
extern size_t wcsspn (const wchar_t *__wcs, const wchar_t *__accept)
      ;
/* Find the first occurrence in WCS of any character in ACCEPT.  */
#ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO
#else
extern wchar_t *wcspbrk (const wchar_t *__wcs, const wchar_t *__accept)
      ;
#endif
/* Find the first occurrence of NEEDLE in HAYSTACK.  */
#ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO
#else
extern wchar_t *wcsstr (const wchar_t *__haystack, const wchar_t *__needle)
      ;
#endif

/* Divide WCS into tokens separated by characters in DELIM.  */
extern wchar_t *wcstok (wchar_t * __s,
			const wchar_t * __delim,
			wchar_t ** __ptr) ;

/* Return the number of wide characters in S.  */
extern size_t wcslen (const wchar_t *__s)  ;

#ifdef __USE_XOPEN
/* Another name for `wcsstr' from XPG4.  */
# ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO
# else
extern wchar_t *wcswcs (const wchar_t *__haystack, const wchar_t *__needle)
      ;
# endif
#endif

#ifdef __USE_XOPEN2K8
/* Return the number of wide characters in S, but at most MAXLEN.  */
extern size_t wcsnlen (const wchar_t *__s, size_t __maxlen)
      ;
#endif


/* Search N wide characters of S for C.  */
#ifdef __CORRECT_ISO_CPP_WCHAR_H_PROTO
#else
extern wchar_t *wmemchr (const wchar_t *__s, wchar_t __c, size_t __n)
      ;
#endif

/* Compare N wide characters of S1 and S2.  */
extern int wmemcmp (const wchar_t *__s1, const wchar_t *__s2, size_t __n)
      ;

/* Copy N wide characters of SRC to DEST.  */
extern wchar_t *wmemcpy (wchar_t * __s1,
			 const wchar_t * __s2, size_t __n) ;

/* Copy N wide characters of SRC to DEST, guaranteeing
   correct behavior for overlapping strings.  */
extern wchar_t *wmemmove (wchar_t *__s1, const wchar_t *__s2, size_t __n)
     ;

/* Set N wide characters of S to C.  */
extern wchar_t *wmemset (wchar_t *__s, wchar_t __c, size_t __n) ;

#ifdef __USE_GNU
/* Copy N wide characters of SRC to DEST and return pointer to following
   wide character.  */
extern wchar_t *wmempcpy (wchar_t * __s1,
			  const wchar_t * __s2, size_t __n)
     ;
#endif


/* Determine whether C constitutes a valid (one-byte) multibyte
   character.  */
extern wint_t btowc (int __c) ;

/* Determine whether C corresponds to a member of the extended
   character set whose multibyte representation is a single byte.  */
extern int wctob (wint_t __c) ;

/* Determine whether PS points to an object representing the initial
   state.  */
extern int mbsinit (const mbstate_t *__ps)  ;

/* Write wide character representation of multibyte character pointed
   to by S to PWC.  */
extern size_t mbrtowc (wchar_t * __pwc,
		       const char * __s, size_t __n,
		       mbstate_t * __p) ;

/* Write multibyte representation of wide character WC to S.  */
extern size_t wcrtomb (char * __s, wchar_t __wc,
		       mbstate_t * __ps) ;

/* Return number of bytes in multibyte character pointed to by S.  */
extern size_t __mbrlen (const char * __s, size_t __n,
			mbstate_t * __ps) ;
extern size_t mbrlen (const char * __s, size_t __n,
		      mbstate_t * __ps) ;


/* Write wide character representation of multibyte character string
   SRC to DST.  */
extern size_t mbsrtowcs (wchar_t * __dst,
			 const char ** __src, size_t __len,
			 mbstate_t * __ps) ;

/* Write multibyte character representation of wide character string
   SRC to DST.  */
extern size_t wcsrtombs (char * __dst,
			 const wchar_t ** __src, size_t __len,
			 mbstate_t * __ps) ;


#ifdef	__USE_XOPEN2K8
/* Write wide character representation of at most NMC bytes of the
   multibyte character string SRC to DST.  */
extern size_t mbsnrtowcs (wchar_t * __dst,
			  const char ** __src, size_t __nmc,
			  size_t __len, mbstate_t * __ps) ;

/* Write multibyte character representation of at most NWC characters
   from the wide character string SRC to DST.  */
extern size_t wcsnrtombs (char * __dst,
			  const wchar_t ** __src,
			  size_t __nwc, size_t __len,
			  mbstate_t * __ps) ;
#endif	/* use POSIX 2008 */


/* The following functions are extensions found in X/Open CAE.  */
#ifdef __USE_XOPEN
/* Determine number of column positions required for C.  */
extern int wcwidth (wchar_t __c) ;

/* Determine number of column positions required for first N wide
   characters (or fewer if S ends before this) in S.  */
extern int wcswidth (const wchar_t *__s, size_t __n) ;
#endif	/* Use X/Open.  */


/* Convert initial portion of the wide string NPTR to `double'
   representation.  */
extern double wcstod (const wchar_t * __nptr,
		      wchar_t ** __endptr) ;

#ifdef __USE_ISOC99
/* Likewise for `float' and `long_double' sizes of floating-point numbers.  */
extern float wcstof (const wchar_t * __nptr,
		     wchar_t ** __endptr) ;
extern long_double wcstold (const wchar_t * __nptr,
			    wchar_t ** __endptr) ;
#endif /* C99 */

#if __GLIBC_USE (IEC_60559_TYPES_EXT) && __GLIBC_USE (ISOC2X)
/* Likewise for `_FloatN' and `_FloatNx' when support is enabled.  */

# if __HAVE_FLOAT16
extern _Float16 wcstof16 (const wchar_t * __nptr,
			  wchar_t ** __endptr) ;
# endif

# if __HAVE_FLOAT32
extern _Float32 wcstof32 (const wchar_t * __nptr,
			  wchar_t ** __endptr) ;
# endif

# if __HAVE_FLOAT64
extern _Float64 wcstof64 (const wchar_t * __nptr,
			  wchar_t ** __endptr) ;
# endif

# if __HAVE_FLOAT128
extern _Float128 wcstof128 (const wchar_t * __nptr,
			    wchar_t ** __endptr) ;
# endif

# if __HAVE_FLOAT32X
extern _Float32x wcstof32x (const wchar_t * __nptr,
			    wchar_t ** __endptr) ;
# endif

# if __HAVE_FLOAT64X
extern _Float64x wcstof64x (const wchar_t * __nptr,
			    wchar_t ** __endptr) ;
# endif

# if __HAVE_FLOAT128X
extern _Float128x wcstof128x (const wchar_t * __nptr,
			      wchar_t ** __endptr) ;
# endif
#endif /* __GLIBC_USE (IEC_60559_TYPES_EXT) && __GLIBC_USE (ISOC2X) */


/* Convert initial portion of wide string NPTR to `long int'
   representation.  */
extern long int wcstol (const wchar_t * __nptr,
			wchar_t ** __endptr, int __base) ;

/* Convert initial portion of wide string NPTR to `unsigned long int'
   representation.  */
extern unsigned long int wcstoul (const wchar_t * __nptr,
				  wchar_t ** __endptr, int __base)
     ;

#ifdef __USE_ISOC99
/* Convert initial portion of wide string NPTR to `long long int'
   representation.  */

extern long long int wcstoll (const wchar_t * __nptr,
			      wchar_t ** __endptr, int __base)
     ;

/* Convert initial portion of wide string NPTR to `unsigned long long int'
   representation.  */

extern unsigned long long int wcstoull (const wchar_t * __nptr,
					wchar_t ** __endptr,
					int __base) ;
#endif /* ISO C99.  */

#ifdef __USE_GNU
/* Convert initial portion of wide string NPTR to `long long int'
   representation.  */

extern long long int wcstoq (const wchar_t * __nptr,
			     wchar_t ** __endptr, int __base)
     ;

/* Convert initial portion of wide string NPTR to `unsigned long long int'
   representation.  */

extern unsigned long long int wcstouq (const wchar_t * __nptr,
				       wchar_t ** __endptr,
				       int __base) ;
#endif /* Use GNU.  */

/* Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.  */
#if __GLIBC_USE (C2X_STRTOL)
# ifdef __REDIRECT
# else
extern long int __isoc23_wcstol (const wchar_t * __nptr,
				 wchar_t ** __endptr, int __base)
     ;
extern unsigned long int __isoc23_wcstoul (const wchar_t * __nptr,
					   wchar_t ** __endptr,
					   int __base)
     ;

extern long long int __isoc23_wcstoll (const wchar_t * __nptr,
				       wchar_t ** __endptr,
				       int __base)
     ;

extern unsigned long long int __isoc23_wcstoull (const wchar_t * __nptr,
						 wchar_t ** __endptr,
						 int __base)
     ;

#ifdef __USE_GNU
/* Parallel versions of the functions above which take the locale to
   use as an additional parameter.  These are GNU extensions inspired
   by the POSIX.1-2008 extended locale API.  */
extern long int wcstol_l (const wchar_t * __nptr,
			  wchar_t ** __endptr, int __base,
			  locale_t __loc) ;

extern unsigned long int wcstoul_l (const wchar_t * __nptr,
				    wchar_t ** __endptr,
				    int __base, locale_t __loc) ;


extern long long int wcstoll_l (const wchar_t * __nptr,
				wchar_t ** __endptr,
				int __base, locale_t __loc) ;


extern unsigned long long int wcstoull_l (const wchar_t * __nptr,
					  wchar_t ** __endptr,
					  int __base, locale_t __loc)
     ;

/* Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.  */
# if __GLIBC_USE (C2X_STRTOL)
#  ifdef __REDIRECT
#  else
extern long int __isoc23_wcstol_l (const wchar_t * __nptr,
				   wchar_t ** __endptr, int __base,
				   locale_t __loc) ;
extern unsigned long int __isoc23_wcstoul_l (const wchar_t * __nptr,
					     wchar_t ** __endptr,
					     int __base, locale_t __loc)
     ;

extern long long int __isoc23_wcstoll_l (const wchar_t * __nptr,
					 wchar_t ** __endptr,
					 int __base, locale_t __loc)
     ;

extern unsigned long long int __isoc23_wcstoull_l (const wchar_t * __nptr,
						   wchar_t ** __endptr,
						   int __base, locale_t __loc)
     ;

extern double wcstod_l (const wchar_t * __nptr,
			wchar_t ** __endptr, locale_t __loc)
     ;

extern float wcstof_l (const wchar_t * __nptr,
		       wchar_t ** __endptr, locale_t __loc)
     ;

extern long_double wcstold_l (const wchar_t * __nptr,
			      wchar_t ** __endptr,
			      locale_t __loc) ;

# if __HAVE_FLOAT16
extern _Float16 wcstof16_l (const wchar_t * __nptr,
			    wchar_t ** __endptr,
			    locale_t __loc) ;
# endif

# if __HAVE_FLOAT32
extern _Float32 wcstof32_l (const wchar_t * __nptr,
			    wchar_t ** __endptr,
			    locale_t __loc) ;
# endif

# if __HAVE_FLOAT64
extern _Float64 wcstof64_l (const wchar_t * __nptr,
			    wchar_t ** __endptr,
			    locale_t __loc) ;
# endif

# if __HAVE_FLOAT128
extern _Float128 wcstof128_l (const wchar_t * __nptr,
			      wchar_t ** __endptr,
			      locale_t __loc) ;
# endif

# if __HAVE_FLOAT32X
extern _Float32x wcstof32x_l (const wchar_t * __nptr,
			      wchar_t ** __endptr,
			      locale_t __loc) ;
# endif

# if __HAVE_FLOAT64X
extern _Float64x wcstof64x_l (const wchar_t * __nptr,
			      wchar_t ** __endptr,
			      locale_t __loc) ;
# endif

# if __HAVE_FLOAT128X
extern _Float128x wcstof128x_l (const wchar_t * __nptr,
				wchar_t ** __endptr,
				locale_t __loc) ;
# endif
#endif	/* use GNU */


#ifdef __USE_XOPEN2K8
/* Copy SRC to DEST, returning the address of the terminating L'\0' in
   DEST.  */
extern wchar_t *wcpcpy (wchar_t * __dest,
			const wchar_t * __src) ;

/* Copy no more than N characters of SRC to DEST, returning the address of
   the last character written into DEST.  */
extern wchar_t *wcpncpy (wchar_t * __dest,
			 const wchar_t * __src, size_t __n)
     ;
#endif


/* Wide character I/O functions.  */


/* Like OPEN_MEMSTREAM, but the stream is wide oriented and produces
   a wide character string.  */
extern __FILE *open_wmemstream (wchar_t **__bufloc, size_t *__sizeloc);
#endif

#if defined __USE_ISOC95 || defined __USE_UNIX98

/* Select orientation for stream.  */
extern int fwide (__FILE *__fp, int __mode) ;


/* Write formatted output to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fwprintf (__FILE * __stream,
		     const wchar_t * __format, ...)
     /* __attribute__ ((__format__ (__wprintf__, 2, 3))) */;
/* Write formatted output to stdout.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int wprintf (const wchar_t * __format, ...)
     /* __attribute__ ((__format__ (__wprintf__, 1, 2))) */;
/* Write formatted output of at most N characters to S.  */
extern int swprintf (wchar_t * __s, size_t __n,
		     const wchar_t * __format, ...)
      /* __attribute__ ((__format__ (__wprintf__, 3, 4))) */;

/* Write formatted output to S from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vfwprintf (__FILE * __s,
		      const wchar_t * __format,
		      __gnuc_va_list __arg)
     /* __attribute__ ((__format__ (__wprintf__, 2, 0))) */;
/* Write formatted output to stdout from argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vwprintf (const wchar_t * __format,
		     __gnuc_va_list __arg)
     /* __attribute__ ((__format__ (__wprintf__, 1, 0))) */;
/* Write formatted output of at most N character to S from argument
   list ARG.  */
extern int vswprintf (wchar_t * __s, size_t __n,
		      const wchar_t * __format,
		      __gnuc_va_list __arg)
      /* __attribute__ ((__format__ (__wprintf__, 3, 0))) */;


/* Read formatted input from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fwscanf (__FILE * __stream,
		    const wchar_t * __format, ...)
     /* __attribute__ ((__format__ (__wscanf__, 2, 3))) */;
/* Read formatted input from stdin.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int wscanf (const wchar_t * __format, ...)
     /* __attribute__ ((__format__ (__wscanf__, 1, 2))) */;
/* Read formatted input from S.  */
extern int swscanf (const wchar_t * __s,
		    const wchar_t * __format, ...)
      /* __attribute__ ((__format__ (__wscanf__, 2, 3))) */;

/* For historical reasons, the C99-compliant versions of the scanf
   functions are at alternative names.  When __LDBL_COMPAT or
   __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI are in effect, this is handled in
   bits/wchar-ldbl.h.  */
extern int __isoc23_fwscanf (__FILE * __stream,
			     const wchar_t * __format, ...);
extern int __isoc23_wscanf (const wchar_t * __format, ...);
extern int __isoc23_swscanf (const wchar_t * __s,
			     const wchar_t * __format, ...)
     ;
extern int __isoc99_fwscanf (__FILE * __stream,
			     const wchar_t * __format, ...);
extern int __isoc99_wscanf (const wchar_t * __format, ...);
extern int __isoc99_swscanf (const wchar_t * __s,
			     const wchar_t * __format, ...)
     ;

#endif /* Use ISO C95, C99 and Unix98. */

#ifdef __USE_ISOC99
/* Read formatted input from S into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vfwscanf (__FILE * __s,
		     const wchar_t * __format,
		     __gnuc_va_list __arg)
     /* __attribute__ ((__format__ (__wscanf__, 2, 0))) */;
/* Read formatted input from stdin into argument list ARG.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int vwscanf (const wchar_t * __format,
		    __gnuc_va_list __arg)
     /* __attribute__ ((__format__ (__wscanf__, 1, 0))) */;
/* Read formatted input from S into argument list ARG.  */
extern int vswscanf (const wchar_t * __s,
		     const wchar_t * __format,
		     __gnuc_va_list __arg)
      /* __attribute__ ((__format__ (__wscanf__, 2, 0))) */;


#endif /* Use ISO C99. */


/* Read a character from STREAM.

   These functions are possible cancellation points and therefore not
   marked with .  */
extern wint_t fgetwc (__FILE *__stream);
extern wint_t getwc (__FILE *__stream);

/* Read a character from stdin.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern wint_t getwchar (void);


/* Write a character to STREAM.

   These functions are possible cancellation points and therefore not
   marked with .  */
extern wint_t fputwc (wchar_t __wc, __FILE *__stream);
extern wint_t putwc (wchar_t __wc, __FILE *__stream);

/* Write a character to stdout.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern wint_t putwchar (wchar_t __wc);


/* Get a newline-terminated wide character string of finite length
   from STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern wchar_t *fgetws (wchar_t * __ws, int __n,
			__FILE * __stream);

/* Write a string to STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern int fputws (const wchar_t * __ws,
		   __FILE * __stream);


/* Push a character back onto the input buffer of STREAM.

   This function is a possible cancellation point and therefore not
   marked with .  */
extern wint_t ungetwc (wint_t __wc, __FILE *__stream);


#ifdef __USE_GNU
/* These are defined to be equivalent to the `char' functions defined
   in POSIX.1:1996.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .  */
extern wint_t getwc_unlocked (__FILE *__stream);
extern wint_t getwchar_unlocked (void);

/* This is the wide character version of a GNU extension.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern wint_t fgetwc_unlocked (__FILE *__stream);

/* Faster version when locking is not necessary.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern wint_t fputwc_unlocked (wchar_t __wc, __FILE *__stream);

/* These are defined to be equivalent to the `char' functions defined
   in POSIX.1:1996.

   These functions are not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation they are cancellation points and
   therefore not marked with .  */
extern wint_t putwc_unlocked (wchar_t __wc, __FILE *__stream);
extern wint_t putwchar_unlocked (wchar_t __wc);


/* This function does the same as `fgetws' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern wchar_t *fgetws_unlocked (wchar_t * __ws, int __n,
				 __FILE * __stream);

/* This function does the same as `fputws' but does not lock the stream.

   This function is not part of POSIX and therefore no official
   cancellation point.  But due to similarity with an POSIX interface
   or due to the implementation it is a cancellation point and
   therefore not marked with .  */
extern int fputws_unlocked (const wchar_t * __ws,
			    __FILE * __stream);
#endif


/* Format TP into S according to FORMAT.
   Write no more than MAXSIZE wide characters and return the number
   of wide characters written, or 0 if it would exceed MAXSIZE.  */
extern size_t wcsftime (wchar_t * __s, size_t __maxsize,
			const wchar_t * __format,
			const struct tm * __tp) ;

# ifdef __USE_GNU
/* Similar to `wcsftime' but takes the information from
   the provided locale and not the global locale.  */
extern size_t wcsftime_l (wchar_t * __s, size_t __maxsize,
			  const wchar_t * __format,
			  const struct tm * __tp,
			  locale_t __loc) ;
# endif

/* Define some macros helping to catch buffer overflows.  */
#if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function
/* Declare all functions from bits/wchar2-decl.h first.  */
# include <bits/wchar2-decl.h>
#endif

/* The following headers provide asm redirections.  These redirections must
   appear before the first usage of these functions, e.g. in bits/wchar.h.  */
#if defined __LDBL_COMPAT || __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI == 1
# include <bits/wchar-ldbl.h>
#endif

#if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function
/* Now include the function definitions and redirects too.  */
# include <bits/wchar2.h>
#endif


#endif /* wchar.h  */
