
unit H5FDros3;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDros3.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDros3.h
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
PH5FD_ros3_fapl_t  = ^H5FD_ros3_fapl_t;
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
 * Read-Only S3 Virtual File Driver (VFD)
 *
 * Programmer:  John Mainzer
 *              2017-10-10
 *
 * Purpose:    The public header file for the ros3 driver.
  }
{$ifndef H5FDros3_H}
{$define H5FDros3_H}
{$ifdef H5_HAVE_ROS3_VFD}

{ was #define dname def_expr }
function H5FD_ROS3 : longint; { return type might be wrong }

{$else}

const
  H5FD_ROS3 = H5I_INVALID_HID;  
{$endif}
{ H5_HAVE_ROS3_VFD  }
{$ifdef H5_HAVE_ROS3_VFD}
{***************************************************************************
 *
 * Structure: H5FD_ros3_fapl_t
 *
 * Purpose:
 *
 *     H5FD_ros3_fapl_t is a public structure that is used to pass S3
 *     authentication data to the appropriate S3 VFD via the FAPL.  A pointer
 *     to an instance of this structure is a parameter to H5Pset_fapl_ros3()
 *     and H5Pget_fapl_ros3().
 *
 *
 *
 * `version` (int32_t)
 *
 *     Version number of the H5FD_ros3_fapl_t structure.  Any instance passed
 *     to the above calls must have a recognized version number, or an error
 *     will be flagged.
 *
 *     This field should be set to H5FD_CURR_ROS3_FAPL_T_VERSION.
 *
 * `authenticate` (hbool_t)
 *
 *     Flag TRUE or FALSE whether or not requests are to be authenticated
 *     with the AWS4 algorithm.
 *     If TRUE, `aws_region`, `secret_id`, and `secret_key` must be populated.
 *     If FALSE, those three components are unused.
 *
 * `aws_region` (char[])
 *
 *     String: name of the AWS "region" of the host, e.g. "us-east-1".
 *
 * `secret_id` (char[])
 *
 *     String: "Access ID" for the resource.
 *
 * `secret_key` (char[])
 *
 *     String: "Secret Access Key" associated with the ID and resource.
 *
 *************************************************************************** }

const
  H5FD_CURR_ROS3_FAPL_T_VERSION = 1;  
  H5FD_ROS3_MAX_REGION_LEN = 32;  
  H5FD_ROS3_MAX_SECRET_ID_LEN = 128;  
  H5FD_ROS3_MAX_SECRET_KEY_LEN = 128;  
type
  PH5FD_ros3_fapl_t = ^TH5FD_ros3_fapl_t;
  TH5FD_ros3_fapl_t = record
      version : Tint32_t;
      authenticate : Thbool_t;
      aws_region : array[0..(H5FD_ROS3_MAX_REGION_LEN+1)-1] of char;
      secret_id : array[0..(H5FD_ROS3_MAX_SECRET_ID_LEN+1)-1] of char;
      secret_key : array[0..(H5FD_ROS3_MAX_SECRET_KEY_LEN+1)-1] of char;
    end;
{ C++ extern C conditionnal removed }

function H5FD_ros3_init:Thid_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \todo Add missing documentation
  }
function H5Pget_fapl_ros3(fapl_id:Thid_t; fa_out:PH5FD_ros3_fapl_t):Therr_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \todo Add missing documentation
  }
function H5Pset_fapl_ros3(fapl_id:Thid_t; fa:PH5FD_ros3_fapl_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ H5_HAVE_ROS3_VFD  }
{$endif}
{ ifndef H5FDros3_H  }

implementation

{ was #define dname def_expr }
function H5FD_ROS3 : longint; { return type might be wrong }
  begin
    H5FD_ROS3:=H5FD_ros3_init;
  end;


end.
