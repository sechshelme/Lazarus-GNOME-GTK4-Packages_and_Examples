unit wand_view;

interface

uses
  fp_magiccore, fp_magicwand;

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

  MagickWand wand view methods.
 }
{$ifndef MAGICKWAND_WAND_VIEW_H}
{$define MAGICKWAND_WAND_VIEW_H}
type

  TDuplexTransferWandViewMethod = function (para1:PWandView; para2:PWandView; para3:PWandView; para4:Tssize_t; para5:longint; 
               para6:pointer):TMagickBooleanType;cdecl;

  TGetWandViewMethod = function (para1:PWandView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;

  TSetWandViewMethod = function (para1:PWandView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;

  TTransferWandViewMethod = function (para1:PWandView; para2:PWandView; para3:Tssize_t; para4:longint; para5:pointer):TMagickBooleanType;cdecl;

  TUpdateWandViewMethod = function (para1:PWandView; para2:Tssize_t; para3:longint; para4:pointer):TMagickBooleanType;cdecl;

function GetWandViewException(para1:PWandView; para2:PExceptionType):Pchar;cdecl;external libmagicwand;
function DuplexTransferWandViewIterator(para1:PWandView; para2:PWandView; para3:PWandView; para4:TDuplexTransferWandViewMethod; para5:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function GetWandViewIterator(para1:PWandView; para2:TGetWandViewMethod; para3:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function IsWandView(para1:PWandView):TMagickBooleanType;cdecl;external libmagicwand;
function SetWandViewIterator(para1:PWandView; para2:TSetWandViewMethod; para3:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function TransferWandViewIterator(para1:PWandView; para2:PWandView; para3:TTransferWandViewMethod; para4:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function UpdateWandViewIterator(para1:PWandView; para2:TUpdateWandViewMethod; para3:pointer):TMagickBooleanType;cdecl;external libmagicwand;
function GetWandViewWand(para1:PWandView):PMagickWand;cdecl;external libmagicwand;
function GetWandViewPixels(para1:PWandView):^PPixelWand;cdecl;external libmagicwand;
function GetWandViewExtent(para1:PWandView):TRectangleInfo;cdecl;external libmagicwand;
procedure SetWandViewDescription(para1:PWandView; para2:Pchar);cdecl;external libmagicwand;
procedure SetWandViewThreads(para1:PWandView; para2:Tsize_t);cdecl;external libmagicwand;
function CloneWandView(para1:PWandView):PWandView;cdecl;external libmagicwand;
function DestroyWandView(para1:PWandView):PWandView;cdecl;external libmagicwand;
function NewWandView(para1:PMagickWand):PWandView;cdecl;external libmagicwand;
function NewWandViewExtent(para1:PMagickWand; para2:Tssize_t; para3:Tssize_t; para4:Tsize_t; para5:Tsize_t):PWandView;cdecl;external libmagicwand;
{$endif}

// === Konventiert am: 5-1-26 19:40:20 ===


implementation



end.
