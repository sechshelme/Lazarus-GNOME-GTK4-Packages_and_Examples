
unit H5FDstdio;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDstdio.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDstdio.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

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
 * Purpose:	The public header file for the sec2 driver.
  }
{$ifndef H5FDstdio_H}
{$define H5FDstdio_H}
{$include "H5Ipublic.h"}

{ was #define dname def_expr }
function H5FD_STDIO : longint; { return type might be wrong }

{ C++ extern C conditionnal removed }
function H5FD_stdio_init:Thid_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \brief Sets the standard I/O driver
 *
 * \fapl_id
 * \returns \herr_t
 *
 * \details H5Pset_fapl_stdio() modifies the file access property list to use
 *          the standard I/O driver, H5FDstdio.
 *
 * \since 1.4.0
 *
  }
function H5Pset_fapl_stdio(fapl_id:Thid_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function H5FD_STDIO : longint; { return type might be wrong }
  begin
    H5FD_STDIO:=H5FD_stdio_init;
  end;


end.
