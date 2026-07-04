

{$include GDK/gdktypes.inc}
{$include GDK/gdkenums.inc}
{$include GDK/gdkenumtypes.inc}
{$include GDK/gdkrectangle.inc}
{$include GDK/gdkrgba.inc}
{$include GDK/gdkseat.inc}
{$include GDK/gdkapplaunchcontext.inc}
{$include GDK/gdkcairo.inc}
{$include GDK/gdkcairocontext.inc}
{$include GDK/gdkcicpparams.inc}
{$include GDK/gdkcontentformats.inc}
{$include GDK/gdkcontentprovider.inc}
{$include GDK/gdkcontentproviderimpl.inc}
{$include GDK/gdkcontentserializer.inc}
{$include GDK/gdkclipboard.inc}
{$include GDK/gdkcolorstate.inc}
{$include GDK/gdkcontentdeserializer.inc}
{$include GDK/gdkcursor.inc}
{$include GDK/gdkdevicetool.inc}
{$include GDK/gdkdevice.inc}
{$include GDK/gdkdevicepad.inc}
{$include GDK/gdkmonitor.inc}
{$include GDK/gdkevents.inc}
{$include GDK/gdkdisplay.inc}
{$include GDK/gdkdisplaymanager.inc}
{$include GDK/gdkdmabufformats.inc}
{$include GDK/gdkdmabuftexture.inc}
{$include GDK/gdkdmabuftexturebuilder.inc}
{$include GDK/gdkdrag.inc}
{$include GDK/gdkdragsurface.inc}
{$include GDK/gdkdragsurfacesize.inc}
{$include GDK/gdkdrawcontext.inc}
{$include GDK/gdkdrop.inc}
{$include GDK/gdkframetimings.inc}
{$include GDK/gdkframeclock.inc}
{$include GDK/gdkglcontext.inc}
{$include GDK/gdkgltexture.inc}
{$include GDK/gdkgltexturebuilder.inc}
{$include GDK/gdkkeys.inc}
{$include GDK/gdkkeysyms.inc}
{$include GDK/gdkmemorytexture.inc}
{$include GDK/gdkmemorytexturebuilder.inc}
{$include GDK/gdkpaintable.inc}
{$include GDK/gdkpango.inc}
{$include GDK/gdkpopuplayout.inc}
{$include GDK/gdkpopup.inc}
{$include GDK/gdksnapshot.inc}
{$include GDK/gdksurface.inc}
{$include GDK/gdktexture.inc}
{$include GDK/gdktexturedownloader.inc}
{$include GDK/gdktoplevellayout.inc}
{$include GDK/gdktoplevel.inc}
{$include GDK/gdktoplevelsize.inc}
{$include GDK/gdkvulkancontext.inc}

{$include GDK/deprecated/gdkpixbuf.inc}                  // io. -> gdktexture





// ==== GDK X11

{$IFDEF Linux}
{$include GDK/x11/gdkx11applaunchcontext.inc }
{$include GDK/x11/gdkx11device.inc }
{$include GDK/x11/gdkx11device_xi2.inc }
{$include GDK/x11/gdkx11devicemanager_xi2.inc }
{$include GDK/x11/gdkx11devicemanager.inc }
{$include GDK/x11/gdkx11screen.inc }
{$include GDK/x11/gdkx11display.inc }
{$include GDK/x11/gdkx11surface.inc }
{$include GDK/x11/gdkx11dnd.inc }
{$include GDK/x11/gdkx11glcontext.inc }
{$include GDK/x11/gdkx11monitor.inc }
{$include GDK/x11/gdkx11selection.inc }
{$include GDK/x11/gdkx11utils.inc }
{$include GDK/x11/gdkx11property.inc }
{$ENDIF}

// ====  GDK Wayland

{$IFDEF Linux}
{$include GDK/wayland/gdkwaylanddevice.inc }           // io.
{$include GDK/wayland/gdkwaylanddisplay.inc }          // io.
{$include GDK/wayland/gdkwaylandglcontext.inc }        // io.
{$include GDK/wayland/gdkwaylandmonitor.inc }          // io.
{$include GDK/wayland/gdkwaylandpopup.inc }            // io.
{$include GDK/wayland/gdkwaylandseat.inc }             // io.
{$include GDK/wayland/gdkwaylandsurface.inc }          // io.
{$include GDK/wayland/gdkwaylandtoplevel.inc }         // io.
{$ENDIF}

