/* ompi/include/mpi.h.  Generated from mpi.h.in by configure.  */
/*
 * Copyright (c) 2004-2005 The Trustees of Indiana University and Indiana
 *                         University Research and Technology
 *                         Corporation.  All rights reserved.
 * Copyright (c) 2004-2013 The University of Tennessee and The University
 *                         of Tennessee Research Foundation.  All rights
 *                         reserved.
 * Copyright (c) 2004-2007 High Performance Computing Center Stuttgart,
 *                         University of Stuttgart.  All rights reserved.
 * Copyright (c) 2004-2005 The Regents of the University of California.
 *                         All rights reserved.
 * Copyright (c) 2007-2022 Cisco Systems, Inc.  All rights reserved
 * Copyright (c) 2008-2009 Sun Microsystems, Inc.  All rights reserved.
 * Copyright (c) 2009-2012 Oak Rigde National Laboratory.  All rights reserved.
 * Copyright (c) 2011      Sandia National Laboratories. All rights reserved.
 * Copyright (c) 2012-2018 Los Alamos National Security, LLC. All rights
 *                         reserved.
 * Copyright (c) 2011-2013 INRIA.  All rights reserved.
 * Copyright (c) 2015      University of Houston. All rights reserved.
 * Copyright (c) 2015-2019 Research Organization for Information Science
 *                         and Technology (RIST).  All rights reserved.
 * Copyright (c) 2017-2019 IBM Corporation.  All rights reserved.
 * Copyright (c) 2018      FUJITSU LIMITED.  All rights reserved.
 * Copyright (c) 2023      Jeffrey M. Squyres.  All rights reserved.
 * $COPYRIGHT$
 *
 * Additional copyrights may follow
 *
 * $HEADER$
 */

#ifndef OMPI_MPI_H
#define OMPI_MPI_H

/* The comment below (and the ending partner) are for building fat
   distributions on platforms that support it.  Please do not remove */

/* @OMPI_BEGIN_CONFIGURE_SECTION@ */

#ifndef OMPI_CONFIG_H

/* Only include these if OMPI_CONFIG_H isn't defined (meaning if
   ompi_config.h hasn't already been included).  Otherwise, we'll
   duplicate all those symbols.  OMPI coding standards say that
   ompi_config.h must be included before all other files, so this
   should be good enough */

/* The compiler id which OMPI was built with */
#define OPAL_BUILD_PLATFORM_COMPILER_FAMILYID 1

/* The compiler version which OMPI was built with */
#define OPAL_BUILD_PLATFORM_COMPILER_VERSION 852480

/* Define to 1 if you have the ANSI C header files. */
#define OPAL_STDC_HEADERS 1

/* Whether your compiler has __attribute__ deprecated or not */
#define OPAL_HAVE_ATTRIBUTE_DEPRECATED 1

/* Whether your compiler has __attribute__ deprecated with the optional argument */
#define OPAL_HAVE_ATTRIBUTE_DEPRECATED_ARGUMENT 1

/* Whether you compiler has __attribute__ error or not */
#define OPAL_HAVE_ATTRIBUTE_ERROR 1

/* Define to 1 if you have the <sys/time.h> header file. */
#define OPAL_HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/synch.h> header file. */
/* #undef OPAL_HAVE_SYS_SYNCH_H */

/* Define to 1 if the system has the type `long long'. */
#define OPAL_HAVE_LONG_LONG 1

/* The size of a `bool', as computed by sizeof. */
/* #undef OPAL_SIZEOF_BOOL */

/* The size of a `int', as computed by sizeof. */
/* #undef OPAL_SIZEOF_INT */

/* Maximum length of datarep string (default is 128) */
#define OPAL_MAX_DATAREP_STRING 128

/* Maximum length of error strings (default is 256) */
#define OPAL_MAX_ERROR_STRING 256

/* Maximum length of info keys (default is 36) */
#define OPAL_MAX_INFO_KEY 36

/* Maximum length of info vals (default is 256) */
#define OPAL_MAX_INFO_VAL 256

/* Maximum length of object names (default is 64) */
#define OPAL_MAX_OBJECT_NAME 64

/* Maximum length of port names (default is 1024) */
#define OPAL_MAX_PORT_NAME 1024

/* Maximum length of processor names (default is 256) */
#define OPAL_MAX_PROCESSOR_NAME 256

/* The number or Fortran INTEGER in MPI Status */
#define OMPI_FORTRAN_STATUS_SIZE 6

/* Whether we have FORTRAN LOGICAL*1 or not */
#define OMPI_HAVE_FORTRAN_LOGICAL1 1

/* Whether we have FORTRAN LOGICAL*2 or not */
#define OMPI_HAVE_FORTRAN_LOGICAL2 1

/* Whether we have FORTRAN LOGICAL*4 or not */
#define OMPI_HAVE_FORTRAN_LOGICAL4 1

/* Whether we have FORTRAN LOGICAL*8 or not */
#define OMPI_HAVE_FORTRAN_LOGICAL8 1

/* Whether we have FORTRAN INTEGER*1 or not */
#define OMPI_HAVE_FORTRAN_INTEGER1 1

/* Whether we have FORTRAN INTEGER*16 or not */
#define OMPI_HAVE_FORTRAN_INTEGER16 0

/* Whether we have FORTRAN INTEGER*2 or not */
#define OMPI_HAVE_FORTRAN_INTEGER2 1

/* Whether we have FORTRAN INTEGER*4 or not */
#define OMPI_HAVE_FORTRAN_INTEGER4 1

/* Whether we have FORTRAN INTEGER*8 or not */
#define OMPI_HAVE_FORTRAN_INTEGER8 1

/* Whether we have FORTRAN REAL*16 or not */
#define OMPI_HAVE_FORTRAN_REAL16 1

/* Whether we have FORTRAN REAL*2 or not */
#define OMPI_HAVE_FORTRAN_REAL2 0

/* Whether we have FORTRAN REAL*4 or not */
#define OMPI_HAVE_FORTRAN_REAL4 1

/* Whether we have FORTRAN REAL*8 or not */
#define OMPI_HAVE_FORTRAN_REAL8 1

/* Whether in include MPI-1 compatibility */
#define OMPI_ENABLE_MPI1_COMPAT 0

/* Whether we have float _Complex  or not */
#define HAVE_FLOAT__COMPLEX 1

/* Whether we have double _Complex  or not */
#define HAVE_DOUBLE__COMPLEX 1

/* Whether we have long double _Complex  or not */
#define HAVE_LONG_DOUBLE__COMPLEX 1

/* Type of MPI_Aint */
#define OMPI_MPI_AINT_TYPE ptrdiff_t

/* Type of MPI_Offset */
#define OMPI_MPI_OFFSET_TYPE long long

/* MPI datatype corresponding to MPI_Offset */
#define OMPI_OFFSET_DATATYPE MPI_LONG_LONG

/* Size of the MPI_Offset corresponding type */
#define OMPI_MPI_OFFSET_SIZE 8

/* Type of MPI_Count */
#define OMPI_MPI_COUNT_TYPE long long

/* type to use for ptrdiff_t, if it does not exist, set to ptrdiff_t if it does exist */
/* #undef ptrdiff_t */

/* Whether we want MPI cxx support or not */
#define OMPI_BUILD_CXX_BINDINGS 1

/* do we want to try to work around C++ bindings SEEK_* issue? */
#define OMPI_WANT_MPI_CXX_SEEK 1

/* Whether a const_cast on a 2-d array will work with the C++ compiler */
#define OMPI_CXX_SUPPORTS_2D_CONST_CAST 1

/* Whether OMPI was built with parameter checking or not */
#define OMPI_PARAM_CHECK 1

/* Enable warnings in wrong usage (e.g. deprecated) in user-level code */
#ifndef OMPI_WANT_MPI_INTERFACE_WARNING
#define OMPI_WANT_MPI_INTERFACE_WARNING 1
#endif

/* Whether or not we have compiled with C++ exceptions support */
#define OMPI_HAVE_CXX_EXCEPTION_SUPPORT 0

/* Major, minor, and release version of Open MPI */
#define OMPI_MAJOR_VERSION 4
#define OMPI_MINOR_VERSION 1
#define OMPI_RELEASE_VERSION 6

/* A  type that allows us to have sentinel type values that are still
   valid */
#define ompi_fortran_bogus_type_t int

/* C type corresponding to FORTRAN INTEGER */
#define ompi_fortran_integer_t int

/* Whether C compiler supports -fvisibility */
#define OPAL_C_HAVE_VISIBILITY 1


#ifndef MPI_Fint
/* MPI_Fint is the same as ompi_fortran_INTEGER_t */
#define MPI_Fint ompi_fortran_integer_t
#endif

#endif /* #ifndef OMPI_CONFIG_H */

/* @OMPI_END_CONFIGURE_SECTION@ */

/* include for ptrdiff_t */
#ifdef OPAL_STDC_HEADERS
#include <stddef.h>
#endif

#ifndef OMPI_BUILDING
#define OMPI_BUILDING 0
#endif


/*
 * Just in case you need it.  :-)
 */
#define OPEN_MPI 1

/*
 * MPI version
 */
#define MPI_VERSION 3
#define MPI_SUBVERSION 1


/*
 * Do we want MPI interface deprecated function warnings?  This is
 * only relevant if we're not building Open MPI (i.e., we're compiling an
 * MPI application).
 */

/*
 * Typedefs
 */

typedef OMPI_MPI_AINT_TYPE MPI_Aint;
typedef OMPI_MPI_OFFSET_TYPE MPI_Offset;
typedef OMPI_MPI_COUNT_TYPE MPI_Count;
typedef struct ompi_communicator_t *MPI_Comm;
typedef struct ompi_datatype_t *MPI_Datatype;
typedef struct ompi_errhandler_t *MPI_Errhandler;
typedef struct ompi_file_t *MPI_File;
typedef struct ompi_group_t *MPI_Group;
typedef struct ompi_info_t *MPI_Info;
typedef struct ompi_op_t *MPI_Op;
typedef struct ompi_request_t *MPI_Request;
typedef struct ompi_message_t *MPI_Message;
typedef struct ompi_status_public_t MPI_Status;
typedef struct ompi_win_t *MPI_Win;
typedef struct mca_base_var_enum_t *MPI_T_enum;
typedef struct ompi_mpit_cvar_handle_t *MPI_T_cvar_handle;
typedef struct mca_base_pvar_handle_t *MPI_T_pvar_handle;
typedef struct mca_base_pvar_session_t *MPI_T_pvar_session;

/*
 * MPI_Status
 */
struct ompi_status_public_t {
    /* These fields are publicly defined in the MPI specification.
       User applications may freely read from these fields. */
    int MPI_SOURCE;
    int MPI_TAG;
    int MPI_ERROR;
    /* The following two fields are internal to the Open MPI
       implementation and should not be accessed by MPI applications.
       They are subject to change at any time.  These are not the
       droids you're looking for. */
    int _cancelled;
    size_t _ucount;
};
typedef struct ompi_status_public_t ompi_status_public_t;

/*
 * User typedefs
 */
typedef int (MPI_Datarep_extent_function)(MPI_Datatype, MPI_Aint *, void *);
typedef int (MPI_Datarep_conversion_function)(void *, MPI_Datatype,
                                              int, void *, MPI_Offset, void *);
typedef void (MPI_Comm_errhandler_function)(MPI_Comm *, int *, ...);

    /* This is a little hackish, but errhandler.h needs space for a
       MPI_File_errhandler_fn.  While it could just be removed, this
       allows us to maintain a stable ABI within OMPI, at least for
       apps that don't use MPI I/O. */
typedef void (ompi_file_errhandler_fn)(MPI_File *, int *, ...);
typedef void (MPI_Win_errhandler_function)(MPI_Win *, int *, ...);
typedef void (MPI_User_function)(void *, void *, int *, MPI_Datatype *);
typedef int (MPI_Comm_copy_attr_function)(MPI_Comm, int, void *,
                                            void *, void *, int *);
typedef int (MPI_Comm_delete_attr_function)(MPI_Comm, int, void *, void *);
typedef int (MPI_Type_copy_attr_function)(MPI_Datatype, int, void *,
                                            void *, void *, int *);
typedef int (MPI_Type_delete_attr_function)(MPI_Datatype, int,
                                              void *, void *);
typedef int (MPI_Win_copy_attr_function)(MPI_Win, int, void *,
                                           void *, void *, int *);
typedef int (MPI_Win_delete_attr_function)(MPI_Win, int, void *, void *);
typedef int (MPI_Grequest_query_function)(void *, MPI_Status *);
typedef int (MPI_Grequest_free_function)(void *);
typedef int (MPI_Grequest_cancel_function)(void *, int);

/*
 * Deprecated typedefs.  Usage is discouraged, as these may be deleted
 * in future versions of the MPI Standard.
 */
typedef ompi_file_errhandler_fn MPI_File_errhandler_function;


/*
 * Miscellaneous constants
 *
 * NOTE: Many of the integer constants below *also* appear in
 * ompi/include/mpif-values.pl.  If you change any of these integer
 * values below, make sure to also change the corresponding values in
 * mpif-values.pl.
 */
#define MPI_ANY_SOURCE         -1                      /* match any source rank */
#define MPI_PROC_NULL          -2                      /* rank of null process */
#define MPI_ROOT               -4                      /* special value for intercomms */
#define MPI_ANY_TAG            -1                      /* match any message tag */
#define MPI_MAX_PROCESSOR_NAME OPAL_MAX_PROCESSOR_NAME /* max proc. name length */
#define MPI_MAX_ERROR_STRING   OPAL_MAX_ERROR_STRING   /* max error message length */
#define MPI_MAX_OBJECT_NAME    OPAL_MAX_OBJECT_NAME    /* max object name length */
#define MPI_MAX_LIBRARY_VERSION_STRING 256             /* max length of library version string */
#define MPI_UNDEFINED          -32766                  /* undefined stuff */
#define MPI_DIST_GRAPH         3                       /* dist graph topology */
#define MPI_CART               1                       /* cartesian topology */
#define MPI_GRAPH              2                       /* graph topology */
#define MPI_KEYVAL_INVALID     -1                      /* invalid key value */

/*
 * More constants
 */
#define MPI_UNWEIGHTED           ((int *) 2)           /* unweighted graph */
#define MPI_WEIGHTS_EMPTY        ((int *) 3)           /* empty weights */
#define MPI_BOTTOM               ((void *) 0)          /* base reference address */
#define MPI_IN_PLACE             ((void *) 1)          /* in place buffer */
#define MPI_BSEND_OVERHEAD       128                   /* size of bsend header + ptr */
#define MPI_MAX_INFO_KEY         OPAL_MAX_INFO_KEY     /* max info key length */
#define MPI_MAX_INFO_VAL         OPAL_MAX_INFO_VAL     /* max info value length */
//xxxxx #define MPI_ARGV_NULL            ((char **) 0)         /* NULL argument vector */
//xxxxx #define MPI_ARGVS_NULL           ((char ***) 0)        /* NULL argument vectors */
#define MPI_ERRCODES_IGNORE      ((int *) 0)           /* don't return error codes */
#define MPI_MAX_PORT_NAME        OPAL_MAX_PORT_NAME    /* max port name length */
#define MPI_ORDER_C              0                     /* C row major order */
#define MPI_ORDER_FORTRAN        1                     /* Fortran column major order */
#define MPI_DISTRIBUTE_BLOCK     0                     /* block distribution */
#define MPI_DISTRIBUTE_CYCLIC    1                     /* cyclic distribution */
#define MPI_DISTRIBUTE_NONE      2                     /* not distributed */
#define MPI_DISTRIBUTE_DFLT_DARG (-1)                  /* default distribution arg */

/*
 * Constants for C code to access elements in Fortran MPI status array.
 *
 * NOTE: The MPI_F_SOURCE, MPI_F_TAG, MPI_F_ERROR are intentionally 1
 * smaller than their Fortran equivalents in mpif-values.pl (because C
 * is 0-indexed and Fortran is 1-indexed).
 */
#define MPI_F_STATUS_SIZE OMPI_FORTRAN_STATUS_SIZE    /* Size of Fortran MPI status array */
#define MPI_F_SOURCE      0                           /* Index for MPI_SOURCE */
#define MPI_F_TAG         1                           /* Index for MPI_TAG */
#define MPI_F_ERROR       2                           /* Index for MPI_ERROR */

/*
 * Since these values are arbitrary to Open MPI, we might as well make
 * them the same as ROMIO for ease of mapping.  These values taken
 * from ROMIO's mpio.h file.
 */
