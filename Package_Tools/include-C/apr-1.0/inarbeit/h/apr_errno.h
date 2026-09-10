/* Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef APR_ERRNO_H
#define APR_ERRNO_H

/**
 * @file apr_errno.h
 * @brief APR Error Codes
 */

#include "apr.h"

#if APR_HAVE_ERRNO_H
#include <errno.h>
#endif

#ifdef __cplusplus
extern "C" {
#endif /* __cplusplus */

/**
 * @defgroup apr_errno Error Codes
 * @ingroup APR
 * @{
 */

/**
 * Type for specifying an error or status code.
 */
typedef int apr_status_t;

/**
 * Return a human readable string describing the specified error.
 * @param statcode The error code to get a string for.
 * @param buf A buffer to hold the error string.
 * @param bufsize Size of the buffer to hold the string.
 */
char * apr_strerror(apr_status_t statcode, char *buf,
                                 apr_size_t bufsize);


/**
 * APR_OS_START_ERROR is where the APR specific error values start.
 */
#define APR_OS_START_ERROR     20000
/**
 * APR_OS_ERRSPACE_SIZE is the maximum number of errors you can fit
 *    into one of the error/status ranges below -- except for
 *    APR_OS_START_USERERR, which see.
 */
#define APR_OS_ERRSPACE_SIZE 50000
/**
 * APR_UTIL_ERRSPACE_SIZE is the size of the space that is reserved for
 * use within apr-util. This space is reserved above that used by APR
 * internally.
 * @note This number MUST be smaller than APR_OS_ERRSPACE_SIZE by a
 *       large enough amount that APR has sufficient room for its
 *       codes.
 */
#define APR_UTIL_ERRSPACE_SIZE 20000
/**
 * APR_OS_START_STATUS is where the APR specific status codes start.
 */
#define APR_OS_START_STATUS    (APR_OS_START_ERROR + APR_OS_ERRSPACE_SIZE)
/**
 * APR_UTIL_START_STATUS is where APR-Util starts defining its
 * status codes.
 */
#define APR_UTIL_START_STATUS   (APR_OS_START_STATUS + \
                           (APR_OS_ERRSPACE_SIZE - APR_UTIL_ERRSPACE_SIZE))
/**
 * APR_OS_START_USERERR are reserved for applications that use APR that
 *     layer their own error codes along with APR's.  Note that the
 *     error immediately following this one is set ten times farther
 *     away than usual, so that users of apr have a lot of room in
 *     which to declare custom error codes.
 *
 * In general applications should try and create unique error codes. To try
 * and assist in finding suitable ranges of numbers to use, the following
 * ranges are known to be used by the listed applications. If your
 * application defines error codes please advise the range of numbers it
 * uses to dev@apr.apache.org for inclusion in this list.
 *
 * Ranges shown are in relation to APR_OS_START_USERERR
 *
 * Subversion - Defined ranges, of less than 100, at intervals of 5000
 *              starting at an offset of 5000, e.g.
 *               +5000 to 5100,  +10000 to 10100
 *
 * Apache HTTPD - +2000 to 2999
 */
#define APR_OS_START_USERERR    (APR_OS_START_STATUS + APR_OS_ERRSPACE_SIZE)
/**
 * APR_OS_START_USEERR is obsolete, defined for compatibility only.
 * Use APR_OS_START_USERERR instead.
 */
#define APR_OS_START_USEERR     APR_OS_START_USERERR
/**xxxxxxx
#define APR_OS_START_CANONERR  (APR_OS_START_USERERR \
                                 + (APR_OS_ERRSPACE_SIZE * 10))
 */
/**
 * APR_OS_START_EAIERR folds EAI_ error codes from getaddrinfo() into
 *     apr_status_t values.
 */
#define APR_OS_START_EAIERR    (APR_OS_START_CANONERR + APR_OS_ERRSPACE_SIZE)
/**
 * APR_OS_START_SYSERR folds platform-specific system error values into
 *     apr_status_t values.
 */
#define APR_OS_START_SYSERR    (APR_OS_START_EAIERR + APR_OS_ERRSPACE_SIZE)

