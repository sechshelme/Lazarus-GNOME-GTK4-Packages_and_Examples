
unit sokol_nuklear;
interface

{
  Automatically converted by H2Pas 1.0.0 from sokol_nuklear.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sokol_nuklear.h
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
Pchar  = ^char;
Plongint  = ^longint;
Pnk_context  = ^nk_context;
Psapp_event  = ^sapp_event;
Psnk_allocator_t  = ^snk_allocator_t;
Psnk_desc_t  = ^snk_desc_t;
Psnk_image_desc_t  = ^snk_image_desc_t;
Psnk_image_t  = ^snk_image_t;
Psnk_logger_t  = ^snk_logger_t;
Pxxxx  = ^xxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  Txxxx =  Longint;
  Const
    SNK_INVALID_ID = 0;

{
    snk_image_t

    A combined texture-view / sampler pair used to inject custom images and samplers into Nuklear.

    Create with snk_make_image(), and convert to an nk_handle via snk_nkhandle().
 }
type
  Psnk_image_t = ^Tsnk_image_t;
  Tsnk_image_t = record
      id : Tuint32_t;
    end;
{
    snk_image_desc_t

    Descriptor struct for snk_make_image(). You must provide
    at least an sg_view handle. Keeping the sg_sampler handle
    zero-initialized will select the builtin default sampler
    which uses linear filtering.
 }

  Psnk_image_desc_t = ^Tsnk_image_desc_t;
  Tsnk_image_desc_t = record
      texture_view : Tsg_view;
      sampler : Tsg_sampler;
    end;
{
    snk_log_item

    An enum with a unique item for each log message, warning, error
    and validation layer message.
 }
{
    snk_allocator_t

    Used in snk_desc_t to provide custom memory-alloc and -free functions
    to sokol_nuklear.h. If memory management should be overridden, both the
    alloc_fn and free_fn function must be provided (e.g. it's not valid to
    override one function but not the other).
 }

  Psnk_allocator_t = ^Tsnk_allocator_t;
  Tsnk_allocator_t = record
      alloc_fn : function (size:Tsize_t; user_data:pointer):pointer;cdecl;
      free_fn : procedure (ptr:pointer; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{
    snk_logger

    Used in snk_desc_t to provide a logging function. Please be aware
    that without logging function, sokol-nuklear will be completely
    silent, e.g. it will not report errors, warnings and
    validation layer messages. For maximum error verbosity,
    compile in debug mode (e.g. NDEBUG *not* defined) and install
    a logger (for instance the standard logging function from sokol_log.h).
 }
(* Const before type ignored *)
{ always "snk" }
{ 0=panic, 1=error, 2=warning, 3=info }
{ SNK_LOGITEM_* }
(* Const before type ignored *)
{ a message string, may be nullptr in release mode }
{ line number in sokol_imgui.h }
(* Const before type ignored *)
{ source filename, may be nullptr in release mode }

  Psnk_logger_t = ^Tsnk_logger_t;
  Tsnk_logger_t = record
      func : procedure (tag:Pchar; log_level:Tuint32_t; log_item_id:Tuint32_t; message_or_null:Pchar; line_nr:Tuint32_t; 
                    filename_or_null:Pchar; user_data:pointer);cdecl;
      user_data : pointer;
    end;
{ default: 65536 }
{ default: 256 }
{ optional memory allocation overrides (default: malloc/free) }
{ optional log function override }

  Psnk_desc_t = ^Tsnk_desc_t;
  Tsnk_desc_t = record
      max_vertices : longint;
      image_pool_size : longint;
      color_format : Tsg_pixel_format;
      depth_format : Tsg_pixel_format;
      sample_count : longint;
      dpi_scale : single;
      no_default_font : Tbool;
      enable_set_mouse_cursor : Tbool;
      allocator : Tsnk_allocator_t;
      logger : Tsnk_logger_t;
    end;
(* Const before type ignored *)

procedure snk_setup(desc:Psnk_desc_t);cdecl;external;
function snk_new_frame:Pnk_context;cdecl;external;
procedure snk_render(width:longint; height:longint);cdecl;external;
(* Const before type ignored *)
function snk_make_image(desc:Psnk_image_desc_t):Tsnk_image_t;cdecl;external;
procedure snk_destroy_image(img:Tsnk_image_t);cdecl;external;
function snk_query_image_desc(img:Tsnk_image_t):Tsnk_image_desc_t;cdecl;external;
function snk_nkhandle(img:Tsnk_image_t):Tnk_handle;cdecl;external;
function snk_image_from_nkhandle(handle:Tnk_handle):Tsnk_image_t;cdecl;external;
{$if !defined(SOKOL_NUKLEAR_NO_SOKOL_APP)}
(* Const before type ignored *)

function snk_handle_event(ev:Psapp_event):Tbool;cdecl;external;
function snk_edit_string(ctx:Pnk_context; flags:Tnk_flags; memory:Pchar; len:Plongint; max:longint; 
           filter:Tnk_plugin_filter):Tnk_flags;cdecl;external;
{$endif}

procedure snk_shutdown;cdecl;external;

implementation


end.