#define MPI_MODE_CREATE              1  /* ADIO_CREATE */
#define MPI_MODE_RDONLY              2  /* ADIO_RDONLY */
#define MPI_MODE_WRONLY              4  /* ADIO_WRONLY  */
#define MPI_MODE_RDWR                8  /* ADIO_RDWR  */
#define MPI_MODE_DELETE_ON_CLOSE    16  /* ADIO_DELETE_ON_CLOSE */
#define MPI_MODE_UNIQUE_OPEN        32  /* ADIO_UNIQUE_OPEN */
#define MPI_MODE_EXCL               64  /* ADIO_EXCL */
#define MPI_MODE_APPEND            128  /* ADIO_APPEND */
#define MPI_MODE_SEQUENTIAL        256  /* ADIO_SEQUENTIAL */

#define MPI_DISPLACEMENT_CURRENT   -54278278

#define MPI_SEEK_SET               600
#define MPI_SEEK_CUR               602
#define MPI_SEEK_END               604

/* Max data representation length */
#define MPI_MAX_DATAREP_STRING OPAL_MAX_DATAREP_STRING

/*
 * MPI-2 One-Sided Communications asserts
 */
#define MPI_MODE_NOCHECK             1
#define MPI_MODE_NOPRECEDE           2
#define MPI_MODE_NOPUT               4
#define MPI_MODE_NOSTORE             8
#define MPI_MODE_NOSUCCEED          16

#define MPI_LOCK_EXCLUSIVE           1
#define MPI_LOCK_SHARED              2

#define MPI_WIN_FLAVOR_CREATE        1
#define MPI_WIN_FLAVOR_ALLOCATE      2
#define MPI_WIN_FLAVOR_DYNAMIC       3
#define MPI_WIN_FLAVOR_SHARED        4

#define MPI_WIN_UNIFIED              0
#define MPI_WIN_SEPARATE             1

/*
 * Predefined attribute keyvals
 *
 * DO NOT CHANGE THE ORDER WITHOUT ALSO CHANGING THE ORDER IN
 * ompi/attribute/attribute_predefined.c and mpif-constants.h (which
 * is included by mpif.h.in).
 */
enum xxxxxx{
    /* MPI-1 */
    MPI_TAG_UB,
    MPI_HOST,
    MPI_IO,
    MPI_WTIME_IS_GLOBAL,

    /* MPI-2 */
    MPI_APPNUM,
    MPI_LASTUSEDCODE,
    MPI_UNIVERSE_SIZE,
    MPI_WIN_BASE,
    MPI_WIN_SIZE,
    MPI_WIN_DISP_UNIT,
    MPI_WIN_CREATE_FLAVOR,
    MPI_WIN_MODEL,

    /* Even though these four are IMPI attributes, they need to be there
       for all MPI jobs */
    IMPI_CLIENT_SIZE,
    IMPI_CLIENT_COLOR,
    IMPI_HOST_SIZE,
    IMPI_HOST_COLOR
};

/*
 * Error classes and codes
 * Do not change the values of these without also modifying mpif.h.in.
 */
#define MPI_SUCCESS                   0
#define MPI_ERR_BUFFER                1
#define MPI_ERR_COUNT                 2
#define MPI_ERR_TYPE                  3
#define MPI_ERR_TAG                   4
#define MPI_ERR_COMM                  5
#define MPI_ERR_RANK                  6
#define MPI_ERR_REQUEST               7
#define MPI_ERR_ROOT                  8
#define MPI_ERR_GROUP                 9
#define MPI_ERR_OP                    10
#define MPI_ERR_TOPOLOGY              11
#define MPI_ERR_DIMS                  12
#define MPI_ERR_ARG                   13
#define MPI_ERR_UNKNOWN               14
#define MPI_ERR_TRUNCATE              15
#define MPI_ERR_OTHER                 16
#define MPI_ERR_INTERN                17
#define MPI_ERR_IN_STATUS             18
#define MPI_ERR_PENDING               19
#define MPI_ERR_ACCESS                20
#define MPI_ERR_AMODE                 21
#define MPI_ERR_ASSERT                22
#define MPI_ERR_BAD_FILE              23
#define MPI_ERR_BASE                  24
#define MPI_ERR_CONVERSION            25
#define MPI_ERR_DISP                  26
#define MPI_ERR_DUP_DATAREP           27
#define MPI_ERR_FILE_EXISTS           28
#define MPI_ERR_FILE_IN_USE           29
#define MPI_ERR_FILE                  30
#define MPI_ERR_INFO_KEY              31
#define MPI_ERR_INFO_NOKEY            32
#define MPI_ERR_INFO_VALUE            33
#define MPI_ERR_INFO                  34
#define MPI_ERR_IO                    35
#define MPI_ERR_KEYVAL                36
#define MPI_ERR_LOCKTYPE              37
#define MPI_ERR_NAME                  38
#define MPI_ERR_NO_MEM                39
#define MPI_ERR_NOT_SAME              40
#define MPI_ERR_NO_SPACE              41
#define MPI_ERR_NO_SUCH_FILE          42
#define MPI_ERR_PORT                  43
#define MPI_ERR_QUOTA                 44
#define MPI_ERR_READ_ONLY             45
#define MPI_ERR_RMA_CONFLICT          46
#define MPI_ERR_RMA_SYNC              47
#define MPI_ERR_SERVICE               48
#define MPI_ERR_SIZE                  49
#define MPI_ERR_SPAWN                 50
#define MPI_ERR_UNSUPPORTED_DATAREP   51
#define MPI_ERR_UNSUPPORTED_OPERATION 52
#define MPI_ERR_WIN                   53
#define MPI_T_ERR_MEMORY              54
#define MPI_T_ERR_NOT_INITIALIZED     55
#define MPI_T_ERR_CANNOT_INIT         56
#define MPI_T_ERR_INVALID_INDEX       57
#define MPI_T_ERR_INVALID_ITEM        58
#define MPI_T_ERR_INVALID_HANDLE      59
#define MPI_T_ERR_OUT_OF_HANDLES      60
#define MPI_T_ERR_OUT_OF_SESSIONS     61
#define MPI_T_ERR_INVALID_SESSION     62
#define MPI_T_ERR_CVAR_SET_NOT_NOW    63
#define MPI_T_ERR_CVAR_SET_NEVER      64
#define MPI_T_ERR_PVAR_NO_STARTSTOP   65
#define MPI_T_ERR_PVAR_NO_WRITE       66
#define MPI_T_ERR_PVAR_NO_ATOMIC      67
#define MPI_ERR_RMA_RANGE             68
#define MPI_ERR_RMA_ATTACH            69
#define MPI_ERR_RMA_FLAVOR            70
#define MPI_ERR_RMA_SHARED            71
#define MPI_T_ERR_INVALID             72
#define MPI_T_ERR_INVALID_NAME        73

/* Per MPI-3 p349 47, MPI_ERR_LASTCODE must be >= the last predefined
   MPI_ERR_<foo> code. Set the last code to allow some room for adding
   error codes without breaking ABI. */
#define MPI_ERR_LASTCODE              92

/*
 * Comparison results.  Don't change the order of these, the group
 * comparison functions rely on it.
 * Do not change the order of these without also modifying
 * mpif-values.pl.
 */
enum xxxxxx{
  MPI_IDENT,
  MPI_CONGRUENT,
  MPI_SIMILAR,
  MPI_UNEQUAL
};

/*
 * MPI_Init_thread constants
 * Do not change the order of these without also modifying
 * mpif-values.pl.
 */
enum xxxxxx{
  MPI_THREAD_SINGLE,
  MPI_THREAD_FUNNELED,
  MPI_THREAD_SERIALIZED,
  MPI_THREAD_MULTIPLE
};

/*
 * Datatype combiners.
 * Do not change the order of these without also modifying
 * mpif-values.pl.
 */
enum xxxxxx{
  MPI_COMBINER_NAMED,
  MPI_COMBINER_DUP,
  MPI_COMBINER_CONTIGUOUS,
  MPI_COMBINER_VECTOR,
#if (OMPI_ENABLE_MPI1_COMPAT || OMPI_BUILDING)
  MPI_COMBINER_HVECTOR_INTEGER,
#else
  OMPI_WAS_MPI_COMBINER_HVECTOR_INTEGER, /* preserve ABI compatibility */
#endif
  MPI_COMBINER_HVECTOR,
  MPI_COMBINER_INDEXED,
#if (OMPI_ENABLE_MPI1_COMPAT || OMPI_BUILDING)
  MPI_COMBINER_HINDEXED_INTEGER,
#else
  OMPI_WAS_MPI_COMBINER_HINDEXED_INTEGER, /* preserve ABI compatibility */
#endif
  MPI_COMBINER_HINDEXED,
  MPI_COMBINER_INDEXED_BLOCK,
#if (OMPI_ENABLE_MPI1_COMPAT || OMPI_BUILDING)
  MPI_COMBINER_STRUCT_INTEGER,
#else
  OMPI_WAS_MPI_COMBINER_STRUCT_INTEGER, /* preserve ABI compatibility */
#endif
  MPI_COMBINER_STRUCT,
  MPI_COMBINER_SUBARRAY,
  MPI_COMBINER_DARRAY,
  MPI_COMBINER_F90_REAL,
  MPI_COMBINER_F90_COMPLEX,
  MPI_COMBINER_F90_INTEGER,
  MPI_COMBINER_RESIZED,
  MPI_COMBINER_HINDEXED_BLOCK
};

enum xxxxxx{
  MPI_COMM_TYPE_SHARED,
  OMPI_COMM_TYPE_HWTHREAD,
  OMPI_COMM_TYPE_CORE,
  OMPI_COMM_TYPE_L1CACHE,
  OMPI_COMM_TYPE_L2CACHE,
  OMPI_COMM_TYPE_L3CACHE,
  OMPI_COMM_TYPE_SOCKET,
  OMPI_COMM_TYPE_NUMA,
  OMPI_COMM_TYPE_BOARD,
  OMPI_COMM_TYPE_HOST,
  OMPI_COMM_TYPE_CU,
  OMPI_COMM_TYPE_CLUSTER
};
#define OMPI_COMM_TYPE_NODE MPI_COMM_TYPE_SHARED

/*
 * MPIT Verbosity Levels
 */
enum xxxxxx{
  MPI_T_VERBOSITY_USER_BASIC,
  MPI_T_VERBOSITY_USER_DETAIL,
  MPI_T_VERBOSITY_USER_ALL,
  MPI_T_VERBOSITY_TUNER_BASIC,
  MPI_T_VERBOSITY_TUNER_DETAIL,
  MPI_T_VERBOSITY_TUNER_ALL,
  MPI_T_VERBOSITY_MPIDEV_BASIC,
  MPI_T_VERBOSITY_MPIDEV_DETAIL,
  MPI_T_VERBOSITY_MPIDEV_ALL
};

/*
 * MPIT Scopes
 */
enum xxxxxx{
  MPI_T_SCOPE_CONSTANT,
  MPI_T_SCOPE_READONLY,
  MPI_T_SCOPE_LOCAL,
  MPI_T_SCOPE_GROUP,
  MPI_T_SCOPE_GROUP_EQ,
  MPI_T_SCOPE_ALL,
  MPI_T_SCOPE_ALL_EQ
};

/*
 * MPIT Object Binding
 */
enum xxxxxx{
  MPI_T_BIND_NO_OBJECT,
  MPI_T_BIND_MPI_COMM,
  MPI_T_BIND_MPI_DATATYPE,
  MPI_T_BIND_MPI_ERRHANDLER,
  MPI_T_BIND_MPI_FILE,
  MPI_T_BIND_MPI_GROUP,
  MPI_T_BIND_MPI_OP,
  MPI_T_BIND_MPI_REQUEST,
  MPI_T_BIND_MPI_WIN,
  MPI_T_BIND_MPI_MESSAGE,
  MPI_T_BIND_MPI_INFO
};

/*
 * MPIT pvar classes
 */
enum xxxxxx{
  MPI_T_PVAR_CLASS_STATE,
  MPI_T_PVAR_CLASS_LEVEL,
  MPI_T_PVAR_CLASS_SIZE,
  MPI_T_PVAR_CLASS_PERCENTAGE,
  MPI_T_PVAR_CLASS_HIGHWATERMARK,
  MPI_T_PVAR_CLASS_LOWWATERMARK,
  MPI_T_PVAR_CLASS_COUNTER,
  MPI_T_PVAR_CLASS_AGGREGATE,
  MPI_T_PVAR_CLASS_TIMER,
  MPI_T_PVAR_CLASS_GENERIC
};

/*
 * NULL handles
 */

/*
 * Special MPI_T handles
 */
#define MPI_T_PVAR_ALL_HANDLES ((MPI_T_pvar_handle) -1)
#define MPI_T_PVAR_HANDLE_NULL ((MPI_T_pvar_handle) 0)
#define MPI_T_PVAR_SESSION_NULL ((MPI_T_pvar_session) 0)
#define MPI_T_CVAR_HANDLE_NULL ((MPI_T_cvar_handle) 0)

/* MPI-2 specifies that the name "MPI_TYPE_NULL_DELETE_FN" (and all
   related friends) must be accessible in C, C++, and Fortran. This is
   unworkable if the back-end Fortran compiler uses all caps for its
   linker symbol convention -- it results in two functions with
   different signatures that have the same name (i.e., both C and
   Fortran use the symbol MPI_TYPE_NULL_DELETE_FN).  So we have to
   #define the C names to be something else, so that they names are
   *accessed* through MPI_TYPE_NULL_DELETE_FN, but their actual symbol
   name is different.

   However, this file is included when the fortran wrapper functions
   are compiled in Open MPI, so we do *not* want these #defines in
   this case (i.e., we need the Fortran wrapper function to be
   compiled as MPI_TYPE_NULL_DELETE_FN).  So add some #if kinds of
   protection for this case. */

#if !defined(OMPI_COMPILING_FORTRAN_WRAPPERS)

#define MPI_TYPE_NULL_DELETE_FN OMPI_C_MPI_TYPE_NULL_DELETE_FN
#define MPI_TYPE_NULL_COPY_FN OMPI_C_MPI_TYPE_NULL_COPY_FN
#define MPI_TYPE_DUP_FN OMPI_C_MPI_TYPE_DUP_FN

#define MPI_COMM_NULL_DELETE_FN OMPI_C_MPI_COMM_NULL_DELETE_FN
#define MPI_COMM_NULL_COPY_FN OMPI_C_MPI_COMM_NULL_COPY_FN
#define MPI_COMM_DUP_FN OMPI_C_MPI_COMM_DUP_FN

#define MPI_WIN_NULL_DELETE_FN OMPI_C_MPI_WIN_NULL_DELETE_FN
#define MPI_WIN_NULL_COPY_FN OMPI_C_MPI_WIN_NULL_COPY_FN
#define MPI_WIN_DUP_FN OMPI_C_MPI_WIN_DUP_FN

/* MPI_CONVERSION_FN_NULL is a sentinel value, but it has to be large
   enough to be the same size as a valid function pointer.  It
   therefore shares many characteristics between Fortran constants and
   Fortran sentinel functions.  For example, it shares the problem of
   having Fortran compilers have all-caps versions of the symbols that
   must be able to be present, and therefore has to be in this
   conditional block in mpi.h. */
#define MPI_CONVERSION_FN_NULL ((MPI_Datarep_conversion_function*) 0)
#endif

 int OMPI_C_MPI_TYPE_NULL_DELETE_FN( MPI_Datatype datatype,
                                                  int type_keyval,
                                                  void* attribute_val_out,
                                                  void* extra_state );
 int OMPI_C_MPI_TYPE_NULL_COPY_FN( MPI_Datatype datatype,
                                                int type_keyval,
                                                void* extra_state,
                                                void* attribute_val_in,
                                                void* attribute_val_out,
                                                int* flag );
 int OMPI_C_MPI_TYPE_DUP_FN( MPI_Datatype datatype,
                                          int type_keyval,
                                          void* extra_state,
                                          void* attribute_val_in,
                                          void* attribute_val_out,
                                          int* flag );
 int OMPI_C_MPI_COMM_NULL_DELETE_FN( MPI_Comm comm,
                                                  int comm_keyval,
                                                  void* attribute_val_out,
                                                  void* extra_state );
 int OMPI_C_MPI_COMM_NULL_COPY_FN( MPI_Comm comm,
                                                int comm_keyval,
                                                void* extra_state,
                                                void* attribute_val_in,
                                                void* attribute_val_out,
                                                int* flag );
 int OMPI_C_MPI_COMM_DUP_FN( MPI_Comm comm, int comm_keyval,
                                          void* extra_state,
                                          void* attribute_val_in,
                                          void* attribute_val_out,
                                          int* flag );
 int OMPI_C_MPI_WIN_NULL_DELETE_FN( MPI_Win window,
                                                 int win_keyval,
                                                 void* attribute_val_out,
                                                 void* extra_state );
 int OMPI_C_MPI_WIN_NULL_COPY_FN( MPI_Win window, int win_keyval,
                                               void* extra_state,
                                               void* attribute_val_in,
                                               void* attribute_val_out,
                                               int* flag );
 int OMPI_C_MPI_WIN_DUP_FN( MPI_Win window, int win_keyval,
                                         void* extra_state,
                                         void* attribute_val_in,
                                         void* attribute_val_out,
                                         int* flag );

