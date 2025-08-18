#ifndef __GSL_VERSION_H__
#define __GSL_VERSION_H__

#include <gsl/gsl_types.h>

#undef 
#undef 
#ifdef __cplusplus
# define  extern "C" {
# define  }
#else
# define  /* empty */
# define  /* empty */
#endif



#define GSL_VERSION "2.7.1"
#define GSL_MAJOR_VERSION 2
#define GSL_MINOR_VERSION 7

GSL_VAR const char * gsl_version;



#endif /* __GSL_VERSION_H__ */
