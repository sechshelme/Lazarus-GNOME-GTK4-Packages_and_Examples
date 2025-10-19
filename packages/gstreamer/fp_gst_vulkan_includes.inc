


{$include gst/vulkan/vulkan_fwd.inc}
{$include gst/vulkan/vulkan_enumtypes.inc}              // io.
{$include gst/vulkan/gstvkdevice.inc}                   // io. -> gstvkbarrier
{$include gst/vulkan/gstvkbarrier.inc}                  // io.
{$include gst/vulkan/gstvkphysicaldevice.inc}           // io. -> gstvkdevice
{$include gst/vulkan/gstvkhandlepool.inc}               // io. -> gstvkdevice
{$include gst/vulkan/gstvkfence.inc}                    // io. -> gstvkdevice, gstvkhandlepool
{$include gst/vulkan/gstvkmemory.inc}                   // io. -> gstvkdevice
{$include gst/vulkan/gstvkimagememory.inc}              // io. -> gstvkdevice
{$include gst/vulkan/gstvkvideoutils.inc}               // io.
{$include gst/vulkan/gstvkimageview.inc}                // io. -> gstvkdevice
{$include gst/vulkan/gstvkdecoder.inc}                  // io. -> gstvkdevice, gstvkvideoutils
{$include gst/vulkan/gstvkinstance.inc}                 // io. -> gstvkdevice
{$include gst/vulkan/gstvkcommandpool.inc}              // io. -> gstvkdevice
{$include gst/vulkan/gstvkcommandbuffer.inc}            // io. -> gstvkcommandpool, gstvkdevice
{$include gst/vulkan/gstvkqueue.inc}                    // io. -> gstvkdevice, gstvkdecoder
{$include gst/vulkan/gstvktrash.inc}                    // io. -> gstvkdevice, gstvkhandlepool
{$include gst/vulkan/gstvkbuffermemory.inc}             // io. -> gstvkdevice
{$include gst/vulkan/gstvkhandle.inc}                   // io. -> gstvkdevice
{$include gst/vulkan/gstvkerror.inc}                    // io.
{$include gst/vulkan/gstvkdisplay.inc}                  // io. -> gstvkdevice
{$include gst/vulkan/gstvkwindow.inc}                   // io. -> gstvkdevice
{$include gst/vulkan/gstvkdescriptorset.inc}            // io. -> gstvkdevice, gstvkhandle
{$include gst/vulkan/gstvkdescriptorpool.inc}           // io. -> gstvkdevice, gstvkhandle, gstvkdescriptorset
{$include gst/vulkan/gstvkdescriptorcache.inc}          // io. -> gstvkdevice, gstvkhandle, gstvkhandlepool, gstvkdescriptorset
{$include gst/vulkan/gstvkfullscreenquad.inc}           // io. -> gstvkdevice, gstvkhandle, gstvkdescriptorset, gstvktrash
{$include gst/vulkan/gstvkdebug.inc}                    // io.
{$include gst/vulkan/gstvkbufferpool.inc}               // io. -> gstvkdevice
{$include gst/vulkan/gstvkvideofilter.inc}              // io. -> gstvkdevice
{$include gst/vulkan/gstvkformat.inc}                   // io. -> gstvkdevice
{$include gst/vulkan/gstvkimagebufferpool.inc}          // io. -> gstvkdevice
{$include gst/vulkan/gstvkoperation.inc}                // io. -> gstvkdevice
{$include gst/vulkan/gstvkswapper.inc}                  // io. -> gstvkdevice
{$include gst/vulkan/gstvkutils.inc}                    // io. -> gstvkdevice, gstvkhandle


