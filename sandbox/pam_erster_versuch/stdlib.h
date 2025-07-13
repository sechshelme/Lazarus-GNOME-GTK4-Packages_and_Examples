/* Copyright (C) 1991-2024 Free Software Foundation, Inc.
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
 *	ISO C99 Standard: 7.20 General utilities	<stdlib.h>
 */

#ifndef	_STDLIB_H

#define __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION
#include <bits/libc-header-start.h>

/* Get size_t, wchar_t and NULL from <stddef.h>.  */
#define __need_size_t
#define __need_wchar_t
#define __need_NULL
#include <stddef.h>



#define	_STDLIB_H	1

#if (defined __USE_XOPEN || defined __USE_XOPEN2K8) && !defined _SYS_WAIT_H
/* XPG requires a few symbols from <sys/wait.h> being defined.  */
# include <bits/waitflags.h>
# include <bits/waitstatus.h>

/* Define the macros <sys/wait.h> also would define this way.  */
# define WEXITSTATUS(status)	__WEXITSTATUS (status)
# define WTERMSIG(status)	__WTERMSIG (status)
# define WSTOPSIG(status)	__WSTOPSIG (status)
# define WIFEXITED(status)	__WIFEXITED (status)
# define WIFSIGNALED(status)	__WIFSIGNALED (status)
# define WIFSTOPPED(status)	__WIFSTOPPED (status)
# ifdef __WIFCONTINUED
#  define WIFCONTINUED(status)	__WIFCONTINUED (status)
# endif
#endif	/* X/Open or XPG7 and <sys/wait.h> not included.  */

/* _FloatN API tests for enablement.  */
#include <bits/floatn.h>

/* Returned by `div'.  */
typedef struct
  {
    int quot;			/* Quotient.  */
    int rem;			/* Remainder.  */
  } div_t;

/* Returned by `ldiv'.  */
#ifndef __ldiv_t_defined
typedef struct
  {
    long int quot;		/* Quotient.  */
    long int rem;		/* Remainder.  */
  } ldiv_t;
# define __ldiv_t_defined	1
#endif

#if defined __USE_ISOC99 && !defined __lldiv_t_defined
/* Returned by `lldiv'.  */
 typedef struct
  {
    long long int quot;		/* Quotient.  */
    long long int rem;		/* Remainder.  */
  } lldiv_t;
# define __lldiv_t_defined	1
#endif


/* The largest number rand will return (same as INT_MAX).  */
#define	RAND_MAX	2147483647


/* We define these the same for all machines.
   Changes from this to the outside world should be done in `_exit'.  */
#define	EXIT_FAILURE	1	/* Failing exit status.  */
#define	EXIT_SUCCESS	0	/* Successful exit status.  */


/* Maximum length of a multibyte character in the current locale.  */


/* Convert a string to a floating-point number.  */
extern double atof (const char *__nptr)
       ;
/* Convert a string to an integer.  */
extern int atoi (const char *__nptr)
       ;
/* Convert a string to a long integer.  */
extern long int atol (const char *__nptr)
       ;

#ifdef __USE_ISOC99
/* Convert a string to a long long integer.  */
 extern long long int atoll (const char *__nptr)
       ;
#endif

/* Convert a string to a floating-point number.  */
extern double strtod (const char * __nptr,		      char ** __endptr)      ;

#ifdef	__USE_ISOC99
/* Likewise for `float' and `long double' sizes of floating-point numbers.  */
extern float strtof (const char * __nptr,
		     char ** __endptr)  ;

// xxxxxxxxx long double
extern double strtold (const char * __nptr,			    char ** __endptr)      ;
#endif

/* Likewise for '_FloatN' and '_FloatNx'.  */

#if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern _Float16 strtof16 (const char * __nptr,
			  char ** __endptr)
      ;
#endif

#if __HAVE_FLOAT32 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern _Float32 strtof32 (const char * __nptr,
			  char ** __endptr)
      ;
#endif

