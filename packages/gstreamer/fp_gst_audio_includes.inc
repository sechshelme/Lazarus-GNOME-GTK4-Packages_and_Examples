
{$include gst/audio/audio_format.inc}                  // io.
{$include gst/audio/gstaudiocdsrc.inc}                 // io.
{$include gst/audio/gstaudiostreamalign.inc}           // io.
{$include gst/audio/audio_enumtypes.inc}               // io.
{$include gst/audio/audio.inc}                         // io.
{$include gst/audio/gstaudioclock.inc}                 // io.
{$include gst/audio/streamvolume.inc}                  // io.
{$include gst/audio/audio_channels.inc}                // io. -> audio_format
{$include gst/audio/audio_quantize.inc}                // io. -> audio_format
{$include gst/audio/audio_info.inc}                    // io. -> audio_format, audio_channels
{$include gst/audio/audio_channel_mixer.inc}           // io. -> audio_format, audio_channels
{$include gst/audio/gstnonstreamaudiodecoder.inc}      // io. -> audio_info, audio_format
{$include gst/audio/gstaudiofilter.inc}                // io. -> audio_info, audio_format
{$include gst/audio/audio_buffer.inc}                  // io. -> audio_info, audio_format
{$include gst/audio/gstaudiodecoder.inc}               // io. -> audio_info
{$include gst/audio/gstaudioencoder.inc}               // io. -> audio_info
{$include gst/audio/audio_converter.inc}               // io. -> audio_info
{$include gst/audio/gstaudioaggregator.inc}            // io. -> audio_info
{$include gst/audio/gstplanaraudioadapter.inc}         // io. -> audio_info
{$include gst/audio/gstdsdformat.inc}                  // io.
{$include gst/audio/gstaudioringbuffer.inc}            // io. -> audio_info, gstdsdformat, audio_channels
{$include gst/audio/gstaudiobasesrc.inc}               // io. -> gstaudioringbuffer
{$include gst/audio/gstaudiosrc.inc}                   // io. -> gstaudiobasesrc
{$include gst/audio/gstaudioiec61937.inc}              // io. -> gstaudioringbuffer
{$include gst/audio/gstaudiobasesink.inc}              // io. -> gstaudioringbuffer
{$include gst/audio/gstdsd.inc}                        // io. -> gstdsdformat, audio_format, audio_info, audio_channels
{$include gst/audio/audio_resampler.inc}               // io. -> audio_format         (  provided_clock <-> clock ???? )
{$include gst/audio/gstaudiometa.inc}                  // io. -> audio_channels, audio_info
{$include gst/audio/gstaudiosink.inc}                  // io. -> gstaudiobasesink, gstaudioringbuffer



