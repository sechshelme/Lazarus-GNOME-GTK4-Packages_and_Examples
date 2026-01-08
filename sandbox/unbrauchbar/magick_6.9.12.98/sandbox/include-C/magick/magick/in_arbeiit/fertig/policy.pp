
unit policy;
interface

{
  Automatically converted by H2Pas 1.0.0 from policy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    policy.h
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
PExceptionInfo  = ^ExceptionInfo;
PFILE  = ^FILE;
PPolicyDomain  = ^PolicyDomain;
PPolicyInfo  = ^PolicyInfo;
PPolicyRights  = ^PolicyRights;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore security policy methods.
 }
{$ifndef MAGICKCORE_POLICY_H}
{$define MAGICKCORE_POLICY_H}
{$include "magick/pixel.h"}
{$include "magick/exception.h"}
type
  PPolicyDomain = ^TPolicyDomain;
  TPolicyDomain =  Longint;
  Const
    UndefinedPolicyDomain = 0;
    CoderPolicyDomain = 1;
    DelegatePolicyDomain = 2;
    FilterPolicyDomain = 3;
    PathPolicyDomain = 4;
    ResourcePolicyDomain = 5;
    SystemPolicyDomain = 6;
    CachePolicyDomain = 7;
    ModulePolicyDomain = 8;
;
type
  PPolicyRights = ^TPolicyRights;
  TPolicyRights =  Longint;
  Const
    UndefinedPolicyRights = $00;
    NoPolicyRights = $00;
    ReadPolicyRights = $01;
    WritePolicyRights = $02;
    ExecutePolicyRights = $04;
    AllPolicyRights = $ff;
;
type
(* Const before type ignored *)

function GetPolicyValue(name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function GetPolicyList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function GetPolicyInfoList(para1:Pchar; para2:Psize_t; para3:PExceptionInfo):^PPolicyInfo;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function IsRightsAuthorized(para1:TPolicyDomain; para2:TPolicyRights; para3:Pchar):TMagickBooleanType;cdecl;external;
function ListPolicyInfo(para1:PFILE; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
function PolicyComponentGenesis:TMagickBooleanType;cdecl;external;
(* Const before type ignored *)
function SetMagickSecurityPolicy(para1:Pchar; para2:PExceptionInfo):TMagickBooleanType;cdecl;external;
procedure PolicyComponentTerminus;cdecl;external;

implementation


end.
