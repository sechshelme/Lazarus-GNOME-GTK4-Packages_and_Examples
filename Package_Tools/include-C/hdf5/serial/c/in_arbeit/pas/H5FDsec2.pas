unit H5FDsec2;

interface

uses
  fp_hdf5;

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
{$ifndef H5FDsec2_H}
{$define H5FDsec2_H}

{ was #define dname def_expr }
function H5FD_SEC2 : longint; { return type might be wrong }

{ C++ extern C conditionnal removed }
function H5FD_sec2_init:Thid_t;cdecl;external libhdf5;
{*
 * \ingroup FAPL
 *
 * \brief Sets the sec2 driver
 *
 * \fapl_id
 * \returns \herr_t
 *
 * \details H5Pset_fapl_sec2() modifies the file access property list to use
 *          the sec2 driver, H5FDsec2.
 *
 * \since 1.4.0
 *
  }
function H5Pset_fapl_sec2(fapl_id:Thid_t):Therr_t;cdecl;external libhdf5;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 21-8-26 14:14:34 ===


implementation


{ was #define dname def_expr }
function H5FD_SEC2 : longint; { return type might be wrong }
  begin
    H5FD_SEC2:=H5FD_sec2_init;
  end;


end.
