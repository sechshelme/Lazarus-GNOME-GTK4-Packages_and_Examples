
unit gstvkconfig;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstvkconfig.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstvkconfig.h
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


{ gstvkconfig.h
 *
 * This is a generated file.  Please modify `gstvkconfig.h.meson'
  }
{$ifndef __GST_VULKAN_CONFIG_H__}
{$define __GST_VULKAN_CONFIG_H__}
{$include <gst/gst.h>}

const
  GST_VULKAN_HAVE_WINDOW_XCB = 1;  
  GST_VULKAN_HAVE_WINDOW_WAYLAND = 1;  
  GST_VULKAN_HAVE_WINDOW_COCOA = 0;  
  GST_VULKAN_HAVE_WINDOW_IOS = 0;  
  GST_VULKAN_HAVE_WINDOW_WIN32 = 0;  
  GST_VULKAN_HAVE_WINDOW_ANDROID = 0;  
  GST_VULKAN_HAVE_VIDEO_EXTENSIONS = 1;  
{$endif}
{ __GST_VULKAN_CONFIG_H__  }

implementation


end.
