
unit H5FDhdfs;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDhdfs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDhdfs.h
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
PH5FD_hdfs_fapl_t  = ^H5FD_hdfs_fapl_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright by The HDF Group.                                               *
 *                                                                           *
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
 * Programmer:  Jacob Smith
 *              2018-04-23
 *
 * Purpose:    The public header file for the hdfs driver.
  }
{$ifndef H5FDhdfs_H}
{$define H5FDhdfs_H}
{$ifdef H5_HAVE_LIBHDFS}

{ was #define dname def_expr }
function H5FD_HDFS : longint; { return type might be wrong }

{$else}
{ H5_HAVE_LIBHDFS  }

const
  H5FD_HDFS = H5I_INVALID_HID;  
{$endif}
{ H5_HAVE_LIBHDFS  }
{***************************************************************************
 *
 * Structure: H5FD_hdfs_fapl_t
 *
 * Purpose:
 *
 *     H5FD_hdfs_fapl_t is a public structure that is used to pass
 *     configuration information to the appropriate HDFS VFD via the FAPL.
 *     A pointer to an instance of this structure is a parameter to
 *     H5Pset_fapl_hdfs() and H5Pget_fapl_hdfs().
 *
 *
 *
 * `version` (int32_t)
 *
 *     Version number of the `H5FD_hdfs_fapl_t` structure.  Any instance passed
 *     to the above calls must have a recognized version number, or an error
 *     will be flagged.
 *
 *     This field should be set to `H5FD__CURR_HDFS_FAPL_T_VERSION`.
 *
 * `namenode_name` (const char[])
 *
 *     Name of "Name Node" to access as the HDFS server.
 *
 *     Must not be longer than `H5FD__HDFS_NODE_NAME_SPACE`.
 *
 *     TBD: Can be NULL.
 *
 * `namenode_port` (int32_t) TBD
 *
 *     Port number to use to connect with Name Node.
 *
 *     TBD: If 0, uses a default port.
 *
 * `kerberos_ticket_cache` (const char[])
 *
 *     Path to the location of the Kerberos authentication cache.
 *
 *     Must not be longer than `H5FD__HDFS_KERB_CACHE_PATH_SPACE`.
 *
 *     TBD: Can be NULL.
 *
 * `user_name` (const char[])
 *
 *     Username to use when accessing file.
 *
 *     Must not be longer than `H5FD__HDFS_USER_NAME_SPACE`.
 *
 *     TBD: Can be NULL.
 *
 * `stream_buffer_size` (int32_t)
 *
 *     Size (in bytes) of the file read stream buffer.
 *
 *     TBD: If -1, relies on a default value.
 *
 *
 *
 * Programmer: Jacob Smith
 *             2018-04-23
 *
 *************************************************************************** }

const
  H5FD__CURR_HDFS_FAPL_T_VERSION = 1;  
  H5FD__HDFS_NODE_NAME_SPACE = 128;  
  H5FD__HDFS_USER_NAME_SPACE = 128;  
  H5FD__HDFS_KERB_CACHE_PATH_SPACE = 128;  
type
  PH5FD_hdfs_fapl_t = ^TH5FD_hdfs_fapl_t;
  TH5FD_hdfs_fapl_t = record
      version : Tint32_t;
      namenode_name : array[0..(H5FD__HDFS_NODE_NAME_SPACE+1)-1] of char;
      namenode_port : Tint32_t;
      user_name : array[0..(H5FD__HDFS_USER_NAME_SPACE+1)-1] of char;
      kerberos_ticket_cache : array[0..(H5FD__HDFS_KERB_CACHE_PATH_SPACE+1)-1] of char;
      stream_buffer_size : Tint32_t;
    end;
{ C++ extern C conditionnal removed }

function H5FD_hdfs_init:Thid_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \todo Add missing documentation
  }
function H5Pget_fapl_hdfs(fapl_id:Thid_t; fa_out:PH5FD_hdfs_fapl_t):Therr_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \todo Add missing documentation
  }
function H5Pset_fapl_hdfs(fapl_id:Thid_t; fa:PH5FD_hdfs_fapl_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ ifndef H5FDhdfs_H  }

implementation

{ was #define dname def_expr }
function H5FD_HDFS : longint; { return type might be wrong }
  begin
    H5FD_HDFS:=H5FD_hdfs_init;
  end;


end.
