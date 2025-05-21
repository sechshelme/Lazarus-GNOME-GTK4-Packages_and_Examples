#ifndef _EFL_CORE_H
#define _EFL_CORE_H

#include <Efl_Config.h>

#include <Eina.h>
#include <Eo.h>
#include <Efl.h>
#ifdef extern
# undef extern
#endif


#include <sys/types.h>

#ifdef __cplusplus
extern "C" {
#endif

 extern double _efl_startup_time;

#include "Ecore_Common.h"
#include "Ecore_Eo.h"

#ifdef __cplusplus
}
#endif


#endif

// We are including efl_general.h again, just in case Efl_Core.h was already included before this
// and the __EFL_*_IS_REQUIRED changed since then.
#include "efl_general.h"
