unit gstvkconfig;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GST_VULKAN_HAVE_WINDOW_XCB = 1;
  GST_VULKAN_HAVE_WINDOW_WAYLAND = 1;
  GST_VULKAN_HAVE_WINDOW_COCOA = 0;
  GST_VULKAN_HAVE_WINDOW_IOS = 0;
  GST_VULKAN_HAVE_WINDOW_WIN32 = 0;
  GST_VULKAN_HAVE_WINDOW_ANDROID = 0;
  GST_VULKAN_HAVE_VIDEO_EXTENSIONS = 1;
  {$ENDIF read_enum}

  // === Konventiert am: 17-7-26 15:37:08 ===


implementation



end.
