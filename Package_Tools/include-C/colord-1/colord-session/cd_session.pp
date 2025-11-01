
unit cd_session;
interface

{
  Automatically converted by H2Pas 1.0.0 from cd_session.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cd_session.h
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
PCdSessionError  = ^CdSessionError;
PCdSessionInteraction  = ^CdSessionInteraction;
PCdSessionStatus  = ^CdSessionStatus;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2012 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$ifndef __CD_SESSION_H}
{$define __CD_SESSION_H}
{$include <glib.h>}

const
  CD_SESSION_DBUS_SERVICE = 'org.freedesktop.ColorHelper';  
  CD_SESSION_DBUS_PATH = '/';  
  CD_SESSION_DBUS_INTERFACE = 'org.freedesktop.ColorHelper';  
  CD_SESSION_DBUS_INTERFACE_DISPLAY = 'org.freedesktop.ColorHelper.Display';  
{*
 * CdSessionStatus:
 *
 * The session status.
 * }
type
  PCdSessionStatus = ^TCdSessionStatus;
  TCdSessionStatus =  Longint;
  Const
    CD_SESSION_STATUS_IDLE = 0;
    CD_SESSION_STATUS_WAITING_FOR_INTERACTION = 1;
    CD_SESSION_STATUS_RUNNING = 2;
;
{*
 * CdSessionInteraction:
 *
 * The interaction required from the user.
 * }
type
  PCdSessionInteraction = ^TCdSessionInteraction;
  TCdSessionInteraction =  Longint;
  Const
    CD_SESSION_INTERACTION_ATTACH_TO_SCREEN = 0;
    CD_SESSION_INTERACTION_MOVE_TO_CALIBRATION = 1;
    CD_SESSION_INTERACTION_MOVE_TO_SURFACE = 2;
    CD_SESSION_INTERACTION_SHUT_LAPTOP_LID = 3;
    CD_SESSION_INTERACTION_NONE = 4;
;
{*
 * CdSessionError:
 *
 * Errors returned from the calibration helper.
  }
type
  PCdSessionError = ^TCdSessionError;
  TCdSessionError =  Longint;
  Const
    CD_SESSION_ERROR_NONE = 0;
    CD_SESSION_ERROR_INTERNAL = 1;
    CD_SESSION_ERROR_FAILED_TO_FIND_DEVICE = 2;
    CD_SESSION_ERROR_FAILED_TO_FIND_SENSOR = 3;
    CD_SESSION_ERROR_FAILED_TO_FIND_TOOL = 4;
    CD_SESSION_ERROR_FAILED_TO_GENERATE_PROFILE = 5;
    CD_SESSION_ERROR_FAILED_TO_GET_WHITEPOINT = 6;
    CD_SESSION_ERROR_FAILED_TO_OPEN_PROFILE = 7;
    CD_SESSION_ERROR_FAILED_TO_SAVE_PROFILE = 8;
    CD_SESSION_ERROR_INVALID_VALUE = 9;
    CD_SESSION_ERROR_LAST = 10;
;
{$endif}
{ __CD_SESSION_H  }

implementation


end.
