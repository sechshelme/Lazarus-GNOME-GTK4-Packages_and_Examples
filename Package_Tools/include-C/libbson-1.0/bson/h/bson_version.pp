
unit bson_version;
interface

{
  Automatically converted by H2Pas 1.0.0 from bson_version.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    bson_version
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
 * Copyright 2013 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$if !defined(BSON_INSIDE) && !defined(BSON_COMPILATION)}
{$error "Only <bson/bson.h> can be included directly."}
{$endif}
{ clang-format off }
{$ifndef BSON_VERSION_H}
{$define BSON_VERSION_H}
{*
 * BSON_MAJOR_VERSION:
 *
 * BSON major version component (e.g. 1 if %BSON_VERSION is 1.2.3)
  }

const
  BSON_MAJOR_VERSION = 1;  
{*
 * BSON_MINOR_VERSION:
 *
 * BSON minor version component (e.g. 2 if %BSON_VERSION is 1.2.3)
  }
  BSON_MINOR_VERSION = 26;  
{*
 * BSON_MICRO_VERSION:
 *
 * BSON micro version component (e.g. 3 if %BSON_VERSION is 1.2.3)
  }
  BSON_MICRO_VERSION = 0;  
{*
 * BSON_PRERELEASE_VERSION:
 *
 * BSON prerelease version component (e.g. pre if %BSON_VERSION is 1.2.3-pre)
  }
{*
 * BSON_VERSION:
 *
 * BSON version.
  }
  BSON_VERSION = 1.26.0;  
{*
 * BSON_VERSION_S:
 *
 * BSON version, encoded as a string, useful for printing and
 * concatenation.
  }
  BSON_VERSION_S = '1.26.0';  
{*
 * BSON_VERSION_HEX:
 *
 * BSON version, encoded as an hexadecimal number, useful for
 * integer comparisons.
  }
  BSON_VERSION_HEX = ((BSON_MAJOR_VERSION shl 24) or (BSON_MINOR_VERSION shl 16)) or (BSON_MICRO_VERSION shl 8);  
{*
 * BSON_CHECK_VERSION:
 * @major: required major version
 * @minor: required minor version
 * @micro: required micro version
 *
 * Compile-time version checking. Evaluates to %TRUE if the version
 * of BSON is greater than or equal to the required one.
  }

implementation


end.
