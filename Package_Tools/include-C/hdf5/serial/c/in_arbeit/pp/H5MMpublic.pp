
unit H5MMpublic;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5MMpublic.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5MMpublic.h
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
PH5MM_allocate_t  = ^H5MM_allocate_t;
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
{-------------------------------------------------------------------------
 *
 * Created:             H5MMpublic.h
 *
 * Purpose:             Public declarations for the H5MM (memory management)
 *                      package.
 *
 *-------------------------------------------------------------------------
  }
{$ifndef H5MMpublic_H}
{$define H5MMpublic_H}
{ Public headers needed by this file  }
{$include "H5public.h"}
{ These typedefs are currently used for VL datatype allocation/freeing  }
{! <!-- [H5MM_allocate_t_snip] --> }
type
  PH5MM_allocate_t = ^TH5MM_allocate_t;
  TH5MM_allocate_t = function (size:Tsize_t; alloc_info:pointer):pointer;cdecl;
{! <!-- [H5MM_allocate_t_snip] --> }
{! <!-- [H5MM_free_t_snip] --> }

  TH5MM_free_t = procedure (mem:pointer; free_info:pointer);cdecl;
{! <!-- [H5MM_free_t_snip] --> }
{ C++ extern C conditionnal removed }
{ C++ end of extern C conditionnal removed }
{$endif}
{ H5MMpublic_H  }

implementation


end.
