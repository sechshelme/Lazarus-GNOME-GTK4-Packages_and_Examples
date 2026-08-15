
unit version;
interface

{
  Automatically converted by H2Pas 1.0.0 from version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    version.h
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
 * Copyright © 2020, VideoLAN and librist authors
 * Copyright © 2019-2020 SipRadius LLC
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef LIBRIST_VERSION_H}
{$define LIBRIST_VERSION_H}

const
  LIBextern_VERSION_MAJOR = 4;  
  LIBextern_VERSION_MINOR = 4;  
  LIBextern_VERSION_PATCH = 0;  
  LIBextern_VERSION = $40400;  
{Helper macro to check against LIBextern_VERSION }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LIBRIST_MAKE_API_VERSION(major,minor,patch : longint) : longint;

{$endif}
{ LIBRIST_VERSION_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBRIST_MAKE_API_VERSION(major,minor,patch : longint) : longint;
begin
  LIBRIST_MAKE_API_VERSION:=(Tpatch(+(minor*$100)))+(major*$10000);
end;


end.
