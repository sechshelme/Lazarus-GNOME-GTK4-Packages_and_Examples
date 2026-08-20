
unit H5FDmpi;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDmpi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDmpi
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
PH5FD_mpio_chunk_opt_t  = ^H5FD_mpio_chunk_opt_t;
PH5FD_mpio_collective_opt_t  = ^H5FD_mpio_collective_opt_t;
PH5FD_mpio_xfer_t  = ^H5FD_mpio_xfer_t;
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
 * Programmer:  Quincey Koziol
 *              Friday, January 30, 2004
 *
 * Purpose:	The public header file for common items for all MPI VFL drivers
  }
{$ifndef H5FDmpi_H}
{$define H5FDmpi_H}
{**** Macros for One linked collective IO case. **** }
{ The default value to do one linked collective IO for all chunks.
   If the average number of chunks per process is greater than this value,
      the library will create an MPI derived datatype to link all chunks to do collective IO.
      The user can set this value through an API.  }

const
  H5D_ONE_LINK_CHUNK_IO_THRESHOLD = 0;  
{**** Macros for multi-chunk collective IO case. **** }
{ The default value of the threshold to do collective IO for this chunk.
   If the average percentage of processes per chunk is greater than the default value,
   collective IO is done for this chunk.
 }
  H5D_MULTI_CHUNK_IO_COL_THRESHOLD = 60;  
{*
 * Type of I/O for data transfer properties
  }
{*< Use independent I/O access  }
{*< Use collective I/O access  }
type
  PH5FD_mpio_xfer_t = ^TH5FD_mpio_xfer_t;
  TH5FD_mpio_xfer_t =  Longint;
  Const
    H5FD_MPIO_INDEPENDENT = 0;
    H5FD_MPIO_COLLECTIVE = 1;
;
{ Type of chunked dataset I/O  }
{zero is the default }
type
  PH5FD_mpio_chunk_opt_t = ^TH5FD_mpio_chunk_opt_t;
  TH5FD_mpio_chunk_opt_t =  Longint;
  Const
    H5FD_MPIO_CHUNK_DEFAULT = 0;
    H5FD_MPIO_CHUNK_ONE_IO = 1;
    H5FD_MPIO_CHUNK_MULTI_IO = 2;
;
{ Type of collective I/O  }
{zero is the default }
type
  PH5FD_mpio_collective_opt_t = ^TH5FD_mpio_collective_opt_t;
  TH5FD_mpio_collective_opt_t =  Longint;
  Const
    H5FD_MPIO_COLLECTIVE_IO = 0;
    H5FD_MPIO_INDIVIDUAL_IO = 1;
;
{ Include all the MPI VFL headers  }
{$include "H5FDmpio.h" /* MPI I/O file driver			*/}
{$endif}
{ H5FDmpi_H  }

implementation


end.
