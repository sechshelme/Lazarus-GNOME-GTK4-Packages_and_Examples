
unit widget;
interface

{
  Automatically converted by H2Pas 1.0.0 from widget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    widget.h
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
PDisplay  = ^Display;
PXEvent  = ^XEvent;
PXResourceInfo  = ^XResourceInfo;
PXWindowInfo  = ^XWindowInfo;
PXWindows  = ^XWindows;
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

  MagickCore X11 widget methods.
 }
{$ifndef MAGICKCORE_WIDGET_H}
{$define MAGICKCORE_WIDGET_H}
{$if defined(MAGICKCORE_X11_DELEGATE)}
{$include "magick/xwindow-private.h"}
{$endif}
{$if defined(MAGICKCORE_X11_DELEGATE)}
(* Const before type ignored *)
(* Const before abstract_declarator ignored *)

function XCommandWidget(para1:PDisplay; para2:PXWindows; para3:PPchar; para4:PXEvent):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function XConfirmWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function XDialogWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar; para5:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before abstract_declarator ignored *)
function XMenuWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:PPchar; para5:Pchar):longint;cdecl;external;
function XPreferencesWidget(para1:PDisplay; para2:PXResourceInfo; para3:PXWindows):TMagickBooleanType;cdecl;external;
procedure DestroyXWidget;cdecl;external;
(* Const before type ignored *)
procedure XColorBrowserWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external;
(* Const before type ignored *)
procedure XFileBrowserWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external;
(* Const before type ignored *)
procedure XFontBrowserWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external;
(* Const before type ignored *)
procedure XInfoWidget(para1:PDisplay; para2:PXWindows; para3:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before abstract_declarator ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure XListBrowserWidget(para1:PDisplay; para2:PXWindows; para3:PXWindowInfo; para4:PPchar; para5:Pchar; 
            para6:Pchar; para7:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure XNoticeWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure XProgressMonitorWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:TMagickOffsetType; para5:TMagickSizeType);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure XTextViewWidget(para1:PDisplay; para2:PXResourceInfo; para3:PXWindows; para4:TMagickBooleanType; para5:Pchar; 
            para6:PPchar);cdecl;external;
{xxxxxxxxxxxxx
static inline void XTextViewHelp(Display *display,
  const XResourceInfo *resource_info,XWindows *windows,
  const MagickBooleanType mono,const char *title,const char *help)

  char
    **help_list;

  ssize_t
    i;

  help_list=StringToList(help);
  if (help_list == (char **) NULL)
    return;
  XTextViewWidget(display,resource_info,windows,mono,title,(const char **)
    help_list);
  for (i=0; help_list[i] != (char *) NULL; i++)
    help_list[i]=DestroyString(help_list[i]);
  help_list=(char **) RelinquishMagickMemory(help_list);

 }
{$endif}

implementation


end.