#if __HAVE_FLOAT64 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern _Float64 strtof64 (const char * __nptr,
			  char ** __endptr)
      ;
#endif

#if __HAVE_FLOAT128 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern _Float128 strtof128 (const char * __nptr,
			    char ** __endptr)
      ;
#endif

#if __HAVE_FLOAT32X && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern _Float32x strtof32x (const char * __nptr,
			    char ** __endptr)
      ;
#endif

#if __HAVE_FLOAT64X && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern _Float64x strtof64x (const char * __nptr,
			    char ** __endptr)
      ;
#endif

#if __HAVE_FLOAT128X && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern _Float128x strtof128x (const char * __nptr,
			      char ** __endptr)
      ;
#endif

/* Convert a string to a long integer.  */
extern long int strtol (const char * __nptr,
			char ** __endptr, int __base)
      ;
/* Convert a string to an unsigned long integer.  */
extern unsigned long int strtoul (const char * __nptr,
				  char ** __endptr, int __base)
      ;

#ifdef __USE_MISC
/* Convert a string to a quadword integer.  */

extern long long int strtoq (const char * __nptr,
			     char ** __endptr, int __base)
      ;
/* Convert a string to an unsigned quadword integer.  */

extern unsigned long long int strtouq (const char * __nptr,
				       char ** __endptr, int __base)
      ;
#endif /* Use misc.  */

#ifdef __USE_ISOC99
/* Convert a string to a quadword integer.  */

extern long long int strtoll (const char * __nptr,
			      char ** __endptr, int __base)
      ;
/* Convert a string to an unsigned quadword integer.  */

extern unsigned long long int strtoull (const char * __nptr,
					char ** __endptr, int __base)
      ;
#endif /* ISO C99 or use MISC.  */

/* Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.  */
#if __GLIBC_USE (C2X_STRTOL)
# ifdef __REDIRECT
extern long int strtol (const char * __nptr,
					 char ** __endptr,
					 int __base)
     ;
extern unsigned long int strtoul
					 (const char * __nptr,
					  char ** __endptr,
					  int __base)
     ;
#  ifdef __USE_MISC

extern long long int strtoq (const char * __nptr,
					      char ** __endptr,
					      int __base)
     ;

extern unsigned long long int strtouq
					      (const char * __nptr,
					       char ** __endptr,
					       int __base)
     ;
#  endif

extern long long int strtoll (const char * __nptr,
					       char ** __endptr,
					       int __base)
     ;

extern unsigned long long int strtoull
					      (const char * __nptr,
					       char ** __endptr,
					       int __base)
     ;

/* Convert a floating-point number to a string.  */
#if __GLIBC_USE (IEC_60559_BFP_EXT_C2X)
extern int strfromd (char *__dest, size_t __size, const char *__format,
		     double __f)
      ;

extern int strfromf (char *__dest, size_t __size, const char *__format,
		     float __f)
      ;

// xxxxxxxx long double
extern int strfroml (char *__dest, size_t __size, const char *__format,
		     double __f)
      ;
#endif

#if __HAVE_FLOAT16 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern int strfromf16 (char *__dest, size_t __size, const char * __format,
		       _Float16 __f)
      ;
#endif

#if __HAVE_FLOAT32 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern int strfromf32 (char *__dest, size_t __size, const char * __format,
		       _Float32 __f)
      ;
#endif

#if __HAVE_FLOAT64 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern int strfromf64 (char *__dest, size_t __size, const char * __format,
		       _Float64 __f)
      ;
#endif

#if __HAVE_FLOAT128 && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern int strfromf128 (char *__dest, size_t __size, const char * __format,
			_Float128 __f)
      ;
#endif

#if __HAVE_FLOAT32X && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern int strfromf32x (char *__dest, size_t __size, const char * __format,
			_Float32x __f)
      ;
#endif

#if __HAVE_FLOAT64X && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern int strfromf64x (char *__dest, size_t __size, const char * __format,
			_Float64x __f)
      ;
