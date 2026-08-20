unit H5Cpublic;

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
{-------------------------------------------------------------------------
 *
 * Created:	H5Cpublic.h
 *              June 4, 2005
 *              John Mainzer
 *
 * Purpose:     Public include file for cache functions.
 *
 *-------------------------------------------------------------------------
  }
{$ifndef H5Cpublic_H}
{$define H5Cpublic_H}
{ Public headers needed by this file  }
{$include "H5public.h"}
{ C++ extern C conditionnal removed }
{*<Automatic cache size increase is disabled, and the remaining increment fields are ignored. }
{*<Automatic cache size increase is enabled using the hit rate threshold algorithm. }
type
  TH5C_cache_incr_mode =  Longint;
  Const
    H5C_incr__off = 0;
    H5C_incr__threshold = 1;

{*<Flash cache size increase is disabled. }
{*<Flash cache size increase is enabled using the add space algorithm. }
type
  TH5C_cache_flash_incr_mode =  Longint;
  Const
    H5C_flash_incr__off = 0;
    H5C_flash_incr__add_space = 1;

{*<Automatic cache size decrease is disabled. }
{*<Automatic cache size decrease is enabled  using the hit rate threshold algorithm. }
{*<Automatic cache size decrease is enabled using the ageout algorithm.  }
{*<Automatic cache size decrease is enabled using the ageout with hit rate threshold algorithm. }
type
  TH5C_cache_decr_mode =  Longint;
  Const
    H5C_decr__off = 0;
    H5C_decr__threshold = 1;
    H5C_decr__age_out = 2;
    H5C_decr__age_out_with_threshold = 3;

{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 20-8-26 19:37:30 ===


implementation



end.
