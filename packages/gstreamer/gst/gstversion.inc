/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


const
  GST_VERSION_MAJOR = 1;
  GST_VERSION_MINOR = 24;
  GST_VERSION_MICRO = 2;
  GST_VERSION_NANO = 0;

function GST_CHECK_VERSION(major, minor, micro: longint): Tgboolean;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_CHECK_VERSION(major, minor, micro: longint): Tgboolean;
begin
  Result := (GST_VERSION_MAJOR > major) or
    ((GST_VERSION_MAJOR = major) and (GST_VERSION_MINOR > minor)) or
    ((GST_VERSION_MAJOR = major) and (GST_VERSION_MINOR = minor) and (GST_VERSION_MICRO >= micro));
end;


{$ENDIF read_implementation}
