
unit avfilter;
interface

{
  Automatically converted by H2Pas 1.0.0 from avfilter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    avfilter.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PAVBufferRef  = ^AVBufferRef;
PAVClass  = ^AVClass;
PAVDictionary  = ^AVDictionary;
PAVFilter  = ^AVFilter;
Pavfilter_execute_func  = ^avfilter_execute_func;
PAVFilterChain  = ^AVFilterChain;
PAVFilterChannelLayouts  = ^AVFilterChannelLayouts;
PAVFilterCommand  = ^AVFilterCommand;
PAVFilterContext  = ^AVFilterContext;
PAVFilterFormats  = ^AVFilterFormats;
PAVFilterFormatsConfig  = ^AVFilterFormatsConfig;
PAVFilterGraph  = ^AVFilterGraph;
PAVFilterGraphInternal  = ^AVFilterGraphInternal;
PAVFilterGraphSegment  = ^AVFilterGraphSegment;
PAVFilterInOut  = ^AVFilterInOut;
PAVFilterInternal  = ^AVFilterInternal;
PAVFilterLink  = ^AVFilterLink;
PAVFilterPad  = ^AVFilterPad;
PAVFilterPadParams  = ^AVFilterPadParams;
PAVFilterParams  = ^AVFilterParams;
PAVPixelFormat  = ^AVPixelFormat;
PAVSampleFormat  = ^AVSampleFormat;
Pchar  = ^char;
Pdouble  = ^double;
Pxxxxxx  = ^xxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * filter layer
 * Copyright (c) 2007 Bobby Bingham
 *
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with FFmpeg; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVFILTER_AVFILTER_H}
{$define AVFILTER_AVFILTER_H}
{*
 * @file
 * @ingroup lavfi
 * Main libavfilter public API header
  }
{*
 * @defgroup lavfi libavfilter
 * Graph-based frame editing library.
 *
 * @
  }
{$include <stddef.h>}
{$include "libavutil/attributes.h"}
{$include "libavutil/avutil.h"}
{$include "libavutil/buffer.h"}
{$include "libavutil/dict.h"}
{$include "libavutil/frame.h"}
{$include "libavutil/log.h"}
{$include "libavutil/samplefmt.h"}
{$include "libavutil/pixfmt.h"}
{$include "libavutil/rational.h"}
{$include "libavfilter/version_major.h"}
{$ifndef HAVE_AV_CONFIG_H}
{ When included as part of the ffmpeg build, only include the major version
 * to avoid unnecessary rebuilds. When included externally, keep including
 * the full version information.  }
{$include "libavfilter/version.h"}
{$endif}
{*
 * Return the LIBAVFILTER_VERSION_INT constant.
  }

function avfilter_version:dword;cdecl;external;
{*
 * Return the libavfilter build-time configuration.
  }
(* Const before type ignored *)
function avfilter_configuration:Pchar;cdecl;external;
{*
 * Return the libavfilter license.
  }
(* Const before type ignored *)
function avfilter_license:Pchar;cdecl;external;
type
{*
 * Get the name of an AVFilterPad.
 *
 * @param pads an array of AVFilterPads
 * @param pad_idx index of the pad in the array; it is the caller's
 *                responsibility to ensure the index is valid
 *
 * @return name of the pad_idx'th pad in pads
  }
(* Const before type ignored *)
(* Const before type ignored *)

function avfilter_pad_get_name(pads:PAVFilterPad; pad_idx:longint):Pchar;cdecl;external;
{*
 * Get the type of an AVFilterPad.
 *
 * @param pads an array of AVFilterPads
 * @param pad_idx index of the pad in the array; it is the caller's
 *                responsibility to ensure the index is valid
 *
 * @return type of the pad_idx'th pad in pads
  }
(* Const before type ignored *)
function avfilter_pad_get_type(pads:PAVFilterPad; pad_idx:longint):TAVMediaType;cdecl;external;
{*
 * The number of the filter inputs is not determined just by AVFilter.inputs.
 * The filter might add additional inputs during initialization depending on the
 * options supplied to it.
  }
const
  AVFILTER_FLAG_DYNAMIC_INPUTS = 1 shl 0;  
{*
 * The number of the filter outputs is not determined just by AVFilter.outputs.
 * The filter might add additional outputs during initialization depending on
 * the options supplied to it.
  }
  AVFILTER_FLAG_DYNAMIC_OUTPUTS = 1 shl 1;  
{*
 * The filter supports multithreading by splitting frames into multiple parts
 * and processing them concurrently.
  }
  AVFILTER_FLAG_SLICE_THREADS = 1 shl 2;  
{*
 * The filter is a "metadata" filter - it does not modify the frame data in any
 * way. It may only affect the metadata (i.e. those fields copied by
 * av_frame_copy_props()).
 *
 * More precisely, this means:
 * - video: the data of any frame output by the filter must be exactly equal to
 *   some frame that is received on one of its inputs. Furthermore, all frames
 *   produced on a given output must correspond to frames received on the same
 *   input and their order must be unchanged. Note that the filter may still
 *   drop or duplicate the frames.
 * - audio: the data produced by the filter on any of its outputs (viewed e.g.
 *   as an array of interleaved samples) must be exactly equal to the data
 *   received by the filter on one of its inputs.
  }
  AVFILTER_FLAG_METADATA_ONLY = 1 shl 3;  
{*
 * The filter can create hardware frames using AVFilterContext.hw_device_ctx.
  }
  AVFILTER_FLAG_HWDEVICE = 1 shl 4;  
{*
 * Some filters support a generic "enable" expression option that can be used
 * to enable or disable a filter in the timeline. Filters supporting this
 * option have this flag set. When the enable expression is false, the default
 * no-op filter_frame() function is called in place of the filter_frame()
 * callback defined on each input pad, thus the frame is passed unchanged to
 * the next filters.
  }
  AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC = 1 shl 16;  
{*
 * Same as AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC, except that the filter will
 * have its filter_frame() callback(s) called as usual even when the enable
 * expression is false. The filter will disable filtering within the
 * filter_frame() callback(s) itself, for example executing code depending on
 * the AVFilterContext->is_disabled value.
  }
  AVFILTER_FLAG_SUPPORT_TIMELINE_INTERNAL = 1 shl 17;  
{*
 * Handy mask to test whether the filter supports or no the timeline feature
 * (internally or generically).
  }
  AVFILTER_FLAG_SUPPORT_TIMELINE = AVFILTER_FLAG_SUPPORT_TIMELINE_GENERIC or AVFILTER_FLAG_SUPPORT_TIMELINE_INTERNAL;  
{*
 * Filter definition. This defines the pads a filter contains, and all the
 * callback functions used to interact with the filter.
  }
{*
     * Filter name. Must be non-NULL and unique among filters.
      }
