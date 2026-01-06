/*
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
*/
#ifndef MAGICKCORE_WIDGET_H
#define MAGICKCORE_WIDGET_H

#if defined(MAGICKCORE_X11_DELEGATE)
#include "magick/xwindow-private.h"
#endif


#if defined(MAGICKCORE_X11_DELEGATE)
extern  int
  XCommandWidget(Display *,XWindows *,const char *const *,XEvent *);
extern  int
  XConfirmWidget(Display *,XWindows *,const char *,const char *);
extern  int
  XDialogWidget(Display *,XWindows *,const char *,const char *,char *);
extern  int
  XMenuWidget(Display *,XWindows *,const char *,const char *const *,char *);

extern  MagickBooleanType
  XPreferencesWidget(Display *,XResourceInfo *,XWindows *);

extern  void
  DestroyXWidget(void);
extern  void
  XColorBrowserWidget(Display *,XWindows *,const char *,char *);
extern  void
  XFileBrowserWidget(Display *,XWindows *,const char *,char *);
extern  void
  XFontBrowserWidget(Display *,XWindows *,const char *,char *);
extern  void
  XInfoWidget(Display *,XWindows *,const char *);
extern  void
  XListBrowserWidget(Display *,XWindows *,XWindowInfo *,const char *const *,
    const char *,const char *,char *);
extern  void
  XNoticeWidget(Display *,XWindows *,const char *,const char *);
extern  void
  XProgressMonitorWidget(Display *,XWindows *,const char *,
    const MagickOffsetType,const MagickSizeType);
extern  void
  XTextViewWidget(Display *,const XResourceInfo *,XWindows *,
    const MagickBooleanType,const char *,const char **);

/*xxxxxxxxxxxxx
static inline void XTextViewHelp(Display *display,
  const XResourceInfo *resource_info,XWindows *windows,
  const MagickBooleanType mono,const char *title,const char *help)
{
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
*/

#endif