/*
 * External variables
 *
 * The below externs use the ompi_predefined_xxx_t structures to maintain
 * back compatibility between MPI library versions.
 * See ompi/communicator/communicator.h comments with struct ompi_communicator_t
 * for full explanation why we chose to use the ompi_predefined_xxx_t structure.
 */
 extern struct ompi_predefined_communicator_t ompi_mpi_comm_world;
 extern struct ompi_predefined_communicator_t ompi_mpi_comm_self;
 extern struct ompi_predefined_communicator_t ompi_mpi_comm_null;

 extern struct ompi_predefined_group_t ompi_mpi_group_empty;
 extern struct ompi_predefined_group_t ompi_mpi_group_null;

 extern struct ompi_predefined_request_t ompi_request_null;

 extern struct ompi_predefined_message_t ompi_message_null;
 extern struct ompi_predefined_message_t ompi_message_no_proc;

 extern struct ompi_predefined_op_t ompi_mpi_op_null;
 extern struct ompi_predefined_op_t ompi_mpi_op_min;
 extern struct ompi_predefined_op_t ompi_mpi_op_max;
 extern struct ompi_predefined_op_t ompi_mpi_op_sum;
 extern struct ompi_predefined_op_t ompi_mpi_op_prod;
 extern struct ompi_predefined_op_t ompi_mpi_op_land;
 extern struct ompi_predefined_op_t ompi_mpi_op_band;
 extern struct ompi_predefined_op_t ompi_mpi_op_lor;
 extern struct ompi_predefined_op_t ompi_mpi_op_bor;
 extern struct ompi_predefined_op_t ompi_mpi_op_lxor;
 extern struct ompi_predefined_op_t ompi_mpi_op_bxor;
 extern struct ompi_predefined_op_t ompi_mpi_op_maxloc;
 extern struct ompi_predefined_op_t ompi_mpi_op_minloc;
 extern struct ompi_predefined_op_t ompi_mpi_op_replace;
 extern struct ompi_predefined_op_t ompi_mpi_op_no_op;


 extern struct ompi_predefined_datatype_t ompi_mpi_datatype_null;

 extern struct ompi_predefined_datatype_t ompi_mpi_char;
 extern struct ompi_predefined_datatype_t ompi_mpi_signed_char;
 extern struct ompi_predefined_datatype_t ompi_mpi_unsigned_char;
 extern struct ompi_predefined_datatype_t ompi_mpi_byte;
 extern struct ompi_predefined_datatype_t ompi_mpi_short;
 extern struct ompi_predefined_datatype_t ompi_mpi_unsigned_short;
 extern struct ompi_predefined_datatype_t ompi_mpi_int;
 extern struct ompi_predefined_datatype_t ompi_mpi_unsigned;
 extern struct ompi_predefined_datatype_t ompi_mpi_long;
 extern struct ompi_predefined_datatype_t ompi_mpi_unsigned_long;
 extern struct ompi_predefined_datatype_t ompi_mpi_long_long_int;
 extern struct ompi_predefined_datatype_t ompi_mpi_unsigned_long_long;
 extern struct ompi_predefined_datatype_t ompi_mpi_float;
 extern struct ompi_predefined_datatype_t ompi_mpi_double;
 extern struct ompi_predefined_datatype_t ompi_mpi_long_double;
 extern struct ompi_predefined_datatype_t ompi_mpi_wchar;
 extern struct ompi_predefined_datatype_t ompi_mpi_packed;

/*
 * Following are the C++/C99 datatypes
 */
 extern struct ompi_predefined_datatype_t ompi_mpi_cxx_bool;
 extern struct ompi_predefined_datatype_t ompi_mpi_cxx_cplex;
 extern struct ompi_predefined_datatype_t ompi_mpi_cxx_dblcplex;
 extern struct ompi_predefined_datatype_t ompi_mpi_cxx_ldblcplex;

/*
 * Following are the Fortran datatypes
 */
 extern struct ompi_predefined_datatype_t ompi_mpi_logical;
 extern struct ompi_predefined_datatype_t ompi_mpi_character;
 extern struct ompi_predefined_datatype_t ompi_mpi_integer;
 extern struct ompi_predefined_datatype_t ompi_mpi_real;
 extern struct ompi_predefined_datatype_t ompi_mpi_dblprec;
 extern struct ompi_predefined_datatype_t ompi_mpi_cplex;
 extern struct ompi_predefined_datatype_t ompi_mpi_dblcplex;
 extern struct ompi_predefined_datatype_t ompi_mpi_ldblcplex;

/* Aggregate struct datatypes are not const */
 extern struct ompi_predefined_datatype_t ompi_mpi_2int;
 extern struct ompi_predefined_datatype_t ompi_mpi_2integer;
 extern struct ompi_predefined_datatype_t ompi_mpi_2real;
 extern struct ompi_predefined_datatype_t ompi_mpi_2dblprec;
 extern struct ompi_predefined_datatype_t ompi_mpi_2cplex;
 extern struct ompi_predefined_datatype_t ompi_mpi_2dblcplex;

 extern struct ompi_predefined_datatype_t ompi_mpi_float_int;
 extern struct ompi_predefined_datatype_t ompi_mpi_double_int;
 extern struct ompi_predefined_datatype_t ompi_mpi_longdbl_int;
 extern struct ompi_predefined_datatype_t ompi_mpi_short_int;
 extern struct ompi_predefined_datatype_t ompi_mpi_long_int;

/* Optional MPI2 datatypes, always declared and defined, but not "exported" as MPI_LOGICAL1 */
 extern struct ompi_predefined_datatype_t ompi_mpi_logical1;
 extern struct ompi_predefined_datatype_t ompi_mpi_logical2;
 extern struct ompi_predefined_datatype_t ompi_mpi_logical4;
 extern struct ompi_predefined_datatype_t ompi_mpi_logical8;
 extern struct ompi_predefined_datatype_t ompi_mpi_integer1;
 extern struct ompi_predefined_datatype_t ompi_mpi_integer2;
 extern struct ompi_predefined_datatype_t ompi_mpi_integer4;
 extern struct ompi_predefined_datatype_t ompi_mpi_integer8;
 extern struct ompi_predefined_datatype_t ompi_mpi_integer16;
 extern struct ompi_predefined_datatype_t ompi_mpi_real2;
 extern struct ompi_predefined_datatype_t ompi_mpi_real4;
 extern struct ompi_predefined_datatype_t ompi_mpi_real8;
 extern struct ompi_predefined_datatype_t ompi_mpi_real16;
 extern struct ompi_predefined_datatype_t ompi_mpi_complex8;
 extern struct ompi_predefined_datatype_t ompi_mpi_complex16;
 extern struct ompi_predefined_datatype_t ompi_mpi_complex32;

/* New datatypes from the MPI 2.2 standard */
 extern struct ompi_predefined_datatype_t ompi_mpi_int8_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_uint8_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_int16_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_uint16_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_int32_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_uint32_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_int64_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_uint64_t;
 extern struct ompi_predefined_datatype_t ompi_mpi_aint;
 extern struct ompi_predefined_datatype_t ompi_mpi_offset;
 extern struct ompi_predefined_datatype_t ompi_mpi_count;
 extern struct ompi_predefined_datatype_t ompi_mpi_c_bool;
 extern struct ompi_predefined_datatype_t ompi_mpi_c_float_complex;
 extern struct ompi_predefined_datatype_t ompi_mpi_c_double_complex;
 extern struct ompi_predefined_datatype_t ompi_mpi_c_long_double_complex;

 extern struct ompi_predefined_errhandler_t ompi_mpi_errhandler_null;
 extern struct ompi_predefined_errhandler_t ompi_mpi_errors_are_fatal;
 extern struct ompi_predefined_errhandler_t ompi_mpi_errors_return;

 extern struct ompi_predefined_win_t ompi_mpi_win_null;
 extern struct ompi_predefined_file_t ompi_mpi_file_null;

 extern struct ompi_predefined_info_t ompi_mpi_info_null;
 extern struct ompi_predefined_info_t ompi_mpi_info_env;

 extern MPI_Fint *MPI_F_STATUS_IGNORE;
 extern MPI_Fint *MPI_F_STATUSES_IGNORE;

/*
 * Removed datatypes.  These datatypes are only available if Open MPI
 * was configured with --enable-mpi1-compatibility.
 *
 * These datatypes were formally removed from the MPI specification
 * and should no longer be used in MPI applications.
 */

 extern struct ompi_predefined_datatype_t ompi_mpi_lb;
 extern struct ompi_predefined_datatype_t ompi_mpi_ub;



