program project1;

// diff /usr/include/glib-2.0/gio/gioenumtypes.h /home/tux/include_neu/glib-2.0/gio/gioenumtypes.h > test.diff


uses
  giotypes,
  gioenums,
  gioenumtypes,
  gaction,
  gactiongroup,
  gactiongroupexporter,
  gactionmap,
  gappinfo,
  gasyncinitable,
  gasyncresult,
  ginputstream,
  goutputstream,
  giostream,
  gfileoutputstream,
  gapplicationcommandline,
  gapplication,
  gfilterinputstream,                 // GInputStream
  gfilteroutputstream,                // GOutputStream
  gbufferedinputstream,               // GFilterInputStream
  gbufferedoutputstream,              // GFilterOutputStream
  gbytesicon,
  gcancellable,
  gcharsetconverter,
  gcontenttype,
  gconverter,
  gconverterinputstream,              // GFilterInputStream
  gconverteroutputstream,             // GFilterOutputStream
  gcredentials,
  gdatagrambased,
  gdatainputstream,                   // GBufferedInputStream
  gdataoutputstream,                  // GFilterOutputStream
  gdbusactiongroup,
  gdbusaddress,
  gdbusauthobserver,
  gdbusintrospection,                 // diverse struct
  gdbusconnection,
  gdbuserror,
  gdbusinterface,
  gdbusinterfaceskeleton,
  gdbusmenumodel,
  gdbusmessage,
  gdbusmethodinvocation,
  gdbusnameowning,
  gdbusnamewatching,
  gdbusproxy,
  gdbusobject,
  gdbusobjectproxy,
  gdbusobjectmanager,
  gdbusobjectmanagerclient,
  gdbusobjectmanagerserver,
  gdbusobjectskeleton,
  gdbusserver,
  gdbusutils,
  gdebugcontrollerdbus,
  gdebugcontroller,
  gmountoperation,
  gmount,
  gdrive,
  gtlsbackend,
  gtlscertificate,
  gtlspassword,
  gtlsconnection,                     // GIOStream
  gtlsinteraction,
  gtlsclientconnection,
  gtlsdatabase,
  gtlsfiledatabase,
  gtlsserverconnection,
  gdtlsclientconnection,
  gdtlsconnection,
  gdtlsserverconnection,
  gemblem,
  gemblemedicon,
  gfilemonitor,
  gfileattribute,
  gfileenumerator,
  gfileinputstream,                   // GInputStream
  gfile,
  gfileiostream,                      // GIOStream
  gfileicon,
  gfileinfo,
  gfilenamecompleter,
  gicon,
  ginetaddress,
  ginetaddressmask,
  gsocketaddress,
  ginetsocketaddress,                 // GSocketAddress
  ginitable,
  gioerror,
  giomodule,
  gioscheduler,
  gsocketcontrolmessage,
  gsocket,
  gsocketaddressenumerator,
  gsocketconnection,                  // GIOStream
  gsocketclient,
  gsocketconnectable,
  gsocketlistener,
  gsocketservice,                     // GSocketListener
  giptosmessage,                      // GSocketControlMessage
  gipv6tclassmessage,                 // GSocketControlMessage
  glistmodel,
  gliststore,
  gloadableicon,
  gmemoryinputstream,                 // GInputStream
  gmemorymonitor,
  gmemoryoutputstream,                // GOutputStream
  gmenumodel,
  gmenu,
  gmenuexporter,
  gnativesocketaddress,               // GSocketAddress
  gvolume,
  gvolumemonitor,
  gnativevolumemonitor,               // GVolumeMonitor
  gnetworkaddress,
  gnetworking,
  gnetworkmonitor,
  gnetworkservice,
  gnotification,
  gpermission,
  gpollableinputstream,
  gpollableoutputstream,
  gpollableutils,
  gpowerprofilemonitor,
  gpropertyaction,
  gproxy,
  gproxyaddress,                      // GInetSocketAddress
  gproxyaddressenumerator,            // GSocketAddressEnumerator
  gproxyresolver,
  gremoteactiongroup,
  gresolver,
  gresource,
  gseekable,
  gsettingsbackend,
  gsettingsschema,
  gsettings,
  gsimpleaction,
  gsimpleactiongroup,
  gsimpleasyncresult,
  gsimpleiostream,
  gsimplepermission,
  gsimpleproxyresolver,
  gsrvtarget,
  gsubprocess,
  gsubprocesslauncher,
  gtask,
  gtcpconnection,                     // GSocketConnectionClass
  gtcpwrapperconnection,              // GTcpConnection
  gtestdbus,
  gthemedicon,
  gthreadedsocketservice,             // GSocketService


  gunixconnection,
  gunixcredentialsmessage,
  gunixfdlist,
  gunixsocketaddress,
  gvfs,
  gzlibcompressor,
  gzlibdecompressor,

  fp_glib2;

  procedure main;
  var
    list: PPgchar;
    i: integer = 0;
    v: Pgchar;
  begin
    list := g_listenv;
    if list <> nil then begin
      while list[i] <> nil do begin
        v := g_getenv(list[i]);
        g_printf('%3d. %-30s   %s'#10, i, list[i], v);
        Inc(i);
      end;
      g_free(list);
    end;
  end;

begin
  main;
end.
