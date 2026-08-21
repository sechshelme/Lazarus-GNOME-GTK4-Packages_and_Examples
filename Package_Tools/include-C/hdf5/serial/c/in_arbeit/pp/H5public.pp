
unit H5public;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5public.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5public.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pdword  = ^dword;
PH5_alloc_stats_t  = ^H5_alloc_stats_t;
PH5_ih_info_t  = ^H5_ih_info_t;
PH5_index_t  = ^H5_index_t;
PH5_iter_order_t  = ^H5_iter_order_t;
Phaddr_t  = ^haddr_t;
Phbool_t  = ^hbool_t;
Pherr_t  = ^herr_t;
Phtri_t  = ^htri_t;
Pint64_t  = ^int64_t;
Psize_t  = ^size_t;
Pssize_t  = ^ssize_t;
Puint32_t  = ^uint32_t;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright by The HDF Group.                                               *
 * All rights reserved.                                                      *
 *                                                                           *
 * This file is part of HDF5.  The full HDF5 copyright notice, including     *
 * terms governing use, modification, and redistribution, is contained in    *
 * the COPYING file, which can be found at the root of the source code       *
 * distribution tree, or in https://www.hdfgroup.org/licenses.               *
 * If you do not have access to either file, you may request a copy from     *
 * help@hdfgroup.org.                                                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  }
{
 * This file contains public declarations for the HDF5 module.
  }
{$ifndef H5public_H}
{$define H5public_H}
{ Include files for public use...  }
{
 * Since H5pubconf.h is a generated header file, it is messy to try
 * to put a #ifndef H5pubconf_H ... #endif guard in it.
 * HDF5 has set an internal rule that it is being included here.
 * Source files should NOT include H5pubconf.h directly but include
 * it via H5public.h.  The #ifndef H5public_H guard above would
 * prevent repeated include.
  }
{$include "H5pubconf.h" /* From configure */}
{ API Version macro wrapper definitions  }
{$include "H5version.h"}
{$ifdef H5_HAVE_FEATURES_H}
{$include <features.h> /* For setting POSIX, BSD, etc. compatibility */}
{$endif}
{$ifdef H5_HAVE_SYS_TYPES_H}
{$include <sys/types.h>}
{$endif}
{$ifdef H5_STDC_HEADERS}
{$include <limits.h> /* For H5T_NATIVE_CHAR defn in H5Tpublic.h  */}
{$include <stdarg.h> /* For variadic functions in H5VLpublic.h   */}
{$endif}
{$ifndef __cplusplus}
{$ifdef H5_HAVE_STDINT_H}
{$include <stdint.h> /* For C9x types */}
{$endif}
{$else}
{$ifdef H5_HAVE_STDINT_H_CXX}
{$include <stdint.h> /* For C9x types (when included from C++) */}
{$endif}
{$endif}
{$ifdef H5_HAVE_INTTYPES_H}
{$include <inttypes.h> /* C99/POSIX.1 header for uint64_t, PRIu64 */}
{$endif}
{$ifdef H5_HAVE_STDDEF_H}
{$include <stddef.h>}
{$endif}
{$ifdef H5_HAVE_PARALLEL}
{ Don't link against MPI C++ bindings  }
{$ifndef MPICH_SKIP_MPICXX}

const
  MPICH_SKIP_MPICXX = 1;  
{$endif}
{$ifndef OMPI_SKIP_MPICXX}

const
  OMPI_SKIP_MPICXX = 1;  
{$endif}
{$include <mpi.h>}
{$ifndef MPI_FILE_NULL /* MPIO may be defined in mpi.h already */}
{$include <mpio.h>}
{$endif}
{$endif}
{ Include the Windows API adapter header early  }
{$include "H5api_adpt.h"}
{ C++ extern C conditionnal removed }
{ Macros for enabling/disabling particular GCC / clang warnings
 *
 * These are duplicated in H5FDmulti.c (we don't want to put them in the
 * public header and the multi VFD can't use private headers). If you make
 * changes here, be sure to update those as well.
 *
 * (see the following web-sites for more info:
 *      http://www.dbp-consulting.com/tutorials/SuppressingGCCWarnings.html
 *      http://gcc.gnu.org/onlinedocs/gcc/Diagnostic-Pragmas.html#Diagnostic-Pragmas
  }
{ Version numbers  }
{*
 * For major interface/format changes
  }

const
  H5_VERS_MAJOR = 1;  
{*
 * For minor interface/format changes
  }
  H5_VERS_MINOR = 10;  
{*
 * For tweaks, bug-fixes, or development
  }
  H5_VERS_RELEASE = 10;  
{*
 * For pre-releases like \c snap0. Empty string for official releases.
  }
  H5_VERS_SUBRELEASE = '';  
{*
 * Full version string
  }
  H5_VERS_INFO = 'HDF5 library version: 1.10.10';  
{*
 * \brief Determines whether the version of the library being used is less
 *        than or equal to the specified version
 *
 * \param[in] Maj Major version number - A non-negative integer value
 * \param[in] Min Minor version number - A non-negative integer value
 * \param[in] Rel Release version number - A non-negative integer value
 * \returns A value of 1 is returned if the library version is less than
 *          or equal to the version number specified.\n
 *          A value of 0 is returned if the library version is greater than the
 *          version number specified.\n
 *          A library version is less than the specified version number if
 *          its major version is smaller than the specified major version
 *          number. If the major version numbers are the same, it is smaller
 *          than the specified version number if its minor version is smaller
 *          than the specified minor version number. If the minor version
 *          numbers are the same, then a library version would be smaller than
 *          the specified version number if its release number is smaller than
 *          the specified release number.
 *
 * \details The #H5_VERSION_GE and #H5_VERSION_LE macros are used at compile
 *          time to conditionally include or exclude code based on the version
 *          of the HDF5 library against which an application will be linked.
 *
 *          The #H5_VERSION_LE macro compares the version of the HDF5 library
 *          being used against the version number specified in the parameters.
 *
 *          For more information about release versioning, see \ref_h5lib_relver.
 *
 * \since 1.8.7
 *
  }
{*
 * Status return values.  Failed integer functions in HDF5 result almost
 * always in a negative value (unsigned failing functions sometimes return
 * zero for failure) while successful return is non-negative (often zero).
 * The negative failure value is most commonly -1, but don't bet on it.
 *
 * The proper way to detect failure is something like:
 * \code
 * if((dset = H5Dopen2(file, name)) < 0)
 *    fprintf(stderr, "unable to open the requested dataset\n");
 * \endcode
  }
type
  Pherr_t = ^Therr_t;
  Therr_t = longint;
{*
 * Boolean type.  Successful return values are zero (false) or positive
 * (true). The typical true value is 1 but don't bet on it.  Boolean
 * functions cannot fail.  Functions that return #htri_t however return zero
 * (false), positive (true), or negative (failure). The proper way to test
 * for truth from a #htri_t function is:
 * \code
 * if ((retval = H5Tcommitted(type)) > 0) 
 *     printf("data type is committed\n");
 *  else if (!retval) 
 *     printf("data type is not committed\n");
 *  else 
 *     printf("error determining whether data type is committed\n");
 * 
 * \endcode
  }
{$ifdef H5_HAVE_STDBOOL_H}
{$include <stdbool.h>}
{$else}
{ H5_HAVE_STDBOOL_H  }
{$ifndef __cplusplus}
{$if defined(H5_SIZEOF_BOOL) && (H5_SIZEOF_BOOL != 0)}

const
  bool = _Bool;  
{$else}

const
  bool = dword;  
{$endif}

const
  true = 1;  
  false = 0;  
{$endif}
{ __cplusplus  }
{$endif}
{ H5_HAVE_STDBOOL_H  }
type
  Phbool_t = ^Thbool_t;
  Thbool_t = Tbool;

  Phtri_t = ^Thtri_t;
  Thtri_t = longint;
{ The signed version of size_t
 *
 * ssize_t is POSIX and not defined in any C standard. It's used in some
 * public HDF5 API calls so this work-around will define it if it's not
 * present.
 *
 * Use of ssize_t should be discouraged in new code.
  }
{$if H5_SIZEOF_SSIZE_T == 0}
{ Undefine this size, we will re-define it in one of the sections below  }
{$undef H5_SIZEOF_SSIZE_T}
{$if H5_SIZEOF_SIZE_T == H5_SIZEOF_INT}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = longint;

const
  H5_SIZEOF_SSIZE_T = H5_SIZEOF_INT;  
(*** was #elif ****){$else H5_SIZEOF_SIZE_T == H5_SIZEOF_LONG}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = longint;

const
  H5_SIZEOF_SSIZE_T = H5_SIZEOF_LONG;  
(*** was #elif ****){$else H5_SIZEOF_SIZE_T == H5_SIZEOF_LONG_LONG}
type
  Pssize_t = ^Tssize_t;
  Tssize_t = int64;

const
  H5_SIZEOF_SSIZE_T = H5_SIZEOF_LONG_LONG;  
{$else}
{ Can't find matching type for ssize_t  }
{$error "nothing appropriate for ssize_t"}
{$endif}
{$endif}
{*
 * The size of file objects.
 *
 * \internal Defined as a (minimum) 64-bit integer type.
  }
{$if H5_SIZEOF_INT64_T >= 8}
(*** was #elif ****){$else H5_SIZEOF_INT >= 8}
type
  Pint64_t = ^Tint64_t;
  Tint64_t = longint;
{$undef H5_SIZEOF_INT64_T}

const
  H5_SIZEOF_INT64_T = H5_SIZEOF_INT;  
(*** was #elif ****){$else H5_SIZEOF_LONG >= 8}
type
  Pint64_t = ^Tint64_t;
  Tint64_t = longint;
{$undef H5_SIZEOF_INT64_T}

const
  H5_SIZEOF_INT64_T = H5_SIZEOF_LONG;  
(*** was #elif ****){$else H5_SIZEOF_LONG_LONG >= 8}
type
  Pint64_t = ^Tint64_t;
  Tint64_t = int64;
{$undef H5_SIZEOF_INT64_T}

const
  H5_SIZEOF_INT64_T = H5_SIZEOF_LONG_LONG;  
{$else}
{$error "nothing appropriate for int64_t"}
{$endif}
{ uint64_t type is used for fields for H5O_info_t.  It may be
 * defined in Posix.1g, otherwise it is defined here.
  }
{$if H5_SIZEOF_UINT64_T >= 8}
{$ifndef UINT64_MAX}

{ was #define dname def_expr }
function UINT64_MAX : Tuint64_t;  

{$endif}
(*** was #elif ****){$else H5_SIZEOF_INT >= 8}
type
  Puint64_t = ^Tuint64_t;
  Tuint64_t = dword;

const
  UINT64_MAX = UINT_MAX;  
{$undef H5_SIZEOF_UINT64_T}
  H5_SIZEOF_UINT64_T = H5_SIZEOF_INT;  
(*** was #elif ****){$else H5_SIZEOF_LONG >= 8}
type
  Puint64_t = ^Tuint64_t;
  Tuint64_t = dword;

const
  UINT64_MAX = ULONG_MAX;  
{$undef H5_SIZEOF_UINT64_T}
  H5_SIZEOF_UINT64_T = H5_SIZEOF_LONG;  
(*** was #elif ****){$else H5_SIZEOF_LONG_LONG >= 8}
type
  Puint64_t = ^Tuint64_t;
  Tuint64_t = qword;

const
  UINT64_MAX = ULLONG_MAX;  
{$undef H5_SIZEOF_UINT64_T}
  H5_SIZEOF_UINT64_T = H5_SIZEOF_LONG_LONG;  
{$else}
{$error "nothing appropriate for uint64_t"}
{$endif}
{*
 * The size of file objects. Used when negative values are needed to indicate errors.
 *
 * \internal Defined as a (minimum) 64-bit integer type. Use of hssize_t
 * should be discouraged in new code.
  }
{*
 * The address of an object in the file.
 *
 * \internal Defined as a (minimum) 64-bit unsigned integer type.
  }
{$if H5_SIZEOF_INT >= 8}
type
  Phaddr_t = ^Thaddr_t;
  Thaddr_t = dword;

const
  HADDR_UNDEF = UINT_MAX;  
  H5_SIZEOF_HADDR_T = H5_SIZEOF_INT;  
{$ifdef H5_HAVE_PARALLEL}
  HADDR_AS_MPI_TYPE = MPI_UNSIGNED;  
{$endif}
{ H5_HAVE_PARALLEL  }

const
  PRIdHADDR = 'd';  
  PRIoHADDR = 'o';  
  PRIuHADDR = 'u';  
  PRIxHADDR = 'x';  
  PRIXHADDR = 'X';  
(*** was #elif ****){$else H5_SIZEOF_LONG >= 8}
type
  Phaddr_t = ^Thaddr_t;
  Thaddr_t = dword;

const
  HADDR_UNDEF = ULONG_MAX;  
  H5_SIZEOF_HADDR_T = H5_SIZEOF_LONG;  
{$ifdef H5_HAVE_PARALLEL}
  HADDR_AS_MPI_TYPE = MPI_UNSIGNED_LONG;  
{$endif}
{ H5_HAVE_PARALLEL  }

const
  PRIdHADDR = 'ld';  
  PRIoHADDR = 'lo';  
  PRIuHADDR = 'lu';  
  PRIxHADDR = 'lx';  
  PRIXHADDR = 'lX';  
(*** was #elif ****){$else H5_SIZEOF_LONG_LONG >= 8}
type
  Phaddr_t = ^Thaddr_t;
  Thaddr_t = qword;

const
  HADDR_UNDEF = ULLONG_MAX;  
  H5_SIZEOF_HADDR_T = H5_SIZEOF_LONG_LONG;  
{$ifdef H5_HAVE_PARALLEL}
  HADDR_AS_MPI_TYPE = MPI_LONG_LONG_INT;  
{$endif}
{ H5_HAVE_PARALLEL  }
{$else}
{$error "nothing appropriate for haddr_t"}
{$endif}

const
  HADDR_MAX = HADDR_UNDEF-1;  
{ uint32_t type is used for creation order field for messages.  It may be
 * defined in Posix.1g, otherwise it is defined here.
  }
{$if H5_SIZEOF_UINT32_T >= 4}
(*** was #elif ****){$else H5_SIZEOF_SHORT >= 4}
type
  Puint32_t = ^Tuint32_t;
  Tuint32_t = smallint;
{$undef H5_SIZEOF_UINT32_T}

const
  H5_SIZEOF_UINT32_T = H5_SIZEOF_SHORT;  
(*** was #elif ****){$else H5_SIZEOF_INT >= 4}
type
  Puint32_t = ^Tuint32_t;
  Tuint32_t = dword;
{$undef H5_SIZEOF_UINT32_T}

const
  H5_SIZEOF_UINT32_T = H5_SIZEOF_INT;  
(*** was #elif ****){$else H5_SIZEOF_LONG >= 4}
type
  Puint32_t = ^Tuint32_t;
  Tuint32_t = dword;
{$undef H5_SIZEOF_UINT32_T}

const
  H5_SIZEOF_UINT32_T = H5_SIZEOF_LONG;  
{$else}
{$error "nothing appropriate for uint32_t"}
{$endif}
{! <!-- [H5_iter_order_t_snip] --> }
{*
 * Common iteration orders
  }
{*< Unknown order  }
{*< Increasing order  }
{*< Decreasing order  }
{*< No particular order, whatever is fastest  }
{*< Number of iteration orders  }
type
  PH5_iter_order_t = ^TH5_iter_order_t;
  TH5_iter_order_t =  Longint;
  Const
    H5_ITER_UNKNOWN = -(1);
    H5_ITER_INC = (-(1))+1;
    H5_ITER_DEC = (-(1))+2;
    H5_ITER_NATIVE = (-(1))+3;
    H5_ITER_N = (-(1))+4;
;
{! <!-- [H5_iter_order_t_snip] --> }
{ Iteration callback values  }
{ (Actually, any positive value will cause the iterator to stop and pass back
 *      that positive value to the function that called the iterator)
  }
{*< Error, stop iteration  }
  H5_ITER_ERROR = -(1);  
{*< Continue iteration  }
  H5_ITER_CONT = 0;  
{*< Stop iteration, short-circuit success  }
  H5_ITER_STOP = 1;  
{! <!-- [H5_index_t_snip] --> }
{*
 * The types of indices on links in groups/attributes on objects.
 * Primarily used for "<do> <foo> by index" routines and for iterating over
 * links in groups/attributes on objects.
  }
{*< Unknown index type                    }
{*< Index on names                        }
{*< Index on creation order               }
{*< Number of indices defined             }
type
  PH5_index_t = ^TH5_index_t;
  TH5_index_t =  Longint;
  Const
    H5_INDEX_UNKNOWN = -(1);
    H5_INDEX_NAME = (-(1))+1;
    H5_INDEX_CRT_ORDER = (-(1))+2;
    H5_INDEX_N = (-(1))+3;
;
{! <!-- [H5_index_t_snip] --> }
{*
 * Storage info struct used by H5O_info_t and H5F_info_t
  }
{! <!-- [H5_ih_info_t_snip] --> }
{*< btree and/or list  }
type
  PH5_ih_info_t = ^TH5_ih_info_t;
  TH5_ih_info_t = record
      index_size : Thsize_t;
      heap_size : Thsize_t;
    end;
{! <!-- [H5_ih_info_t_snip] --> }
{*
 * Allocation statistics info struct
  }
{*< Running count of total # of bytes allocated  }
{*< Current # of bytes allocated  }
{*< Peak # of bytes allocated  }
{*< Largest block allocated  }
{*< Running count of total # of blocks allocated  }
{*< Current # of blocks allocated  }
{*< Peak # of blocks allocated  }

  PH5_alloc_stats_t = ^TH5_alloc_stats_t;
  TH5_alloc_stats_t = record
      total_alloc_bytes : qword;
      curr_alloc_bytes : Tsize_t;
      peak_alloc_bytes : Tsize_t;
      max_block_size : Tsize_t;
      total_alloc_blocks_count : Tsize_t;
      curr_alloc_blocks_count : Tsize_t;
      peak_alloc_blocks_count : Tsize_t;
    end;
{ Functions in H5.c  }
{*
 * \ingroup H5
 * \brief Initializes the HDF5 library
 * \return \herr_t
 *
 * \details H5open() initializes the HDF5 library.
 *
 * \details When the HDF5 library is used in a C application, the library is
 *          automatically initialized when the first HDf5 function call is
 *          issued. If one finds that an HDF5 library function is failing
 *          inexplicably, H5open() can be called first. It is safe to call
 *          H5open() before an application issues any other function calls to
 *          the HDF5 library as there are no damaging side effects in calling
 *          it more than once.
  }

function H5open:Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Flushes all data to disk, closes all open objects, and releases memory
 * \return \herr_t
 *
 * \details H5close() flushes all data to disk, closes all open HDF5 objects,
 *          and cleans up all memory used by the HDF5 library. This function is
 *          generally called when the application calls exit(), but may be
 *          called earlier in the event of an emergency shutdown or out of a
 *          desire to free all resources used by the HDF5 library.
  }
function H5close:Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Instructs library not to install atexit() cleanup routine
 * \return \herr_t
 *
 * \details H5dont_atexit() indicates to the library that an atexit() cleanup
 *          routine should not be installed. The major purpose for using this
 *          function is in situations where the library is dynamically linked
 *          into an application and is un-linked from the application before
 *          exit() gets called. In those situations, a routine installed with
 *          atexit() would jump to a routine which was no longer in memory,
 *          causing errors.
 *
 * \attention In order to be effective, this routine \Emphmust be called
 *            before any other HDF5 function calls, and must be called each
 *            time the library is loaded/linked into the application (the first
 *            time and after it's been un-loaded).
  }
function H5dont_atexit:Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Garbage collects on all free-lists of all types
 * \return \herr_t
 *
 * \details H5garbage_collect() walks through all garbage collection routines
 *          of the library, freeing any unused memory.
 *
 *          It is not required that H5garbage_collect() be called at any
 *          particular time; it is only necessary in certain situations where
 *          the application has performed actions that cause the library to
 *          allocate many objects. The application should call
 *          H5garbage_collect() if it eventually releases those objects and
 *          wants to reduce the memory used by the library from the peak usage
 *          required.
 *
 * \note The library automatically garbage collects all the free lists when the
 *       application ends.
  }
function H5garbage_collect:Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Sets free-list size limits
 *
 * \param[in] reg_global_lim The cumulative limit, in bytes, on memory used for
 *                           all regular free lists (Default: 1MB)
 * \param[in] reg_list_lim The limit, in bytes, on memory used for each regular
 *                         free list (Default: 64KB)
 * \param[in] arr_global_lim The cumulative limit, in bytes, on memory used for
 *                           all array free lists (Default: 4MB)
 * \param[in] arr_list_lim The limit, in bytes, on memory used for each array
 *                         free list (Default: 256KB)
 * \param[in] blk_global_lim The cumulative limit, in bytes, on memory used for
 *                           all block free lists and, separately, for all
 *                           factory free lists (Default: 16MB)
 * \param[in] blk_list_lim The limit, in bytes, on memory used for each block
 *                         or factory free list (Default: 1MB)
 * \return \herr_t
 *
 * \details H5set_free_list_limits() sets size limits on all types of free
 *          lists. The HDF5 library uses free lists internally to manage
 *          memory. The types of free lists used are as follows:
 *          \li Regular free lists manage memory for single internal data
 *              structures.
 *          \li Array free lists manage memory for arrays of internal
 *              data structures.
 *          \li Block free lists manage memory for arbitrarily-sized blocks
 *              of bytes.
 *          \li Factory free lists manage memory for fixed-size blocks of
 *              bytes.
 *
 *          The parameters specify global and per-list limits; for example, \p
 *          reg_global_limit and \p reg_list_limit limit the accumulated size
 *          of all regular free lists and the size of each individual regular
 *          free list, respectively. Therefore, if an application sets a 1Mb
 *          limit on each of the global lists, up to 4Mb of total storage might
 *          be allocated, 1Mb for each of the regular, array, block, and
 *          factory type lists.
 *
 *          The settings specified for block free lists are duplicated for
 *          factory free lists. Therefore, increasing the global limit on block
 *          free lists by x bytes will increase the potential free list memory
 *          usage by 2x bytes.
 *
 *          Using a value of -1 for a limit means that no limit is set for the
 *          specified type of free list.
 *
 * \version 1.8.3 Function changed in this release to set factory free list
 *                memory limits.
 *
 * \since 1.6.0
  }
function H5set_free_list_limits(reg_global_lim:longint; reg_list_lim:longint; arr_global_lim:longint; arr_list_lim:longint; blk_global_lim:longint; 
           blk_list_lim:longint):Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Gets the current size of the free lists used to manage memory
 *
 * \param[out] reg_size The current size of all "regular" free list memory used
 * \param[out] arr_size The current size of all "array" free list memory used
 * \param[out] blk_size The current size of all "block" free list memory used
 * \param[out] fac_size The current size of all "factory" free list memory used
 * \return \herr_t
 *
 * \details H5get_free_list_sizes() obtains the current size of the different
 *          kinds of free lists that the library uses to manage memory. The
 *          free list sizes can be set with H5set_free_list_limits() and
 *          garbage collected with H5garbage_collect(). These lists are global
 *          for the entire library.
 *
 * \since 1.10.7
  }
function H5get_free_list_sizes(reg_size:Psize_t; arr_size:Psize_t; blk_size:Psize_t; fac_size:Psize_t):Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Gets the memory allocation statistics for the library
 *
 * \param[out] stats Memory allocation statistics
 * \return \herr_t
 *
 * \details H5get_alloc_stats() gets the memory allocation statistics for the
 *          library, if the \c --enable-memory-alloc-sanity-check option was
 *          given when building the library. Applications can check whether
 *          this option was enabled detecting if the
 *          \c H5_MEMORY_ALLOC_SANITY_CHECK macro is defined. This option is
 *          enabled by default for debug builds of the library and disabled by
 *          default for non-debug builds. If the option is not enabled, all the
 *          values returned with be 0. These statistics are global for the
 *          entire library, but do not include allocations from chunked dataset
 *          I/O filters or non-native VOL connectors.
 *
 * \since 1.10.7
  }
function H5get_alloc_stats(stats:PH5_alloc_stats_t):Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Returns the HDF library release number
 *
 * \param[out] majnum The major version number of the library
 * \param[out] minnum The minor version number of the library
 * \param[out] relnum The release version number of the library
 * \return \herr_t
 *
 * \details H5get_libversion() retrieves the major, minor, and release numbers
 *          of the version of the HDF5 library which is linked to the
 *          application.
 *
  }
function H5get_libversion(majnum:Pdword; minnum:Pdword; relnum:Pdword):Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Verifies that HDF5 library versions are consistent
 *
 * \param[in] majnum HDF5 library major version number
 * \param[in] minnum HDF5 library minor version number
 * \param[in] relnum HDF5 library release number
 * \return \herr_t
 *
 * \details H5check_version() verifies that the version of the HDF5 library
 *          with which an application was compiled, as indicated by the passed
 *          parameters, matches the version of the HDF5 library against which
 *          the application is currently linked.
 *
 *          \p majnum is the major version number of the HDF library with which
 *          the application was compiled, \p minnum is the minor version
 *          number, and \p relnum is the release number. Consider the following
 *          example:
 *
 *          An official HDF5 release is labelled as follows:
 *          HDF5 Release \Code\<majnum\>.\<minnum\>.\<relnum\>\n
 *          For example, in HDF5 Release 1.8.5:
 *          \li 1 is the major version number, \p majnum.
 *          \li 8 is the minor version number, \p minnum.
 *          \li 5 is the release number, \p relnum.
 *
 *          As stated above, H5check_version() first verifies that the version
 *          of the HDF5 library with which an application was compiled matches
 *          the version of the HDF5 library against which the application is
 *          currently linked. If this check fails, H5check_version() causes the
 *          application to abort (by means of a standard C abort() call) and
 *          prints information that is usually useful for debugging. This
 *          precaution is taken to avoid the risks of data corruption or
 *          segmentation faults.
 *
 *          The most common cause of this failure is that an application was
 *          compiled with one version of HDF5 and is dynamically linked with a
 *          different version different version.
 *
 *          If the above test passes, H5check_version() proceeds to verify the
 *          consistency of additional library version information. This is
 *          designed to catch source code inconsistencies that do not normally
 *          cause failures; if this check reveals an inconsistency, an
 *          informational warning is printed but the application is allowed to
 *          run.
 *
  }
function H5check_version(majnum:dword; minnum:dword; relnum:dword):Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Determines whether the HDF5 library was built with the thread-safety
 *        feature enabled
 *
 * \param[out] is_ts Boolean value indicating whether the library was built
 *                   with thread-safety enabled
 * \return \herr_t
 *
 * \details The HDF5 library, although not internally multi-threaded, can be
 *          built with a thread-safety feature enabled that protects internal
 *          data structures with a mutex. In certain circumstances, it may be
 *          useful to determine, at run-time, whether the linked HDF5 library
 *          was built with the thread-safety feature enabled.
  }
function H5is_library_threadsafe(is_ts:Phbool_t):Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Frees memory allocated by the HDF5 library
 *
 * \param[in] mem Buffer to be freed. Can be NULL
 * \return \herr_t
 *
 * \details H5free_memory() frees memory that has been allocated by the caller
 *          with H5allocate_memory() or by the HDF5 library on behalf of the
 *          caller.
 *
 *          H5Tget_member_name() provides an example of memory allocation on
 *          behalf of the caller: The function returns a buffer containing the
 *          name of a compound datatype member. It is the caller’s
 *          responsibility to eventually free that buffer with H5free_memory().
 *
 * \attention It is especially important to use this function to free memory
 *            allocated by the library on Windows. The C standard library is
 *            implemented in dynamic link libraries (DLLs) known as the C
 *            run-time (CRT). Each version of Visual Studio comes with two CRT
 *            DLLs (debug and release) and allocating and freeing across DLL
 *            boundaries can cause resource leaks and subtle bugs due to heap
 *            corruption.\n
 *            Only use this function to free memory allocated by the HDF5
 *            Library. It will generally not be safe to use this function to
 *            free memory allocated by any other means.\n
 *            Even when using this function, it is still best to ensure that
 *            all components of a C application are built with the same version
 *            of Visual Studio and build (debug or release) and thus linked
 *            against the same CRT.
 *
 * \see H5allocate_memory(), H5resize_memory()
 *
 * \since 1.8.13
 *
  }
function H5free_memory(mem:pointer):Therr_t;cdecl;external;
{*
 * \ingroup H5
 * \brief Frees memory allocated by the HDF5 library
 *
 * \param[in] size The size in bytes of the buffer to be allocated
 * \param[in] clear Flag whether the new buffer is to be initialized with 0
 *
 * \return On success, returns pointer to newly allocated buffer or returns
 *         NULL if size is 0 (zero).\n
 *         Returns NULL on failure.
 *
 * \details H5allocate_memory() allocates a memory buffer of size bytes that
 *          will later be freed internally by the HDF5 library.
 *
 *          The boolean \p clear parameter specifies whether the buffer should
 *          be initialized. If clear is \c TRUE, all bits in the buffer are to be
 *          set to 0 (zero); if clear is \c FALSE, the buffer will not be
 *          initialized.
 *
 *          This function is intended to have the semantics of malloc() and
 *          calloc(). However, unlike malloc() and calloc() which allow for a
 *          "special" pointer to be returned instead of NULL, this function
 *          always returns NULL on failure or when size is set to 0 (zero).
 *
 * \note At this time, the only intended use for this function is to allocate
 *       memory that will be returned to the library as a data buffer from a
 *       third-party filter.
 *
 * \attention To avoid heap corruption, allocated memory should be freed using
 *            the same library that initially allocated it. In most cases, the
 *            HDF5 API uses resources that are allocated and freed either
 *            entirely by the user or entirely by the library, so this is not a
 *            problem. In rare cases, however, HDF5 API calls will free memory
 *            that the user allocated. This function allows the user to safely
 *            allocate this memory.\n
 *            It is particularly important to use this function to allocate
 *            memory in Microsoft Windows environments. In Windows, the C
 *            standard library is implemented in dynamic link libraries (DLLs)
 *            known as the C run-time (CRT). Each version of Visual Studio
 *            comes with multiple versions of the CRT DLLs (debug, release, et
 *            cetera) and allocating and freeing memory across DLL boundaries
 *            can cause resource leaks and subtle bugs due to heap corruption.\n
 *            Even when using this function, it is best where possible to
 *            ensure that all components of a C application are built with the
 *            same version of Visual Studio and configuration (Debug or
 *            Release), and thus linked against the same CRT.\n
 *            Use this function only to allocate memory inside third-party HDF5
 *            filters. It will generally not be safe to use this function to
 *            allocate memory for any other purpose.
 *
 * \see H5free_memory(), H5resize_memory()
 *
 * \since 1.8.15
 *
  }
function H5allocate_memory(size:Tsize_t; clear:Thbool_t):pointer;cdecl;external;
{*
 * \ingroup H5
 * \brief Resizes and, if required, re-allocates memory that will later be
 *        freed internally by the HDF5 library
 *
 * \param[in] mem Pointer to a buffer to be resized. May be NULL
 * \param[in] size New size of the buffer, in bytes

 *
 * \return On success, returns pointer to resized or reallocated buffer
 *         or returns NULL if size is 0 (zero).\n
 *         Returns NULL on failure.
 *
 * \details H5resize_memory() takes a pointer to an existing buffer and resizes
 *          the buffer to match the value in \p size. If necessary, the buffer
 *          is reallocated. If \p size is 0, the buffer is released.
 *
 *          The input buffer must either be NULL or have been allocated by
 *          H5allocate_memory() since the input buffer may be freed by the
 *          library.
 *
 *          For certain behaviors, the pointer \p mem may be passed in as NULL.
 *
 *          This function is intended to have the semantics of realloc():
 *
 *          <table>
 *            <tr><td>\CodeH5resize_memory(buffer, size)</td>
 *                <td>Resizes buffer. Returns pointer to resized buffer.</td></tr>
 *            <tr><td>\CodeH5resize_memory(NULL, size)</td>
 *                <td>Allocates memory using HDF5 Library allocator.
 *                    Returns pointer to new buffer</td></tr>
 *            <tr><td>\CodeH5resize_memory(buffer, 0)</td>
 *                <td>Frees memory using HDF5 Library allocator.
 *                    Returns NULL.</td></tr>
 *            <tr><td>\CodeH5resize_memory(NULL, 0)</td>
 *                <td>Returns NULL (undefined in C standard).</td></tr>
 *          </table>
 *
 *          Unlike realloc(), which allows for a "special pointer to be
 *          returned instead of NULL, this function always returns NULL on
 *          failure or when size is 0 (zero).
 *
 * \note At this time, the only intended use for this function is to resize or
 *       reallocate memory that will be returned to the library (and eventually
 *       to the user) as a data buffer from a third-party HDF5 filter.
 *
 * \attention To avoid heap corruption, allocated memory should be freed using
 *            the same library that initially allocated it. In most cases, the
 *            HDF5 API uses resources that are allocated and freed either
 *            entirely by the user or entirely by the library, so this is not a
 *            problem. In rare cases, however, HDF5 API calls will free memory
 *            that the user allocated. This function allows the user to safely
 *            allocate this memory.\n
 *            It is particularly important to use this function to resize
 *            memory on Microsoft Windows systems. In Windows, the C standard
 *            library is implemented in dynamic link libraries (DLLs) known as
 *            the C run-time (CRT). Each version of Visual Studio comes with
 *            multiple versions of the CRT DLLs (debug, release, et cetera) and
 *            allocating and freeing memory across DLL boundaries can cause
 *            resource leaks and subtle bugs due to heap corruption.\n
 *            Even when using this function, it is still best to ensure that
 *            all components of a C application are built with the same version
 *            of Visual Studio and the same configuration (Debug or Release),
 *            and thus linked against the same CRT.\n
 *            Only use this function to resize memory inside third-party HDF5
 *            filters. It will generally not be safe to use this function to
 *            resize memory for any other purpose.
 *
 * \see H5allocate_memory(), H5free_memory()
 *
 * \since 1.8.15
 *
  }
function H5resize_memory(mem:pointer; size:Tsize_t):pointer;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ H5public_H  }

implementation

{ was #define dname def_expr }
function UINT64_MAX : Tuint64_t;
  begin
    UINT64_MAX:=Tuint64_t(-(1));
  end;


end.
