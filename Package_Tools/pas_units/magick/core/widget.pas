unit widget;

interface

uses
  x, xlib, xutil, fp_magiccore, magick_type;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



function XCommandWidget(para1:PDisplay; para2:PXWindows; para3:PPchar; para4:PXEvent):longint;cdecl;external libmagiccore;
function XConfirmWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar):longint;cdecl;external libmagiccore;
function XDialogWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar; para5:Pchar):longint;cdecl;external libmagiccore;
function XMenuWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:PPchar; para5:Pchar):longint;cdecl;external libmagiccore;
function XPreferencesWidget(para1:PDisplay; para2:PXResourceInfo; para3:PXWindows):TMagickBooleanType;cdecl;external libmagiccore;
procedure DestroyXWidget;cdecl;external libmagiccore;
procedure XColorBrowserWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external libmagiccore;
procedure XFileBrowserWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external libmagiccore;
procedure XFontBrowserWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external libmagiccore;
procedure XInfoWidget(para1:PDisplay; para2:PXWindows; para3:Pchar);cdecl;external libmagiccore;
procedure XListBrowserWidget(para1:PDisplay; para2:PXWindows; para3:PXWindowInfo; para4:PPchar; para5:Pchar;
            para6:Pchar; para7:Pchar);cdecl;external libmagiccore;
procedure XNoticeWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:Pchar);cdecl;external libmagiccore;
procedure XProgressMonitorWidget(para1:PDisplay; para2:PXWindows; para3:Pchar; para4:TMagickOffsetType; para5:TMagickSizeType);cdecl;external libmagiccore;
procedure XTextViewWidget(para1:PDisplay; para2:PXResourceInfo; para3:PXWindows; para4:TMagickBooleanType; para5:Pchar; 
            para6:PPchar);cdecl;external libmagiccore;
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

// === Konventiert am: 6-1-26 15:47:44 ===


implementation



end.