/**
 * @defgroup APR_ERROR_map APR Error Space
 * <PRE>
 * The following attempts to show the relation of the various constants
 * used for mapping APR Status codes.
 *
 *       0
 *
 *  20,000     APR_OS_START_ERROR
 *
 *         + APR_OS_ERRSPACE_SIZE (50,000)
 *
 *  70,000      APR_OS_START_STATUS
 *
 *         + APR_OS_ERRSPACE_SIZE - APR_UTIL_ERRSPACE_SIZE (30,000)
 *
 * 100,000      APR_UTIL_START_STATUS
 *
 *         + APR_UTIL_ERRSPACE_SIZE (20,000)
 *
 * 120,000      APR_OS_START_USERERR
 *
 *         + 10 x APR_OS_ERRSPACE_SIZE (50,000 * 10)
 *
 * 620,000      APR_OS_START_CANONERR
 *
 *         + APR_OS_ERRSPACE_SIZE (50,000)
 *
 * 670,000      APR_OS_START_EAIERR
 *
 *         + APR_OS_ERRSPACE_SIZE (50,000)
 *
 * 720,000      APR_OS_START_SYSERR
 *
 * </PRE>
 */

/** no error. */
#define APR_SUCCESS 0

/**
 * @defgroup APR_Error APR Error Values
 * <PRE>
 * <b>APR ERROR VALUES</b>
 * APR_ENOSTAT      APR was unable to perform a stat on the file
 * APR_ENOPOOL      APR was not provided a pool with which to allocate memory
 * APR_EBADDATE     APR was given an invalid date
 * APR_EINVALSOCK   APR was given an invalid socket
 * APR_ENOPROC      APR was not given a process structure
 * APR_ENOTIME      APR was not given a time structure
 * APR_ENODIR       APR was not given a directory structure
 * APR_ENOLOCK      APR was not given a lock structure
 * APR_ENOPOLL      APR was not given a poll structure
 * APR_ENOSOCKET    APR was not given a socket
 * APR_ENOTHREAD    APR was not given a thread structure
 * APR_ENOTHDKEY    APR was not given a thread key structure
 * APR_ENOSHMAVAIL  There is no more shared memory available
 * APR_EDSOOPEN     APR was unable to open the dso object.  For more
 *                  information call apr_dso_error().
 * APR_EGENERAL     General failure (specific information not available)
 * APR_EBADIP       The specified IP address is invalid
 * APR_EBADMASK     The specified netmask is invalid
 * APR_ESYMNOTFOUND Could not find the requested symbol
 * APR_ENOTENOUGHENTROPY Not enough entropy to continue
 * </PRE>
 *
 * <PRE>
 * <b>APR STATUS VALUES</b>
 * APR_INCHILD        Program is currently executing in the child
 * APR_INPARENT       Program is currently executing in the parent
 * APR_DETACH         The thread is detached
 * APR_NOTDETACH      The thread is not detached
 * APR_CHILD_DONE     The child has finished executing
 * APR_CHILD_NOTDONE  The child has not finished executing
 * APR_TIMEUP         The operation did not finish before the timeout
 * APR_INCOMPLETE     The operation was incomplete although some processing
 *                    was performed and the results are partially valid
 * APR_BADCH          Getopt found an option not in the option string
 * APR_BADARG         Getopt found an option that is missing an argument
 *                    and an argument was specified in the option string
 * APR_EOF            APR has encountered the end of the file
 * APR_NOTFOUND       APR was unable to find the socket in the poll structure
 * APR_ANONYMOUS      APR is using anonymous shared memory
 * APR_FILEBASED      APR is using a file name as the key to the shared memory
 * APR_KEYBASED       APR is using a shared key as the key to the shared memory
 * APR_EINIT          Ininitalizer value.  If no option has been found, but
 *                    the status variable requires a value, this should be used
 * APR_ENOTIMPL       The APR function has not been implemented on this
 *                    platform, either because nobody has gotten to it yet,
 *                    or the function is impossible on this platform.
 * APR_EMISMATCH      Two passwords do not match.
 * APR_EABSOLUTE      The given path was absolute.
 * APR_ERELATIVE      The given path was relative.
 * APR_EINCOMPLETE    The given path was neither relative nor absolute.
 * APR_EABOVEROOT     The given path was above the root path.
 * APR_EBUSY          The given lock was busy.
 * APR_EPROC_UNKNOWN  The given process wasn't recognized by APR
 * </PRE>
 * @{
 */