#endif

#if __HAVE_FLOAT128X && __GLIBC_USE (IEC_60559_TYPES_EXT)
extern int strfromf128x (char *__dest, size_t __size, const char * __format,
			 _Float128x __f)
      ;
#endif


#ifdef __USE_GNU
/* Parallel versions of the functions above which take the locale to
   use as an additional parameter.  These are GNU extensions inspired
   by the POSIX.1-2008 extended locale API.  */
# include <bits/types/locale_t.h>

extern long int strtol_l (const char * __nptr,
			  char ** __endptr, int __base,
			  locale_t __loc)  ;

extern unsigned long int strtoul_l (const char * __nptr,
				    char ** __endptr,
				    int __base, locale_t __loc)
      ;


extern long long int strtoll_l (const char * __nptr,
				char ** __endptr, int __base,
				locale_t __loc)
      ;


extern unsigned long long int strtoull_l (const char * __nptr,
					  char ** __endptr,
					  int __base, locale_t __loc)
      ;

/* Versions of the above functions that handle '0b' and '0B' prefixes
   in base 0 or 2.  */
# if __GLIBC_USE (C2X_STRTOL)
#  ifdef __REDIRECT
extern long int strtol_l (const char * __nptr,
					   char ** __endptr,
					   int __base, locale_t __loc)     ;
extern unsigned long int strtoul_l
					 (const char * __nptr,
					  char ** __endptr,
					  int __base, locale_t __loc)     ;

extern long long int strtoll_l (const char * __nptr,
						 char ** __endptr,
						 int __base,
						 locale_t __loc)     ;

extern unsigned long long int strtoull_l
					      (const char * __nptr,
					       char ** __endptr,
					       int __base, locale_t __loc)     ;

extern double strtod_l (const char * __nptr,
			char ** __endptr, locale_t __loc)
      ;

extern float strtof_l (const char * __nptr,
		       char ** __endptr, locale_t __loc)
      ;

// xxxxx long double
extern double strtold_l (const char * __nptr,
			      char ** __endptr,
			      locale_t __loc)
      ;

# if __HAVE_FLOAT16
extern _Float16 strtof16_l (const char * __nptr,
			    char ** __endptr,
			    locale_t __loc)
      ;
# endif

# if __HAVE_FLOAT32
extern _Float32 strtof32_l (const char * __nptr,
			    char ** __endptr,
			    locale_t __loc)
      ;
# endif

# if __HAVE_FLOAT64
extern _Float64 strtof64_l (const char * __nptr,
			    char ** __endptr,
			    locale_t __loc)
      ;
# endif

# if __HAVE_FLOAT128
extern _Float128 strtof128_l (const char * __nptr,
			      char ** __endptr,
			      locale_t __loc)
      ;
# endif

# if __HAVE_FLOAT32X
extern _Float32x strtof32x_l (const char * __nptr,
			      char ** __endptr,
			      locale_t __loc)
      ;
# endif

# if __HAVE_FLOAT64X
extern _Float64x strtof64x_l (const char * __nptr,
			      char ** __endptr,
			      locale_t __loc)
      ;
# endif

# if __HAVE_FLOAT128X
extern _Float128x strtof128x_l (const char * __nptr,
				char ** __endptr,
				locale_t __loc)
      ;
# endif
#endif /* GNU */




#if defined __USE_MISC || defined __USE_XOPEN_EXTENDED
/* Convert N to base 64 using the digits "./0-9A-Za-z", least-significant
   digit first.  Returns a pointer to static storage overwritten by the
   next call.  */
extern char *l64a (long int __n)  ;

/* Read a number from a string S in base 64 as above.  */
extern long int a64l (const char *__s)
       ;

#endif	/* Use misc || extended X/Open.  */

#if defined __USE_MISC || defined __USE_XOPEN_EXTENDED
# include <sys/types.h>	/* we need int32_t... */

