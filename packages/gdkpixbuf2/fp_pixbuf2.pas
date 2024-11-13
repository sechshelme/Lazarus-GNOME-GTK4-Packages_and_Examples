unit fp_pixbuf2;

interface

uses
  ctypes,
  glib280,
  gmodule;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include pixbuf/gdk_pixbuf_core.inc}
{$include pixbuf/gdk_pixbuf_features.inc}
{$include pixbuf/gdk_pixbuf_macros.inc}           // gdk_pixbuf_features
{$include pixbuf/gdk_pixbuf_animation.inc}
{$include pixbuf/gdk_pixbuf_io.inc}               // gdk_pixbuf_animation
{$include pixbuf/gdk_pixbuf_loader.inc}           // gdk_pixbuf_animation, gdk_pixbuf_io
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
{$include pixbuf/gdk_pixbuf_macros.inc}           // gdk_pixbuf_features
{$include pixbuf/gdk_pixbuf_animation.inc}
{$include pixbuf/gdk_pixbuf_io.inc}               // gdk_pixbuf_animation
{$include pixbuf/gdk_pixbuf_loader.inc}           // gdk_pixbuf_animation, gdk_pixbuf_io
{$include pixbuf/gdk_pixbuf_enum_types.inc}
{$include pixbuf/gdk_pixbuf_marshal.inc}
{$include pixbuf/gdk_pixbuf_simple_anim.inc}
{$include pixbuf/gdk_pixbuf_transform.inc}
{$include pixbuf/gdk_pixdata.inc}
{$UNDEF read_implementation}

end.
