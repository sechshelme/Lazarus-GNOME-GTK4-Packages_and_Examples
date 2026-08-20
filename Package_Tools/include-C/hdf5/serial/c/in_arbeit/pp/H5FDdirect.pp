
unit H5FDdirect;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDdirect.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDdirect.h
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
    Psize_t  = ^size_t;
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
 * Programmer:  Raymond Lu
 *              Wednesday, 20 September 2006
 *
 * Purpose:	The public header file for the direct driver.
  }
{$ifndef H5FDdirect_H}
{$define H5FDdirect_H}
{$ifdef H5_HAVE_DIRECT}

{ was #define dname def_expr }
function H5FD_DIRECT : longint; { return type might be wrong }

{$else}

const
  H5FD_DIRECT = H5I_INVALID_HID;  
{$endif}
{ H5_HAVE_DIRECT  }
{$ifdef H5_HAVE_DIRECT}
{ C++ extern C conditionnal removed }
{ Default values for memory boundary, file block size, and maximal copy buffer size.
 * Application can set these values through the function H5Pset_fapl_direct.  }

const
  MBOUNDARY_DEF = 4096;  
  FBSIZE_DEF = 4096;  
(* error 
#define CBSIZE_DEF    16 * 1024 * 1024
in define line 37 *)

function H5FD_direct_init:Thid_t;cdecl;external;
    {*
     * \ingroup FAPL
     *
     * \brief Sets up use of the direct I/O driver
     *
     * \fapl_id
     * \param[in] alignment Required memory alignment boundary
     * \param[in] block_size File system block size
     * \param[in] cbuf_size Copy buffer size
     * \returns \herr_t
     *
     * \details H5Pset_fapl_direct() sets the file access property list, \p fapl_id,
     *          to use the direct I/O driver, #H5FD_DIRECT. With this driver, data
     *          is written to or read from the file synchronously without being
     *          cached by the system.
     *
     *          File systems usually require the data address in memory, the file
     *          address, and the size of the data to be aligned. The HDF5 library’s
     *          direct I/O driver is able to handle unaligned data, though that will
     *          consume some additional memory resources and may slow
     *          performance. To get better performance, use the system function \p
     *          posix_memalign to align the data buffer in memory and the HDF5
     *          function H5Pset_alignment() to align the data in the file. Be aware,
     *          however, that aligned data I/O may cause the HDF5 file to be bigger
     *          than the actual data size would otherwise require because the
     *          alignment may leave some holes in the file.
     *
     *          \p alignment specifies the required alignment boundary in memory.
     *
     *          \p block_size specifies the file system block size. A value of 0
     *          (zero) means to use HDF5 library’s default value of 4KB.
     *
     *          \p cbuf_size specifies the copy buffer size.
     *
     * \since 1.8.0
     *
      }
function H5Pset_fapl_direct(fapl_id:Thid_t; alignment:Tsize_t; block_size:Tsize_t; cbuf_size:Tsize_t):Therr_t;cdecl;external;
    {*
     * \ingroup FAPL
     *
     * \brief Retrieves direct I/O driver settings
     *
     * \fapl_id
     * \param[out] boundary Required memory alignment boundary
     * \param[out] block_size File system block size
     * \param[out] cbuf_size Copy buffer size
     * \returns \herr_t
     *
     * \details H5Pget_fapl_direct() retrieves the required memory alignment (\p
     *          alignment), file system block size (\p block_size), and copy buffer
     *          size (\p cbuf_size) settings for the direct I/O driver, #H5FD_DIRECT,
     *          from the file access property list \p fapl_id.
     *
     *          See H5Pset_fapl_direct() for discussion of these values,
     *          requirements, and important considerations.
     *
     * \since 1.8.0
     *
      }
    {out }    {out }    {out }function H5Pget_fapl_direct(fapl_id:Thid_t; boundary:Psize_t; block_size:Psize_t; cbuf_size:Psize_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
    { H5_HAVE_DIRECT  }
{$endif}

implementation

{ was #define dname def_expr }
function H5FD_DIRECT : longint; { return type might be wrong }
  begin
    H5FD_DIRECT:=H5FD_direct_init;
  end;


end.