/* These are the functions that actually do things.  The `random', `srandom',
   `initstate' and `setstate' functions are those from BSD Unices.
   The `rand' and `srand' functions are required by the ANSI standard.
   We provide both interfaces to the same random number generator.  */
/* Return a random long integer between 0 and 2^31-1 inclusive.  */
extern long int random (void) ;

/* Seed the random number generator with the given number.  */
extern void srandom (unsigned int __seed) ;

/* Initialize the random number generator to use state buffer STATEBUF,
   of length STATELEN, and seed it with SEED.  Optimal lengths are 8, 16,
   32, 64, 128 and 256, the bigger the better; values less than 8 will
   cause an error and values greater than 256 will be rounded down.  */
extern char *initstate (unsigned int __seed, char *__statebuf,
			size_t __statelen)  ;

/* Switch the random number generator to state buffer STATEBUF,
   which should have been previously initialized by `initstate'.  */
extern char *setstate (char *__statebuf)  ;


# ifdef __USE_MISC
/* Reentrant versions of the `random' family of functions.
   These functions all use the following data structure to contain
   state, rather than global state variables.  */

struct random_data
  {
    int32_t *fptr;		/* Front pointer.  */
    int32_t *rptr;		/* Rear pointer.  */
    int32_t *state;		/* Array of state values.  */
    int rand_type;		/* Type of random number generator.  */
    int rand_deg;		/* Degree of random number generator.  */
    int rand_sep;		/* Distance between front and rear.  */
    int32_t *end_ptr;		/* Pointer behind state table.  */
  };

extern int random_r (struct random_data * __buf,
		     int32_t * __result)  ;

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
      ;

extern int initstate_r (unsigned int __seed, char * __statebuf,
			size_t __statelen,
			struct random_data * __buf)
      ;

extern int setstate_r (char * __statebuf,
		       struct random_data * __buf)
      ;
# endif	/* Use misc.  */
#endif	/* Use extended X/Open || misc. */


/* Return a random integer between 0 and RAND_MAX inclusive.  */
extern int rand (void) ;
/* Seed the random number generator with the given number.  */
extern void srand (unsigned int __seed) ;

#ifdef __USE_POSIX199506
/* Reentrant interface according to POSIX.1.  */
extern int rand_r (unsigned int *__seed) ;
#endif


#if defined __USE_MISC || defined __USE_XOPEN
/* System V style 48-bit random number generator functions.  */

/* Return non-negative, double-precision floating-point value in [0.0,1.0).  */
extern double drand48 (void) ;
extern double erand48 (unsigned short int __xsubi[3])  ;

/* Return non-negative, long integer in [0,2^31).  */
extern long int lrand48 (void) ;
extern long int nrand48 (unsigned short int __xsubi[3])
      ;

/* Return signed, long integers in [-2^31,2^31).  */
extern long int mrand48 (void) ;
extern long int jrand48 (unsigned short int __xsubi[3])
      ;

/* Seed random number generator.  */
extern void srand48 (long int __seedval) ;
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
      ;
extern void lcong48 (unsigned short int __param[7])  ;

# ifdef __USE_MISC
/* Data structure for communication with thread safe versions.  This
   type is to be regarded as opaque.  It's only exported because users
   have to allocate objects of this type.  */
struct drand48_data
  {
    unsigned short int __x[3];	/* Current state.  */
    unsigned short int __old_x[3]; /* Old state.  */
    unsigned short int __c;	/* Additive const. in congruential formula.  */
    unsigned short int __init;	/* Flag for initializing.  */
     unsigned long long int __a;	/* Factor in congruential
						   formula.  */
  };

/* Return non-negative, double-precision floating-point value in [0.0,1.0).  */
extern int drand48_r (struct drand48_data * __buffer,
		      double * __result)  ;
extern int erand48_r (unsigned short int __xsubi[3],
		      struct drand48_data * __buffer,
		      double * __result)  ;

/* Return non-negative, long integer in [0,2^31).  */
extern int lrand48_r (struct drand48_data * __buffer,
		      long int * __result)
      ;