(* Const before type ignored *)
{*
     * A description of the filter. May be NULL.
     *
     * You should use the NULL_IF_CONFIG_SMALL() macro to define it.
      }
(* Const before type ignored *)
{*
     * List of static inputs.
     *
     * NULL if there are no (static) inputs. Instances of filters with
     * AVFILTER_FLAG_DYNAMIC_INPUTS set may have more inputs than present in
     * this list.
      }
(* Const before type ignored *)
{*
     * List of static outputs.
     *
     * NULL if there are no (static) outputs. Instances of filters with
     * AVFILTER_FLAG_DYNAMIC_OUTPUTS set may have more outputs than present in
     * this list.
      }
(* Const before type ignored *)
{*
     * A class for the private data, used to declare filter private AVOptions.
     * This field is NULL for filters that do not declare any options.
     *
     * If this field is non-NULL, the first member of the filter private data
     * must be a pointer to AVClass, which will be set by libavfilter generic
     * code to this class.
      }
(* Const before type ignored *)
{*
     * A combination of AVFILTER_FLAG_*
      }
{****************************************************************
     * All fields below this line are not part of the public API. They
     * may not be used outside of libavfilter and can be changed and
     * removed at will.
     * New public fields should be added right above.
     *****************************************************************
      }
{*
     * The number of entries in the list of inputs.
      }
{*
     * The number of entries in the list of outputs.
      }
{*
     * This field determines the state of the formats union.
     * It is an enum FilterFormatsState value.
      }
{*
     * Filter pre-initialization function
     *
     * This callback will be called immediately after the filter context is
     * allocated, to allow allocating and initing sub-objects.
     *
     * If this callback is not NULL, the uninit callback will be called on
     * allocation failure.
     *
     * @return 0 on success,
     *         AVERROR code on failure (but the code will be
     *           dropped and treated as ENOMEM by the calling code)
      }
{*
     * Filter initialization function.
     *
     * This callback will be called only once during the filter lifetime, after
     * all the options have been set, but before links between filters are
     * established and format negotiation is done.
     *
     * Basic filter initialization should be done here. Filters with dynamic
     * inputs and/or outputs should create those inputs/outputs here based on
     * provided options. No more changes to this filter's inputs/outputs can be
     * done after this callback.
     *
     * This callback must not assume that the filter links exist or frame
     * parameters are known.
     *
     * @ref AVFilter.uninit "uninit" is guaranteed to be called even if
     * initialization fails, so this callback does not have to clean up on
     * failure.
     *
     * @return 0 on success, a negative AVERROR on failure
      }
{*
     * Filter uninitialization function.
     *
     * Called only once right before the filter is freed. Should deallocate any
     * memory held by the filter, release any buffer references, etc. It does
     * not need to deallocate the AVFilterContext.priv memory itself.
     *
     * This callback may be called even if @ref AVFilter.init "init" was not
     * called or failed, so it must be prepared to handle such a situation.
      }
{*
     * The state of the following union is determined by formats_state.
     * See the documentation of enum FilterFormatsState in internal.h.
      }
{*
         * Query formats supported by the filter on its inputs and outputs.
         *
         * This callback is called after the filter is initialized (so the inputs
         * and outputs are fixed), shortly before the format negotiation. This
         * callback may be called more than once.
         *
         * This callback must set ::AVFilterLink's
         * @ref AVFilterFormatsConfig.formats "outcfg.formats"
         * on every input link and
         * @ref AVFilterFormatsConfig.formats "incfg.formats"
         * on every output link to a list of pixel/sample formats that the filter
         * supports on that link.
         * For audio links, this filter must also set
         * @ref AVFilterFormatsConfig.samplerates "incfg.samplerates"
         *  /
         * @ref AVFilterFormatsConfig.samplerates "outcfg.samplerates"
         * and @ref AVFilterFormatsConfig.channel_layouts "incfg.channel_layouts"
         *  /
         * @ref AVFilterFormatsConfig.channel_layouts "outcfg.channel_layouts"
         * analogously.
         *
         * This callback must never be NULL if the union is in this state.
         *
         * @return zero on success, a negative value corresponding to an
         * AVERROR code otherwise
          }
{*
         * A pointer to an array of admissible pixel formats delimited
         * by AV_PIX_FMT_NONE. The generic code will use this list
         * to indicate that this filter supports each of these pixel formats,
         * provided that all inputs and outputs use the same pixel format.
         *
         * This list must never be NULL if the union is in this state.
         * The type of all inputs and outputs of filters using this must
         * be AVMEDIA_TYPE_VIDEO.
          }
(* Const before type ignored *)
{*
         * Analogous to pixels, but delimited by AV_SAMPLE_FMT_NONE
         * and restricted to filters that only have AVMEDIA_TYPE_AUDIO
         * inputs and outputs.
         *
         * In addition to that the generic code will mark all inputs
         * and all outputs as supporting all sample rates and every
         * channel count and channel layout, as long as all inputs
         * and outputs use the same sample rate and channel count/layout.
          }
(* Const before type ignored *)
{*
         * Equivalent to  pix_fmt, AV_PIX_FMT_NONE  as pixels_list.
          }
{*
         * Equivalent to  sample_fmt, AV_SAMPLE_FMT_NONE  as samples_list.
          }
{/< size of private data to allocate for the filter }
{/< Additional flags for avfilter internal use only. }
{*
     * Make the filter instance process a command.
     *
     * @param cmd    the command to process, for handling simplicity all commands must be alphanumeric only
     * @param arg    the argument for the command
     * @param res    a buffer with size res_size where the filter(s) can return a response. This must not change when the command is not supported.
     * @param flags  if AVFILTER_CMD_FLAG_FAST is set and the command would be
     *               time consuming then a filter should treat it like an unsupported command
     *
     * @returns >=0 on success otherwise an error code.
     *          AVERROR(ENOSYS) on unsupported commands
      }
(* Const before type ignored *)
(* Const before type ignored *)
{*
     * Filter activation function.
     *
     * Called when any processing is needed from the filter, instead of any
     * filter_frame and request_frame on pads.
     *
     * The function must examine inlinks and outlinks and perform a single
     * step of processing. If there is nothing to do, the function must do
     * nothing and not return an error. If more steps are or may be
     * possible, it must use ff_filter_set_ready() to schedule another
     * activation.
      }