/* These can't sit in a private header, so in spite of the extra size,
 * they need to be made available here.
 */
#define SOCBASEERR              10000
#define SOCEPERM                (SOCBASEERR+1)             /* Not owner */
#define SOCESRCH                (SOCBASEERR+3)             /* No such process */
#define SOCEINTR                (SOCBASEERR+4)             /* Interrupted system call */
#define SOCENXIO                (SOCBASEERR+6)             /* No such device or address */
#define SOCEBADF                (SOCBASEERR+9)             /* Bad file number */
#define SOCEACCES               (SOCBASEERR+13)            /* Permission denied */
#define SOCEFAULT               (SOCBASEERR+14)            /* Bad address */
#define SOCEINVAL               (SOCBASEERR+22)            /* Invalid argument */
#define SOCEMFILE               (SOCBASEERR+24)            /* Too many open files */
#define SOCEPIPE                (SOCBASEERR+32)            /* Broken pipe */
#define SOCEOS2ERR              (SOCBASEERR+100)           /* OS/2 Error */
#define SOCEWOULDBLOCK          (SOCBASEERR+35)            /* Operation would block */
#define SOCEINPROGRESS          (SOCBASEERR+36)            /* Operation now in progress */
#define SOCEALREADY             (SOCBASEERR+37)            /* Operation already in progress */
#define SOCENOTSOCK             (SOCBASEERR+38)            /* Socket operation on non-socket */
#define SOCEDESTADDRREQ         (SOCBASEERR+39)            /* Destination address required */
#define SOCEMSGSIZE             (SOCBASEERR+40)            /* Message too long */
#define SOCEPROTOTYPE           (SOCBASEERR+41)            /* Protocol wrong type for socket */
#define SOCENOPROTOOPT          (SOCBASEERR+42)            /* Protocol not available */
#define SOCEPROTONOSUPPORT      (SOCBASEERR+43)            /* Protocol not supported */
#define SOCESOCKTNOSUPPORT      (SOCBASEERR+44)            /* Socket type not supported */
#define SOCEOPNOTSUPP           (SOCBASEERR+45)            /* Operation not supported on socket */
#define SOCEPFNOSUPPORT         (SOCBASEERR+46)            /* Protocol family not supported */
#define SOCEAFNOSUPPORT         (SOCBASEERR+47)            /* Address family not supported by protocol family */
#define SOCEADDRINUSE           (SOCBASEERR+48)            /* Address already in use */
#define SOCEADDRNOTAVAIL        (SOCBASEERR+49)            /* Can't assign requested address */
#define SOCENETDOWN             (SOCBASEERR+50)            /* Network is down */
#define SOCENETUNREACH          (SOCBASEERR+51)            /* Network is unreachable */
#define SOCENETRESET            (SOCBASEERR+52)            /* Network dropped connection on reset */
#define SOCECONNABORTED         (SOCBASEERR+53)            /* Software caused connection abort */
#define SOCECONNRESET           (SOCBASEERR+54)            /* Connection reset by peer */
#define SOCENOBUFS              (SOCBASEERR+55)            /* No buffer space available */
#define SOCEISCONN              (SOCBASEERR+56)            /* Socket is already connected */
#define SOCENOTCONN             (SOCBASEERR+57)            /* Socket is not connected */
#define SOCESHUTDOWN            (SOCBASEERR+58)            /* Can't send after socket shutdown */
#define SOCETOOMANYREFS         (SOCBASEERR+59)            /* Too many references: can't splice */
#define SOCETIMEDOUT            (SOCBASEERR+60)            /* Connection timed out */
#define SOCECONNREFUSED         (SOCBASEERR+61)            /* Connection refused */
#define SOCELOOP                (SOCBASEERR+62)            /* Too many levels of symbolic links */
#define SOCENAMETOOLONG         (SOCBASEERR+63)            /* File name too long */
#define SOCEHOSTDOWN            (SOCBASEERR+64)            /* Host is down */
#define SOCEHOSTUNREACH         (SOCBASEERR+65)            /* No route to host */
#define SOCENOTEMPTY            (SOCBASEERR+66)            /* Directory not empty */


