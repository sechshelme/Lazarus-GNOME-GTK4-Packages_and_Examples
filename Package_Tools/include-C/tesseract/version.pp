
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


{ SPDX-License-Identifier: Apache-2.0 }
{ File:        version.h }
{ Description: Version information }
{ }
{ (C) Copyright 2018, Google Inc. }
{ Licensed under the Apache License, Version 2.0 (the "License"); }
{ you may not use this file except in compliance with the License. }
{ You may obtain a copy of the License at }
{ http://www.apache.org/licenses/LICENSE-2.0 }
{ Unless required by applicable law or agreed to in writing, software }
{ distributed under the License is distributed on an "AS IS" BASIS, }
{ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{ See the License for the specific language governing permissions and }
{ limitations under the License. }
{$ifndef TESSERACT_API_VERSION_H_}
{$define TESSERACT_API_VERSION_H_}
{ clang-format off }

const
  TESSERACT_MAJOR_VERSION = 5;  
  TESSERACT_MINOR_VERSION = 3;  
  TESSERACT_MICRO_VERSION = 4;  
  TESSERACT_VERSION = ((TESSERACT_MAJOR_VERSION shl 16) or (TESSERACT_MINOR_VERSION shl 8)) or TESSERACT_MICRO_VERSION;  
  TESSERACT_VERSION_STR = '5.3.4';  
{ clang-format on }
{$endif}
{ TESSERACT_API_VERSION_H_ }

implementation


end.
