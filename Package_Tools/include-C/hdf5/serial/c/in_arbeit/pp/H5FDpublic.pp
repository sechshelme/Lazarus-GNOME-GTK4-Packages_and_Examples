
unit H5FDpublic;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDpublic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDpublic.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
PH5FD_class_t  = ^H5FD_class_t;
PH5FD_file_image_callbacks_t  = ^H5FD_file_image_callbacks_t;
PH5FD_file_image_op_t  = ^H5FD_file_image_op_t;
PH5FD_free_t  = ^H5FD_free_t;
PH5FD_mem_t  = ^H5FD_mem_t;
PH5FD_t  = ^H5FD_t;
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
 * Programmer:  Robb Matzke
 *              Monday, July 26, 1999
  }
{$ifndef H5FDpublic_H}
{$define H5FDpublic_H}
{$include "H5public.h"}
{$include "H5Fpublic.h" /*for H5F_close_degree_t */}
{define a convenient app feature test }

const
  H5_HAVE_VFL = 1;  
{ Default VFL driver value  }
  H5FD_VFD_DEFAULT = 0;  
{ Types of allocation requests: see H5Fpublic.h   }
type
  PH5FD_mem_t = ^TH5FD_mem_t;
  TH5FD_mem_t = TH5F_mem_t;
{ Map "fractal heap" header blocks to 'ohdr' type file memory, since its
 * a fair amount of work to add a new kind of file memory and they are similar
 * enough to object headers and probably too minor to deserve their own type.
 *
 * Map "fractal heap" indirect blocks to 'ohdr' type file memory, since they
 * are similar to fractal heap header blocks.
 *
 * Map "fractal heap" direct blocks to 'lheap' type file memory, since they
 * will be replacing local heaps.
 *
 * Map "fractal heap" 'huge' objects to 'draw' type file memory, since they
 * represent large objects that are directly stored in the file.
 *
 *      -QAK
  }

