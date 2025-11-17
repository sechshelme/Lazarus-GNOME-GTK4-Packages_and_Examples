
unit gphoto2_port_result;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_port_result.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_port_result.h
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
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file gphoto2-port-result.h
 *
 * Copyright 2001 Lutz Mueller <lutz@users.sf.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_PORT_RESULT_H}
{$define LIBGPHOTO2_GPHOTO2_PORT_RESULT_H}
{ Return values. gphoto2-port should only return values from 0 to -99  }
{*
 * \brief Everything is OK
 *
 * Note that this is also the value 0, and every error is negative (lower).
  }

const
  GP_OK = 0;  
{*
 * \brief Generic Error
  }
  GP_ERROR = -(1);  
{*
 * \brief Bad parameters passed
  }
  GP_ERROR_BAD_PARAMETERS = -(2);  
{*
 * \brief Out of memory
  }
  GP_ERROR_NO_MEMORY = -(3);  
{*
 * \brief Error in the camera driver
  }
  GP_ERROR_LIBRARY = -(4);  
{*
 * \brief Unknown libgphoto2 port passed
  }
  GP_ERROR_UNKNOWN_PORT = -(5);  
{*
 * \brief Functionality not supported
  }
  GP_ERROR_NOT_SUPPORTED = -(6);  
{*
 * \brief Generic I/O error
  }
  GP_ERROR_IO = -(7);  
{*
 * \brief Buffer overflow of internal structure
  }
  GP_ERROR_FIXED_LIMIT_EXCEEDED = -(8);  
{*
 * \brief Operation timed out
  }
  GP_ERROR_TIMEOUT = -(10);  
{*
 * \brief Serial ports not supported
  }
  GP_ERROR_IO_SUPPORTED_SERIAL = -(20);  
{*
 * \brief USB ports not supported
  }
  GP_ERROR_IO_SUPPORTED_USB = -(21);  
{*
 * \brief Error initializing I/O
  }
  GP_ERROR_IO_INIT = -(31);  
{*
 * \brief I/O during read
  }
  GP_ERROR_IO_READ = -(34);  
{*
 * \brief I/O during write
  }
  GP_ERROR_IO_WRITE = -(35);  
{*
 * \brief I/O during update of settings
  }
  GP_ERROR_IO_UPDATE = -(37);  
{*
 * \brief Specified serial speed not possible.
  }
  GP_ERROR_IO_SERIAL_SPEED = -(41);  
{*
 * \brief Error during USB Clear HALT
  }
  GP_ERROR_IO_USB_CLEAR_HALT = -(51);  
{*
 * \brief Error when trying to find USB device
  }
  GP_ERROR_IO_USB_FIND = -(52);  
{*
 * \brief Error when trying to claim the USB device
  }
  GP_ERROR_IO_USB_CLAIM = -(53);  
{*
 * \brief Error when trying to lock the device
  }
  GP_ERROR_IO_LOCK = -(60);  
{*
 * \brief Unspecified error when talking to HAL
  }
  GP_ERROR_HAL = -(70);  
{ C++ extern C conditionnal removed }
{ __cplusplus  }
(* Const before type ignored *)

function gp_port_result_as_string(result:longint):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_PORT_RESULT_H)  }

implementation


end.
