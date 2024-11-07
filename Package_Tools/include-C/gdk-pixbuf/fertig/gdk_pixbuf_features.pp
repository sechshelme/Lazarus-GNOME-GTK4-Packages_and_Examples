
unit gdk_pixbuf_features;
interface

{
  Automatically converted by H2Pas 0.99.16 from gdk_pixbuf_features.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdk_pixbuf_features.h
}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __GDK_PIXBUF_FEATURES_H__}
{$define __GDK_PIXBUF_FEATURES_H__}
{$if defined(GDK_PIXBUF_DISABLE_SINGLE_INCLUDES) && !defined (GDK_PIXBUF_H_INSIDE) && !defined (GDK_PIXBUF_COMPILATION)}
{$error "Only <gdk-pixbuf/gdk-pixbuf.h> can be included directly."}
{$endif}
{$include <glib.h>}
{*
 * GDK_PIXBUF_MAJOR:
 * 
 * Major version of gdk-pixbuf library, that is the "0" in
 * "0.8.2" for example.
  }
{*
 * GDK_PIXBUF_MINOR:
 * 
 * Minor version of gdk-pixbuf library, that is the "8" in
 * "0.8.2" for example.
  }
{*
 * GDK_PIXBUF_MICRO:
 * 
 * Micro version of gdk-pixbuf library, that is the "2" in
 * "0.8.2" for example.
  }
{*
 * GDK_PIXBUF_VERSION:
 * 
 * Contains the full version of GdkPixbuf as a string.
 *
 * This is the version being compiled against; contrast with
 * `gdk_pixbuf_version`.
  }

const
  GDK_PIXBUF_MAJOR = 2;  
  GDK_PIXBUF_MINOR = 42;  
  GDK_PIXBUF_MICRO = 10;  
  GDK_PIXBUF_VERSION = '2.42.10';  
{ We prefix variable declarations so they can
 * properly get exported/imported from Windows DLLs.
  }
{*
 * gdk_pixbuf_major_version:
 * 
 * The major version number of the gdk-pixbuf library.  (e.g. in 
 * gdk-pixbuf version 1.2.5 this is 1.) 
 * 
 * 
 * This variable is in the library, so represents the
 * gdk-pixbuf library you have linked against. Contrast with the
 * `GDK_PIXBUF_MAJOR` macro, which represents the major version of the
 * gdk-pixbuf headers you have included.
  }
{*
 * gdk_pixbuf_minor_version:
 * 
 * The minor version number of the gdk-pixbuf library.  (e.g. in 
 * gdk-pixbuf version 1.2.5 this is 2.) 
 * 
 * 
 * This variable is in the library, so represents the
 * gdk-pixbuf library you have linked against. Contrast with the
 * `GDK_PIXBUF_MINOR` macro, which represents the minor version of the
 * gdk-pixbuf headers you have included.
  }
{*
 * gdk_pixbuf_micro_version:
 * 
 * The micro version number of the gdk-pixbuf library.  (e.g. in 
 * gdk-pixbuf version 1.2.5 this is 5.) 
 * 
 * 
 * This variable is in the library, so represents the
 * gdk-pixbuf library you have linked against. Contrast with the
 * `GDK_PIXBUF_MICRO` macro, which represents the micro version of the
 * gdk-pixbuf headers you have included.
  }
{*
 * gdk_pixbuf_version:
 * 
 * Contains the full version of the gdk-pixbuf library as a string.
 * This is the version currently in use by a running program.
  }
(* Const before declarator ignored *)
  var
    gdk_pixbuf_major_version : Tguint;cvar;external;
(* Const before declarator ignored *)
    gdk_pixbuf_minor_version : Tguint;cvar;external;
(* Const before declarator ignored *)
    gdk_pixbuf_micro_version : Tguint;cvar;external;
(* Const before declarator ignored *)
    gdk_pixbuf_version : Pansichar;cvar;external;
{$endif}
{ __GDK_PIXBUF_FEATURES_H__  }

implementation


end.