type
  PAVFilter = ^TAVFilter;
  TAVFilter = record
      name : Pchar;
      description : Pchar;
      inputs : PAVFilterPad;
      outputs : PAVFilterPad;
      priv_class : PAVClass;
      flags : longint;
      nb_inputs : Tuint8_t;
      nb_outputs : Tuint8_t;
      formats_state : Tuint8_t;
      preinit : function (ctx:PAVFilterContext):longint;cdecl;
      init : function (ctx:PAVFilterContext):longint;cdecl;
      uninit : procedure (ctx:PAVFilterContext);cdecl;
      formats : record
          case longint of
            0 : ( query_func : function (para1:PAVFilterContext):longint );
            1 : ( pixels_list : PAVPixelFormat );
            2 : ( samples_list : PAVSampleFormat );
            3 : ( pix_fmt : TAVPixelFormat );
            4 : ( sample_fmt : TAVSampleFormat );
          end;cdecl;
      priv_size : longint;
      flags_internal : longint;
      process_command : function (para1:PAVFilterContext; cmd:Pchar; arg:Pchar; res:Pchar; res_len:longint; 
                   flags:longint):longint;cdecl;
      activate : function (ctx:PAVFilterContext):longint;cdecl;
    end;
{*
 * Get the number of elements in an AVFilter's inputs or outputs array.
  }
(* Const before type ignored *)

function avfilter_filter_pad_count(filter:PAVFilter; is_output:longint):dword;cdecl;external;
{*
 * Process multiple parts of the frame concurrently.
  }
const
  AVFILTER_THREAD_SLICE = 1 shl 0;  
type
{* An instance of a filter  }
(* Const before type ignored *)
{/< needed for av_log() and filters common options }
(* Const before type ignored *)
{/< the AVFilter of which this is an instance }
{/< name of this filter instance }
{/< array of input pads }
{/< array of pointers to input links }
{/< number of input pads }
{/< array of output pads }
{/< array of pointers to output links }
{/< number of output pads }
{/< private data for use by the filter }
{/< filtergraph this filter belongs to }
{*
     * Type of multithreading being allowed/used. A combination of
     * AVFILTER_THREAD_* flags.
     *
     * May be set by the caller before initializing the filter to forbid some
     * or all kinds of multithreading for this filter. The default is allowing
     * everything.
     *
     * When the filter is initialized, this field is combined using bit AND with
     * AVFilterGraph.thread_type to get the final mask used for determining
     * allowed threading types. I.e. a threading type needs to be set in both
     * to be allowed.
     *
     * After the filter is initialized, libavfilter sets this field to the
     * threading type that is actually used (0 for no multithreading).
      }
{*
     * An opaque struct for libavfilter internal use.
      }
{/< enable expression string }
{/< parsed expression (AVExpr*) }
{/< variable values for the enable expression }
{/< the enabled state from the last expression evaluation }
{*
     * For filters which will create hardware frames, sets the device the
     * filter should create them in.  All other filters will ignore this field:
     * in particular, a filter which consumes or processes hardware frames will
     * instead use the hw_frames_ctx field in AVFilterLink to carry the
     * hardware context information.
     *
     * May be set by the caller on filters flagged with AVFILTER_FLAG_HWDEVICE
     * before initializing the filter with avfilter_init_str() or
     * avfilter_init_dict().
      }
{*
     * Max number of threads allowed in this filter instance.
     * If <= 0, its value is ignored.
     * Overrides global number of threads set per filter graph.
      }
{*
     * Ready status of the filter.
     * A non-0 value means that the filter needs activating;
     * a higher value suggests a more urgent activation.
      }
{*
     * Sets the number of extra hardware frames which the filter will
     * allocate on its output links for use in following filters or by
     * the caller.
     *
     * Some hardware filters require all frames that they will use for
     * output to be defined in advance before filtering starts.  For such
     * filters, any hardware frame pools used for output must therefore be
     * of fixed size.  The extra frames set here are on top of any number
     * that the filter needs internally in order to operate normally.
     *
     * This field must be set before the graph containing this filter is
     * configured.
      }
  PAVFilterContext = ^TAVFilterContext;
  TAVFilterContext = record
      av_class : PAVClass;
      filter : PAVFilter;
      name : Pchar;
      input_pads : PAVFilterPad;
      inputs : ^PAVFilterLink;
      nb_inputs : dword;
      output_pads : PAVFilterPad;
      outputs : ^PAVFilterLink;
      nb_outputs : dword;
      priv : pointer;
      graph : PAVFilterGraph;
      thread_type : longint;
      internal : PAVFilterInternal;
      command_queue : PAVFilterCommand;
      enable_str : Pchar;
      enable : pointer;
      var_values : Pdouble;
      is_disabled : longint;
      hw_device_ctx : PAVBufferRef;
      nb_threads : longint;
      ready : dword;
      extra_hw_frames : longint;
    end;

