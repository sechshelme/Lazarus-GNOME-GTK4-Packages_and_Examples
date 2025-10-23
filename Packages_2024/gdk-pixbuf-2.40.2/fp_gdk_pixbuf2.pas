unit fp_gdk_pixbuf2;

interface

uses
  fp_glib2,
  fp_gmodule;

const
  {$IFDEF Linux}
  libgdk_pixbuf2 = 'libgdk_pixbuf-2.0';
  libgdk_pixbuf_xlib2 = 'libgdk_pixbuf_xlib-2.0';  // Nur Linux
  {$ENDIF}

  {$IFDEF Windows}
  libgdk_pixbuf2 = 'libgdk_pixbuf-2.0-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include pixbuf/gdk_pixbuf_core.inc}
  {$include pixbuf/gdk_pixbuf_features.inc}
  {$include pixbuf/gdk_pixbuf_macros.inc}
  {$include pixbuf/gdk_pixbuf_animation.inc}
  {$include pixbuf/gdk_pixbuf_io.inc}
  {$include pixbuf/gdk_pixbuf_loader.inc}
  {$include pixbuf/gdk_pixbuf_enum_types.inc}
  {$include pixbuf/gdk_pixbuf_marshal.inc}
  {$include pixbuf/gdk_pixbuf_simple_anim.inc}
  {$include pixbuf/gdk_pixbuf_transform.inc}
  {$include pixbuf/gdk_pixdata.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include pixbuf/gdk_pixbuf_core.inc}
{$include pixbuf/gdk_pixbuf_features.inc}
{$include pixbuf/gdk_pixbuf_macros.inc}
{$include pixbuf/gdk_pixbuf_animation.inc}
{$include pixbuf/gdk_pixbuf_io.inc}
{$include pixbuf/gdk_pixbuf_loader.inc}
{$include pixbuf/gdk_pixbuf_enum_types.inc}
{$include pixbuf/gdk_pixbuf_marshal.inc}
{$include pixbuf/gdk_pixbuf_simple_anim.inc}
{$include pixbuf/gdk_pixbuf_transform.inc}
{$include pixbuf/gdk_pixdata.inc}
{$UNDEF read_implementation}

end.
