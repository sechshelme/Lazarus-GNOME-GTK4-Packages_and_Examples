
unit librist_config;
interface

{
  Automatically converted by H2Pas 1.0.0 from librist_config.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    librist_config.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2021, VideoLAN and librist authors
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef LIBRIST_CONFIG_H}
{$define LIBRIST_CONFIG_H}

const
  HAVE_SRP_SUPPORT = 1;  
{$endif}
{ LIBRIST_CONFIG_H  }

implementation


end.