{*
 * Lists of formats / etc. supported by an end of a link.
 *
 * This structure is directly part of AVFilterLink, in two copies:
 * one for the source filter, one for the destination filter.

 * These lists are used for negotiating the format to actually be used,
 * which will be loaded into the format and channel_layout members of
 * AVFilterLink, when chosen.
  }
{*
     * List of supported formats (pixel or sample).
      }
{*
     * Lists of supported sample rates, only for audio.
      }
{*
     * Lists of supported channel layouts, only for audio.
      }

  PAVFilterFormatsConfig = ^TAVFilterFormatsConfig;
  TAVFilterFormatsConfig = record
      formats : PAVFilterFormats;
      samplerates : PAVFilterFormats;
      channel_layouts : PAVFilterChannelLayouts;
    end;
{*
 * A link between two filters. This contains pointers to the source and
 * destination filters between which this link exists, and the indexes of
 * the pads involved. In addition, this link also contains the parameters
 * which have been negotiated and agreed upon between the filter, such as
 * image dimensions, format, etc.
 *
 * Applications must not normally access the link structure directly.
 * Use the buffersrc and buffersink API instead.
 * In the future, access to the header may be reserved for filters
 * implementation.
  }
{/< source filter }
{/< output pad on the source filter }
{/< dest filter }
{/< input pad on the dest filter }
{/< filter media type }
{ These parameters apply only to video  }
{/< agreed upon image width }
{/< agreed upon image height }
{/< agreed upon sample aspect ratio }
{ These parameters apply only to audio  }
{$if FF_API_OLD_CHANNEL_LAYOUT}
{*
     * channel layout of current buffer (see libavutil/channel_layout.h)
     * @deprecated use ch_layout
      }
{$endif}
{/< samples per second }
{/< agreed upon media format }
{*
     * Define the time base used by the PTS of the frames/samples
     * which will pass through this link.
     * During the configuration stage, each filter is supposed to
     * change only the output timebase, while the timebase of the
     * input link is assumed to be an unchangeable property.
      }
{/< channel layout of current buffer (see libavutil/channel_layout.h) }
{****************************************************************
     * All fields below this line are not part of the public API. They
     * may not be used outside of libavfilter and can be changed and
     * removed at will.
     * New public fields should be added right above.
     *****************************************************************
      }
{*
     * Lists of supported formats / etc. supported by the input filter.
      }
{*
     * Lists of supported formats / etc. supported by the output filter.
      }
{* stage of the initialization of the link properties (dimensions, etc)  }
{/< not started }
{/< started, but incomplete }
{/< complete }
{*
     * Graph the filter belongs to.
      }
{*
     * Current timestamp of the link, as defined by the most recent
     * frame(s), in link time_base units.
      }
{*
     * Current timestamp of the link, as defined by the most recent
     * frame(s), in AV_TIME_BASE units.
      }
{*
     * Index in the age array.
      }
{*
     * Frame rate of the stream on the link, or 1/0 if unknown or variable;
     * if left to 0/0, will be automatically copied from the first input
     * of the source filter if it exists.
     *
     * Sources should set it to the best estimation of the real frame rate.
     * If the source frame rate is unknown or variable, set this to 1/0.
     * Filters should update it if necessary depending on their function.
     * Sinks can use it to set a default output frame rate.
     * It is similar to the r_frame_rate field in AVStream.
      }
{*
     * Minimum number of samples to filter at once. If filter_frame() is
     * called with fewer samples, it will accumulate them in fifo.
     * This field and the related ones must not be changed after filtering
     * has started.
     * If 0, all related fields are ignored.
      }
{*
     * Maximum number of samples to filter at once. If filter_frame() is
     * called with more samples, it will split them.
      }
{*
     * Number of past frames sent through the link.
      }
{*
     * Number of past samples sent through the link.
      }
{*
     * A pointer to a FFFramePool struct.
      }
{*
     * True if a frame is currently wanted on the output of this filter.
     * Set when ff_request_frame() is called by the output,
     * cleared when a frame is filtered.
      }
{*
     * For hwaccel pixel formats, this should be a reference to the
     * AVHWFramesContext describing the frames.
      }
{$ifndef FF_INTERNAL_FIELDS}
{*
     * Internal structure members.
     * The fields below this limit are internal for libavfilter's use
     * and must in no way be accessed by applications.
      }
{$else}
{ FF_INTERNAL_FIELDS  }
{*
     * Queue of frames waiting to be filtered.
      }
{*
     * If set, the source filter can not generate a frame as is.
     * The goal is to avoid repeatedly calling the request_frame() method on
     * the same link.
      }
{*
     * Link input status.
     * If not zero, all attempts of filter_frame will fail with the
     * corresponding code.
      }
{*
     * Timestamp of the input status change.
      }
{*
     * Link output status.
     * If not zero, all attempts of request_frame will fail with the
     * corresponding code.
      }
{$endif}
{ FF_INTERNAL_FIELDS  }
type
  PAVFilterLink = ^TAVFilterLink;
  TAVFilterLink = record
      src : PAVFilterContext;
      srcpad : PAVFilterPad;
      dst : PAVFilterContext;
      dstpad : PAVFilterPad;
      _type : TAVMediaType;
      w : longint;
      h : longint;
      sample_aspect_ratio : TAVRational;
      channel_layout : Tuint64_t;
      sample_rate : longint;
      format : longint;
      time_base : TAVRational;
      ch_layout : TAVChannelLayout;
      incfg : TAVFilterFormatsConfig;
      outcfg : TAVFilterFormatsConfig;
      init_state :  Longint;
      Const
        AVLINK_UNINIT = 0;
        AVLINK_STARTINIT = 1;
        AVLINK_INIT = 2;
;
      graph : PAVFilterGraph;
      current_pts : Tint64_t;
      current_pts_us : Tint64_t;
      age_index : longint;
      frame_rate : TAVRational;
      min_samples : longint;
      max_samples : longint;
      frame_count_in : Tint64_t;
      frame_count_out : Tint64_t;
      sample_count_in : Tint64_t;
      sample_count_out : Tint64_t;
      frame_pool : pointer;
      frame_wanted_out : longint;
      hw_frames_ctx : PAVBufferRef;
      reserved : array[0..61439] of char;
      fifo : TFFFrameQueue;
      frame_blocked_in : longint;
      status_in : longint;
      status_in_pts : Tint64_t;
      status_out : longint;
    end
{*
 * Link two filters together.
 *
 * @param src    the source filter
 * @param srcpad index of the output pad on the source filter
 * @param dst    the destination filter
 * @param dstpad index of the input pad on the destination filter
 * @return       zero on success
  }

function avfilter_link(src:PAVFilterContext; srcpad:dword; dst:PAVFilterContext; dstpad:dword):longint;cdecl;external;
{*
 * Free the link in *link, and set its pointer to NULL.
  }
procedure avfilter_link_free(link:PPAVFilterLink);cdecl;external;
{*
 * Negotiate the media format, dimensions, etc of all inputs to a filter.
 *
 * @param filter the filter to negotiate the properties for its inputs
 * @return       zero on successful negotiation
  }
function avfilter_config_links(filter:PAVFilterContext):longint;cdecl;external;
const
  AVFILTER_CMD_FLAG_ONE = 1;  {/< Stop once a filter understood the command (for target=all for example), fast filters are favored automatically }
  AVFILTER_CMD_FLAG_FAST = 2;  {/< Only execute command when its fast (like a video out that supports contrast adjustment in hw) }
{*
 * Make the filter instance process a command.
 * It is recommended to use avfilter_graph_send_command().
  }
(* Const before type ignored *)
(* Const before type ignored *)

function avfilter_process_command(filter:PAVFilterContext; cmd:Pchar; arg:Pchar; res:Pchar; res_len:longint; 
           flags:longint):longint;cdecl;external;
{*
 * Iterate over all registered filters.
 *
 * @param opaque a pointer where libavfilter will store the iteration state. Must
 *               point to NULL to start the iteration.
 *
 * @return the next registered filter or NULL when the iteration is
 *         finished
  }