/*
 * MPI API
 */

  int MPI_Abort(MPI_Comm comm, int errorcode);
  int MPI_Accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                  int target_rank, MPI_Aint target_disp, int target_count,
                                  MPI_Datatype target_datatype, MPI_Op op, MPI_Win win);
  int MPI_Add_error_class(int *errorclass);
  int MPI_Add_error_code(int errorclass, int *errorcode);
  int MPI_Add_error_string(int errorcode, const char *string);
  int MPI_Allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                 void *recvbuf, int recvcount,
                                 MPI_Datatype recvtype, MPI_Comm comm);
  int MPI_Iallgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                 void *recvbuf, int recvcount,
                                 MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int MPI_Allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                  void *recvbuf, const int recvcounts[],
                                  const int displs[], MPI_Datatype recvtype, MPI_Comm comm);
  int MPI_Iallgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                  void *recvbuf, const int recvcounts[],
                                  const int displs[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int MPI_Alloc_mem(MPI_Aint size, MPI_Info info,
                                 void *baseptr);
  int MPI_Allreduce(const void *sendbuf, void *recvbuf, int count,
                                 MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int MPI_Iallreduce(const void *sendbuf, void *recvbuf, int count,
                                 MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int MPI_Alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                void *recvbuf, int recvcount,
                                MPI_Datatype recvtype, MPI_Comm comm);
  int MPI_Ialltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                void *recvbuf, int recvcount,
                                MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int MPI_Alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[],
                                 MPI_Datatype sendtype, void *recvbuf, const int recvcounts[],
                                 const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm);
  int MPI_Ialltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[],
                                 MPI_Datatype sendtype, void *recvbuf, const int recvcounts[],
                                 const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int MPI_Alltoallw(const void *sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[],
                                 void *recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[],
                                 MPI_Comm comm);
  int MPI_Ialltoallw(const void *sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[],
                                 void *recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[],
                                 MPI_Comm comm, MPI_Request *request);
  int MPI_Barrier(MPI_Comm comm);
  int MPI_Ibarrier(MPI_Comm comm, MPI_Request *request);
  int MPI_Bcast(void *buffer, int count, MPI_Datatype datatype,
                             int root, MPI_Comm comm);
  int MPI_Bsend(const void *buf, int count, MPI_Datatype datatype,
                             int dest, int tag, MPI_Comm comm);
  int MPI_Ibcast(void *buffer, int count, MPI_Datatype datatype,
				                              int root, MPI_Comm comm,
											  MPI_Request *request);
  int MPI_Bsend_init(const void *buf, int count, MPI_Datatype datatype,
                                  int dest, int tag, MPI_Comm comm, MPI_Request *request);
  int MPI_Buffer_attach(void *buffer, int size);
  int MPI_Buffer_detach(void *buffer, int *size);
  int MPI_Cancel(MPI_Request *request);
  int MPI_Cart_coords(MPI_Comm comm, int rank, int maxdims, int coords[]);
  int MPI_Cart_create(MPI_Comm old_comm, int ndims, const int dims[],
                                   const int periods[], int reorder, MPI_Comm *comm_cart);
  int MPI_Cart_get(MPI_Comm comm, int maxdims, int dims[],
                                int periods[], int coords[]);
  int MPI_Cart_map(MPI_Comm comm, int ndims, const int dims[],
                                const int periods[], int *newrank);
  int MPI_Cart_rank(MPI_Comm comm, const int coords[], int *rank);
  int MPI_Cart_shift(MPI_Comm comm, int direction, int disp,
                                  int *rank_source, int *rank_dest);
  int MPI_Cart_sub(MPI_Comm comm, const int remain_dims[], MPI_Comm *new_comm);
  int MPI_Cartdim_get(MPI_Comm comm, int *ndims);
  int MPI_Close_port(const char *port_name);
  int MPI_Comm_accept(const char *port_name, MPI_Info info, int root,
                                   MPI_Comm comm, MPI_Comm *newcomm);
  MPI_Fint MPI_Comm_c2f(MPI_Comm comm);
  int MPI_Comm_call_errhandler(MPI_Comm comm, int errorcode);
  int MPI_Comm_compare(MPI_Comm comm1, MPI_Comm comm2, int *result);
  int MPI_Comm_connect(const char *port_name, MPI_Info info, int root,
                                    MPI_Comm comm, MPI_Comm *newcomm);
  int MPI_Comm_create_errhandler(MPI_Comm_errhandler_function *function,
                                              MPI_Errhandler *errhandler);
  int MPI_Comm_create_keyval(MPI_Comm_copy_attr_function *comm_copy_attr_fn,
                                          MPI_Comm_delete_attr_function *comm_delete_attr_fn,
                                          int *comm_keyval, void *extra_state);
  int MPI_Comm_create_group(MPI_Comm comm, MPI_Group group, int tag, MPI_Comm *newcomm);
  int MPI_Comm_create(MPI_Comm comm, MPI_Group group, MPI_Comm *newcomm);
  int MPI_Comm_delete_attr(MPI_Comm comm, int comm_keyval);
  int MPI_Comm_disconnect(MPI_Comm *comm);
  int MPI_Comm_dup(MPI_Comm comm, MPI_Comm *newcomm);
  int MPI_Comm_idup(MPI_Comm comm, MPI_Comm *newcomm, MPI_Request *request);
  int MPI_Comm_dup_with_info(MPI_Comm comm, MPI_Info info, MPI_Comm *newcomm);
  MPI_Comm MPI_Comm_f2c(MPI_Fint comm);
  int MPI_Comm_free_keyval(int *comm_keyval);
  int MPI_Comm_free(MPI_Comm *comm);
  int MPI_Comm_get_attr(MPI_Comm comm, int comm_keyval,
                                     void *attribute_val, int *flag);
  int MPI_Dist_graph_create(MPI_Comm comm_old, int n, const int nodes[],
                                         const int degrees[], const int targets[],
                                         const int weights[], MPI_Info info,
                                         int reorder, MPI_Comm * newcomm);
  int MPI_Dist_graph_create_adjacent(MPI_Comm comm_old,
                                                  int indegree, const int sources[],
                                                  const int sourceweights[],
                                                  int outdegree,
                                                  const int destinations[],
                                                  const int destweights[],
                                                  MPI_Info info, int reorder,
                                                  MPI_Comm *comm_dist_graph);
 int MPI_Dist_graph_neighbors(MPI_Comm comm, int maxindegree,
                                           int sources[], int sourceweights[],
                                           int maxoutdegree,
                                           int destinations[],
                                           int destweights[]);
  int MPI_Dist_graph_neighbors_count(MPI_Comm comm,
                                                  int *inneighbors,
                                                  int *outneighbors,
                                                  int *weighted);
  int MPI_Comm_get_errhandler(MPI_Comm comm, MPI_Errhandler *erhandler);
  int MPI_Comm_get_info(MPI_Comm comm, MPI_Info *info_used);
  int MPI_Comm_get_name(MPI_Comm comm, char *comm_name, int *resultlen);
  int MPI_Comm_get_parent(MPI_Comm *parent);
  int MPI_Comm_group(MPI_Comm comm, MPI_Group *group);
  int MPI_Comm_join(int fd, MPI_Comm *intercomm);
  int MPI_Comm_rank(MPI_Comm comm, int *rank);
  int MPI_Comm_remote_group(MPI_Comm comm, MPI_Group *group);
  int MPI_Comm_remote_size(MPI_Comm comm, int *size);
  int MPI_Comm_set_attr(MPI_Comm comm, int comm_keyval, void *attribute_val);
  int MPI_Comm_set_errhandler(MPI_Comm comm, MPI_Errhandler errhandler);
  int MPI_Comm_set_info(MPI_Comm comm, MPI_Info info);
  int MPI_Comm_set_name(MPI_Comm comm, const char *comm_name);
  int MPI_Comm_size(MPI_Comm comm, int *size);
  int MPI_Comm_spawn(const char *command, char *argv[], int maxprocs, MPI_Info info,
                                  int root, MPI_Comm comm, MPI_Comm *intercomm,
                                  int array_of_errcodes[]);
  int MPI_Comm_spawn_multiple(int count, char *array_of_commands[], char **array_of_argv[],
                                           const int array_of_maxprocs[], const MPI_Info array_of_info[],
                                           int root, MPI_Comm comm, MPI_Comm *intercomm,
                                           int array_of_errcodes[]);
  int MPI_Comm_split(MPI_Comm comm, int color, int key, MPI_Comm *newcomm);
  int MPI_Comm_split_type(MPI_Comm comm, int split_type, int key, MPI_Info info, MPI_Comm *newcomm);
  int MPI_Comm_test_inter(MPI_Comm comm, int *flag);
  int MPI_Compare_and_swap(const void *origin_addr, const void *compare_addr,
                                        void *result_addr, MPI_Datatype datatype, int target_rank,
                                        MPI_Aint target_disp, MPI_Win win);
  int MPI_Dims_create(int nnodes, int ndims, int dims[]);
  MPI_Fint MPI_Errhandler_c2f(MPI_Errhandler errhandler);
  MPI_Errhandler MPI_Errhandler_f2c(MPI_Fint errhandler);
  int MPI_Errhandler_free(MPI_Errhandler *errhandler);
  int MPI_Error_class(int errorcode, int *errorclass);
  int MPI_Error_string(int errorcode, char *string, int *resultlen);
  int MPI_Exscan(const void *sendbuf, void *recvbuf, int count,
                              MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int MPI_Fetch_and_op(const void *origin_addr, void *result_addr, MPI_Datatype datatype,
                                    int target_rank, MPI_Aint target_disp, MPI_Op op, MPI_Win win);
  int MPI_Iexscan(const void *sendbuf, void *recvbuf, int count,
                              MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  MPI_Fint MPI_File_c2f(MPI_File file);
  MPI_File MPI_File_f2c(MPI_Fint file);
  int MPI_File_call_errhandler(MPI_File fh, int errorcode);
  int MPI_File_create_errhandler(MPI_File_errhandler_function *function,
                                              MPI_Errhandler *errhandler);
  int MPI_File_set_errhandler( MPI_File file, MPI_Errhandler errhandler);
  int MPI_File_get_errhandler( MPI_File file, MPI_Errhandler *errhandler);
  int MPI_File_open(MPI_Comm comm, const char *filename, int amode,
                                 MPI_Info info, MPI_File *fh);
  int MPI_File_close(MPI_File *fh);
  int MPI_File_delete(const char *filename, MPI_Info info);
  int MPI_File_set_size(MPI_File fh, MPI_Offset size);
  int MPI_File_preallocate(MPI_File fh, MPI_Offset size);
  int MPI_File_get_size(MPI_File fh, MPI_Offset *size);
  int MPI_File_get_group(MPI_File fh, MPI_Group *group);
  int MPI_File_get_amode(MPI_File fh, int *amode);
  int MPI_File_set_info(MPI_File fh, MPI_Info info);
  int MPI_File_get_info(MPI_File fh, MPI_Info *info_used);
  int MPI_File_set_view(MPI_File fh, MPI_Offset disp, MPI_Datatype etype,
                                     MPI_Datatype filetype, const char *datarep, MPI_Info info);
  int MPI_File_get_view(MPI_File fh, MPI_Offset *disp,
                                     MPI_Datatype *etype,
                                     MPI_Datatype *filetype, char *datarep);
  int MPI_File_read_at(MPI_File fh, MPI_Offset offset, void *buf,
                                    int count, MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_read_at_all(MPI_File fh, MPI_Offset offset, void *buf,
                                        int count, MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_write_at(MPI_File fh, MPI_Offset offset, const void *buf,
                                     int count, MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_write_at_all(MPI_File fh, MPI_Offset offset, const void *buf,
                                         int count, MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_iread_at(MPI_File fh, MPI_Offset offset, void *buf,
                                     int count, MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_iwrite_at(MPI_File fh, MPI_Offset offset, const void *buf,
                                      int count, MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_iread_at_all(MPI_File fh, MPI_Offset offset, void *buf,
                                     int count, MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_iwrite_at_all(MPI_File fh, MPI_Offset offset, const void *buf,
                                      int count, MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_read(MPI_File fh, void *buf, int count,
                                 MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_read_all(MPI_File fh, void *buf, int count,
                                     MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_write(MPI_File fh, const void *buf, int count,
                                  MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_write_all(MPI_File fh, const void *buf, int count,
                                      MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_iread(MPI_File fh, void *buf, int count,
                                  MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_iwrite(MPI_File fh, const void *buf, int count,
                                   MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_iread_all(MPI_File fh, void *buf, int count,
                                  MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_iwrite_all(MPI_File fh, const void *buf, int count,
                                   MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_seek(MPI_File fh, MPI_Offset offset, int whence);
  int MPI_File_get_position(MPI_File fh, MPI_Offset *offset);
  int MPI_File_get_byte_offset(MPI_File fh, MPI_Offset offset,
                                            MPI_Offset *disp);
  int MPI_File_read_shared(MPI_File fh, void *buf, int count,
                                        MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_write_shared(MPI_File fh, const void *buf, int count,
					 MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_iread_shared(MPI_File fh, void *buf, int count,
                                         MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_iwrite_shared(MPI_File fh, const void *buf, int count,
                                          MPI_Datatype datatype, MPI_Request *request);
  int MPI_File_read_ordered(MPI_File fh, void *buf, int count,
                                         MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_write_ordered(MPI_File fh, const void *buf, int count,
                                          MPI_Datatype datatype, MPI_Status *status);
  int MPI_File_seek_shared(MPI_File fh, MPI_Offset offset, int whence);
  int MPI_File_get_position_shared(MPI_File fh, MPI_Offset *offset);
  int MPI_File_read_at_all_begin(MPI_File fh, MPI_Offset offset, void *buf,
                                              int count, MPI_Datatype datatype);
  int MPI_File_read_at_all_end(MPI_File fh, void *buf, MPI_Status *status);
  int MPI_File_write_at_all_begin(MPI_File fh, MPI_Offset offset, const void *buf,
                                               int count, MPI_Datatype datatype);
  int MPI_File_write_at_all_end(MPI_File fh, const void *buf, MPI_Status *status);
  int MPI_File_read_all_begin(MPI_File fh, void *buf, int count,
                                           MPI_Datatype datatype);
  int MPI_File_read_all_end(MPI_File fh, void *buf, MPI_Status *status);
  int MPI_File_write_all_begin(MPI_File fh, const void *buf, int count,
                                            MPI_Datatype datatype);
  int MPI_File_write_all_end(MPI_File fh, const void *buf, MPI_Status *status);
  int MPI_File_read_ordered_begin(MPI_File fh, void *buf, int count,
                                               MPI_Datatype datatype);
  int MPI_File_read_ordered_end(MPI_File fh, void *buf, MPI_Status *status);
  int MPI_File_write_ordered_begin(MPI_File fh, const void *buf, int count,
                                                MPI_Datatype datatype);
  int MPI_File_write_ordered_end(MPI_File fh, const void *buf, MPI_Status *status);
  int MPI_File_get_type_extent(MPI_File fh, MPI_Datatype datatype,
                                            MPI_Aint *extent);
  int MPI_File_set_atomicity(MPI_File fh, int flag);
  int MPI_File_get_atomicity(MPI_File fh, int *flag);
  int MPI_File_sync(MPI_File fh);
  int MPI_Finalize(void);
  int MPI_Finalized(int *flag);
  int MPI_Free_mem(void *base);
  int MPI_Gather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                              void *recvbuf, int recvcount, MPI_Datatype recvtype,
                              int root, MPI_Comm comm);
  int MPI_Igather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                              void *recvbuf, int recvcount, MPI_Datatype recvtype,
                              int root, MPI_Comm comm, MPI_Request *request);
  int MPI_Gatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                               void *recvbuf, const int recvcounts[], const int displs[],
                               MPI_Datatype recvtype, int root, MPI_Comm comm);
  int MPI_Igatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                               void *recvbuf, const int recvcounts[], const int displs[],
                               MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request);
  int MPI_Get_address(const void *location, MPI_Aint *address);
  int MPI_Get_count(const MPI_Status *status, MPI_Datatype datatype, int *count);
  int MPI_Get_elements(const MPI_Status *status, MPI_Datatype datatype, int *count);
  int MPI_Get_elements_x(const MPI_Status *status, MPI_Datatype datatype, MPI_Count *count);
  int MPI_Get(void *origin_addr, int origin_count,
                           MPI_Datatype origin_datatype, int target_rank,
                           MPI_Aint target_disp, int target_count,
                           MPI_Datatype target_datatype, MPI_Win win);
  int MPI_Get_accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                      void *result_addr, int result_count, MPI_Datatype result_datatype,
                                      int target_rank, MPI_Aint target_disp, int target_count,
                                      MPI_Datatype target_datatype, MPI_Op op, MPI_Win win);
  int MPI_Get_library_version(char *version, int *resultlen);
  int MPI_Get_processor_name(char *name, int *resultlen);
  int MPI_Get_version(int *version, int *subversion);
  int MPI_Graph_create(MPI_Comm comm_old, int nnodes, const int index[],
                                    const int edges[], int reorder, MPI_Comm *comm_graph);
  int MPI_Graph_get(MPI_Comm comm, int maxindex, int maxedges,
                                 int index[], int edges[]);
  int MPI_Graph_map(MPI_Comm comm, int nnodes, const int index[], const int edges[],
                                 int *newrank);
  int MPI_Graph_neighbors_count(MPI_Comm comm, int rank, int *nneighbors);
  int MPI_Graph_neighbors(MPI_Comm comm, int rank, int maxneighbors,
                                       int neighbors[]);
  int MPI_Graphdims_get(MPI_Comm comm, int *nnodes, int *nedges);
  int MPI_Grequest_complete(MPI_Request request);
  int MPI_Grequest_start(MPI_Grequest_query_function *query_fn,
                                      MPI_Grequest_free_function *free_fn,
                                      MPI_Grequest_cancel_function *cancel_fn,
                                      void *extra_state, MPI_Request *request);
  MPI_Fint MPI_Group_c2f(MPI_Group group);
  int MPI_Group_compare(MPI_Group group1, MPI_Group group2, int *result);
  int MPI_Group_difference(MPI_Group group1, MPI_Group group2,
                                        MPI_Group *newgroup);
  int MPI_Group_excl(MPI_Group group, int n, const int ranks[],
                                  MPI_Group *newgroup);
  MPI_Group MPI_Group_f2c(MPI_Fint group);
  int MPI_Group_free(MPI_Group *group);
  int MPI_Group_incl(MPI_Group group, int n, const int ranks[],
                                  MPI_Group *newgroup);
  int MPI_Group_intersection(MPI_Group group1, MPI_Group group2,
                                          MPI_Group *newgroup);
  int MPI_Group_range_excl(MPI_Group group, int n, int ranges[][3],
                                        MPI_Group *newgroup);
  int MPI_Group_range_incl(MPI_Group group, int n, int ranges[][3],
                                        MPI_Group *newgroup);
  int MPI_Group_rank(MPI_Group group, int *rank);
  int MPI_Group_size(MPI_Group group, int *size);
  int MPI_Group_translate_ranks(MPI_Group group1, int n, const int ranks1[],
                                             MPI_Group group2, int ranks2[]);
  int MPI_Group_union(MPI_Group group1, MPI_Group group2,
                                   MPI_Group *newgroup);
  int MPI_Ibsend(const void *buf, int count, MPI_Datatype datatype, int dest,
                              int tag, MPI_Comm comm, MPI_Request *request);
  int MPI_Improbe(int source, int tag, MPI_Comm comm,
                               int *flag, MPI_Message *message,
                               MPI_Status *status);
  int MPI_Imrecv(void *buf, int count, MPI_Datatype type,
                              MPI_Message *message, MPI_Request *request);
  MPI_Fint MPI_Info_c2f(MPI_Info info);
  int MPI_Info_create(MPI_Info *info);
  int MPI_Info_delete(MPI_Info info, const char *key);
  int MPI_Info_dup(MPI_Info info, MPI_Info *newinfo);
  MPI_Info MPI_Info_f2c(MPI_Fint info);
  int MPI_Info_free(MPI_Info *info);
  int MPI_Info_get(MPI_Info info, const char *key, int valuelen,
                                char *value, int *flag);
  int MPI_Info_get_nkeys(MPI_Info info, int *nkeys);
  int MPI_Info_get_nthkey(MPI_Info info, int n, char *key);
  int MPI_Info_get_valuelen(MPI_Info info, const char *key, int *valuelen,
                                         int *flag);
  int MPI_Info_set(MPI_Info info, const char *key, const char *value);
  int MPI_Init(int *argc, char ***argv);
  int MPI_Initialized(int *flag);
  int MPI_Init_thread(int *argc, char ***argv, int required,
                                   int *provided);
  int MPI_Intercomm_create(MPI_Comm local_comm, int local_leader,
                                        MPI_Comm bridge_comm, int remote_leader,
                                        int tag, MPI_Comm *newintercomm);
  int MPI_Intercomm_merge(MPI_Comm intercomm, int high,
                                       MPI_Comm *newintercomm);
  int MPI_Iprobe(int source, int tag, MPI_Comm comm, int *flag,
                              MPI_Status *status);
  int MPI_Irecv(void *buf, int count, MPI_Datatype datatype, int source,
                             int tag, MPI_Comm comm, MPI_Request *request);
  int MPI_Irsend(const void *buf, int count, MPI_Datatype datatype, int dest,
                              int tag, MPI_Comm comm, MPI_Request *request);
  int MPI_Isend(const void *buf, int count, MPI_Datatype datatype, int dest,
                             int tag, MPI_Comm comm, MPI_Request *request);
  int MPI_Issend(const void *buf, int count, MPI_Datatype datatype, int dest,
                              int tag, MPI_Comm comm, MPI_Request *request);
  int MPI_Is_thread_main(int *flag);
  int MPI_Lookup_name(const char *service_name, MPI_Info info, char *port_name);
  MPI_Fint MPI_Message_c2f(MPI_Message message);
  MPI_Message MPI_Message_f2c(MPI_Fint message);
  int MPI_Mprobe(int source, int tag, MPI_Comm comm,
                               MPI_Message *message,
                               MPI_Status *status);
  int MPI_Mrecv(void *buf, int count, MPI_Datatype type,
                             MPI_Message *message, MPI_Status *status);
  int MPI_Neighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                          void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                          MPI_Comm comm);
  int MPI_Ineighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                           void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                           MPI_Comm comm, MPI_Request *request);
  int MPI_Neighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                           void *recvbuf, const int recvcounts[], const int displs[],
                                           MPI_Datatype recvtype, MPI_Comm comm);
  int MPI_Ineighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                            void *recvbuf, const int recvcounts[], const int displs[],
                                            MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int MPI_Neighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                         void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                         MPI_Comm comm);
  int MPI_Ineighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                          void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                          MPI_Comm comm, MPI_Request *request);
  int MPI_Neighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[],  MPI_Datatype sendtype,
                                          void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype,
                                          MPI_Comm comm);
  int MPI_Ineighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype,
                                           void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype,
                                           MPI_Comm comm, MPI_Request *request);
  int MPI_Neighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[],
                                          void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[],
                                          MPI_Comm comm);
  int MPI_Ineighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[],
                                           void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[],
                                           MPI_Comm comm, MPI_Request *request);
  MPI_Fint MPI_Op_c2f(MPI_Op op);
  int MPI_Op_commutative(MPI_Op op, int *commute);
  int MPI_Op_create(MPI_User_function *function, int commute, MPI_Op *op);
  int MPI_Open_port(MPI_Info info, char *port_name);
  MPI_Op MPI_Op_f2c(MPI_Fint op);
  int MPI_Op_free(MPI_Op *op);
  int MPI_Pack_external(const char datarep[], const void *inbuf, int incount,
                                     MPI_Datatype datatype, void *outbuf,
                                     MPI_Aint outsize, MPI_Aint *position);
  int MPI_Pack_external_size(const char datarep[], int incount,
                                          MPI_Datatype datatype, MPI_Aint *size);
  int MPI_Pack(const void *inbuf, int incount, MPI_Datatype datatype,
                            void *outbuf, int outsize, int *position, MPI_Comm comm);
  int MPI_Pack_size(int incount, MPI_Datatype datatype, MPI_Comm comm,
                                 int *size);
  int MPI_Pcontrol(const int level, ...);
  int MPI_Probe(int source, int tag, MPI_Comm comm, MPI_Status *status);
  int MPI_Publish_name(const char *service_name, MPI_Info info,
                                    const char *port_name);
  int MPI_Put(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                           int target_rank, MPI_Aint target_disp, int target_count,
                           MPI_Datatype target_datatype, MPI_Win win);
  int MPI_Query_thread(int *provided);
  int MPI_Raccumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                   int target_rank, MPI_Aint target_disp, int target_count,
                                   MPI_Datatype target_datatype, MPI_Op op, MPI_Win win, MPI_Request *request);
  int MPI_Recv_init(void *buf, int count, MPI_Datatype datatype, int source,
                                 int tag, MPI_Comm comm, MPI_Request *request);
  int MPI_Recv(void *buf, int count, MPI_Datatype datatype, int source,
                            int tag, MPI_Comm comm, MPI_Status *status);
  int MPI_Reduce(const void *sendbuf, void *recvbuf, int count,
                              MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm);
  int MPI_Ireduce(const void *sendbuf, void *recvbuf, int count,
                              MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm, MPI_Request *request);
  int MPI_Reduce_local(const void *inbuf, void *inoutbuf, int count,
                                    MPI_Datatype datatype, MPI_Op op);
  int MPI_Reduce_scatter(const void *sendbuf, void *recvbuf, const int recvcounts[],
                                      MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int MPI_Ireduce_scatter(const void *sendbuf, void *recvbuf, const int recvcounts[],
                                      MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int MPI_Reduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount,
                                      MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int MPI_Ireduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount,
                                      MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int MPI_Register_datarep(const char *datarep,
                                        MPI_Datarep_conversion_function *read_conversion_fn,
                                        MPI_Datarep_conversion_function *write_conversion_fn,
                                        MPI_Datarep_extent_function *dtype_file_extent_fn,
                                        void *extra_state);
  MPI_Fint MPI_Request_c2f(MPI_Request request);
  MPI_Request MPI_Request_f2c(MPI_Fint request);
  int MPI_Request_free(MPI_Request *request);
  int MPI_Request_get_status(MPI_Request request, int *flag,
                                          MPI_Status *status);
  int MPI_Rget(void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                            int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype,
                            MPI_Win win, MPI_Request *request);
  int MPI_Rget_accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                       void *result_addr, int result_count, MPI_Datatype result_datatype,
                                       int target_rank, MPI_Aint target_disp, int target_count,
                                       MPI_Datatype target_datatype, MPI_Op op,
                                       MPI_Win win, MPI_Request *request);
  int MPI_Rput(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                            int target_rank, MPI_Aint target_disp, int target_cout,
                            MPI_Datatype target_datatype, MPI_Win win, MPI_Request *request);
  int MPI_Rsend(const void *ibuf, int count, MPI_Datatype datatype, int dest,
                             int tag, MPI_Comm comm);
  int MPI_Rsend_init(const void *buf, int count, MPI_Datatype datatype,
                                  int dest, int tag, MPI_Comm comm,
                                  MPI_Request *request);
  int MPI_Scan(const void *sendbuf, void *recvbuf, int count,
                            MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int MPI_Iscan(const void *sendbuf, void *recvbuf, int count,
                            MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int MPI_Scatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                               void *recvbuf, int recvcount, MPI_Datatype recvtype,
                               int root, MPI_Comm comm);
  int MPI_Iscatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                               void *recvbuf, int recvcount, MPI_Datatype recvtype,
                               int root, MPI_Comm comm, MPI_Request *request);
  int MPI_Scatterv(const void *sendbuf, const int sendcounts[], const int displs[],
                                MPI_Datatype sendtype, void *recvbuf, int recvcount,
                                MPI_Datatype recvtype, int root, MPI_Comm comm);
  int MPI_Iscatterv(const void *sendbuf, const int sendcounts[], const int displs[],
                                MPI_Datatype sendtype, void *recvbuf, int recvcount,
                                MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request);
  int MPI_Send_init(const void *buf, int count, MPI_Datatype datatype,
                                 int dest, int tag, MPI_Comm comm,
                                 MPI_Request *request);
  int MPI_Send(const void *buf, int count, MPI_Datatype datatype, int dest,
                            int tag, MPI_Comm comm);
  int MPI_Sendrecv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                int dest, int sendtag, void *recvbuf, int recvcount,
                                MPI_Datatype recvtype, int source, int recvtag,
                                MPI_Comm comm,  MPI_Status *status);
  int MPI_Sendrecv_replace(void * buf, int count, MPI_Datatype datatype,
                                        int dest, int sendtag, int source, int recvtag,
                                        MPI_Comm comm, MPI_Status *status);
  int MPI_Ssend_init(const void *buf, int count, MPI_Datatype datatype,
                                  int dest, int tag, MPI_Comm comm,
                                  MPI_Request *request);
  int MPI_Ssend(const void *buf, int count, MPI_Datatype datatype, int dest,
                             int tag, MPI_Comm comm);
  int MPI_Start(MPI_Request *request);
  int MPI_Startall(int count, MPI_Request array_of_requests[]);
  int MPI_Status_c2f(const MPI_Status *c_status, MPI_Fint *f_status);
  int MPI_Status_f2c(const MPI_Fint *f_status, MPI_Status *c_status);
  int MPI_Status_set_cancelled(MPI_Status *status, int flag);
  int MPI_Status_set_elements(MPI_Status *status, MPI_Datatype datatype,
                                           int count);
  int MPI_Status_set_elements_x(MPI_Status *status, MPI_Datatype datatype,
                                             MPI_Count count);
  int MPI_Testall(int count, MPI_Request array_of_requests[], int *flag,
                               MPI_Status array_of_statuses[]);
  int MPI_Testany(int count, MPI_Request array_of_requests[], int *index,
                               int *flag, MPI_Status *status);
  int MPI_Test(MPI_Request *request, int *flag, MPI_Status *status);
  int MPI_Test_cancelled(const MPI_Status *status, int *flag);
  int MPI_Testsome(int incount, MPI_Request array_of_requests[],
                                int *outcount, int array_of_indices[],
                                MPI_Status array_of_statuses[]);
  int MPI_Topo_test(MPI_Comm comm, int *status);
  MPI_Fint MPI_Type_c2f(MPI_Datatype datatype);
  int MPI_Type_commit(MPI_Datatype *type);
  int MPI_Type_contiguous(int count, MPI_Datatype oldtype,
                                       MPI_Datatype *newtype);
  int MPI_Type_create_darray(int size, int rank, int ndims,
                                          const int gsize_array[], const int distrib_array[],
                                          const int darg_array[], const int psize_array[],
                                          int order, MPI_Datatype oldtype,
                                          MPI_Datatype *newtype);
  int MPI_Type_create_f90_complex(int p, int r, MPI_Datatype *newtype);
  int MPI_Type_create_f90_integer(int r, MPI_Datatype *newtype);
  int MPI_Type_create_f90_real(int p, int r, MPI_Datatype *newtype);
  int MPI_Type_create_hindexed_block(int count, int blocklength,
                                                  const MPI_Aint array_of_displacements[],
                                                  MPI_Datatype oldtype,
                                                  MPI_Datatype *newtype);
  int MPI_Type_create_hindexed(int count, const int array_of_blocklengths[],
                                            const MPI_Aint array_of_displacements[],
                                            MPI_Datatype oldtype,
                                            MPI_Datatype *newtype);
  int MPI_Type_create_hvector(int count, int blocklength, MPI_Aint stride,
                                           MPI_Datatype oldtype,
                                           MPI_Datatype *newtype);
  int MPI_Type_create_keyval(MPI_Type_copy_attr_function *type_copy_attr_fn,
                                          MPI_Type_delete_attr_function *type_delete_attr_fn,
                                          int *type_keyval, void *extra_state);
  int MPI_Type_create_indexed_block(int count, int blocklength,
                                                 const int array_of_displacements[],
                                                 MPI_Datatype oldtype,
                                                 MPI_Datatype *newtype);
  int MPI_Type_create_struct(int count, const int array_of_block_lengths[],
                                          const MPI_Aint array_of_displacements[],
                                          const MPI_Datatype array_of_types[],
                                          MPI_Datatype *newtype);
  int MPI_Type_create_subarray(int ndims, const int size_array[], const int subsize_array[],
                                            const int start_array[], int order,
                                            MPI_Datatype oldtype, MPI_Datatype *newtype);
  int MPI_Type_create_resized(MPI_Datatype oldtype, MPI_Aint lb,
                                           MPI_Aint extent, MPI_Datatype *newtype);
  int MPI_Type_delete_attr(MPI_Datatype type, int type_keyval);
  int MPI_Type_dup(MPI_Datatype type, MPI_Datatype *newtype);
  int MPI_Type_free(MPI_Datatype *type);
  int MPI_Type_free_keyval(int *type_keyval);
  MPI_Datatype MPI_Type_f2c(MPI_Fint datatype);
  int MPI_Type_get_attr(MPI_Datatype type, int type_keyval,
                                     void *attribute_val, int *flag);
  int MPI_Type_get_contents(MPI_Datatype mtype, int max_integers,
                                         int max_addresses, int max_datatypes,
                                         int array_of_integers[],
                                         MPI_Aint array_of_addresses[],
                                         MPI_Datatype array_of_datatypes[]);
  int MPI_Type_get_envelope(MPI_Datatype type, int *num_integers,
                                         int *num_addresses, int *num_datatypes,
                                         int *combiner);
  int MPI_Type_get_extent(MPI_Datatype type, MPI_Aint *lb,
                                       MPI_Aint *extent);
  int MPI_Type_get_extent_x(MPI_Datatype type, MPI_Count *lb,
                                         MPI_Count *extent);
  int MPI_Type_get_name(MPI_Datatype type, char *type_name,
                                     int *resultlen);
  int MPI_Type_get_true_extent(MPI_Datatype datatype, MPI_Aint *true_lb,
                                            MPI_Aint *true_extent);
  int MPI_Type_get_true_extent_x(MPI_Datatype datatype, MPI_Count *true_lb,
                                              MPI_Count *true_extent);
  int MPI_Type_indexed(int count, const int array_of_blocklengths[],
                                    const int array_of_displacements[],
                                    MPI_Datatype oldtype, MPI_Datatype *newtype);
  int MPI_Type_match_size(int typeclass, int size, MPI_Datatype *type);
  int MPI_Type_set_attr(MPI_Datatype type, int type_keyval,
                                     void *attr_val);
  int MPI_Type_set_name(MPI_Datatype type, const char *type_name);
  int MPI_Type_size(MPI_Datatype type, int *size);
  int MPI_Type_size_x(MPI_Datatype type, MPI_Count *size);
  int MPI_Type_vector(int count, int blocklength, int stride,
                                   MPI_Datatype oldtype, MPI_Datatype *newtype);
  int MPI_Unpack(const void *inbuf, int insize, int *position,
                              void *outbuf, int outcount, MPI_Datatype datatype,
                              MPI_Comm comm);
  int MPI_Unpublish_name(const char *service_name, MPI_Info info, const char *port_name);
  int MPI_Unpack_external (const char datarep[], const void *inbuf, MPI_Aint insize,
                                        MPI_Aint *position, void *outbuf, int outcount,
                                        MPI_Datatype datatype);
  int MPI_Waitall(int count, MPI_Request array_of_requests[],
                               MPI_Status *array_of_statuses);
  int MPI_Waitany(int count, MPI_Request array_of_requests[],
                               int *index, MPI_Status *status);
  int MPI_Wait(MPI_Request *request, MPI_Status *status);
  int MPI_Waitsome(int incount, MPI_Request array_of_requests[],
                                int *outcount, int array_of_indices[],
                                MPI_Status array_of_statuses[]);
  int MPI_Win_allocate(MPI_Aint size, int disp_unit, MPI_Info info,
                                    MPI_Comm comm, void *baseptr, MPI_Win *win);
  int MPI_Win_allocate_shared(MPI_Aint size, int disp_unit, MPI_Info info,
                                           MPI_Comm comm, void *baseptr, MPI_Win *win);
  int MPI_Win_attach(MPI_Win win, void *base, MPI_Aint size);
  MPI_Fint MPI_Win_c2f(MPI_Win win);
  int MPI_Win_call_errhandler(MPI_Win win, int errorcode);
  int MPI_Win_complete(MPI_Win win);
  int MPI_Win_create(void *base, MPI_Aint size, int disp_unit,
                                  MPI_Info info, MPI_Comm comm, MPI_Win *win);
  int MPI_Win_create_dynamic(MPI_Info info, MPI_Comm comm, MPI_Win *win);
  int MPI_Win_create_errhandler(MPI_Win_errhandler_function *function,
                                             MPI_Errhandler *errhandler);
  int MPI_Win_create_keyval(MPI_Win_copy_attr_function *win_copy_attr_fn,
                                         MPI_Win_delete_attr_function *win_delete_attr_fn,
                                         int *win_keyval, void *extra_state);
  int MPI_Win_delete_attr(MPI_Win win, int win_keyval);
  int MPI_Win_detach(MPI_Win win, const void *base);
  MPI_Win MPI_Win_f2c(MPI_Fint win);
  int MPI_Win_fence(int assert, MPI_Win win);
  int MPI_Win_flush(int rank, MPI_Win win);
  int MPI_Win_flush_all(MPI_Win win);
  int MPI_Win_flush_local(int rank, MPI_Win win);
  int MPI_Win_flush_local_all(MPI_Win win);
  int MPI_Win_free(MPI_Win *win);
  int MPI_Win_free_keyval(int *win_keyval);
  int MPI_Win_get_attr(MPI_Win win, int win_keyval,
                                    void *attribute_val, int *flag);
  int MPI_Win_get_errhandler(MPI_Win win, MPI_Errhandler *errhandler);
  int MPI_Win_get_group(MPI_Win win, MPI_Group *group);
  int MPI_Win_get_info(MPI_Win win, MPI_Info *info_used);
  int MPI_Win_get_name(MPI_Win win, char *win_name, int *resultlen);
  int MPI_Win_lock(int lock_type, int rank, int assert, MPI_Win win);
  int MPI_Win_lock_all(int assert, MPI_Win win);
  int MPI_Win_post(MPI_Group group, int assert, MPI_Win win);
  int MPI_Win_set_attr(MPI_Win win, int win_keyval, void *attribute_val);
  int MPI_Win_set_errhandler(MPI_Win win, MPI_Errhandler errhandler);
  int MPI_Win_set_info(MPI_Win win, MPI_Info info);
  int MPI_Win_set_name(MPI_Win win, const char *win_name);
  int MPI_Win_shared_query(MPI_Win win, int rank, MPI_Aint *size, int *disp_unit, void *baseptr);
  int MPI_Win_start(MPI_Group group, int assert, MPI_Win win);
  int MPI_Win_sync(MPI_Win win);
  int MPI_Win_test(MPI_Win win, int *flag);
  int MPI_Win_unlock(int rank, MPI_Win win);
  int MPI_Win_unlock_all(MPI_Win win);
  int MPI_Win_wait(MPI_Win win);
  double MPI_Wtick(void);
  double MPI_Wtime(void);

  /*
   * Profiling MPI API
   */
  int PMPI_Abort(MPI_Comm comm, int errorcode);
  int PMPI_Accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                   int target_rank, MPI_Aint target_disp, int target_count,
                                   MPI_Datatype target_datatype, MPI_Op op, MPI_Win win);
  int PMPI_Add_error_class(int *errorclass);
  int PMPI_Add_error_code(int errorclass, int *errorcode);
  int PMPI_Add_error_string(int errorcode, const char *string);
  int PMPI_Allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                  void *recvbuf, int recvcount,
                                  MPI_Datatype recvtype, MPI_Comm comm);
  int PMPI_Iallgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                  void *recvbuf, int recvcount,
                                  MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int PMPI_Allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                   void *recvbuf, const int recvcounts[],
                                   const int displs[], MPI_Datatype recvtype, MPI_Comm comm);
  int PMPI_Iallgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                   void *recvbuf, const int recvcounts[],
                                   const int displs[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int PMPI_Alloc_mem(MPI_Aint size, MPI_Info info,
                                  void *baseptr);
  int PMPI_Allreduce(const void *sendbuf, void *recvbuf, int count,
                                  MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int PMPI_Iallreduce(const void *sendbuf, void *recvbuf, int count,
                                  MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int PMPI_Alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                 void *recvbuf, int recvcount,
                                 MPI_Datatype recvtype, MPI_Comm comm);
  int PMPI_Ialltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                 void *recvbuf, int recvcount,
                                 MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int PMPI_Alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[],
                                  MPI_Datatype sendtype, void *recvbuf, const int recvcounts[],
                                  const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm);
  int PMPI_Ialltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[],
                                  MPI_Datatype sendtype, void *recvbuf, const int recvcounts[],
                                  const int rdispls[], MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int PMPI_Alltoallw(const void *sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[],
                                  void *recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[],
                                  MPI_Comm comm);
  int PMPI_Ialltoallw(const void *sendbuf, const int sendcounts[], const int sdispls[], const MPI_Datatype sendtypes[],
                                  void *recvbuf, const int recvcounts[], const int rdispls[], const MPI_Datatype recvtypes[],
                                  MPI_Comm comm, MPI_Request *request);
  int PMPI_Dist_graph_create(MPI_Comm comm_old, int n, const int nodes[],
                                          const int degrees[], const int targets[],
                                          const int weights[], MPI_Info info,
                                          int reorder, MPI_Comm * newcomm);
  int PMPI_Dist_graph_create_adjacent(MPI_Comm comm_old,
                                                   int indegree, const int sources[],
                                                   const int sourceweights[],
                                                   int outdegree,
                                                   const int destinations[],
                                                   const int destweights[],
                                                   MPI_Info info, int reorder,
                                                   MPI_Comm *comm_dist_graph);
 int PMPI_Dist_graph_neighbors(MPI_Comm comm, int maxindegree,
                                            int sources[], int sourceweights[],
                                            int maxoutdegree,
                                             int destinations[],
                                            int destweights[]);
  int PMPI_Dist_graph_neighbors_count(MPI_Comm comm,
                                                   int *inneighbors,
                                                   int *outneighbors,
                                                   int *weighted);
  int PMPI_Barrier(MPI_Comm comm);
  int PMPI_Ibarrier(MPI_Comm comm, MPI_Request *request);
  int PMPI_Bcast(void *buffer, int count, MPI_Datatype datatype,
                              int root, MPI_Comm comm);
  int PMPI_Ibcast(void *buffer, int count, MPI_Datatype datatype,
				                              int root, MPI_Comm comm,
											  MPI_Request *request);
  int PMPI_Bsend(const void *buf, int count, MPI_Datatype datatype,
                              int dest, int tag, MPI_Comm comm);
  int PMPI_Bsend_init(const void *buf, int count, MPI_Datatype datatype,
                                   int dest, int tag, MPI_Comm comm, MPI_Request *request);
  int PMPI_Buffer_attach(void *buffer, int size);
  int PMPI_Buffer_detach(void *buffer, int *size);
  int PMPI_Cancel(MPI_Request *request);
  int PMPI_Cart_coords(MPI_Comm comm, int rank, int maxdims, int coords[]);
  int PMPI_Cart_create(MPI_Comm old_comm, int ndims, const int dims[],
                                    const int periods[], int reorder, MPI_Comm *comm_cart);
  int PMPI_Cart_get(MPI_Comm comm, int maxdims, int dims[],
                                 int periods[], int coords[]);
  int PMPI_Cart_map(MPI_Comm comm, int ndims, const int dims[],
                                 const int periods[], int *newrank);
  int PMPI_Cart_rank(MPI_Comm comm, const int coords[], int *rank);
  int PMPI_Cart_shift(MPI_Comm comm, int direction, int disp,
                                   int *rank_source, int *rank_dest);
  int PMPI_Cart_sub(MPI_Comm comm, const int remain_dims[], MPI_Comm *new_comm);
  int PMPI_Cartdim_get(MPI_Comm comm, int *ndims);
  int PMPI_Close_port(const char *port_name);
  int PMPI_Comm_accept(const char *port_name, MPI_Info info, int root,
                                    MPI_Comm comm, MPI_Comm *newcomm);
  MPI_Fint PMPI_Comm_c2f(MPI_Comm comm);
  int PMPI_Comm_call_errhandler(MPI_Comm comm, int errorcode);
  int PMPI_Comm_compare(MPI_Comm comm1, MPI_Comm comm2, int *result);
  int PMPI_Comm_connect(const char *port_name, MPI_Info info, int root,
                                     MPI_Comm comm, MPI_Comm *newcomm);
  int PMPI_Comm_create_errhandler(MPI_Comm_errhandler_function *function,
                                               MPI_Errhandler *errhandler);
  int PMPI_Comm_create_keyval(MPI_Comm_copy_attr_function *comm_copy_attr_fn,
                                           MPI_Comm_delete_attr_function *comm_delete_attr_fn,
                                           int *comm_keyval, void *extra_state);
  int PMPI_Comm_create_group(MPI_Comm comm, MPI_Group group, int tag, MPI_Comm *newcomm);
  int PMPI_Comm_create(MPI_Comm comm, MPI_Group group, MPI_Comm *newcomm);
  int PMPI_Comm_delete_attr(MPI_Comm comm, int comm_keyval);
  int PMPI_Comm_disconnect(MPI_Comm *comm);
  int PMPI_Comm_dup(MPI_Comm comm, MPI_Comm *newcomm);
  int PMPI_Comm_idup(MPI_Comm comm, MPI_Comm *newcomm, MPI_Request *request);
  int PMPI_Comm_dup_with_info(MPI_Comm comm, MPI_Info info, MPI_Comm *newcomm);
  MPI_Comm PMPI_Comm_f2c(MPI_Fint comm);
  int PMPI_Comm_free_keyval(int *comm_keyval);
  int PMPI_Comm_free(MPI_Comm *comm);
  int PMPI_Comm_get_attr(MPI_Comm comm, int comm_keyval,
                                      void *attribute_val, int *flag);
  int PMPI_Comm_get_errhandler(MPI_Comm comm, MPI_Errhandler *erhandler);
  int PMPI_Comm_get_info(MPI_Comm comm, MPI_Info *info_used);
  int PMPI_Comm_get_name(MPI_Comm comm, char *comm_name, int *resultlen);
  int PMPI_Comm_get_parent(MPI_Comm *parent);
  int PMPI_Comm_group(MPI_Comm comm, MPI_Group *group);
  int PMPI_Comm_join(int fd, MPI_Comm *intercomm);
  int PMPI_Comm_rank(MPI_Comm comm, int *rank);
  int PMPI_Comm_remote_group(MPI_Comm comm, MPI_Group *group);
  int PMPI_Comm_remote_size(MPI_Comm comm, int *size);
  int PMPI_Comm_set_attr(MPI_Comm comm, int comm_keyval, void *attribute_val);
  int PMPI_Comm_set_errhandler(MPI_Comm comm, MPI_Errhandler errhandler);
  int PMPI_Comm_set_info(MPI_Comm comm, MPI_Info info);
  int PMPI_Comm_set_name(MPI_Comm comm, const char *comm_name);
  int PMPI_Comm_size(MPI_Comm comm, int *size);
  int PMPI_Comm_spawn(const char *command, char *argv[], int maxprocs, MPI_Info info,
                                   int root, MPI_Comm comm, MPI_Comm *intercomm,
                                   int array_of_errcodes[]);
  int PMPI_Comm_spawn_multiple(int count, char *array_of_commands[], char **array_of_argv[],
                                            const int array_of_maxprocs[], const MPI_Info array_of_info[],
                                            int root, MPI_Comm comm, MPI_Comm *intercomm,
                                            int array_of_errcodes[]);
  int PMPI_Comm_split(MPI_Comm comm, int color, int key, MPI_Comm *newcomm);
  int PMPI_Comm_split_type(MPI_Comm comm, int split_type, int key, MPI_Info info, MPI_Comm *newcomm);
  int PMPI_Comm_test_inter(MPI_Comm comm, int *flag);
  int PMPI_Compare_and_swap(const void *origin_addr, const void *compare_addr,
                                         void *result_addr, MPI_Datatype datatype, int target_rank,
                                         MPI_Aint target_disp, MPI_Win win);
  int PMPI_Dims_create(int nnodes, int ndims, int dims[]);
  MPI_Fint PMPI_Errhandler_c2f(MPI_Errhandler errhandler);
  MPI_Errhandler PMPI_Errhandler_f2c(MPI_Fint errhandler);
  int PMPI_Errhandler_free(MPI_Errhandler *errhandler);
  int PMPI_Error_class(int errorcode, int *errorclass);
  int PMPI_Error_string(int errorcode, char *string, int *resultlen);
  int PMPI_Exscan(const void *sendbuf, void *recvbuf, int count,
                               MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int PMPI_Fetch_and_op(const void *origin_addr, void *result_addr, MPI_Datatype datatype,
                                     int target_rank, MPI_Aint target_disp, MPI_Op op, MPI_Win win);
  int PMPI_Iexscan(const void *sendbuf, void *recvbuf, int count,
                               MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  MPI_Fint PMPI_File_c2f(MPI_File file);
  MPI_File PMPI_File_f2c(MPI_Fint file);
  int PMPI_File_call_errhandler(MPI_File fh, int errorcode);
  int PMPI_File_create_errhandler(MPI_File_errhandler_function *function,
                                               MPI_Errhandler *errhandler);
  int PMPI_File_set_errhandler( MPI_File file, MPI_Errhandler errhandler);
  int PMPI_File_get_errhandler( MPI_File file, MPI_Errhandler *errhandler);
  int PMPI_File_open(MPI_Comm comm, const char *filename, int amode,
                                  MPI_Info info, MPI_File *fh);
  int PMPI_File_close(MPI_File *fh);
  int PMPI_File_delete(const char *filename, MPI_Info info);
  int PMPI_File_set_size(MPI_File fh, MPI_Offset size);
  int PMPI_File_preallocate(MPI_File fh, MPI_Offset size);
  int PMPI_File_get_size(MPI_File fh, MPI_Offset *size);
  int PMPI_File_get_group(MPI_File fh, MPI_Group *group);
  int PMPI_File_get_amode(MPI_File fh, int *amode);
  int PMPI_File_set_info(MPI_File fh, MPI_Info info);
  int PMPI_File_get_info(MPI_File fh, MPI_Info *info_used);
  int PMPI_File_set_view(MPI_File fh, MPI_Offset disp, MPI_Datatype etype,
                                      MPI_Datatype filetype, const char *datarep, MPI_Info info);
  int PMPI_File_get_view(MPI_File fh, MPI_Offset *disp,
                                      MPI_Datatype *etype,
                                      MPI_Datatype *filetype, char *datarep);
  int PMPI_File_read_at(MPI_File fh, MPI_Offset offset, void *buf,
                                     int count, MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_read_at_all(MPI_File fh, MPI_Offset offset, void *buf,
                                         int count, MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_write_at(MPI_File fh, MPI_Offset offset, const void *buf,
                                      int count, MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_write_at_all(MPI_File fh, MPI_Offset offset, const void *buf,
                                          int count, MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_iread_at(MPI_File fh, MPI_Offset offset, void *buf,
                                      int count, MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_iwrite_at(MPI_File fh, MPI_Offset offset, const void *buf,
                                       int count, MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_iread_at_all(MPI_File fh, MPI_Offset offset, void *buf,
                                          int count, MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_iwrite_at_all(MPI_File fh, MPI_Offset offset, const void *buf,
                                           int count, MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_read(MPI_File fh, void *buf, int count,
                                  MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_read_all(MPI_File fh, void *buf, int count,
                                      MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_write(MPI_File fh, const void *buf, int count,
                                   MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_write_all(MPI_File fh, const void *buf, int count,
                                       MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_iread(MPI_File fh, void *buf, int count,
                                   MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_iwrite(MPI_File fh, const void *buf, int count,
                                    MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_iread_all(MPI_File fh, void *buf, int count,
                                       MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_iwrite_all(MPI_File fh, const void *buf, int count,
                                        MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_seek(MPI_File fh, MPI_Offset offset, int whence);
  int PMPI_File_get_position(MPI_File fh, MPI_Offset *offset);
  int PMPI_File_get_byte_offset(MPI_File fh, MPI_Offset offset,
                                             MPI_Offset *disp);
  int PMPI_File_read_shared(MPI_File fh, void *buf, int count,
                                         MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_write_shared(MPI_File fh, const void *buf, int count,
                                          MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_iread_shared(MPI_File fh, void *buf, int count,
                                          MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_iwrite_shared(MPI_File fh, const void *buf, int count,
                                           MPI_Datatype datatype, MPI_Request *request);
  int PMPI_File_read_ordered(MPI_File fh, void *buf, int count,
                                          MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_write_ordered(MPI_File fh, const void *buf, int count,
                                           MPI_Datatype datatype, MPI_Status *status);
  int PMPI_File_seek_shared(MPI_File fh, MPI_Offset offset, int whence);
  int PMPI_File_get_position_shared(MPI_File fh, MPI_Offset *offset);
  int PMPI_File_read_at_all_begin(MPI_File fh, MPI_Offset offset, void *buf,
                                               int count, MPI_Datatype datatype);
  int PMPI_File_read_at_all_end(MPI_File fh, void *buf, MPI_Status *status);
  int PMPI_File_write_at_all_begin(MPI_File fh, MPI_Offset offset, const void *buf,
                                                int count, MPI_Datatype datatype);
  int PMPI_File_write_at_all_end(MPI_File fh, const void *buf, MPI_Status *status);
  int PMPI_File_read_all_begin(MPI_File fh, void *buf, int count,
                                            MPI_Datatype datatype);
  int PMPI_File_read_all_end(MPI_File fh, void *buf, MPI_Status *status);
  int PMPI_File_write_all_begin(MPI_File fh, const void *buf, int count,
                                             MPI_Datatype datatype);
  int PMPI_File_write_all_end(MPI_File fh, const void *buf, MPI_Status *status);
  int PMPI_File_read_ordered_begin(MPI_File fh, void *buf, int count,
                                                MPI_Datatype datatype);
  int PMPI_File_read_ordered_end(MPI_File fh, void *buf, MPI_Status *status);
  int PMPI_File_write_ordered_begin(MPI_File fh, const void *buf, int count,
                                                 MPI_Datatype datatype);
  int PMPI_File_write_ordered_end(MPI_File fh, const void *buf, MPI_Status *status);
  int PMPI_File_get_type_extent(MPI_File fh, MPI_Datatype datatype,
                                             MPI_Aint *extent);
  int PMPI_File_set_atomicity(MPI_File fh, int flag);
  int PMPI_File_get_atomicity(MPI_File fh, int *flag);
  int PMPI_File_sync(MPI_File fh);
  int PMPI_Finalize(void);
  int PMPI_Finalized(int *flag);
  int PMPI_Free_mem(void *base);
  int PMPI_Gather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                               void *recvbuf, int recvcount, MPI_Datatype recvtype,
                               int root, MPI_Comm comm);
  int PMPI_Igather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                               void *recvbuf, int recvcount, MPI_Datatype recvtype,
                               int root, MPI_Comm comm, MPI_Request *request);
  int PMPI_Gatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                void *recvbuf, const int recvcounts[], const int displs[],
                                MPI_Datatype recvtype, int root, MPI_Comm comm);
  int PMPI_Igatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                void *recvbuf, const int recvcounts[], const int displs[],
                                MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request);
  int PMPI_Get_address(const void *location, MPI_Aint *address);
  int PMPI_Get_count(const MPI_Status *status, MPI_Datatype datatype, int *count);
  int PMPI_Get_elements(const MPI_Status *status, MPI_Datatype datatype,
                                     int *count);
  int PMPI_Get_elements_x(const MPI_Status *status, MPI_Datatype datatype,
                                       MPI_Count *count);
  int PMPI_Get(void *origin_addr, int origin_count,
                            MPI_Datatype origin_datatype, int target_rank,
                            MPI_Aint target_disp, int target_count,
                            MPI_Datatype target_datatype, MPI_Win win);
  int PMPI_Get_accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                       void *result_addr, int result_count, MPI_Datatype result_datatype,
                                       int target_rank, MPI_Aint target_disp, int target_count,
                                       MPI_Datatype target_datatype, MPI_Op op, MPI_Win win);
  int PMPI_Get_library_version(char *version, int *resultlen);
  int PMPI_Get_processor_name(char *name, int *resultlen);
  int PMPI_Get_version(int *version, int *subversion);
  int PMPI_Graph_create(MPI_Comm comm_old, int nnodes, const int index[],
                                     const int edges[], int reorder, MPI_Comm *comm_graph);
  int PMPI_Graph_get(MPI_Comm comm, int maxindex, int maxedges,
                                  int index[], int edges[]);
  int PMPI_Graph_map(MPI_Comm comm, int nnodes, const int index[], const int edges[],
                                  int *newrank);
  int PMPI_Graph_neighbors_count(MPI_Comm comm, int rank, int *nneighbors);
  int PMPI_Graph_neighbors(MPI_Comm comm, int rank, int maxneighbors,
                                        int neighbors[]);
  int PMPI_Graphdims_get(MPI_Comm comm, int *nnodes, int *nedges);
  int PMPI_Grequest_complete(MPI_Request request);
  int PMPI_Grequest_start(MPI_Grequest_query_function *query_fn,
                                       MPI_Grequest_free_function *free_fn,
                                       MPI_Grequest_cancel_function *cancel_fn,
                                       void *extra_state, MPI_Request *request);
  MPI_Fint PMPI_Group_c2f(MPI_Group group);
  int PMPI_Group_compare(MPI_Group group1, MPI_Group group2, int *result);
  int PMPI_Group_difference(MPI_Group group1, MPI_Group group2,
                                         MPI_Group *newgroup);
  int PMPI_Group_excl(MPI_Group group, int n, const int ranks[],
                                   MPI_Group *newgroup);
  MPI_Group PMPI_Group_f2c(MPI_Fint group);
  int PMPI_Group_free(MPI_Group *group);
  int PMPI_Group_incl(MPI_Group group, int n, const int ranks[],
                                   MPI_Group *newgroup);
  int PMPI_Group_intersection(MPI_Group group1, MPI_Group group2,
                                           MPI_Group *newgroup);
  int PMPI_Group_range_excl(MPI_Group group, int n, int ranges[][3],
                                         MPI_Group *newgroup);
  int PMPI_Group_range_incl(MPI_Group group, int n, int ranges[][3],
                                         MPI_Group *newgroup);
  int PMPI_Group_rank(MPI_Group group, int *rank);
  int PMPI_Group_size(MPI_Group group, int *size);
  int PMPI_Group_translate_ranks(MPI_Group group1, int n, const int ranks1[],
                                              MPI_Group group2, int ranks2[]);
  int PMPI_Group_union(MPI_Group group1, MPI_Group group2,
                                    MPI_Group *newgroup);
  int PMPI_Ibsend(const void *buf, int count, MPI_Datatype datatype, int dest,
                               int tag, MPI_Comm comm, MPI_Request *request);
  int PMPI_Improbe(int source, int tag, MPI_Comm comm,
                                int *flag, MPI_Message *message,
                                MPI_Status *status);
  int PMPI_Imrecv(void *buf, int count, MPI_Datatype type,
                               MPI_Message *message, MPI_Request *request);
  MPI_Fint PMPI_Info_c2f(MPI_Info info);
  int PMPI_Info_create(MPI_Info *info);
  int PMPI_Info_delete(MPI_Info info, const char *key);
  int PMPI_Info_dup(MPI_Info info, MPI_Info *newinfo);
  MPI_Info PMPI_Info_f2c(MPI_Fint info);
  int PMPI_Info_free(MPI_Info *info);
  int PMPI_Info_get(MPI_Info info, const char *key, int valuelen,
                                 char *value, int *flag);
  int PMPI_Info_get_nkeys(MPI_Info info, int *nkeys);
  int PMPI_Info_get_nthkey(MPI_Info info, int n, char *key);
  int PMPI_Info_get_valuelen(MPI_Info info, const char *key, int *valuelen,
                                          int *flag);
  int PMPI_Info_set(MPI_Info info, const char *key, const char *value);
  int PMPI_Init(int *argc, char ***argv);
  int PMPI_Initialized(int *flag);
  int PMPI_Init_thread(int *argc, char ***argv, int required,
                                    int *provided);
  int PMPI_Intercomm_create(MPI_Comm local_comm, int local_leader,
                                         MPI_Comm bridge_comm, int remote_leader,
                                         int tag, MPI_Comm *newintercomm);
  int PMPI_Intercomm_merge(MPI_Comm intercomm, int high,
                                        MPI_Comm *newintercomm);
  int PMPI_Iprobe(int source, int tag, MPI_Comm comm, int *flag,
                               MPI_Status *status);
  int PMPI_Irecv(void *buf, int count, MPI_Datatype datatype, int source,
                              int tag, MPI_Comm comm, MPI_Request *request);
  int PMPI_Irsend(const void *buf, int count, MPI_Datatype datatype, int dest,
                               int tag, MPI_Comm comm, MPI_Request *request);
  int PMPI_Isend(const void *buf, int count, MPI_Datatype datatype, int dest,
                              int tag, MPI_Comm comm, MPI_Request *request);
  int PMPI_Issend(const void *buf, int count, MPI_Datatype datatype, int dest,
                               int tag, MPI_Comm comm, MPI_Request *request);
  int PMPI_Is_thread_main(int *flag);
  int PMPI_Lookup_name(const char *service_name, MPI_Info info, char *port_name);
  MPI_Fint PMPI_Message_c2f(MPI_Message message);
  MPI_Message PMPI_Message_f2c(MPI_Fint message);
  int PMPI_Mprobe(int source, int tag, MPI_Comm comm,
                               MPI_Message *message,
                               MPI_Status *status);
  int PMPI_Mrecv(void *buf, int count, MPI_Datatype type,
                              MPI_Message *message, MPI_Status *status);
  int PMPI_Neighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                           void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                           MPI_Comm comm);
  int PMPI_Ineighbor_allgather(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                            void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                            MPI_Comm comm, MPI_Request *request);
  int PMPI_Neighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                            void *recvbuf, const int recvcounts[], const int displs[],
                                            MPI_Datatype recvtype, MPI_Comm comm);
  int PMPI_Ineighbor_allgatherv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                             void *recvbuf, const int recvcounts[], const int displs[],
                                             MPI_Datatype recvtype, MPI_Comm comm, MPI_Request *request);
  int PMPI_Neighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                          void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                          MPI_Comm comm);
  int PMPI_Ineighbor_alltoall(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                           void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                           MPI_Comm comm, MPI_Request *request);
  int PMPI_Neighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[],  MPI_Datatype sendtype,
                                           void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype,
                                           MPI_Comm comm);
  int PMPI_Ineighbor_alltoallv(const void *sendbuf, const int sendcounts[], const int sdispls[], MPI_Datatype sendtype,
                                            void *recvbuf, const int recvcounts[], const int rdispls[], MPI_Datatype recvtype,
                                            MPI_Comm comm, MPI_Request *request);
  int PMPI_Neighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[],
                                           void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[],
                                           MPI_Comm comm);
  int PMPI_Ineighbor_alltoallw(const void *sendbuf, const int sendcounts[], const MPI_Aint sdispls[], const MPI_Datatype sendtypes[],
                                            void *recvbuf, const int recvcounts[], const MPI_Aint rdispls[], const MPI_Datatype recvtypes[],
                                            MPI_Comm comm, MPI_Request *request);
  MPI_Fint PMPI_Op_c2f(MPI_Op op);
  int PMPI_Op_commutative(MPI_Op op, int *commute);
  int PMPI_Op_create(MPI_User_function *function, int commute, MPI_Op *op);
  int PMPI_Open_port(MPI_Info info, char *port_name);
  MPI_Op PMPI_Op_f2c(MPI_Fint op);
  int PMPI_Op_free(MPI_Op *op);
  int PMPI_Pack_external(const char datarep[], const void *inbuf, int incount,
                                      MPI_Datatype datatype, void *outbuf,
                                      MPI_Aint outsize, MPI_Aint *position);
  int PMPI_Pack_external_size(const char datarep[], int incount,
                                           MPI_Datatype datatype, MPI_Aint *size);
  int PMPI_Pack(const void *inbuf, int incount, MPI_Datatype datatype,
                             void *outbuf, int outsize, int *position, MPI_Comm comm);
  int PMPI_Pack_size(int incount, MPI_Datatype datatype, MPI_Comm comm,
                                  int *size);
  int PMPI_Pcontrol(const int level, ...);
  int PMPI_Probe(int source, int tag, MPI_Comm comm, MPI_Status *status);
  int PMPI_Publish_name(const char *service_name, MPI_Info info,
                                     const char *port_name);
  int PMPI_Put(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                            int target_rank, MPI_Aint target_disp, int target_count,
                            MPI_Datatype target_datatype, MPI_Win win);
  int PMPI_Query_thread(int *provided);
  int PMPI_Raccumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                    int target_rank, MPI_Aint target_disp, int target_count,
                                    MPI_Datatype target_datatype, MPI_Op op, MPI_Win win, MPI_Request *request);
  int PMPI_Recv_init(void *buf, int count, MPI_Datatype datatype, int source,
                                  int tag, MPI_Comm comm, MPI_Request *request);
  int PMPI_Recv(void *buf, int count, MPI_Datatype datatype, int source,
                             int tag, MPI_Comm comm, MPI_Status *status);
  int PMPI_Reduce(const void *sendbuf, void *recvbuf, int count,
                               MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm);
  int PMPI_Ireduce(const void *sendbuf, void *recvbuf, int count,
                               MPI_Datatype datatype, MPI_Op op, int root, MPI_Comm comm, MPI_Request *request);
  int PMPI_Reduce_local(const void *inbuf, void *inoutbuf, int count,
                                     MPI_Datatype datatype, MPI_Op);
  int PMPI_Reduce_scatter(const void *sendbuf, void *recvbuf, const int recvcounts[],
                                       MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int PMPI_Ireduce_scatter(const void *sendbuf, void *recvbuf, const int recvcounts[],
                                        MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int PMPI_Reduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount,
                                             MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int PMPI_Ireduce_scatter_block(const void *sendbuf, void *recvbuf, int recvcount,
                                              MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int PMPI_Register_datarep(const char *datarep,
                                         MPI_Datarep_conversion_function *read_conversion_fn,
                                         MPI_Datarep_conversion_function *write_conversion_fn,
                                         MPI_Datarep_extent_function *dtype_file_extent_fn,
                                         void *extra_state);
  MPI_Fint PMPI_Request_c2f(MPI_Request request);
  MPI_Request PMPI_Request_f2c(MPI_Fint request);
  int PMPI_Request_free(MPI_Request *request);
  int PMPI_Request_get_status(MPI_Request request, int *flag,
                                           MPI_Status *status);
  int PMPI_Rget(void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                             int target_rank, MPI_Aint target_disp, int target_count, MPI_Datatype target_datatype,
                             MPI_Win win, MPI_Request *request);
  int PMPI_Rget_accumulate(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                                        void *result_addr, int result_count, MPI_Datatype result_datatype,
                                        int target_rank, MPI_Aint target_disp, int target_count,
                                        MPI_Datatype target_datatype, MPI_Op op,
                                        MPI_Win win, MPI_Request *request);
  int PMPI_Rput(const void *origin_addr, int origin_count, MPI_Datatype origin_datatype,
                             int target_rank, MPI_Aint target_disp, int target_cout,
                             MPI_Datatype target_datatype, MPI_Win win, MPI_Request *request);
  int PMPI_Rsend(const void *ibuf, int count, MPI_Datatype datatype, int dest,
                              int tag, MPI_Comm comm);
  int PMPI_Rsend_init(const void *buf, int count, MPI_Datatype datatype,
                                   int dest, int tag, MPI_Comm comm,
                                   MPI_Request *request);
  int PMPI_Scan(const void *sendbuf, void *recvbuf, int count,
                             MPI_Datatype datatype, MPI_Op op, MPI_Comm comm);
  int PMPI_Iscan(const void *sendbuf, void *recvbuf, int count,
                             MPI_Datatype datatype, MPI_Op op, MPI_Comm comm, MPI_Request *request);
  int PMPI_Scatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                int root, MPI_Comm comm);
  int PMPI_Iscatter(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                void *recvbuf, int recvcount, MPI_Datatype recvtype,
                                int root, MPI_Comm comm, MPI_Request *request);
  int PMPI_Scatterv(const void *sendbuf, const int sendcounts[], const int displs[],
                                 MPI_Datatype sendtype, void *recvbuf, int recvcount,
                                 MPI_Datatype recvtype, int root, MPI_Comm comm);
  int PMPI_Iscatterv(const void *sendbuf, const int sendcounts[], const int displs[],
                                 MPI_Datatype sendtype, void *recvbuf, int recvcount,
                                 MPI_Datatype recvtype, int root, MPI_Comm comm, MPI_Request *request);
  int PMPI_Send_init(const void *buf, int count, MPI_Datatype datatype,
                                  int dest, int tag, MPI_Comm comm,
                                  MPI_Request *request);
  int PMPI_Send(const void *buf, int count, MPI_Datatype datatype, int dest,
                             int tag, MPI_Comm comm);
  int PMPI_Sendrecv(const void *sendbuf, int sendcount, MPI_Datatype sendtype,
                                 int dest, int sendtag, void *recvbuf, int recvcount,
                                 MPI_Datatype recvtype, int source, int recvtag,
                                 MPI_Comm comm,  MPI_Status *status);
  int PMPI_Sendrecv_replace(void * buf, int count, MPI_Datatype datatype,
                                         int dest, int sendtag, int source, int recvtag,
                                         MPI_Comm comm, MPI_Status *status);
  int PMPI_Ssend_init(const void *buf, int count, MPI_Datatype datatype,
                                   int dest, int tag, MPI_Comm comm,
                                   MPI_Request *request);
  int PMPI_Ssend(const void *buf, int count, MPI_Datatype datatype, int dest,
                              int tag, MPI_Comm comm);
  int PMPI_Start(MPI_Request *request);
  int PMPI_Startall(int count, MPI_Request array_of_requests[]);
  int PMPI_Status_c2f(const MPI_Status *c_status, MPI_Fint *f_status);
  int PMPI_Status_f2c(const MPI_Fint *f_status, MPI_Status *c_status);
  int PMPI_Status_set_cancelled(MPI_Status *status, int flag);
  int PMPI_Status_set_elements(MPI_Status *status, MPI_Datatype datatype,
                                            int count);
  int PMPI_Status_set_elements_x(MPI_Status *status, MPI_Datatype datatype,
                                              MPI_Count count);
  int PMPI_Testall(int count, MPI_Request array_of_requests[], int *flag,
                                MPI_Status array_of_statuses[]);
  int PMPI_Testany(int count, MPI_Request array_of_requests[], int *index, int *flag, MPI_Status *status);
  int PMPI_Test(MPI_Request *request, int *flag, MPI_Status *status);
  int PMPI_Test_cancelled(const MPI_Status *status, int *flag);
  int PMPI_Testsome(int incount, MPI_Request array_of_requests[],
                                 int *outcount, int array_of_indices[],
                                 MPI_Status array_of_statuses[]);
  int PMPI_Topo_test(MPI_Comm comm, int *status);
  MPI_Fint PMPI_Type_c2f(MPI_Datatype datatype);
  int PMPI_Type_commit(MPI_Datatype *type);
  int PMPI_Type_contiguous(int count, MPI_Datatype oldtype,
                                        MPI_Datatype *newtype);
  int PMPI_Type_create_darray(int size, int rank, int ndims,
                                           const int gsize_array[], const int distrib_array[],
                                           const int darg_array[], const int psize_array[],
                                           int order, MPI_Datatype oldtype,
                                           MPI_Datatype *newtype);
  int PMPI_Type_create_f90_complex(int p, int r, MPI_Datatype *newtype);
  int PMPI_Type_create_f90_integer(int r, MPI_Datatype *newtype);
  int PMPI_Type_create_f90_real(int p, int r, MPI_Datatype *newtype);
  int PMPI_Type_create_hindexed(int count, const int array_of_blocklengths[],
                                             const MPI_Aint array_of_displacements[],
                                             MPI_Datatype oldtype,
                                             MPI_Datatype *newtype);
  int PMPI_Type_create_hvector(int count, int blocklength, MPI_Aint stride,
                                            MPI_Datatype oldtype,
                                            MPI_Datatype *newtype);
  int PMPI_Type_create_keyval(MPI_Type_copy_attr_function *type_copy_attr_fn,
                                           MPI_Type_delete_attr_function *type_delete_attr_fn,
                                           int *type_keyval, void *extra_state);
  int PMPI_Type_create_hindexed_block(int count, int blocklength,
                                                   const MPI_Aint array_of_displacements[],
                                                   MPI_Datatype oldtype,
                                                   MPI_Datatype *newtype);
  int PMPI_Type_create_indexed_block(int count, int blocklength,
                                                  const int array_of_displacements[],
                                                  MPI_Datatype oldtype,
                                                  MPI_Datatype *newtype);
  int PMPI_Type_create_struct(int count, const int array_of_block_lengths[],
                                           const MPI_Aint array_of_displacements[],
                                           const MPI_Datatype array_of_types[],
                                           MPI_Datatype *newtype);
  int PMPI_Type_create_subarray(int ndims, const int size_array[], const int subsize_array[],
                                             const int start_array[], int order,
                                             MPI_Datatype oldtype, MPI_Datatype *newtype);
  int PMPI_Type_create_resized(MPI_Datatype oldtype, MPI_Aint lb,
                                            MPI_Aint extent, MPI_Datatype *newtype);
  int PMPI_Type_delete_attr(MPI_Datatype type, int type_keyval);
  int PMPI_Type_dup(MPI_Datatype type, MPI_Datatype *newtype);
  int PMPI_Type_free(MPI_Datatype *type);
  int PMPI_Type_free_keyval(int *type_keyval);
  MPI_Datatype PMPI_Type_f2c(MPI_Fint datatype);
  int PMPI_Type_get_attr(MPI_Datatype type, int type_keyval,
                                      void *attribute_val, int *flag);
  int PMPI_Type_get_contents(MPI_Datatype mtype, int max_integers,
                                          int max_addresses, int max_datatypes,
                                          int array_of_integers[],
                                          MPI_Aint array_of_addresses[],
                                          MPI_Datatype array_of_datatypes[]);
  int PMPI_Type_get_envelope(MPI_Datatype type, int *num_integers,
                                          int *num_addresses, int *num_datatypes,
                                          int *combiner);
  int PMPI_Type_get_extent(MPI_Datatype type, MPI_Aint *lb,
                                        MPI_Aint *extent);
  int PMPI_Type_get_extent_x(MPI_Datatype type, MPI_Count *lb,
                                          MPI_Count *extent);
  int PMPI_Type_get_name(MPI_Datatype type, char *type_name,
                                      int *resultlen);
  int PMPI_Type_get_true_extent(MPI_Datatype datatype, MPI_Aint *true_lb,
                                             MPI_Aint *true_extent);
  int PMPI_Type_get_true_extent_x(MPI_Datatype datatype, MPI_Count *true_lb,
                                               MPI_Count *true_extent);
  int PMPI_Type_indexed(int count, const int array_of_blocklengths[],
                                     const int array_of_displacements[],
                                     MPI_Datatype oldtype, MPI_Datatype *newtype);
  int PMPI_Type_match_size(int typeclass, int size, MPI_Datatype *type);
  int PMPI_Type_set_attr(MPI_Datatype type, int type_keyval,
                                      void *attr_val);
  int PMPI_Type_set_name(MPI_Datatype type, const char *type_name);
  int PMPI_Type_size(MPI_Datatype type, int *size);
  int PMPI_Type_size_x(MPI_Datatype type, MPI_Count *size);
  int PMPI_Type_vector(int count, int blocklength, int stride,
                                    MPI_Datatype oldtype, MPI_Datatype *newtype);
  int PMPI_Unpack(const void *inbuf, int insize, int *position,
                               void *outbuf, int outcount, MPI_Datatype datatype,
                               MPI_Comm comm);
  int PMPI_Unpublish_name(const char *service_name, MPI_Info info,
                                       const char *port_name);
  int PMPI_Unpack_external (const char datarep[], const void *inbuf, MPI_Aint insize,
                                         MPI_Aint *position, void *outbuf, int outcount,
                                         MPI_Datatype datatype);
  int PMPI_Waitall(int count, MPI_Request array_of_requests[],
                                MPI_Status array_of_statuses[]);
  int PMPI_Waitany(int count, MPI_Request array_of_requests[],
                                int *index, MPI_Status *status);
  int PMPI_Wait(MPI_Request *request, MPI_Status *status);
  int PMPI_Waitsome(int incount, MPI_Request array_of_requests[],
                                 int *outcount, int array_of_indices[],
                                 MPI_Status array_of_statuses[]);
  int PMPI_Win_allocate(MPI_Aint size, int disp_unit, MPI_Info info,
                                     MPI_Comm comm, void *baseptr, MPI_Win *win);
  int PMPI_Win_allocate_shared(MPI_Aint size, int disp_unit, MPI_Info info,
                                            MPI_Comm comm, void *baseptr, MPI_Win *win);
  int PMPI_Win_attach(MPI_Win win, void *base, MPI_Aint size);
  MPI_Fint PMPI_Win_c2f(MPI_Win win);
  int PMPI_Win_call_errhandler(MPI_Win win, int errorcode);
  int PMPI_Win_complete(MPI_Win win);
  int PMPI_Win_create(void *base, MPI_Aint size, int disp_unit,
                                   MPI_Info info, MPI_Comm comm, MPI_Win *win);
  int PMPI_Win_create_dynamic(MPI_Info info, MPI_Comm comm, MPI_Win *win);
  int PMPI_Win_create_errhandler(MPI_Win_errhandler_function *function,
                                              MPI_Errhandler *errhandler);
  int PMPI_Win_create_keyval(MPI_Win_copy_attr_function *win_copy_attr_fn,
                                          MPI_Win_delete_attr_function *win_delete_attr_fn,
                                          int *win_keyval, void *extra_state);
  int PMPI_Win_delete_attr(MPI_Win win, int win_keyval);
  int PMPI_Win_detach(MPI_Win win, const void *base);
  MPI_Win PMPI_Win_f2c(MPI_Fint win);
  int PMPI_Win_fence(int assert, MPI_Win win);
  int PMPI_Win_flush(int rank, MPI_Win win);
  int PMPI_Win_flush_all(MPI_Win win);
  int PMPI_Win_flush_local(int rank, MPI_Win win);
  int PMPI_Win_flush_local_all(MPI_Win win);
  int PMPI_Win_free(MPI_Win *win);
  int PMPI_Win_free_keyval(int *win_keyval);
  int PMPI_Win_get_attr(MPI_Win win, int win_keyval,
                                     void *attribute_val, int *flag);
  int PMPI_Win_get_errhandler(MPI_Win win, MPI_Errhandler *errhandler);
  int PMPI_Win_get_group(MPI_Win win, MPI_Group *group);
  int PMPI_Win_get_info(MPI_Win win, MPI_Info *info_used);
  int PMPI_Win_get_name(MPI_Win win, char *win_name, int *resultlen);
  int PMPI_Win_lock(int lock_type, int rank, int assert, MPI_Win win);
  int PMPI_Win_lock_all(int assert, MPI_Win win);
  int PMPI_Win_post(MPI_Group group, int assert, MPI_Win win);
  int PMPI_Win_set_attr(MPI_Win win, int win_keyval, void *attribute_val);
  int PMPI_Win_set_errhandler(MPI_Win win, MPI_Errhandler errhandler);
  int PMPI_Win_set_info(MPI_Win win, MPI_Info info);
  int PMPI_Win_set_name(MPI_Win win, const char *win_name);
  int PMPI_Win_shared_query(MPI_Win win, int rank, MPI_Aint *size, int *disp_unit, void *baseptr);
  int PMPI_Win_start(MPI_Group group, int assert, MPI_Win win);
  int PMPI_Win_sync(MPI_Win win);
  int PMPI_Win_test(MPI_Win win, int *flag);
  int PMPI_Win_unlock(int rank, MPI_Win win);
  int PMPI_Win_unlock_all(MPI_Win win);
  int PMPI_Win_wait(MPI_Win win);
  double PMPI_Wtick(void);
  double PMPI_Wtime(void);
  int PMPI_T_init_thread (int required, int *provided);
  int PMPI_T_finalize (void);
  int PMPI_T_cvar_get_num (int *num_cvar);
  int PMPI_T_cvar_get_info (int cvar_index, char *name, int *name_len,
                                         int *verbosity, MPI_Datatype *datatype,
                                         MPI_T_enum *enumtype, char *desc,
                                         int *desc_len, int *bind, int *scope);
  int PMPI_T_cvar_get_index (const char *name, int *cvar_index);
  int PMPI_T_cvar_handle_alloc (int cvar_index, void *obj_handle,
                                            MPI_T_cvar_handle *handle, int *count);
  int PMPI_T_cvar_handle_free (MPI_T_cvar_handle *handle);
  int PMPI_T_cvar_read (MPI_T_cvar_handle handle, void *buf);
  int PMPI_T_cvar_write (MPI_T_cvar_handle handle, const void *buf);
  int PMPI_T_category_get_num(int *num_cat);
  int PMPI_T_category_get_info(int cat_index, char *name, int *name_len,
                                            char *desc, int *desc_len, int *num_cvars,
                                            int *num_pvars, int *num_categories);
  int PMPI_T_category_get_index (const char *name, int *category_index);
  int PMPI_T_category_get_cvars(int cat_index, int len, int indices[]);
  int PMPI_T_category_get_pvars(int cat_index, int len, int indices[]);
  int PMPI_T_category_get_categories(int cat_index, int len, int indices[]);
  int PMPI_T_category_changed(int *stamp);

  int PMPI_T_pvar_get_num(int *num_pvar);
  int PMPI_T_pvar_get_info(int pvar_index, char *name, int *name_len,
                                        int *verbosity, int *var_class, MPI_Datatype *datatype,
                                        MPI_T_enum *enumtype, char *desc, int *desc_len, int *bind,
                                        int *readonly, int *continuous, int *atomic);
  int PMPI_T_pvar_get_index (const char *name, int var_class, int *pvar_index);
  int PMPI_T_pvar_session_create(MPI_T_pvar_session *session);
  int PMPI_T_pvar_session_free(MPI_T_pvar_session *session);
  int PMPI_T_pvar_handle_alloc(MPI_T_pvar_session session, int pvar_index,
                                            void *obj_handle, MPI_T_pvar_handle *handle, int *count);
  int PMPI_T_pvar_handle_free(MPI_T_pvar_session session, MPI_T_pvar_handle *handle);
  int PMPI_T_pvar_start(MPI_T_pvar_session session, MPI_T_pvar_handle handle);
  int PMPI_T_pvar_stop(MPI_T_pvar_session session, MPI_T_pvar_handle handle);
  int PMPI_T_pvar_read(MPI_T_pvar_session session, MPI_T_pvar_handle handle,
                                    void *buf);
  int PMPI_T_pvar_write(MPI_T_pvar_session session, MPI_T_pvar_handle handle,
                                     const void *buf);
  int PMPI_T_pvar_reset(MPI_T_pvar_session session, MPI_T_pvar_handle handle);
  int PMPI_T_pvar_readreset(MPI_T_pvar_session session, MPI_T_pvar_handle handle,
                                         void *buf);
  int PMPI_T_enum_get_info(MPI_T_enum enumtype, int *num, char *name, int *name_len);
  int PMPI_T_enum_get_item(MPI_T_enum enumtype, int index, int *value, char *name,
                                        int *name_len);

  /*
   * Tool MPI API
   */
  int MPI_T_init_thread (int required, int *provided);
  int MPI_T_finalize (void);
  int MPI_T_cvar_get_num (int *num_cvar);
  int MPI_T_cvar_get_info (int cvar_index, char *name, int *name_len,
                                        int *verbosity, MPI_Datatype *datatype,
                                        MPI_T_enum *enumtype, char *desc,
                                        int *desc_len, int *bind, int *scope);
  int MPI_T_cvar_get_index (const char *name, int *cvar_index);
  int MPI_T_cvar_handle_alloc (int cvar_index, void *obj_handle,
                                            MPI_T_cvar_handle *handle, int *count);
  int MPI_T_cvar_handle_free (MPI_T_cvar_handle *handle);
  int MPI_T_cvar_read (MPI_T_cvar_handle handle, void *buf);
  int MPI_T_cvar_write (MPI_T_cvar_handle handle, const void *buf);
  int MPI_T_category_get_num(int *num_cat);
  int MPI_T_category_get_info(int cat_index, char *name, int *name_len,
                                           char *desc, int *desc_len, int *num_cvars,
                                           int *num_pvars, int *num_categories);
  int MPI_T_category_get_index (const char *name, int *category_index);
  int MPI_T_category_get_cvars(int cat_index, int len, int indices[]);
  int MPI_T_category_get_pvars(int cat_index, int len, int indices[]);
  int MPI_T_category_get_categories(int cat_index, int len, int indices[]);
  int MPI_T_category_changed(int *stamp);

  int MPI_T_pvar_get_num(int *num_pvar);
  int MPI_T_pvar_get_info(int pvar_index, char *name, int *name_len,
                                       int *verbosity, int *var_class, MPI_Datatype *datatype,
                                       MPI_T_enum *enumtype, char *desc, int *desc_len, int *bind,
                                       int *readonly, int *continuous, int *atomic);
  int MPI_T_pvar_get_index (const char *name, int var_class, int *pvar_index);
  int MPI_T_pvar_session_create(MPI_T_pvar_session *session);
  int MPI_T_pvar_session_free(MPI_T_pvar_session *session);
  int MPI_T_pvar_handle_alloc(MPI_T_pvar_session session, int pvar_index,
                                           void *obj_handle, MPI_T_pvar_handle *handle, int *count);
  int MPI_T_pvar_handle_free(MPI_T_pvar_session session, MPI_T_pvar_handle *handle);
  int MPI_T_pvar_start(MPI_T_pvar_session session, MPI_T_pvar_handle handle);
  int MPI_T_pvar_stop(MPI_T_pvar_session session, MPI_T_pvar_handle handle);
  int MPI_T_pvar_read(MPI_T_pvar_session session, MPI_T_pvar_handle handle,
                                   void *buf);
  int MPI_T_pvar_write(MPI_T_pvar_session session, MPI_T_pvar_handle handle,
                                    const void *buf);
  int MPI_T_pvar_reset(MPI_T_pvar_session session, MPI_T_pvar_handle handle);
  int MPI_T_pvar_readreset(MPI_T_pvar_session session, MPI_T_pvar_handle handle,
                                        void *buf);
  int MPI_T_enum_get_info(MPI_T_enum enumtype, int *num, char *name, int *name_len);
  int MPI_T_enum_get_item(MPI_T_enum enumtype, int index, int *value, char *name,
                                       int *name_len);

/*
 * Even though MPI_Copy_function and MPI_Delete_function are
 * deprecated, we do not use the attributes marking them as such,
 * because otherwise the compiler will warn for all the functions that
 * are declared using them (e.g., MPI_Keyval_create).
 */
typedef int (MPI_Copy_function)(MPI_Comm, int, void *,
                                void *, void *, int *);
/* MPI_Copy_function was deprecated in MPI-2.0; use MPI_Comm_copy_attr_function instead. */
typedef int (MPI_Delete_function)(MPI_Comm, int, void *, void *);
/* MPI_Delete_function was deprecated in MPI-2.0; use MPI_Comm_delete_attr_function instead. */

#if (!OMPI_OMIT_MPI1_COMPAT_DECLS || OMPI_BUILDING)
/*
 * Removed typedefs.  These typedefs are only available if Open MPI
 * was configured with --enable-mpi1-compatibility.
 *
 * These typedefs were formally removed from the MPI specification
 * and should no longer be used in MPI applications.
 *
 * Even though MPI_Handler_function is removed, we do not use the
 * attributes marking it as such, because otherwise the compiler
 * will warn for all the functions that are declared using them
 * (e.g., MPI_Errhandler_create).
 */
typedef void (MPI_Handler_function)(MPI_Comm *, int *, ...);
/* MPI_Handler_function was removed in MPI-3.0; use MPI_Comm_use_errhandler_function instead. */


