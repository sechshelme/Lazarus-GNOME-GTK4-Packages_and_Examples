unit gstvkconfig;

interface

uses
  fp_glib2, fp_gst;

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

// === Konventiert am: 17-7-26 15:37:08 ===


implementation



end.
