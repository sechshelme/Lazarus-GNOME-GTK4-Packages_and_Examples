

{$include gio/giotypes.inc}
{$include gio/gioenums.inc}
{$include gio/gioenumtypes.inc}
{$include gio/gcancellable.inc}
{$include gio/gaction.inc}
{$include gio/gactiongroup.inc}
{$include gio/gactiongroupexporter.inc}
{$include gio/gactionmap.inc}
{$include gio/gappinfo.inc}
{$include gio/gasyncinitable.inc}
{$include gio/gasyncresult.inc}
{$include gio/ginputstream.inc}
{$include gio/goutputstream.inc}
{$include gio/giostream.inc}
{$include gio/gapplicationcommandline.inc}
{$include gio/gapplication.inc}
{$include gio/gfilterinputstream.inc}                 // GInputStream
{$include gio/gfilteroutputstream.inc}                // GOutputStream
{$include gio/gbufferedinputstream.inc}               // GFilterInputStream
{$include gio/gbufferedoutputstream.inc}              // GFilterOutputStream
{$include gio/gbytesicon.inc}
{$include gio/gcharsetconverter.inc}
{$include gio/gcontenttype.inc}
{$include gio/gconverter.inc}
{$include gio/gconverterinputstream.inc}              // GFilterInputStream
{$include gio/gconverteroutputstream.inc}             // GFilterOutputStream
{$include gio/gcredentials.inc}
{$include gio/gdatagrambased.inc}
{$include gio/gdatainputstream.inc}                   // GBufferedInputStream
{$include gio/gdataoutputstream.inc}                  // GFilterOutputStream
{$include gio/gdbusactiongroup.inc}
{$include gio/gdbusaddress.inc}
{$include gio/gdbusauthobserver.inc}
{$include gio/gdbusintrospection.inc}                 // diverse struct
{$include gio/gdbusconnection.inc}
{$include gio/gdbuserror.inc}
{$include gio/gdbusinterface.inc}
{$include gio/gdbusinterfaceskeleton.inc}
{$include gio/gdbusmenumodel.inc}
{$include gio/gdbusmessage.inc}
{$include gio/gdbusmethodinvocation.inc}
{$include gio/gdbusnameowning.inc}
{$include gio/gdbusnamewatching.inc}
{$include gio/gdbusproxy.inc}
{$include gio/gdbusobject.inc}
{$include gio/gdbusobjectproxy.inc}
{$include gio/gdbusobjectmanager.inc}
{$include gio/gdbusobjectmanagerclient.inc}
{$include gio/gdbusobjectmanagerserver.inc}
{$include gio/gdbusobjectskeleton.inc}
{$include gio/gdbusserver.inc}
{$include gio/gdbusutils.inc}
{$include gio/gdebugcontrollerdbus.inc}
{$include gio/gdebugcontroller.inc}
{$include gio/gmountoperation.inc}
{$include gio/gmount.inc}
{$include gio/gdrive.inc}
{$include gio/gsocketaddress.inc}
{$include gio/gsocketcontrolmessage.inc}
{$include gio/gsocket.inc}
{$include gio/gsocketaddressenumerator.inc}
{$include gio/gsocketconnection.inc}                  // GIOStream
{$include gio/gsocketclient.inc}
{$include gio/gsocketconnectable.inc}
{$include gio/gsocketlistener.inc}
{$include gio/gsocketservice.inc}                     // GSocketListener
{$include gio/gtlscertificate.inc}
{$include gio/gtlspassword.inc}
{$include gio/gtlsconnection.inc}                     // GIOStream
{$include gio/gtlsinteraction.inc}
{$include gio/gtlsclientconnection.inc}
{$include gio/gtlsdatabase.inc}
{$include gio/gtlsbackend.inc}
{$include gio/gtlsfiledatabase.inc}
{$include gio/gtlsserverconnection.inc}
{$include gio/gdtlsclientconnection.inc}
{$include gio/gdtlsconnection.inc}
{$include gio/gdtlsserverconnection.inc}
{$include gio/gemblem.inc}
{$include gio/gemblemedicon.inc}
{$include gio/gfilemonitor.inc}
{$include gio/gfileattribute.inc}
{$include gio/gfileenumerator.inc}
{$include gio/gfileinputstream.inc}                   // GInputStream
{$include gio/gfileoutputstream.inc}
{$include gio/gfileiostream.inc}                      // GIOStream
{$include gio/gfile.inc}
{$include gio/gfileicon.inc}
{$include gio/gfileinfo.inc}
{$include gio/gfilenamecompleter.inc}
{$include gio/gicon.inc}
{$include gio/ginetaddress.inc}
{$include gio/ginetaddressmask.inc}
{$include gio/ginetsocketaddress.inc}                 // GSocketAddress
{$include gio/ginitable.inc}
{$include gio/gioerror.inc}
{$include gio/giomodule.inc}
{$include gio/gioscheduler.inc}
{$include gio/giptosmessage.inc}                      // GSocketControlMessage
{$include gio/gipv6tclassmessage.inc}                 // GSocketControlMessage
{$include gio/glistmodel.inc}
{$include gio/gliststore.inc}
{$include gio/gloadableicon.inc}
{$include gio/gmemoryinputstream.inc}                 // GInputStream
{$include gio/gmemorymonitor.inc}
{$include gio/gmemoryoutputstream.inc}                // GOutputStream
{$include gio/gmenumodel.inc}
{$include gio/gmenu.inc}
{$include gio/gmenuexporter.inc}
{$include gio/gnativesocketaddress.inc}               // GSocketAddress
{$include gio/gvolume.inc}
{$include gio/gvolumemonitor.inc}
{$include gio/gnativevolumemonitor.inc}               // GVolumeMonitor
{$include gio/gnetworkaddress.inc}
{$include gio/gnetworking.inc}
{$include gio/gnetworkmonitor.inc}
{$include gio/gnetworkservice.inc}
{$include gio/gnotification.inc}
{$include gio/gpermission.inc}
{$include gio/gpollableinputstream.inc}
{$include gio/gpollableoutputstream.inc}
{$include gio/gpollableutils.inc}
{$include gio/gpowerprofilemonitor.inc}
{$include gio/gpropertyaction.inc}
{$include gio/gproxyaddress.inc}                      // GInetSocketAddress
{$include gio/gproxyaddressenumerator.inc}            // GSocketAddressEnumerator
{$include gio/gproxyresolver.inc}
{$include gio/gproxy.inc}
{$include gio/gremoteactiongroup.inc}
{$include gio/gresolver.inc}
{$include gio/gresource.inc}
{$include gio/gseekable.inc}
{$include gio/gsettingsbackend.inc}
{$include gio/gsettingsschema.inc}
{$include gio/gsettings.inc}
{$include gio/gsimpleaction.inc}
{$include gio/gsimpleactiongroup.inc}
{$include gio/gsimpleasyncresult.inc}
{$include gio/gsimpleiostream.inc}
{$include gio/gsimplepermission.inc}
{$include gio/gsimpleproxyresolver.inc}
{$include gio/gsrvtarget.inc}
{$include gio/gsubprocess.inc}
{$include gio/gsubprocesslauncher.inc}
{$include gio/gtask.inc}
{$include gio/gtcpconnection.inc}                     // GSocketConnection
{$include gio/gtcpwrapperconnection.inc}              // GTcpConnection
{$include gio/gtestdbus.inc}
{$include gio/gthemedicon.inc}
{$include gio/gthreadedsocketservice.inc}             // GSocketService
{$include gio/gunixconnection.inc}                    // GSocketConnection
{$include gio/gunixcredentialsmessage.inc}            // GSocketControlMessage
{$include gio/gunixfdlist.inc}
{$include gio/gunixsocketaddress.inc}                 // GSocketAddress
{$include gio/gvfs.inc}
{$include gio/gzlibcompressor.inc}
{$include gio/gzlibdecompressor.inc}


