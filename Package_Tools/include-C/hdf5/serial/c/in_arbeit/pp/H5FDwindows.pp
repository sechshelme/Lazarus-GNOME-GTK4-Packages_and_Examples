
unit H5FDwindows;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDwindows.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDwindows.h
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
 * Programmer:  Scott Wegner
 *		Based on code by Robb Matzke
 *              Thursday, May 24 2007
 *
 * Purpose:	The public header file for the windows driver.
  }
{$ifndef H5FDwindows_H}
{$define H5FDwindows_H}

{ was #define dname def_expr }
function H5FD_WINDOWS : longint; { return type might be wrong }

{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \ingroup FAPL
 *
 * \brief Sets the Windows I/O driver
 *
 * \fapl_id
 * \returns \herr_t
 *
 * \details H5Pset_fapl_windows() sets the default HDF5 Windows I/O driver on
 *          Windows systems.
 *
 *          Since the HDF5 library uses this driver, #H5FD_WINDOWS, by default
 *          on Windows systems, it is not normally necessary for a user
 *          application to call H5Pset_fapl_windows(). While it is not
 *          recommended, there may be times when a user chooses to set a
 *          different HDF5 driver, such as the standard I/O driver (#H5FD_STDIO)
 *          or the sec2 driver (#H5FD_SEC2), in a Windows
 *          application. H5Pset_fapl_windows() is provided so that the
 *          application can return to the Windows I/O driver when the time
 *          comes.
 *
 *          Only the Windows driver is tested on Windows systems; other drivers
 *          are used at the application’s and the user’s risk.
 *
 *          Furthermore, the Windows driver is tested and available only on
 *          Windows systems; it is not available on non-Windows systems.
 *
 * \since 1.8.0
 *
  }
function H5Pset_fapl_windows(fapl_id:Thid_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ H5FDwindows_H  }

implementation

{ was #define dname def_expr }
function H5FD_WINDOWS : longint; { return type might be wrong }
  begin
    H5FD_WINDOWS:=H5FD_sec2_init;
  end;


end.
