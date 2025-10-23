
{$IFDEF read_interface}


    function GDK_PIXBUF_CHECK_VERSION(major, minor, micro: Integer): Boolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

    function GDK_PIXBUF_CHECK_VERSION(major, minor, micro: Integer): Boolean;
    begin
      Result := (GDK_PIXBUF_MAJOR > major) or
                ((GDK_PIXBUF_MAJOR = major) and (GDK_PIXBUF_MINOR > minor)) or
                ((GDK_PIXBUF_MAJOR = major) and (GDK_PIXBUF_MINOR = minor) and
                 (GDK_PIXBUF_MICRO >= micro));
    end;


{$ENDIF read_implementation}