extern int nrand48_r (unsigned short int __xsubi[3],
		      struct drand48_data * __buffer,
		      long int * __result)
      ;

/* Return signed, long integers in [-2^31,2^31).  */
extern int mrand48_r (struct drand48_data * __buffer,
		      long int * __result)
      ;
extern int jrand48_r (unsigned short int __xsubi[3],
		      struct drand48_data * __buffer,
		      long int * __result)
      ;

/* Seed random number generator.  */
extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
      ;

extern int seed48_r (unsigned short int __seed16v[3],
		     struct drand48_data *__buffer)  ;

extern int lcong48_r (unsigned short int __param[7],
		      struct drand48_data *__buffer)
      ;

/* Return a random integer between zero and 2**32-1 (inclusive).  */
extern __uint32_t arc4random (void)
      ;

/* Fill the buffer with random data.  */
extern void arc4random_buf (void *__buf, size_t __size)
      ;

/* Return a random number between zero (inclusive) and the specified
   limit (exclusive).  */
extern __uint32_t arc4random_uniform (__uint32_t __upper_bound)
      ;
# endif	/* Use misc.  */
#endif	/* Use misc or X/Open.  */

/* Allocate SIZE bytes of memory.  */
extern void *malloc (size_t __size);
/* Allocate NMEMB elements of SIZE bytes each, all initialized to 0.  */
extern void *calloc (size_t __nmemb, size_t __size);

/* Re-allocate the previously allocated block
   in PTR, making the new block SIZE bytes long.  */
/* __attribute_malloc__ is not used, because if realloc returns
   the same pointer that was passed to it, aliasing needs to be allowed
   between objects pointed by the old and new pointers.  */
extern void *realloc (void *__ptr, size_t __size);

/* Free a block allocated by `malloc', `realloc' or `calloc'.  */
extern void free (void *__ptr) ;

#ifdef __USE_MISC
/* Re-allocate the previously allocated block in PTR, making the new
   block large enough for NMEMB elements of SIZE bytes each.  */
/* __attribute_malloc__ is not used, because if reallocarray returns
   the same pointer that was passed to it, aliasing needs to be allowed
   between objects pointed by the old and new pointers.  */
extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size);

/* Add reallocarray as its own deallocator.  */
extern void *reallocarray (void *__ptr, size_t __nmemb, size_t __size);
#endif

#ifdef __USE_MISC
# include <alloca.h>
#endif /* Use misc.  */

/* Allocate SIZE bytes on a page boundary.  The storage cannot be freed.  */
extern void *valloc (size_t __size) ;
#endif

#ifdef __USE_XOPEN2K
/* Allocate memory of SIZE bytes with an alignment of ALIGNMENT.  */
extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
      ;
#endif

#ifdef __USE_ISOC11
/* ISO C variant of aligned allocation.  */
extern void *aligned_alloc (size_t __alignment, size_t __size);
#endif

/* Abort execution and generate a core-dump.  */
extern void abort (void) ;


/* Register a function to be called when `exit' is called.  */
extern int atexit (void (*__func) (void))  ;

#if defined __USE_ISOC11 || defined __USE_ISOCXX11
/* Register a function to be called when `quick_exit' is called.  */
extern int at_quick_exit (void (*__func) (void))  ;
#endif

#ifdef	__USE_MISC
/* Register a function to be called with the status
   given to `exit' and the given argument.  */
extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
      ;
#endif

/* Call all functions registered with `atexit' and `on_exit',
   in the reverse of the order in which they were registered,
   perform stdio cleanup, and terminate program execution with STATUS.  */
extern void exit (int __status)  ;

#if defined __USE_ISOC11 || defined __USE_ISOCXX11
/* Call all functions registered with `at_quick_exit' in the reverse
   of the order in which they were registered and terminate program
   execution with STATUS.  */
extern void quick_exit (int __status)  ;
#endif

#ifdef __USE_ISOC99
/* Terminate the program with STATUS without calling any of the
   functions registered with `atexit' or `on_exit'.  */
