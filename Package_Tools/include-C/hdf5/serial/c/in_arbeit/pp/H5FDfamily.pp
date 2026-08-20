
unit H5FDfamily;
interface

{
  Automatically converted by H2Pas 1.0.0 from H5FDfamily.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    H5FDfamily.h
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
Phid_t  = ^hid_t;
Phsize_t  = ^hsize_t;
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
 *              Monday, August  4, 1999
 *
 * Purpose:	The public header file for the family driver.
  }
{$ifndef H5FDfamily_H}
{$define H5FDfamily_H}

{ was #define dname def_expr }
function H5FD_FAMILY : longint; { return type might be wrong }

{ C++ extern C conditionnal removed }
function H5FD_family_init:Thid_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \brief Sets the file access property list to use the family driver
 *
 * \fapl_id
 * \param[in] memb_size Size in bytes of each file member
 * \param[in] memb_fapl_id Identifier of file access property list for
 *            each family member
 * \returns \herr_t
 *
 * \details H5Pset_fapl_family() sets the file access property list identifier,
 *          \p fapl_id, to use the family driver.
 *
 *          \p memb_size is the size in bytes of each file member. This size
 *          will be saved in file when the property list \p fapl_id is used to
 *          create a new file. If \p fapl_id is used to open an existing file,
 *          \p memb_size has to be equal to the original size saved in file. A
 *          failure with an error message indicating the correct member size
 *          will be returned if \p memb_size does not match the size saved. If
 *          any user does not know the original size, #H5F_FAMILY_DEFAULT can be
 *          passed in. The library will retrieve the saved size.
 *
 *          \p memb_fapl_id is the identifier of the file access property list
 *          to be used for each family member.
 *
 * \version 1.8.0 Behavior of the \p memb_size parameter was changed.
 * \since 1.4.0
 *
  }
function H5Pset_fapl_family(fapl_id:Thid_t; memb_size:Thsize_t; memb_fapl_id:Thid_t):Therr_t;cdecl;external;
{*
 * \ingroup FAPL
 *
 * \brief Returns file access property list information
 *
 * \fapl_id
 * \param[out] memb_size Size in bytes of each file member
 * \param[out] memb_fapl_id Identifier of file access property list for
 *             each family member
 * \returns \herr_t
 *
 * \details H5Pget_fapl_family() returns file access property list for use with
 *          the family driver. This information is returned through the output
 *          parameters.
 *
 * \since 1.4.0
 *
  }
{out }{out }function H5Pget_fapl_family(fapl_id:Thid_t; memb_size:Phsize_t; memb_fapl_id:Phid_t):Therr_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation

{ was #define dname def_expr }
function H5FD_FAMILY : longint; { return type might be wrong }
  begin
    H5FD_FAMILY:=H5FD_family_init;
  end;


end.
