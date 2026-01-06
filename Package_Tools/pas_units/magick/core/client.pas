unit client;

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

  MagickCore client methods.
 }
{$ifndef MAGICKCORE_CLIENT_H}
{$define MAGICKCORE_CLIENT_H}

function GetClientPath:Pchar;cdecl;external libmagiccore;
function GetClientName:Pchar;cdecl;external libmagiccore;
function SetClientName(para1:Pchar):Pchar;cdecl;external libmagiccore;
function SetClientPath(para1:Pchar):Pchar;cdecl;external libmagiccore;
{$if defined(__cplusplus) || defined(c_plusplus)}

// === Konventiert am: 6-1-26 19:23:00 ===


implementation



end.
