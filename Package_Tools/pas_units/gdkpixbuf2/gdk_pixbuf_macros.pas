unit gdk_pixbuf_macros;

interface

uses
  glib280, GDK4, gdk_pixbuf_features;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


    function GDK_PIXBUF_CHECK_VERSION(major, minor, micro: Integer): Boolean;

implementation

    function GDK_PIXBUF_CHECK_VERSION(major, minor, micro: Integer): Boolean;
    begin
      Result := (GDK_PIXBUF_MAJOR > major) or
                ((GDK_PIXBUF_MAJOR = major) and (GDK_PIXBUF_MINOR > minor)) or
                ((GDK_PIXBUF_MAJOR = major) and (GDK_PIXBUF_MINOR = minor) and
                 (GDK_PIXBUF_MICRO >= micro));
    end;


end.
