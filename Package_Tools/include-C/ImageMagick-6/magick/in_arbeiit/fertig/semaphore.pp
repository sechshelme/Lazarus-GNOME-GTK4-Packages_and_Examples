
unit semaphore;
interface

{
  Automatically converted by H2Pas 1.0.0 from semaphore.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    semaphore.h
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
PSemaphoreInfo  = ^SemaphoreInfo;
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

  MagickCore methods to lock and unlock semaphores.
 }
type

procedure SemaphoreComponentTerminus;cdecl;external;
function SemaphoreComponentGenesis:TMagickBooleanType;cdecl;external;
function AllocateSemaphoreInfo:PSemaphoreInfo;cdecl;external;
procedure ActivateSemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external;
procedure DestroySemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external;
procedure LockSemaphoreInfo(para1:PSemaphoreInfo);cdecl;external;
procedure SemaphoreComponentTerminus;cdecl;external;
procedure UnlockSemaphoreInfo(para1:PSemaphoreInfo);cdecl;external;

implementation


end.
