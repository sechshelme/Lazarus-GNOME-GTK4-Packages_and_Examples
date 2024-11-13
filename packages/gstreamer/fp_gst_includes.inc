
{$include gst/gst.inc}                      // io.
{$include gst/gstconfig.inc}                // io.
{$include gst/gstobject.inc}                // io. -> gstconfig
{$include gst/gstminiobject.inc}            // io.
{$include gst/gstenumtypes.inc}             // io.
{$include gst/gsterror.inc}                 // io.
{$include gst/gstversion.inc}               // io.
{$include gst/gstchildproxy.inc}            // io.
{$include gst/gstparamspecs.inc}            // io.
{$include gst/gstcontrolsource.inc}         // io.
{$include gst/gstpreset.inc}                // io.
{$include gst/gsttracerrecord.inc}          // io.
{$include gst/gstpoll.inc}                  // io.
{$include gst/gstelementmetadata.inc}       // io.
{$include gst/gsttracerfactory.inc}         // io.
{$include gst/gstatomicqueue.inc}           // io.
{$include gst/gstmemory.inc}                // io.
{$include gst/gstallocator.inc}             // io. -> gstmemory
{$include gst/gstcontrolbinding.inc}        // io. -> gstobject, gstconfig
{$include gst/gstclock.inc}                 // io.
{$include gst/gstsystemclock.inc}           // io. -> gstclock
{$include gst/gstinfo.inc}                  // io.         Makros entfernt
{$include gst/gstdatetime.inc}              // io.
{$include gst/gststructure.inc}             // io. -> gstdatetime
{$include gst/gstcontext.inc}               // io. -> gststructure
{$include gst/gsttaskpool.inc}              // io.
{$include gst/gsttask.inc}                  // io. -> gsttaskpool,
{$include gst/gstbytearrayinterface.inc}    // io.    ( move() )
{$include gst/gstmeta.inc}                  // io. -> gststructure, gstbytearrayinterface
{$include gst/gstcapsfeatures.inc}          // io.
{$include gst/gstcaps.inc}                  // io. -> gststructure, gstcapsfeatures
{$include gst/gstdevice.inc}                // io. -> gstcaps, gststructure
{$include gst/gstbuffer.inc}                // io. -> gstmemory, gstallocator, gstmeta, gstcaps, gstclock
{$include gst/gststreamcollection.inc}      // io.
{$include gst/gstiterator.inc}              // io.
{$include gst/gstformat.inc}                // io. -> gstiterator
{$include gst/gstsegment.inc}               // io. -> gstformat
{$include gst/gstbufferlist.inc}            // io.
{$include gst/gstsample.inc}                // io. -> gstbuffer, gstcaps, gstsegment, gststructure, gstbufferlist
{$include gst/gsttaglist.inc}               // io. -> gstdatetime, gstsample
{$include gst/gsttagsetter.inc}             // io. -> gsttaglist
{$include gst/gsttoc.inc}                   // io. -> gsttaglist
{$include gst/gsttocsetter.inc}             // io. -> gsttoc
{$include gst/gstplugin.inc}                // io. -> gststructure
{$include gst/gsttracer.inc}                // io. -> gstplugin
{$include gst/gstpluginfeature.inc}         // io. -> gstplugin
{$include gst/gstpadtemplate.inc}           // io. -> gstcaps          // ( PGstPad = Pointer ) wegen Kompflickt
{$include gst/gstevent.inc}                 // io. -> gststructure, gstsegment, gststreamcollection, gstcaps, gsttaglist, gsttoc, gstformat, gstclock
{$include gst/gstpad.inc}                   // io. -> gstpadtemplate, gsttask, gstbufferlist, gstevent, gstiterator, gstcaps, gstbuffer
{$include gst/gstbufferpool.inc}            // io. -> gstformat, gststructure, gstbuffer, gstallocator, gstcaps, gstpad
{$include gst/gstquery.inc}                 // io. -> gstformat, gststructure, gstcaps, gstallocator, gstbufferpool, gstpad, gstcontext
{$include gst/gstmessage.inc}               // io. -> gststructure, gsttaglist, gstquery, gstformat, gstclock, gsttoc, gstcontext, gstevent, gstdevice, gststreamcollection
{$include gst/gstbus.inc}                   // io. -> gstmessage
{$include gst/gststreams.inc}               // io. -> gstcaps, gstevent, gsttaglist
{$include gst/gstelement.inc}               // io. -> gststructure, gstbus, gstclock, gstmessage, gstpad, gstcontext, gstdevice, gstcaps, gstpadtemplate, gstiterator, gstconfig, gstevent, gstformat, gstsegment; Makros entfernt
{$include gst/gsturi.inc}                   // io. -> gstelement
{$include gst/gstelementfactory.inc}        // io. -> gstelement, gsturi, gstplugin, gstpluginfeature, gstcaps
{$include gst/gstparse.inc}                 // io. -> gstelement
{$include gst/gstbin.inc}                   // io. -> gstelement, gstbus, gstclock, gstmessage, gstiterator
{$include gst/gstutils.inc}                 // io. -> gstelement, gstcaps, gstformat, gstpad, gstpadtemplate, gstsegment, gstbin, gstparse        Makros entfernt
{$include gst/gstvalue.inc}                 // io. -> gstcaps, gstcapsfeatures, gststructure, gstbuffer, gstdatetime
{$include gst/gstdeviceprovider.inc}        // io. -> gstbus, gstdevice
{$include gst/gstdeviceproviderfactory.inc} // io. -> gstdeviceprovider, gstplugin, gstpluginfeature
{$include gst/gsttypefind.inc}              // io. -> gstcaps, gstplugin
{$include gst/gstghostpad.inc}              // io. -> gstpad, gstpadtemplate, gstiterator, gstbufferlist
{$include gst/gstregistry.inc}              // io. -> gstplugin, gstpluginfeature
{$include gst/gstdebugutils.inc}            // io. -> gstbin
{$include gst/gstpipeline.inc}              // io. -> gstbin, gstclock, gstelement, gstbus
{$include gst/gstdynamictypefactory.inc}    // io. -> gstplugin
{$include gst/gstpromise.inc}               // io. -> gststructure
{$include gst/gstcompat.inc}                // io. -> gstmessage, gstpad, gstevent, gstcaps, gstbuffer
{$include gst/gstdevicemonitor.inc}         // io. -> gstbus, gstcaps
{$include gst/gstprotection.inc}            // io. -> gstmeta, gststructure, gstbuffer
{$include gst/gsttypefindfactory.inc}       // io. -> gsttypefind, gstcaps



//{$include gobject/gtype.inc}                   // io.


