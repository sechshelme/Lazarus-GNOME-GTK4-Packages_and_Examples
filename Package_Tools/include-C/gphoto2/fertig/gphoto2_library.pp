
unit gphoto2_library;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_library.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_library.h
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
PCamera  = ^Camera;
PCameraAbilitiesList  = ^CameraAbilitiesList;
PCameraText  = ^CameraText;
PGPContext  = ^GPContext;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 * \brief Camery driver header.
 *
 * \author Copyright 2000 Scott Fritzinger
 *
 * \note
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \note
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \note
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_LIBRARY_H}
{$define LIBGPHOTO2_GPHOTO2_LIBRARY_H}
{$include <gphoto2/gphoto2-abilities-list.h>}
{$include <gphoto2/gphoto2-camera.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief Returns a unique id for the camera driver.
 *
 * \param id a #CameraText
 * \return a gphoto2 error code
 *
 * }
type

  TCameraLibraryIdFunc = function (id:PCameraText):longint;cdecl;
{*
 * \brief Adds the abilities of the supported models to the supplied list.
 *
 * \param list a #CameraAbilitiesList
 * \return a gphoto2 error code
 *
 * }

  TCameraLibraryAbilitiesFunc = function (list:PCameraAbilitiesList):longint;cdecl;
{*
 * \brief Initializes the camera.
 *
 * \param camera a #Camera
 * \param context a #GPContext
 * \return a gphoto2 error code
 *
 * The camera driver will establish a first connection
 * to the camera and configure the camera variable (i.e. using
 * #gp_filesystem_set_list_funcs or #gp_port_get_settings).
 *
 * }

  TCameraLibraryInitFunc = function (camera:PCamera; context:PGPContext):longint;cdecl;
{
 * If you want to write a camera library, you need to implement
 * the following three functions. Everything else should be declared
 * as static.
  }

function camera_id(id:PCameraText):longint;cdecl;external;
function camera_abilities(list:PCameraAbilitiesList):longint;cdecl;external;
function camera_init(camera:PCamera; context:PGPContext):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_LIBRARY_H)  }

implementation


end.
