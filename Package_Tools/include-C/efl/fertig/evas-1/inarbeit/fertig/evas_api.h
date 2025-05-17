#ifndef _EFL_extern_H
#define _EFL_extern_H

#ifdef extern
#error extern should not be already defined
#endif

#ifdef _WIN32
# ifndef EVAS_STATIC
#  ifdef EVAS_BUILD
#   define extern __declspec(dllexport)
#  else
#   define extern __declspec(dllimport)
#  endif
# else
#  define extern
# endif
# define 
#elif __GNUC__
# if __GNUC__ >= 4
#  define extern __attribute__ ((visibility("default")))
#  define  __attribute__ ((weak))
# else
#  define extern
#  define 
# endif
#else
# define extern
# define 
#endif

#endif