(* Const before type ignored *)
function av_filter_iterate(opaque:Ppointer):PAVFilter;cdecl;external;
{*
 * Get a filter definition matching the given name.
 *
 * @param name the filter name to find
 * @return     the filter definition, if any matching one is registered.
 *             NULL if none found.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function avfilter_get_by_name(name:Pchar):PAVFilter;cdecl;external;
{*
 * Initialize a filter with the supplied parameters.
 *
 * @param ctx  uninitialized filter context to initialize
 * @param args Options to initialize the filter with. This must be a
 *             ':'-separated list of options in the 'key=value' form.
 *             May be NULL if the options have been set directly using the
 *             AVOptions API or there are no options that need to be set.
 * @return 0 on success, a negative AVERROR on failure
  }
(* Const before type ignored *)
function avfilter_init_str(ctx:PAVFilterContext; args:Pchar):longint;cdecl;external;
{*
 * Initialize a filter with the supplied dictionary of options.
 *
 * @param ctx     uninitialized filter context to initialize
 * @param options An AVDictionary filled with options for this filter. On
 *                return this parameter will be destroyed and replaced with
 *                a dict containing options that were not found. This dictionary
 *                must be freed by the caller.
 *                May be NULL, then this function is equivalent to
 *                avfilter_init_str() with the second parameter set to NULL.
 * @return 0 on success, a negative AVERROR on failure
 *
 * @note This function and avfilter_init_str() do essentially the same thing,
 * the difference is in manner in which the options are passed. It is up to the
 * calling code to choose whichever is more preferable. The two functions also
 * behave differently when some of the provided options are not declared as
 * supported by the filter. In such a case, avfilter_init_str() will fail, but
 * this function will leave those extra options in the options AVDictionary and
 * continue as usual.
  }
function avfilter_init_dict(ctx:PAVFilterContext; options:PPAVDictionary):longint;cdecl;external;
{*
 * Free a filter context. This will also remove the filter from its
 * filtergraph's list of filters.
 *
 * @param filter the filter to free
  }
procedure avfilter_free(filter:PAVFilterContext);cdecl;external;
{*
 * Insert a filter in the middle of an existing link.
 *
 * @param link the link into which the filter should be inserted
 * @param filt the filter to be inserted
 * @param filt_srcpad_idx the input pad on the filter to connect
 * @param filt_dstpad_idx the output pad on the filter to connect
 * @return     zero on success
  }
function avfilter_insert_filter(link:PAVFilterLink; filt:PAVFilterContext; filt_srcpad_idx:dword; filt_dstpad_idx:dword):longint;cdecl;external;
{*
 * @return AVClass for AVFilterContext.
 *
 * @see av_opt_find().
  }
(* Const before type ignored *)
function avfilter_get_class:PAVClass;cdecl;external;
type
{*
 * A function pointer passed to the @ref AVFilterGraph.execute callback to be
 * executed multiple times, possibly in parallel.
 *
 * @param ctx the filter context the job belongs to
 * @param arg an opaque parameter passed through from @ref
 *            AVFilterGraph.execute
 * @param jobnr the index of the job being executed
 * @param nb_jobs the total number of jobs
 *
 * @return 0 on success, a negative AVERROR on error
  }
{*
 * A function executing multiple jobs, possibly in parallel.
 *
 * @param ctx the filter context to which the jobs belong
 * @param func the function to be called multiple times
 * @param arg the argument to be passed to func
 * @param ret a nb_jobs-sized array to be filled with return values from each
 *            invocation of func
 * @param nb_jobs the number of jobs to execute
 *
 * @return 0 on success, a negative AVERROR on error
  }
(* Const before type ignored *)
{/< sws options to use for the auto-inserted scale filters }
{*
     * Type of multithreading allowed for filters in this graph. A combination
     * of AVFILTER_THREAD_* flags.
     *
     * May be set by the caller at any point, the setting will apply to all
     * filters initialized after that. The default is allowing everything.
     *
     * When a filter in this graph is initialized, this field is combined using
     * bit AND with AVFilterContext.thread_type to get the final mask used for
     * determining allowed threading types. I.e. a threading type needs to be
     * set in both to be allowed.
      }
{*
     * Maximum number of threads used by filters in this graph. May be set by
     * the caller before adding any filters to the filtergraph. Zero (the
     * default) means that the number of threads is determined automatically.
      }
{*
     * Opaque object for libavfilter internal use.
      }
{*
     * Opaque user data. May be set by the caller to an arbitrary value, e.g. to
     * be used from callbacks like @ref AVFilterGraph.execute.
     * Libavfilter will not touch this field in any way.
      }
{*
     * This callback may be set by the caller immediately after allocating the
     * graph and before adding any filters to it, to provide a custom
     * multithreading implementation.
     *
     * If set, filters with slice threading capability will call this callback
     * to execute multiple jobs in parallel.
     *
     * If this field is left unset, libavfilter will use its internal
     * implementation, which may or may not be multithreaded depending on the
     * platform and build options.
      }
{/< swr options to use for the auto-inserted aresample filters, Access ONLY through AVOptions }
{*
     * Private fields
     *
     * The following fields are for internal use only.
     * Their type, offset, number and semantic can change without notice.
      }

  PAVFilterGraph = ^TAVFilterGraph;
  TAVFilterGraph = record
      av_class : PAVClass;
      filters : ^PAVFilterContext;
      nb_filters : dword;
      scale_sws_opts : Pchar;
      thread_type : longint;
      nb_threads : longint;
      internal : PAVFilterGraphInternal;
      opaque : pointer;
      execute : Pavfilter_execute_func;
      aresample_swr_opts : Pchar;
      sink_links : ^PAVFilterLink;
      sink_links_count : longint;
      disable_auto_convert : dword;
    end;
{*
 * Allocate a filter graph.
 *
 * @return the allocated filter graph on success or NULL.
  }

function avfilter_graph_alloc:PAVFilterGraph;cdecl;external;
{*
 * Create a new filter instance in a filter graph.
 *
 * @param graph graph in which the new filter will be used
 * @param filter the filter to create an instance of
 * @param name Name to give to the new instance (will be copied to
 *             AVFilterContext.name). This may be used by the caller to identify
 *             different filters, libavfilter itself assigns no semantics to
 *             this parameter. May be NULL.
 *
 * @return the context of the newly created filter instance (note that it is
 *         also retrievable directly through AVFilterGraph.filters or with
 *         avfilter_graph_get_filter()) on success or NULL on failure.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function avfilter_graph_alloc_filter(graph:PAVFilterGraph; filter:PAVFilter; name:Pchar):PAVFilterContext;cdecl;external;
{*
 * Get a filter instance identified by instance name from graph.
 *
 * @param graph filter graph to search through.
 * @param name filter instance name (should be unique in the graph).
 * @return the pointer to the found filter instance or NULL if it
 * cannot be found.
  }
(* Const before type ignored *)
function avfilter_graph_get_filter(graph:PAVFilterGraph; name:Pchar):PAVFilterContext;cdecl;external;
{*
 * Create and add a filter instance into an existing graph.
 * The filter instance is created from the filter filt and inited
 * with the parameter args. opaque is currently ignored.
 *
 * In case of success put in *filt_ctx the pointer to the created
 * filter instance, otherwise set *filt_ctx to NULL.
 *
 * @param name the instance name to give to the created filter instance
 * @param graph_ctx the filter graph
 * @return a negative AVERROR error code in case of failure, a non
 * negative value otherwise
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function avfilter_graph_create_filter(filt_ctx:PPAVFilterContext; filt:PAVFilter; name:Pchar; args:Pchar; opaque:pointer; 
           graph_ctx:PAVFilterGraph):longint;cdecl;external;
{*
 * Enable or disable automatic format conversion inside the graph.
 *
 * Note that format conversion can still happen inside explicitly inserted
 * scale and aresample filters.
 *
 * @param flags  any of the AVFILTER_AUTO_CONVERT_* constants
  }
procedure avfilter_graph_set_auto_convert(graph:PAVFilterGraph; flags:dword);cdecl;external;
{*< all automatic conversions enabled  }
{*< all automatic conversions disabled  }
type
  Txxxxxx =  Longint;
  Const
    AVFILTER_AUTO_CONVERT_ALL = 0;
    AVFILTER_AUTO_CONVERT_NONE = -(1);

{*
 * Check validity and configure all the links and formats in the graph.
 *
 * @param graphctx the filter graph
 * @param log_ctx context used for logging
 * @return >= 0 in case of success, a negative AVERROR code otherwise
  }

function avfilter_graph_config(graphctx:PAVFilterGraph; log_ctx:pointer):longint;cdecl;external;
{*
 * Free a graph, destroy its links, and set *graph to NULL.
 * If *graph is NULL, do nothing.
  }
procedure avfilter_graph_free(graph:PPAVFilterGraph);cdecl;external;
{*
 * A linked-list of the inputs/outputs of the filter chain.
 *
 * This is mainly useful for avfilter_graph_parse() / avfilter_graph_parse2(),
 * where it is used to communicate open (unlinked) inputs and outputs from and
 * to the caller.
 * This struct specifies, per each not connected pad contained in the graph, the
 * filter context and the pad index required for establishing a link.
  }
{* unique name for this input/output in the list  }
{* filter context associated to this input/output  }
{* index of the filt_ctx pad to use for linking  }
{* next input/input in the list, NULL if this is the last  }
type
  PAVFilterInOut = ^TAVFilterInOut;
  TAVFilterInOut = record
      name : Pchar;
      filter_ctx : PAVFilterContext;
      pad_idx : longint;
      next : PAVFilterInOut;
    end;
{*
 * Allocate a single AVFilterInOut entry.
 * Must be freed with avfilter_inout_free().
 * @return allocated AVFilterInOut on success, NULL on failure.
  }

function avfilter_inout_alloc:PAVFilterInOut;cdecl;external;
{*
 * Free the supplied list of AVFilterInOut and set *inout to NULL.
 * If *inout is NULL, do nothing.
  }
procedure avfilter_inout_free(inout:PPAVFilterInOut);cdecl;external;
{*
 * Add a graph described by a string to a graph.
 *
 * @note The caller must provide the lists of inputs and outputs,
 * which therefore must be known before calling the function.
 *
 * @note The inputs parameter describes inputs of the already existing
 * part of the graph; i.e. from the point of view of the newly created
 * part, they are outputs. Similarly the outputs parameter describes
 * outputs of the already existing filters, which are provided as
 * inputs to the parsed filters.
 *
 * @param graph   the filter graph where to link the parsed graph context
 * @param filters string to be parsed
 * @param inputs  linked list to the inputs of the graph
 * @param outputs linked list to the outputs of the graph
 * @return zero on success, a negative AVERROR code on error
  }
(* Const before type ignored *)
function avfilter_graph_parse(graph:PAVFilterGraph; filters:Pchar; inputs:PAVFilterInOut; outputs:PAVFilterInOut; log_ctx:pointer):longint;cdecl;external;
{*
 * Add a graph described by a string to a graph.
 *
 * In the graph filters description, if the input label of the first
 * filter is not specified, "in" is assumed; if the output label of
 * the last filter is not specified, "out" is assumed.
 *
 * @param graph   the filter graph where to link the parsed graph context
 * @param filters string to be parsed
 * @param inputs  pointer to a linked list to the inputs of the graph, may be NULL.
 *                If non-NULL, *inputs is updated to contain the list of open inputs
 *                after the parsing, should be freed with avfilter_inout_free().
 * @param outputs pointer to a linked list to the outputs of the graph, may be NULL.
 *                If non-NULL, *outputs is updated to contain the list of open outputs
 *                after the parsing, should be freed with avfilter_inout_free().
 * @return non negative on success, a negative AVERROR code on error
  }
(* Const before type ignored *)
function avfilter_graph_parse_ptr(graph:PAVFilterGraph; filters:Pchar; inputs:PPAVFilterInOut; outputs:PPAVFilterInOut; log_ctx:pointer):longint;cdecl;external;
{*
 * Add a graph described by a string to a graph.
 *
 * @param[in]  graph   the filter graph where to link the parsed graph context
 * @param[in]  filters string to be parsed
 * @param[out] inputs  a linked list of all free (unlinked) inputs of the
 *                     parsed graph will be returned here. It is to be freed
 *                     by the caller using avfilter_inout_free().
 * @param[out] outputs a linked list of all free (unlinked) outputs of the
 *                     parsed graph will be returned here. It is to be freed by the
 *                     caller using avfilter_inout_free().
 * @return zero on success, a negative AVERROR code on error
 *
 * @note This function returns the inputs and outputs that are left
 * unlinked after parsing the graph and the caller then deals with
 * them.
 * @note This function makes no reference whatsoever to already
 * existing parts of the graph and the inputs parameter will on return
 * contain inputs of the newly parsed part of the graph.  Analogously
 * the outputs parameter will contain outputs of the newly created
 * filters.
  }
(* Const before type ignored *)
function avfilter_graph_parse2(graph:PAVFilterGraph; filters:Pchar; inputs:PPAVFilterInOut; outputs:PPAVFilterInOut):longint;cdecl;external;
{*
 * Parameters of a filter's input or output pad.
 *
 * Created as a child of AVFilterParams by avfilter_graph_segment_parse().
 * Freed in avfilter_graph_segment_free().
  }
{*
     * An av_malloc()'ed string containing the pad label.
     *
     * May be av_free()'d and set to NULL by the caller, in which case this pad
     * will be treated as unlabeled for linking.
     * May also be replaced by another av_malloc()'ed string.
      }
type
  PAVFilterPadParams = ^TAVFilterPadParams;
  TAVFilterPadParams = record
      _label : Pchar;
    end;
{*
 * Parameters describing a filter to be created in a filtergraph.
 *
 * Created as a child of AVFilterGraphSegment by avfilter_graph_segment_parse().
 * Freed in avfilter_graph_segment_free().
  }
{*
     * The filter context.
     *
     * Created by avfilter_graph_segment_create_filters() based on
     * AVFilterParams.filter_name and instance_name.
     *
     * Callers may also create the filter context manually, then they should
     * av_free() filter_name and set it to NULL. Such AVFilterParams instances
     * are then skipped by avfilter_graph_segment_create_filters().
      }
{*
     * Name of the AVFilter to be used.
     *
     * An av_malloc()'ed string, set by avfilter_graph_segment_parse(). Will be
     * passed to avfilter_get_by_name() by
     * avfilter_graph_segment_create_filters().
     *
     * Callers may av_free() this string and replace it with another one or
     * NULL. If the caller creates the filter instance manually, this string
     * MUST be set to NULL.
     *
     * When both AVFilterParams.filter an AVFilterParams.filter_name are NULL,
     * this AVFilterParams instance is skipped by avfilter_graph_segment_*()
     * functions.
      }
{*
     * Name to be used for this filter instance.
     *
     * An av_malloc()'ed string, may be set by avfilter_graph_segment_parse() or
     * left NULL. The caller may av_free() this string and replace with another
     * one or NULL.
     *
     * Will be used by avfilter_graph_segment_create_filters() - passed as the
     * third argument to avfilter_graph_alloc_filter(), then freed and set to
     * NULL.
      }
{*
     * Options to be apllied to the filter.
     *
     * Filled by avfilter_graph_segment_parse(). Afterwards may be freely
     * modified by the caller.
     *
     * Will be applied to the filter by avfilter_graph_segment_apply_opts()
     * with an equivalent of av_opt_set_dict2(filter, &opts, AV_OPT_SEARCH_CHILDREN),
     * i.e. any unapplied options will be left in this dictionary.
      }

  PAVFilterParams = ^TAVFilterParams;
  TAVFilterParams = record
      filter : PAVFilterContext;
      filter_name : Pchar;
      instance_name : Pchar;
      opts : PAVDictionary;
      inputs : ^PAVFilterPadParams;
      nb_inputs : dword;
      outputs : ^PAVFilterPadParams;
      nb_outputs : dword;
    end;
{*
 * A filterchain is a list of filter specifications.
 *
 * Created as a child of AVFilterGraphSegment by avfilter_graph_segment_parse().
 * Freed in avfilter_graph_segment_free().
  }

  PAVFilterChain = ^TAVFilterChain;
  TAVFilterChain = record
      filters : ^PAVFilterParams;
      nb_filters : Tsize_t;
    end;
{*
 * A parsed representation of a filtergraph segment.
 *
 * A filtergraph segment is conceptually a list of filterchains, with some
 * supplementary information (e.g. format conversion flags).
 *
 * Created by avfilter_graph_segment_parse(). Must be freed with
 * avfilter_graph_segment_free().
  }
{*
     * The filtergraph this segment is associated with.
     * Set by avfilter_graph_segment_parse().
      }
{*
     * A list of filter chain contained in this segment.
     * Set in avfilter_graph_segment_parse().
      }
{*
     * A string containing a colon-separated list of key=value options applied
     * to all scale filters in this segment.
     *
     * May be set by avfilter_graph_segment_parse().
     * The caller may free this string with av_free() and replace it with a
     * different av_malloc()'ed string.
      }

  PAVFilterGraphSegment = ^TAVFilterGraphSegment;
  TAVFilterGraphSegment = record
      graph : PAVFilterGraph;
      chains : ^PAVFilterChain;
      nb_chains : Tsize_t;
      scale_sws_opts : Pchar;
    end;
{*
 * Parse a textual filtergraph description into an intermediate form.
 *
 * This intermediate representation is intended to be modified by the caller as
 * described in the documentation of AVFilterGraphSegment and its children, and
 * then applied to the graph either manually or with other
 * avfilter_graph_segment_*() functions. See the documentation for
 * avfilter_graph_segment_apply() for the canonical way to apply
 * AVFilterGraphSegment.
 *
 * @param graph Filter graph the parsed segment is associated with. Will only be
 *              used for logging and similar auxiliary purposes. The graph will
 *              not be actually modified by this function - the parsing results
 *              are instead stored in seg for further processing.
 * @param graph_str a string describing the filtergraph segment
 * @param flags reserved for future use, caller must set to 0 for now
 * @param seg A pointer to the newly-created AVFilterGraphSegment is written
 *            here on success. The graph segment is owned by the caller and must
 *            be freed with avfilter_graph_segment_free() before graph itself is
 *            freed.
 *
 * @retval "non-negative number" success
 * @retval "negative error code" failure
  }
(* Const before type ignored *)

function avfilter_graph_segment_parse(graph:PAVFilterGraph; graph_str:Pchar; flags:longint; seg:PPAVFilterGraphSegment):longint;cdecl;external;
{*
 * Create filters specified in a graph segment.
 *
 * Walk through the creation-pending AVFilterParams in the segment and create
 * new filter instances for them.
 * Creation-pending params are those where AVFilterParams.filter_name is
 * non-NULL (and hence AVFilterParams.filter is NULL). All other AVFilterParams
 * instances are ignored.
 *
 * For any filter created by this function, the corresponding
 * AVFilterParams.filter is set to the newly-created filter context,
 * AVFilterParams.filter_name and AVFilterParams.instance_name are freed and set
 * to NULL.
 *
 * @param seg the filtergraph segment to process
 * @param flags reserved for future use, caller must set to 0 for now
 *
 * @retval "non-negative number" Success, all creation-pending filters were
 *                               successfully created
 * @retval AVERROR_FILTER_NOT_FOUND some filter's name did not correspond to a
 *                                  known filter
 * @retval "another negative error code" other failures
 *
 * @note Calling this function multiple times is safe, as it is idempotent.
  }
function avfilter_graph_segment_create_filters(seg:PAVFilterGraphSegment; flags:longint):longint;cdecl;external;
{*
 * Apply parsed options to filter instances in a graph segment.
 *
 * Walk through all filter instances in the graph segment that have option
 * dictionaries associated with them and apply those options with
 * av_opt_set_dict2(..., AV_OPT_SEARCH_CHILDREN). AVFilterParams.opts is
 * replaced by the dictionary output by av_opt_set_dict2(), which should be
 * empty (NULL) if all options were successfully applied.
 *
 * If any options could not be found, this function will continue processing all
 * other filters and finally return AVERROR_OPTION_NOT_FOUND (unless another
 * error happens). The calling program may then deal with unapplied options as
 * it wishes.
 *
 * Any creation-pending filters (see avfilter_graph_segment_create_filters())
 * present in the segment will cause this function to fail. AVFilterParams with
 * no associated filter context are simply skipped.
 *
 * @param seg the filtergraph segment to process
 * @param flags reserved for future use, caller must set to 0 for now
 *
 * @retval "non-negative number" Success, all options were successfully applied.
 * @retval AVERROR_OPTION_NOT_FOUND some options were not found in a filter
 * @retval "another negative error code" other failures
 *
 * @note Calling this function multiple times is safe, as it is idempotent.
  }
function avfilter_graph_segment_apply_opts(seg:PAVFilterGraphSegment; flags:longint):longint;cdecl;external;
{*
 * Initialize all filter instances in a graph segment.
 *
 * Walk through all filter instances in the graph segment and call
 * avfilter_init_dict(..., NULL) on those that have not been initialized yet.
 *
 * Any creation-pending filters (see avfilter_graph_segment_create_filters())
 * present in the segment will cause this function to fail. AVFilterParams with
 * no associated filter context or whose filter context is already initialized,
 * are simply skipped.
 *
 * @param seg the filtergraph segment to process
 * @param flags reserved for future use, caller must set to 0 for now
 *
 * @retval "non-negative number" Success, all filter instances were successfully
 *                               initialized
 * @retval "negative error code" failure
 *
 * @note Calling this function multiple times is safe, as it is idempotent.
  }
function avfilter_graph_segment_init(seg:PAVFilterGraphSegment; flags:longint):longint;cdecl;external;
{*
 * Link filters in a graph segment.
 *
 * Walk through all filter instances in the graph segment and try to link all
 * unlinked input and output pads. Any creation-pending filters (see
 * avfilter_graph_segment_create_filters()) present in the segment will cause
 * this function to fail. Disabled filters and already linked pads are skipped.
 *
 * Every filter output pad that has a corresponding AVFilterPadParams with a
 * non-NULL label is
 * - linked to the input with the matching label, if one exists;
 * - exported in the outputs linked list otherwise, with the label preserved.
 * Unlabeled outputs are
 * - linked to the first unlinked unlabeled input in the next non-disabled
 *   filter in the chain, if one exists
 * - exported in the ouputs linked list otherwise, with NULL label
 *
 * Similarly, unlinked input pads are exported in the inputs linked list.
 *
 * @param seg the filtergraph segment to process
 * @param flags reserved for future use, caller must set to 0 for now
 * @param[out] inputs  a linked list of all free (unlinked) inputs of the
 *                     filters in this graph segment will be returned here. It
 *                     is to be freed by the caller using avfilter_inout_free().
 * @param[out] outputs a linked list of all free (unlinked) outputs of the
 *                     filters in this graph segment will be returned here. It
 *                     is to be freed by the caller using avfilter_inout_free().
 *
 * @retval "non-negative number" success
 * @retval "negative error code" failure
 *
 * @note Calling this function multiple times is safe, as it is idempotent.
  }
function avfilter_graph_segment_link(seg:PAVFilterGraphSegment; flags:longint; inputs:PPAVFilterInOut; outputs:PPAVFilterInOut):longint;cdecl;external;
{*
 * Apply all filter/link descriptions from a graph segment to the associated filtergraph.
 *
 * This functions is currently equivalent to calling the following in sequence:
 * - avfilter_graph_segment_create_filters();
 * - avfilter_graph_segment_apply_opts();
 * - avfilter_graph_segment_init();
 * - avfilter_graph_segment_link();
 * failing if any of them fails. This list may be extended in the future.
 *
 * Since the above functions are idempotent, the caller may call some of them
 * manually, then do some custom processing on the filtergraph, then call this
 * function to do the rest.
 *
 * @param seg the filtergraph segment to process
 * @param flags reserved for future use, caller must set to 0 for now
 * @param[out] inputs passed to avfilter_graph_segment_link()
 * @param[out] outputs passed to avfilter_graph_segment_link()
 *
 * @retval "non-negative number" success
 * @retval "negative error code" failure
 *
 * @note Calling this function multiple times is safe, as it is idempotent.
  }
function avfilter_graph_segment_apply(seg:PAVFilterGraphSegment; flags:longint; inputs:PPAVFilterInOut; outputs:PPAVFilterInOut):longint;cdecl;external;
{*
 * Free the provided AVFilterGraphSegment and everything associated with it.
 *
 * @param seg double pointer to the AVFilterGraphSegment to be freed. NULL will
 * be written to this pointer on exit from this function.
 *
 * @note
 * The filter contexts (AVFilterParams.filter) are owned by AVFilterGraph rather
 * than AVFilterGraphSegment, so they are not freed.
  }
procedure avfilter_graph_segment_free(seg:PPAVFilterGraphSegment);cdecl;external;
{*
 * Send a command to one or more filter instances.
 *
 * @param graph  the filter graph
 * @param target the filter(s) to which the command should be sent
 *               "all" sends to all filters
 *               otherwise it can be a filter or filter instance name
 *               which will send the command to all matching filters.
 * @param cmd    the command to send, for handling simplicity all commands must be alphanumeric only
 * @param arg    the argument for the command
 * @param res    a buffer with size res_size where the filter(s) can return a response.
 *
 * @returns >=0 on success otherwise an error code.
 *              AVERROR(ENOSYS) on unsupported commands
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function avfilter_graph_send_command(graph:PAVFilterGraph; target:Pchar; cmd:Pchar; arg:Pchar; res:Pchar; 
           res_len:longint; flags:longint):longint;cdecl;external;
{*
 * Queue a command for one or more filter instances.
 *
 * @param graph  the filter graph
 * @param target the filter(s) to which the command should be sent
 *               "all" sends to all filters
 *               otherwise it can be a filter or filter instance name
 *               which will send the command to all matching filters.
 * @param cmd    the command to sent, for handling simplicity all commands must be alphanumeric only
 * @param arg    the argument for the command
 * @param ts     time at which the command should be sent to the filter
 *
 * @note As this executes commands after this function returns, no return code
 *       from the filter is provided, also AVFILTER_CMD_FLAG_ONE is not supported.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function avfilter_graph_queue_command(graph:PAVFilterGraph; target:Pchar; cmd:Pchar; arg:Pchar; flags:longint; 
           ts:Tdouble):longint;cdecl;external;
{*
 * Dump a graph into a human-readable string representation.
 *
 * @param graph    the graph to dump
 * @param options  formatting options; currently ignored
 * @return  a string, or NULL in case of memory allocation failure;
 *          the string must be freed using av_free
  }
(* Const before type ignored *)
function avfilter_graph_dump(graph:PAVFilterGraph; options:Pchar):Pchar;cdecl;external;
{*
 * Request a frame on the oldest sink link.
 *
 * If the request returns AVERROR_EOF, try the next.
 *
 * Note that this function is not meant to be the sole scheduling mechanism
 * of a filtergraph, only a convenience function to help drain a filtergraph
 * in a balanced way under normal circumstances.
 *
 * Also note that AVERROR_EOF does not mean that frames did not arrive on
 * some of the sinks during the process.
 * When there are multiple sink links, in case the requested link
 * returns an EOF, this may cause a filter to flush pending frames
 * which are sent to another sink link, although unrequested.
 *
 * @return  the return value of ff_request_frame(),
 *          or AVERROR_EOF if all links returned AVERROR_EOF
  }
function avfilter_graph_request_oldest(graph:PAVFilterGraph):longint;cdecl;external;
{*
 * @
  }
{$endif}
{ AVFILTER_AVFILTER_H  }

implementation


end.