extern void _Exit (int __status)  ;
#endif


/* Return the value of envariable NAME, or NULL if it doesn't exist.  */
extern char *getenv (const char *__name)  ;

#ifdef __USE_GNU
/* This function is similar to the above but returns NULL if the
   programs is running with SUID or SGID enabled.  */
extern char *secure_getenv (const char *__name)
      ;
#endif

#if defined __USE_MISC || defined __USE_XOPEN
/* The SVID says this is in <stdio.h>, but this seems a better place.	*/
/* Put STRING, which is of the form "NAME=VALUE", in the environment.
   If there is no `=', remove NAME from the environment.  */
extern int putenv (char *__string)  ;
#endif

#ifdef __USE_XOPEN2K
/* Set NAME to VALUE in the environment.
   If REPLACE is nonzero, overwrite an existing value.  */
extern int setenv (const char *__name, const char *__value, int __replace)
      ;

/* Remove the variable NAME from the environment.  */
extern int unsetenv (const char *__name)  ;
#endif

#ifdef	__USE_MISC
/* The `clearenv' was planned to be added to POSIX.1 but probably
   never made it.  Nevertheless the POSIX.9 standard (POSIX bindings
   for Fortran 77) requires this function.  */
extern int clearenv (void) ;
#endif


/* Generate a unique temporary file name from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the file name unique.
   Always returns TEMPLATE, it's either a temporary file name or a null
   string if it cannot get a unique file name.  */
extern char *mktemp (char *__template)  ;
#endif

#if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8
/* Generate a unique temporary file name from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the filename unique.
   Returns a file descriptor open on the file for reading and writing,
   or -1 if it cannot create a uniquely-named file.

   This function is a possible cancellation point and therefore not
   marked with .  */
# ifndef __USE_FILE_OFFSET64
extern int mkstemp (char *__template) ;
# else
#  ifdef __REDIRECT
extern int mkstemp64 (char *__template) ;
# endif
#endif

#ifdef __USE_MISC
/* Similar to mkstemp, but the template can have a suffix after the
   XXXXXX.  The length of the suffix is specified in the second
   parameter.

   This function is a possible cancellation point and therefore not
   marked with .  */
# ifndef __USE_FILE_OFFSET64
extern int mkstemps (char *__template, int __suffixlen) ;
# else
extern int mkstemps64 (char *__template, int __suffixlen)
     ;
# endif
#endif

#ifdef __USE_XOPEN2K8
/* Create a unique temporary directory from TEMPLATE.
   The last six characters of TEMPLATE must be "XXXXXX";
   they are replaced with a string that makes the directory name unique.
   Returns TEMPLATE, or a null pointer if it cannot get a unique name.
   The directory is created mode 700.  */
extern char *mkdtemp (char *__template)  ;
#endif

#ifdef __USE_GNU
/* Generate a unique temporary file name from TEMPLATE similar to
   mkstemp.  But allow the caller to pass additional flags which are
   used in the open call to create the file..

   This function is a possible cancellation point and therefore not
   marked with .  */
# ifndef __USE_FILE_OFFSET64
extern int mkostemp (char *__template, int __flags) ;
# else
extern int mkostemp64 (char *__template, int __flags) ;
# endif

/* Similar to mkostemp, but the template can have a suffix after the
   XXXXXX.  The length of the suffix is specified in the second
   parameter.

   This function is a possible cancellation point and therefore not
   marked with .  */
# ifndef __USE_FILE_OFFSET64
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     ;
# else
#  ifdef __REDIRECT
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     ;
# endif
#endif


/* Execute the given line as a shell command.

   This function is a cancellation point and therefore not marked with
   .  */
extern int system (const char *__command) ;


#ifdef	__USE_GNU
/* Return a malloc'd string containing the canonical absolute name of the
   existing named file.  */
extern char *canonicalize_file_name (const char *__name);
#endif

