unit semaphore;

interface

uses
  fp_magiccore;

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

procedure SemaphoreComponentTerminus;cdecl;external libmagiccore;
function SemaphoreComponentGenesis:TMagickBooleanType;cdecl;external libmagiccore;
function AllocateSemaphoreInfo:PSemaphoreInfo;cdecl;external libmagiccore;
procedure ActivateSemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external libmagiccore;
procedure DestroySemaphoreInfo(para1:PPSemaphoreInfo);cdecl;external libmagiccore;
procedure LockSemaphoreInfo(para1:PSemaphoreInfo);cdecl;external libmagiccore;
procedure SemaphoreComponentTerminus;cdecl;external libmagiccore;
procedure UnlockSemaphoreInfo(para1:PSemaphoreInfo);cdecl;external libmagiccore;

// === Konventiert am: 6-1-26 19:17:31 ===


implementation



end.
