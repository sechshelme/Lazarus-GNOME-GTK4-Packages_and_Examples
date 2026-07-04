unit gdktypes;

interface

uses
  fp_glib2, fp_cairo, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GDK_CURRENT_TIME = 0;

type
  PGdkRectangle = ^TGdkRectangle;
  TGdkRectangle = Tcairo_rectangle_int_t;

type
  PGdkCicpParams = type Pointer;
  PGdkColorState = type Pointer;
  PGdkContentFormats = type Pointer;
  PGdkCursor = type Pointer;
  PGdkTexture = type Pointer;
  PGdkTextureDownloader = type Pointer;
  PGdkDevice = type Pointer;
  PGdkDrag = type Pointer;
  PGdkDrop = type Pointer;
  PGdkClipboard = type Pointer;
  PGdkDisplayManager = type Pointer;
  PGdkDisplay = type Pointer;
  PGdkSurface = type Pointer;
  PGdkAppLaunchContext = type Pointer;
  PGdkSnapshot = type Pointer;
  PGdkDrawContext = type Pointer;
  PGdkCairoContext = type Pointer;
  PGdkGLContext = type Pointer;
  PGdkVulkanContext = type Pointer;
  PGdkDmabufFormats = type Pointer;
  PGdkDmabufTexture = type Pointer;

  PPGdkKeymapKey = ^PGdkKeymapKey;
  PGdkKeymapKey = ^TGdkKeymapKey;
  TGdkKeymapKey = record
    keycode: Tguint;
    group: longint;
    level: longint;
  end;


  // === Konventiert am: 2-7-26 19:29:17 ===


implementation



end.