#if defined __USE_MISC || defined __USE_XOPEN_EXTENDED
/* Return the canonical absolute name of file NAME.  If RESOLVED is
   null, the result is malloc'd; otherwise, if the canonical name is
   PATH_MAX chars or more, returns null with `errno' set to
   ENAMETOOLONG; if the name fits in fewer than PATH_MAX chars,
   returns the name in RESOLVED.  */
extern char *realpath (const char * __name,
		       char * __resolved)  ;
#endif


/* Shorthand for type of comparison functions.  */
#ifndef __COMPAR_FN_T
# define __COMPAR_FN_T
typedef int (*__compar_fn_t) (const void *, const void *);

# ifdef	__USE_GNU
typedef __compar_fn_t comparison_fn_t;
# endif
#endif
#ifdef __USE_GNU
typedef int (*__compar_d_fn_t) (const void *, const void *, void *);
#endif

/* Do a binary search for KEY in BASE, which consists of NMEMB elements
   of SIZE bytes each, using COMPAR to perform the comparisons.  */
extern void *bsearch (const void *__key, const void *__base,
		      size_t __nmemb, size_t __size, __compar_fn_t __compar)
     ;

#ifdef __USE_EXTERN_INLINES
# include <bits/stdlib-bsearch.h>
#endif

/* Sort NMEMB elements of BASE, of SIZE bytes each,
   using COMPAR to perform the comparisons.  */
extern void qsort (void *__base, size_t __nmemb, size_t __size,
		   __compar_fn_t __compar) ;
#ifdef __USE_GNU
extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
		     __compar_d_fn_t __compar, void *__arg)
  ;
#endif


/* Return the absolute value of X.  */
extern int abs (int __x) ;
extern long int labs (long int __x) ;

#ifdef __USE_ISOC99
 extern long long int llabs (long long int __x);
#endif


/* Return the `div_t', `ldiv_t' or `lldiv_t' representation
   of the value of NUMER over DENOM. */
/* GCC may have built-ins for these someday.  */
extern div_t div (int __numer, int __denom);
extern ldiv_t ldiv (long int __numer, long int __denom);

#ifdef __USE_ISOC99
 extern lldiv_t lldiv (long long int __numer,
				    long long int __denom) ;
#endif


/* Convert floating point numbers to strings.  The returned values are
   valid only until another call to the same function.  */

/* Convert VALUE to a string with NDIGIT digits and return a pointer to
   this.  Set *DECPT with the position of the decimal character and *SIGN
   with the sign of the number.  */
extern char *ecvt (double __value, int __ndigit, int * __decpt,
		   int * __sign)   ;

/* Convert VALUE to a string rounded to NDIGIT decimal digits.  Set *DECPT
   with the position of the decimal character and *SIGN with the sign of
   the number.  */
extern char *fcvt (double __value, int __ndigit, int * __decpt,
		   int * __sign)   ;

/* If possible convert VALUE to a string with NDIGIT significant digits.
   Otherwise use exponential representation.  The resulting string will
   be written to BUF.  */
extern char *gcvt (double __value, int __ndigit, char *__buf)
       ;
#endif

#ifdef __USE_MISC
/* Long double versions of above functions.  */
// xx long double
extern char *qecvt ( double __value, int __ndigit,
		    int * __decpt, int * __sign)
       ;
// xx long double
extern char *qfcvt ( double __value, int __ndigit,
		    int * __decpt, int * __sign)
       ;
// xx long double
extern char *qgcvt ( double __value, int __ndigit, char *__buf)
       ;


/* Reentrant version of the functions above which provide their own
   buffers.  */
extern int ecvt_r (double __value, int __ndigit, int * __decpt,
		   int * __sign, char * __buf,
		   size_t __len)  ;
extern int fcvt_r (double __value, int __ndigit, int * __decpt,
		   int * __sign, char * __buf,
		   size_t __len)  ;

// xxxxx long double
extern int qecvt_r ( double __value, int __ndigit,
		    int * __decpt, int * __sign,
		    char * __buf, size_t __len)
      ;
