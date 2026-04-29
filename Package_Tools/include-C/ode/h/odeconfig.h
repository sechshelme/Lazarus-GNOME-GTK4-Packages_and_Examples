/*************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 *************************************************************************/

#ifndef _ODE_ODECONFIG_H_
#define _ODE_ODECONFIG_H_

/* Pull in the standard headers */
#include <stddef.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <math.h>
#include <string.h>
#include <float.h>


#include <ode/precision.h>


#if defined(ODE_DLL) || defined(ODE_LIB)
#define __ODE__
#endif



/* Well-defined common data types...need to be defined for 64 bit systems */
    typedef int64_t         dint64;
    typedef uint64_t        duint64;
    typedef int32_t         dint32;
    typedef uint32_t        duint32;
    typedef int16_t         dint16;
    typedef uint16_t        duint16;
    typedef int8_t          dint8;
    typedef uint8_t         duint8;

    typedef intptr_t        dintptr;
    typedef uintptr_t       duintptr;
    typedef ptrdiff_t       ddiffint;
    typedef size_t          dsizeint;




#endif
