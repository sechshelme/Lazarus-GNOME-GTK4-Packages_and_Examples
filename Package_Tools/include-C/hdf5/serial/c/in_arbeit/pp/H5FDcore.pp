
unit H5FDcore;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDcore.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDcore.h
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
Phbool_t  = ^hbool_t;
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
 * Programmer:  Robb Matzke
 *              Monday, August  2, 1999
 *
 * Purpose:	The public header file for the core driver.
  }
{$ifndef H5FDcore_H}
{$define H5FDcore_H}

{ was #define dname def_expr }
function H5FD_CORE : longint; { return type might be wrong }

{ C++ extern C conditionnal removed }
function H5FD_core_init:Thid_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \brief Modifies the file access property list to use the #H5FD_CORE driver
 *
 * \fapl_id
 * \param[in] increment Size, in bytes, of memory increments
 * \param[in] backing_store Boolean flag indicating whether to write the file
 *            contents to disk when the file is closed
 * \returns \herr_t
 *
 * \details H5Pset_fapl_core() modifies the file access property list to use the
 *          #H5FD_CORE driver.
 *
 *          The #H5FD_CORE driver enables an application to work with a file in
 *          memory, speeding reads and writes as no disk access is made. File
 *          contents are stored only in memory until the file is closed. The \p
 *          backing_store parameter determines whether file contents are ever
 *          written to disk.
 *
 *          \p increment specifies the increment by which allocated memory is to
 *          be increased each time more memory is required.
 *
 *          While using H5Fcreate() to create a core file, if the \p
 *          backing_store is set to 1 (TRUE), the file contents are flushed to a
 *          file with the same name as this core file when the file is closed or
 *          access to the file is terminated in memory.
 *
 *          The application is allowed to open an existing file with #H5FD_CORE
 *          driver. While using H5Fopen() to open an existing file, if the \p
 *          backing_store is set to 1 (TRUE) and the \c flags for H5Fopen() is set to
 *          #H5F_ACC_RDWR, any change to the file contents are saved to the file
 *          when the file is closed. If \p backing_store is set to 0 (FALSE) and the \c
 *          flags for H5Fopen() is set to #H5F_ACC_RDWR, any change to the file
 *          contents will be lost when the file is closed. If the flags for
 *          H5Fopen() is set to #H5F_ACC_RDONLY, no change to the file is
 *          allowed either in memory or on file.
 *
 * \note Currently this driver cannot create or open family or multi files.
 *
 * \since 1.4.0
 *
  }
function H5Pset_fapl_core(fapl_id:Thid_t; increment:Tsize_t; backing_store:Thbool_t):Therr_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \brief Queries core file driver properties
 *
 * \fapl_id
 * \param[out] increment Size, in bytes, of memory increments
 * \param[out] backing_store Boolean flag indicating whether to write the file
 *             contents to disk when the file is closed
 * \returns \herr_t
 *
 * \details H5Pget_fapl_core() queries the #H5FD_CORE driver properties as set
 *          by H5Pset_fapl_core().
 *
 * \since 1.4.0
 *
  }
{out }{out }function H5Pget_fapl_core(fapl_id:Thid_t; increment:Psize_t; backing_store:Phbool_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function H5FD_CORE : longint; { return type might be wrong }
  begin
    H5FD_CORE:=H5FD_core_init;
  end;


end.
