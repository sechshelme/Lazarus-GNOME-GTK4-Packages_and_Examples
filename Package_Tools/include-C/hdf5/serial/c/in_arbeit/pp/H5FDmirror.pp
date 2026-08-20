
unit H5FDmirror;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDmirror.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDmirror.h
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
PH5FD_mirror_fapl_t  = ^H5FD_mirror_fapl_t;
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
 * Purpose: Public, shared definitions for Mirror VFD & remote Writer.
  }
{$ifndef H5FDmirror_H}
{$define H5FDmirror_H}
{$ifdef H5_HAVE_MIRROR_VFD}

{ was #define dname def_expr }
function H5FD_MIRROR : longint; { return type might be wrong }

{ C++ extern C conditionnal removed }
{ ============================================================================
 * Mirror VFD use and operation.
 * ============================================================================
  }
{ ---------------------------------------------------------------------------
 * Structure:   H5FD_mirror_fapl_t
 *
 * Used to pass configuration information to the Mirror VFD.
 * Populate components as appropriate and pass structure pointer to
 * `H5Pset_fapl_mirror()`.
 *
 * `magic` (uint32_t)
 *      Semi-unique number to sanity-check pointers to this structure type.
 *      MUST equal H5FD_MIRROR_FAPL_MAGIC to be considered valid.
 *
 * `version` (uint32_t)
 *      Indicates expected components of the structure.
 *
 * `handshake_port (int)
 *      Port number to expect to reach the "Mirror Server" on the remote host.
 *
 * `remote_ip` (char[])
 *      IP address string of "Mirror Server" remote host.
 * ---------------------------------------------------------------------------
  }
const
  H5FD_MIRROR_FAPL_MAGIC = $F8DD514C;  
  H5FD_MIRROR_CURR_FAPL_T_VERSION = 1;  
  H5FD_MIRROR_MAX_IP_LEN = 32;  
type
  PH5FD_mirror_fapl_t = ^TH5FD_mirror_fapl_t;
  TH5FD_mirror_fapl_t = record
      magic : Tuint32_t;
      version : Tuint32_t;
      handshake_port : longint;
      remote_ip : array[0..(H5FD_MIRROR_MAX_IP_LEN+1)-1] of char;
    end;

function H5FD_mirror_init:Thid_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \todo Add missing documentation
  }
function H5Pget_fapl_mirror(fapl_id:Thid_t; fa_out:PH5FD_mirror_fapl_t):Therr_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \todo Add missing documentation
  }
function H5Pset_fapl_mirror(fapl_id:Thid_t; fa:PH5FD_mirror_fapl_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$else}
{ H5_HAVE_MIRROR_VFD  }

const
  H5FD_MIRROR = H5I_INAVLID_HID;  
{$endif}
{ H5_HAVE_MIRROR_VFD  }
{$endif}
{ H5FDmirror_H  }

implementation

{ was #define dname def_expr }
function H5FD_MIRROR : longint; { return type might be wrong }
  begin
    H5FD_MIRROR:=H5FD_mirror_init;
  end;


end.
