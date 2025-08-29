unit wallpaper;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpWallpaperFlags = ^TXdpWallpaperFlags;
  TXdpWallpaperFlags = longint;

const
  XDP_WALLPAPER_FLAG_NONE = 0;
  XDP_WALLPAPER_FLAG_BACKGROUND = 1 shl 0;
  XDP_WALLPAPER_FLAG_LOCKSCREEN = 1 shl 1;
  XDP_WALLPAPER_FLAG_PREVIEW = 1 shl 2;

//  XDP_WALLPAPER_TARGET_BOTH = XDP_WALLPAPER_TARGET_BACKGROUND or XDP_WALLPAPER_TARGET_LOCKSCREEN;

procedure xdp_portal_set_wallpaper(portal: PXdpPortal; parent: PXdpParent; uri: pchar; flags: TXdpWallpaperFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_set_wallpaper_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:37:26 ===


implementation



end.