const
  H5FD_MEM_FHEAP_HDR = H5FD_MEM_OHDR;  
  H5FD_MEM_FHEAP_IBLOCK = H5FD_MEM_OHDR;  
  H5FD_MEM_FHEAP_DBLOCK = H5FD_MEM_LHEAP;  
  H5FD_MEM_FHEAP_HUGE_OBJ = H5FD_MEM_DRAW;  
{ Map "free space" header blocks to 'ohdr' type file memory, since its
 * a fair amount of work to add a new kind of file memory and they are similar
 * enough to object headers and probably too minor to deserve their own type.
 *
 * Map "free space" serialized sections to 'lheap' type file memory, since they
 * are similar enough to local heap info.
 *
 *      -QAK
  }
  H5FD_MEM_FSPACE_HDR = H5FD_MEM_OHDR;  
  H5FD_MEM_FSPACE_SINFO = H5FD_MEM_LHEAP;  
{ Map "shared object header message" master table to 'ohdr' type file memory,
 * since its a fair amount of work to add a new kind of file memory and they are
 * similar enough to object headers and probably too minor to deserve their own
 * type.
 *
 * Map "shared object header message" indices to 'btree' type file memory,
 * since they are similar enough to B-tree nodes.
 *
 *      -QAK
  }
  H5FD_MEM_SOHM_TABLE = H5FD_MEM_OHDR;  
  H5FD_MEM_SOHM_INDEX = H5FD_MEM_BTREE;  
{ Map "extensible array" header blocks to 'ohdr' type file memory, since its
 * a fair amount of work to add a new kind of file memory and they are similar
 * enough to object headers and probably too minor to deserve their own type.
 *
 * Map "extensible array" index blocks to 'ohdr' type file memory, since they
 * are similar to extensible array header blocks.
 *
 * Map "extensible array" super blocks to 'btree' type file memory, since they
 * are similar enough to B-tree nodes.
 *
 * Map "extensible array" data blocks & pages to 'lheap' type file memory, since
 * they are similar enough to local heap info.
 *
 *      -QAK
  }
  H5FD_MEM_EARRAY_HDR = H5FD_MEM_OHDR;  
  H5FD_MEM_EARRAY_IBLOCK = H5FD_MEM_OHDR;  
  H5FD_MEM_EARRAY_SBLOCK = H5FD_MEM_BTREE;  
  H5FD_MEM_EARRAY_DBLOCK = H5FD_MEM_LHEAP;  
  H5FD_MEM_EARRAY_DBLK_PAGE = H5FD_MEM_LHEAP;  
{ Map "fixed array" header blocks to 'ohdr' type file memory, since its
 * a fair amount of work to add a new kind of file memory and they are similar
 * enough to object headers and probably too minor to deserve their own type.
 *
 * Map "fixed array" data blocks & pages to 'lheap' type file memory, since
 * they are similar enough to local heap info.
 *
  }
  H5FD_MEM_FARRAY_HDR = H5FD_MEM_OHDR;  
  H5FD_MEM_FARRAY_DBLOCK = H5FD_MEM_LHEAP;  
  H5FD_MEM_FARRAY_DBLK_PAGE = H5FD_MEM_LHEAP;  
{
 * A free-list map which maps all types of allocation requests to a single
 * free list.  This is useful for drivers that don't really care about
 * keeping different requests segregated in the underlying file and which
 * want to make most efficient reuse of freed memory.  The use of the
 * H5FD_MEM_SUPER free list is arbitrary.
  }
{ Define VFL driver features that can be enabled on a per-driver basis  }
{ These are returned with the 'query' function pointer in H5FD_class_t  }
{
 * Defining H5FD_FEAT_AGGREGATE_METADATA for a VFL driver means that
 * the library will attempt to allocate a larger block for metadata and
 * then sub-allocate each metadata request from that larger block.
  }
  H5FD_FEAT_AGGREGATE_METADATA = $00000001;  
{
 * Defining H5FD_FEAT_ACCUMULATE_METADATA for a VFL driver means that
 * the library will attempt to cache metadata as it is written to the file
 * and build up a larger block of metadata to eventually pass to the VFL
 * 'write' routine.
 *
 * Distinguish between updating the metadata accumulator on writes and
 * reads.  This is particularly (perhaps only, even) important for MPI-I/O
 * where we guarantee that writes are collective, but reads may not be.
 * If we were to allow the metadata accumulator to be written during a
 * read operation, the application would hang.
  }
  H5FD_FEAT_ACCUMULATE_METADATA_WRITE = $00000002;  
  H5FD_FEAT_ACCUMULATE_METADATA_READ = $00000004;  
  H5FD_FEAT_ACCUMULATE_METADATA = H5FD_FEAT_ACCUMULATE_METADATA_WRITE or H5FD_FEAT_ACCUMULATE_METADATA_READ;  
{
 * Defining H5FD_FEAT_DATA_SIEVE for a VFL driver means that
 * the library will attempt to cache raw data as it is read from/written to
 * a file in a "data seive" buffer.  See Rajeev Thakur's papers:
 *  http://www.mcs.anl.gov/~thakur/papers/romio-coll.ps.gz
 *  http://www.mcs.anl.gov/~thakur/papers/mpio-high-perf.ps.gz
  }
  H5FD_FEAT_DATA_SIEVE = $00000008;  
{
 * Defining H5FD_FEAT_AGGREGATE_SMALLDATA for a VFL driver means that
 * the library will attempt to allocate a larger block for "small" raw data
 * and then sub-allocate "small" raw data requests from that larger block.
  }
  H5FD_FEAT_AGGREGATE_SMALLDATA = $00000010;  
{
 * Defining H5FD_FEAT_IGNORE_DRVRINFO for a VFL driver means that
 * the library will ignore the driver info that is encoded in the file
 * for the VFL driver.  (This will cause the driver info to be eliminated
 * from the file when it is flushed/closed, if the file is opened R/W).
  }
  H5FD_FEAT_IGNORE_DRVRINFO = $00000020;  
{
 * Defining the H5FD_FEAT_DIRTY_DRVRINFO_LOAD for a VFL driver means that
 * the library will mark the driver info dirty when the file is opened
 * R/W.  This will cause the driver info to be re-encoded when the file
 * is flushed/closed.
  }
  H5FD_FEAT_DIRTY_DRVRINFO_LOAD = $00000040;  
{
 * Defining H5FD_FEAT_POSIX_COMPAT_HANDLE for a VFL driver means that
 * the handle for the VFD (returned with the 'get_handle' callback) is
 * of type 'int' and is compatible with POSIX I/O calls.
  }
  H5FD_FEAT_POSIX_COMPAT_HANDLE = $00000080;  
{
 * Defining H5FD_FEAT_HAS_MPI for a VFL driver means that
 * the driver makes use of MPI communication and code may retrieve
 * communicator/rank information from it
  }
  H5FD_FEAT_HAS_MPI = $00000100;  
{
 * Defining the H5FD_FEAT_ALLOCATE_EARLY for a VFL driver will force
 * the library to use the H5D_ALLOC_TIME_EARLY on dataset create
 * instead of the default H5D_ALLOC_TIME_LATE
  }
  H5FD_FEAT_ALLOCATE_EARLY = $00000200;  
{
 * Defining H5FD_FEAT_ALLOW_FILE_IMAGE for a VFL driver means that
 * the driver is able to use a file image in the fapl as the initial
 * contents of a file.
  }
  H5FD_FEAT_ALLOW_FILE_IMAGE = $00000400;  
{
 * Defining H5FD_FEAT_CAN_USE_FILE_IMAGE_CALLBACKS for a VFL driver
 * means that the driver is able to use callbacks to make a copy of the
 * image to store in memory.
  }
  H5FD_FEAT_CAN_USE_FILE_IMAGE_CALLBACKS = $00000800;  
{
 * Defining H5FD_FEAT_SUPPORTS_SWMR_IO for a VFL driver means that the
 * driver supports the single-writer/multiple-readers I/O pattern.
  }
  H5FD_FEAT_SUPPORTS_SWMR_IO = $00001000;  
{
 * Defining H5FD_FEAT_USE_ALLOC_SIZE for a VFL driver
 * means that the library will just pass the allocation size to the
 * the driver's allocation callback which will eventually handle alignment.
 * This is specifically used for the multi/split driver.
  }
  H5FD_FEAT_USE_ALLOC_SIZE = $00002000;  
{
 * Defining H5FD_FEAT_PAGED_AGGR for a VFL driver
 * means that the driver needs special file space mapping for paged aggregation.
 * This is specifically used for the multi/split driver.
  }
  H5FD_FEAT_PAGED_AGGR = $00004000;  
{
 * Defining H5FD_FEAT_DEFAULT_VFD_COMPATIBLE for a VFL driver
 * that creates a file which is compatible with the default VFD.
 * Generally, this means that the VFD creates a single file that follows
 * the canonical HDF5 file format.
 * Regarding the Splitter VFD specifically, only drivers with this flag
 * enabled may be used as the Write-Only (W/O) channel driver.
  }
  H5FD_FEAT_DEFAULT_VFD_COMPATIBLE = $00008000;  
{ Forward declaration  }
type
{ Class information for each file driver  }
(* Const before type ignored *)
{out }{out }(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PH5FD_class_t = ^TH5FD_class_t;
  TH5FD_class_t = record
      name : Pchar;
      maxaddr : Thaddr_t;
      fc_degree : TH5F_close_degree_t;
      terminate : function :Therr_t;cdecl;
      sb_size : function (file:PH5FD_t):Thsize_t;cdecl;
      sb_encode : function (file:PH5FD_t; name:Pchar; p:Pbyte):Therr_t;cdecl;
      sb_decode : function (f:PH5FD_t; name:Pchar; p:Pbyte):Therr_t;cdecl;
      fapl_size : Tsize_t;
      fapl_get : function (file:PH5FD_t):pointer;cdecl;
      fapl_copy : function (fapl:pointer):pointer;cdecl;
      fapl_free : function (fapl:pointer):Therr_t;cdecl;
      dxpl_size : Tsize_t;
      dxpl_copy : function (dxpl:pointer):pointer;cdecl;
      dxpl_free : function (dxpl:pointer):Therr_t;cdecl;
      open : function (name:Pchar; flags:dword; fapl:Thid_t; maxaddr:Thaddr_t):PH5FD_t;cdecl;
      close : function (file:PH5FD_t):Therr_t;cdecl;
      cmp : function (f1:PH5FD_t; f2:PH5FD_t):longint;cdecl;
      query : function (f1:PH5FD_t; flags:Pdword):Therr_t;cdecl;
      get_type_map : function (file:PH5FD_t; type_map:PH5FD_mem_t):Therr_t;cdecl;
      alloc : function (file:PH5FD_t; _type:TH5FD_mem_t; dxpl_id:Thid_t; size:Thsize_t):Thaddr_t;cdecl;
      free : function (file:PH5FD_t; _type:TH5FD_mem_t; dxpl_id:Thid_t; addr:Thaddr_t; size:Thsize_t):Therr_t;cdecl;
      get_eoa : function (file:PH5FD_t; _type:TH5FD_mem_t):Thaddr_t;cdecl;
      set_eoa : function (file:PH5FD_t; _type:TH5FD_mem_t; addr:Thaddr_t):Therr_t;cdecl;
      get_eof : function (file:PH5FD_t; _type:TH5FD_mem_t):Thaddr_t;cdecl;
      get_handle : function (file:PH5FD_t; fapl:Thid_t; file_handle:Ppointer):Therr_t;cdecl;
      read : function (file:PH5FD_t; _type:TH5FD_mem_t; dxpl:Thid_t; addr:Thaddr_t; size:Tsize_t; 
                   buffer:pointer):Therr_t;cdecl;
      write : function (file:PH5FD_t; _type:TH5FD_mem_t; dxpl:Thid_t; addr:Thaddr_t; size:Tsize_t; 
                   buffer:pointer):Therr_t;cdecl;
      flush : function (file:PH5FD_t; dxpl_id:Thid_t; closing:Thbool_t):Therr_t;cdecl;
      truncate : function (file:PH5FD_t; dxpl_id:Thid_t; closing:Thbool_t):Therr_t;cdecl;
      lock : function (file:PH5FD_t; rw:Thbool_t):Therr_t;cdecl;
      unlock : function (file:PH5FD_t):Therr_t;cdecl;
      fl_map : array[0..(H5FD_MEM_NTYPES)-1] of TH5FD_mem_t;
    end;
{ A free list is a singly-linked list of address/size pairs.  }

  PH5FD_free_t = ^TH5FD_free_t;
  TH5FD_free_t = record
      addr : Thaddr_t;
      size : Thsize_t;
      next : PH5FD_free_t;
    end;
{
 * The main datatype for each driver. Public fields common to all drivers
 * are declared here and the driver appends private fields in memory.
  }
{driver ID for this file    }
(* Const before type ignored *)
{constant class info        }
{ File 'serial' number      }
{ File access flags (from create or open)  }
{ VFL Driver feature Flags  }
{ For this file, overrides class  }
{ Base address for HDF5 data w/in file  }
{ Space allocation management fields  }
{ Threshold for alignment   }
{ Allocation alignment      }
{ Paged aggregation for file space is enabled or not  }
  PH5FD_t = ^TH5FD_t;
  TH5FD_t = record
      driver_id : Thid_t;
      cls : PH5FD_class_t;
      fileno : dword;
      access_flags : dword;
      feature_flags : dword;
      maxaddr : Thaddr_t;
      base_addr : Thaddr_t;
      threshold : Thsize_t;
      alignment : Thsize_t;
      paged_aggr : Thbool_t;
    end;

{*
 * Define enum for the source of file image callbacks
  }
{! <!-- [H5FD_file_image_op_t_snip] --> }
{*< Passed to the \p image_malloc and \p image_memcpy callbacks when a
     * file image buffer is to be copied while being set in a file access
     * property list (FAPL) }
{*< Passed to the \p image_malloc and \p image_memcpy callbacks
     * when a file image buffer is to be copied when a FAPL is copied }
{*<Passed to the \p image_malloc and \p image_memcpy callbacks when
     * a file image buffer is to be copied while being retrieved from a FAPL }
{*<Passed to the \p image_free callback when a file image
     * buffer is to be released during a FAPL close operation }
{*<Passed to the \p image_malloc and
     * \p image_memcpy callbackswhen a
     * file image buffer is to be copied during a file open operation \n
     * While the file image being opened will typically be copied from a
     * FAPL, this need not always be the case. For example, the core file
     * driver, also known as the memory file driver, takes its initial
     * image from a file. }
{*<Passed to the \p image_realloc callback when a file driver needs
     * to resize an image buffer }
{*<Passed to the \p image_free callback when an image buffer is to
     * be released during a file close operation }

  PH5FD_file_image_op_t = ^TH5FD_file_image_op_t;
  TH5FD_file_image_op_t =  Longint;
  Const
    H5FD_FILE_IMAGE_OP_NO_OP = 0;
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_SET = 1;
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_COPY = 2;
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_GET = 3;
    H5FD_FILE_IMAGE_OP_PROPERTY_LIST_CLOSE = 4;
    H5FD_FILE_IMAGE_OP_FILE_OPEN = 5;
    H5FD_FILE_IMAGE_OP_FILE_RESIZE = 6;
    H5FD_FILE_IMAGE_OP_FILE_CLOSE = 7;
;
{! <!-- [H5FD_file_image_op_t_snip] --> }
{*
 * Define structure to hold file image callbacks
  }
{! <!-- [H5FD_file_image_callbacks_t_snip] --> }
{*
     * \param[in] size Size in bytes of the file image buffer to allocate
     * \param[in] file_image_op A value from H5FD_file_image_op_t indicating
     *                          the operation being performed on the file image
     *                          when this callback is invoked
     * \param[in] udata Value passed in in the H5Pset_file_image_callbacks
     *            parameter \p udata
      }
{! <!-- [image_malloc_snip] --> }
{! <!-- [image_malloc_snip] --> }
{*
     * \param[in] dest Address of the destination buffer
     * \param[in] src Address of the source buffer
     * \param[in] file_image_op A value from #H5FD_file_image_op_t indicating
     *                          the operation being performed on the file image
     *                          when this callback is invoked
     * \param[in] udata Value passed in in the H5Pset_file_image_callbacks
     *            parameter \p udata
      }
{! <!-- [image_memcpy_snip] --> }
(* Const before type ignored *)
{! <!-- [image_memcpy_snip] --> }
{*
     * \param[in] ptr Pointer to the buffer being reallocated
     * \param[in] file_image_op A value from #H5FD_file_image_op_t indicating
     *                          the operation being performed on the file image
     *                          when this callback is invoked
     * \param[in] udata Value passed in in the H5Pset_file_image_callbacks
     *            parameter \p udata
      }
{! <!-- [image_realloc_snip] --> }
{! <!-- [image_realloc_snip] --> }
{*
     * \param[in] udata Value passed in in the H5Pset_file_image_callbacks
     *            parameter \p udata
      }
{! <!-- [image_free_snip] --> }
{! <!-- [image_free_snip] --> }
{*
     * \param[in] udata Value passed in in the H5Pset_file_image_callbacks
     *            parameter \p udata
      }
{! <!-- [udata_copy_snip] --> }
{! <!-- [udata_copy_snip] --> }
{*
     * \param[in] udata Value passed in in the H5Pset_file_image_callbacks
     *            parameter \p udata
      }
{! <!-- [udata_free_snip] --> }
{! <!-- [udata_free_snip] --> }
{*
     * \brief The final field in the #H5FD_file_image_callbacks_t struct,
     *        provides a pointer to user-defined data. This pointer will be
     *        passed to the image_malloc, image_memcpy, image_realloc, and
     *        image_free callbacks. Define udata as NULL if no user-defined
     *        data is provided.
      }
type
  PH5FD_file_image_callbacks_t = ^TH5FD_file_image_callbacks_t;
  TH5FD_file_image_callbacks_t = record
      image_malloc : function (size:Tsize_t; file_image_op:TH5FD_file_image_op_t; udata:pointer):pointer;cdecl;
      image_memcpy : function (dest:pointer; src:pointer; size:Tsize_t; file_image_op:TH5FD_file_image_op_t; udata:pointer):pointer;cdecl;
      image_realloc : function (ptr:pointer; size:Tsize_t; file_image_op:TH5FD_file_image_op_t; udata:pointer):pointer;cdecl;
      image_free : function (ptr:pointer; file_image_op:TH5FD_file_image_op_t; udata:pointer):Therr_t;cdecl;
      udata_copy : function (udata:pointer):pointer;cdecl;
      udata_free : function (udata:pointer):Therr_t;cdecl;
      udata : pointer;
    end;
{! <!-- [H5FD_file_image_callbacks_t_snip] --> }
{ C++ extern C conditionnal removed }
{ Function prototypes  }
(* Const before type ignored *)

function H5FDregister(cls:PH5FD_class_t):Thid_t;cdecl;external;
function H5FDunregister(driver_id:Thid_t):Therr_t;cdecl;external;
(* Const before type ignored *)
function H5FDopen(name:Pchar; flags:dword; fapl_id:Thid_t; maxaddr:Thaddr_t):PH5FD_t;cdecl;external;
function H5FDclose(file:PH5FD_t):Therr_t;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function H5FDcmp(f1:PH5FD_t; f2:PH5FD_t):longint;cdecl;external;
(* Const before type ignored *)
function H5FDquery(f:PH5FD_t; flags:Pdword):longint;cdecl;external;
function H5FDalloc(file:PH5FD_t; _type:TH5FD_mem_t; dxpl_id:Thid_t; size:Thsize_t):Thaddr_t;cdecl;external;
function H5FDfree(file:PH5FD_t; _type:TH5FD_mem_t; dxpl_id:Thid_t; addr:Thaddr_t; size:Thsize_t):Therr_t;cdecl;external;
function H5FDget_eoa(file:PH5FD_t; _type:TH5FD_mem_t):Thaddr_t;cdecl;external;
function H5FDset_eoa(file:PH5FD_t; _type:TH5FD_mem_t; eoa:Thaddr_t):Therr_t;cdecl;external;
function H5FDget_eof(file:PH5FD_t; _type:TH5FD_mem_t):Thaddr_t;cdecl;external;
function H5FDget_vfd_handle(file:PH5FD_t; fapl:Thid_t; file_handle:Ppointer):Therr_t;cdecl;external;
{out }function H5FDread(file:PH5FD_t; _type:TH5FD_mem_t; dxpl_id:Thid_t; addr:Thaddr_t; size:Tsize_t; 
           buf:pointer):Therr_t;cdecl;external;
(* Const before type ignored *)
function H5FDwrite(file:PH5FD_t; _type:TH5FD_mem_t; dxpl_id:Thid_t; addr:Thaddr_t; size:Tsize_t; 
           buf:pointer):Therr_t;cdecl;external;
function H5FDflush(file:PH5FD_t; dxpl_id:Thid_t; closing:Thbool_t):Therr_t;cdecl;external;
function H5FDtruncate(file:PH5FD_t; dxpl_id:Thid_t; closing:Thbool_t):Therr_t;cdecl;external;
function H5FDlock(file:PH5FD_t; rw:Thbool_t):Therr_t;cdecl;external;
function H5FDunlock(file:PH5FD_t):Therr_t;cdecl;external;
{*
 * \ingroup H5FD
 *
 * \brief Allows querying a VFD ID for features before the file is opened
 *
 * \param[in] driver_id Virtual File Driver (VFD) ID
 * \param[out] flags VFD flags supported
 *
 * \return \herr_t
 *
 * \details Queries a virtual file driver (VFD) for feature flags. Takes a
 *          VFD hid_t so it can be used before the file is opened. For example,
 *          this could be used to check if a VFD supports SWMR.
 *
 * \note The flags obtained here are just those of the base driver and
 *       do not take any configuration options (e.g., set via a fapl
 *       call) into consideration.
 *
 * \since 1.10.2
  }
{out }function H5FDdriver_query(driver_id:Thid_t; flags:Pdword):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