// xxxxx long double
extern int qfcvt_r ( double __value, int __ndigit,
		    int * __decpt, int * __sign,
		    char * __buf, size_t __len)
      ;
#endif	/* misc */


/* Return the length of the multibyte character
   in S, which is no longer than N.  */
extern int mblen (const char *__s, size_t __n) ;
/* Return the length of the given multibyte character,
   putting its `wchar_t' representation in *PWC.  */
extern int mbtowc (wchar_t * __pwc,
		   const char * __s, size_t __n) ;
/* Put the multibyte character represented
   by WCHAR in S, returning its length.  */
extern int wctomb (char *__s, wchar_t __wchar) ;


/* Convert a multibyte string to a wide char string.  */
extern size_t mbstowcs (wchar_t *  __pwcs,
			const char * __s, size_t __n) ;
/* Convert a wide char string to multibyte string.  */
extern size_t wcstombs (char * __s,
			const wchar_t * __pwcs, size_t __n);

#ifdef __USE_MISC
/* Determine whether the string value of RESPONSE matches the affirmation
   or negative response expression as specified by the LC_MESSAGES category
   in the program's current locale.  Returns 1 if affirmative, 0 if
   negative, and -1 if not matching.  */
extern int rpmatch (const char *__response)  ;
#endif


#if defined __USE_XOPEN_EXTENDED || defined __USE_XOPEN2K8
/* Parse comma separated suboption from *OPTIONP and match against
   strings in TOKENS.  If found return index and set *VALUEP to
   optional value introduced by an equal sign.  If the suboption is
   not part of TOKENS return in *VALUEP beginning of unknown
   suboption.  On exit *OPTIONP is set to the beginning of the next
   token or at the terminating NUL character.  */
extern int getsubopt (char ** __optionp,
		      char *const * __tokens,
		      char ** __valuep);
#endif


/* X/Open pseudo terminal handling.  */

#ifdef __USE_XOPEN2KXSI
/* Return a master pseudo-terminal handle.  */
extern int posix_openpt (int __oflag) ;
#endif

#ifdef __USE_XOPEN_EXTENDED
/* The next four functions all take a master pseudo-tty fd and
   perform an operation on the associated slave:  */

/* Chown the slave to the calling user.  */
extern int grantpt (int __fd) ;

/* Release an internal lock so the slave can be opened.
   Call after grantpt().  */
extern int unlockpt (int __fd) ;

/* Return the pathname of the pseudo terminal slave associated with
   the master FD is open on, or NULL on errors.
   The returned storage is good until the next call to this function.  */
extern char *ptsname (int __fd)  ;
#endif

#ifdef __USE_GNU
/* Store at most BUFLEN characters of the pathname of the slave pseudo
   terminal associated with the master FD is open on in BUF.
   Return 0 on success, otherwise an error number.  */
extern int ptsname_r (int __fd, char *__buf, size_t __buflen);

/* Open a master pseudo terminal and return its file descriptor.  */
extern int getpt (void);
#endif

#ifdef __USE_MISC
/* Put the 1 minute, 5 minute and 15 minute load averages into the first
   NELEM elements of LOADAVG.  Return the number written (never more than
   three, but may be less than NELEM), or -1 if an error occurred.  */
extern int getloadavg (double __loadavg[], int __nelem)
      ;
#endif

#if defined __USE_XOPEN_EXTENDED && !defined __USE_XOPEN2K
/* Return the index into the active-logins file (utmp) for
   the controlling terminal.  */
extern int ttyslot (void) ;
#endif

#include <bits/stdlib-float.h>

/* Define some macros helping to catch buffer overflows.  */
#if __USE_FORTIFY_LEVEL > 0 && defined __fortify_function
# include <bits/stdlib.h>
#endif

#include <bits/floatn.h>
#if defined __LDBL_COMPAT || __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI == 1
# include <bits/stdlib-ldbl.h>
#endif


#endif /* stdlib.h  */
