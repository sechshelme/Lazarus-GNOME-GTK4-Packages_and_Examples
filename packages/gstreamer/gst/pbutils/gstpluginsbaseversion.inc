/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_PLUGINS_BASE_VERSION_MAJOR = 1;  
  GST_PLUGINS_BASE_VERSION_MINOR = 24;
  GST_PLUGINS_BASE_VERSION_MICRO = 2;
  GST_PLUGINS_BASE_VERSION_NANO = 0;
{ xxxxxxxxxxxxxxxxxxxxxxxxxxxx }
{
#define	GST_CHECK_PLUGINS_BASE_VERSION(major,minor,micro)	\
    (GST_PLUGINS_BASE_VERSION_MAJOR > (major) || \
     (GST_PLUGINS_BASE_VERSION_MAJOR == (major) && GST_PLUGINS_BASE_VERSION_MINOR > (minor)) || \
     (GST_PLUGINS_BASE_VERSION_MAJOR == (major) && GST_PLUGINS_BASE_VERSION_MINOR == (minor) && \
      GST_PLUGINS_BASE_VERSION_MICRO >= (micro)) || \
     (GST_PLUGINS_BASE_VERSION_MAJOR == (major) && GST_PLUGINS_BASE_VERSION_MINOR == (minor) && \
      GST_PLUGINS_BASE_VERSION_MICRO + 1 == (micro) && GST_PLUGINS_BASE_VERSION_NANO > 0))
 }

procedure gst_plugins_base_version(major:Pguint; minor:Pguint; micro:Pguint; nano:Pguint);cdecl;external libgstpbutils;
function gst_plugins_base_version_string:Pgchar;cdecl;external libgstpbutils;

// === Konventiert am: 27-9-24 16:15:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
