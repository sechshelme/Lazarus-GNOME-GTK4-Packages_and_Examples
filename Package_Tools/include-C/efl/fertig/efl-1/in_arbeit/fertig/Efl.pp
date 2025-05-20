
unit Efl;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efl.h
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
PEfl_Gfx_Path_Command  = ^Efl_Gfx_Path_Command;
PEfl_Object  = ^Efl_Object;
PEfl_Observable_Tuple  = ^Efl_Observable_Tuple;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_H}
{$define _EFL_H}
{$include <Eo.h>}

const
  EFL_VERSION_1_18 = 1;  
  EFL_VERSION_1_19 = 1;  
  EFL_VERSION_1_20 = 1;  
  EFL_VERSION_1_21 = 1;  
  EFL_VERSION_1_22 = 1;  
  EFL_VERSION_1_23 = 1;  
  EFL_VERSION_1_24 = 1;  
  EFL_VERSION_1_25 = 1;  
  EFL_VERSION_1_26 = 1;  
{*
 * @ingroup Efl
 * @since 1.18
 *
 * This type is a alias to struct tm.
 * It is intended to be a standard way to reference it in .eo files.
  }
type
  Ttm = TEfl_Time;
{$include "interfaces/efl_types.eot.h"}
{$include <Efl_MVVM_Common.h>}
{ Data types  }
{$ifdef EFL_BETA_API_SUPPORT}
{* No error on load  }
  var
    EFL_GFX_IMAGE_LOAD_ERROR_NONE : TEina_Error;cvar;external;
{* A non-specific error occurred  }
    EFL_GFX_IMAGE_LOAD_ERROR_GENERIC : TEina_Error;cvar;external;
{* File (or file path) does not exist  }
    EFL_GFX_IMAGE_LOAD_ERROR_DOES_NOT_EXIST : TEina_Error;cvar;external;
{* Permission denied to an existing file (or path)  }
    EFL_GFX_IMAGE_LOAD_ERROR_PERMISSION_DENIED : TEina_Error;cvar;external;
{* Allocation of resources failure prevented load  }
    EFL_GFX_IMAGE_LOAD_ERROR_RESOURCE_ALLOCATION_FAILED : TEina_Error;cvar;external;
{* File corrupt (but was detected as a known format)  }
    EFL_GFX_IMAGE_LOAD_ERROR_CORRUPT_FILE : TEina_Error;cvar;external;
{* File is not a known format  }
    EFL_GFX_IMAGE_LOAD_ERROR_UNKNOWN_FORMAT : TEina_Error;cvar;external;
{* Reading operation has been cancelled during decoding  }
    EFL_GFX_IMAGE_LOAD_ERROR_CANCELLED : TEina_Error;cvar;external;
{* (Edje only) The file pointed to is incompatible, i.e., it doesn't
 * match the library's current version's format.  }
    EFL_GFX_IMAGE_LOAD_ERROR_INCOMPATIBLE_FILE : TEina_Error;cvar;external;
{* (Edje only) The group/collection set to load from was not found in the file  }
    EFL_GFX_IMAGE_LOAD_ERROR_UNKNOWN_COLLECTION : TEina_Error;cvar;external;
{* (Edje only) The group/collection set to load from had recursive references
 * on its components  }
    EFL_GFX_IMAGE_LOAD_ERROR_RECURSIVE_REFERENCE : TEina_Error;cvar;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$include "interfaces/efl_gfx_types.eot.h"}
{$include "interfaces/efl_ui_drag_types.eot.h"}
type
  PEfl_Gfx_Path_Command = ^TEfl_Gfx_Path_Command;
  TEfl_Gfx_Path_Command = TEfl_Gfx_Path_Command_Type;
{ Interfaces  }
{$include "interfaces/efl_config.eo.h"}
{$include "interfaces/efl_control.eo.h"}
{$include "interfaces/efl_duplicate.eo.h"}
{$include "interfaces/efl_file.h"}
{$include "interfaces/efl_file.eo.h"}
{$include "interfaces/efl_file_save.eo.h"}
{$include "interfaces/efl_gfx_image.eo.h"}
{$include "interfaces/efl_gfx_frame_controller.eo.h"}
{$include "interfaces/efl_gfx_image_load_controller.eo.h"}
{$include "interfaces/efl_gfx_image_orientable.eo.h"}
{$include "interfaces/efl_part.eo.h"}
{$include "interfaces/efl_playable.eo.h"}
{$include "interfaces/efl_player.eo.h"}
{$include "interfaces/efl_audio_control.eo.h"}
{$include "interfaces/efl_text.eo.h"}
{$include "interfaces/efl_text_types.eot.h"}
{$include "interfaces/efl_ui_i18n.eo.h"}
{$include "interfaces/efl_ui_layout_orientable.eo.h"}
{$include "interfaces/efl_ui_layout_orientable_readonly.eo.h"}
{$include "interfaces/efl_ui_drag.eo.h"}
{$include "interfaces/efl_ui_range_display.eo.h"}
{$include "interfaces/efl_ui_range_interactive.eo.h"}
{$include "interfaces/efl_ui_autorepeat.eo.h"}
{$include "interfaces/efl_ui_draggable.eo.h"}
{$include "interfaces/efl_ui_scrollable.eo.h"}
{$include "interfaces/efl_ui_scrollbar.eo.h"}
{$include "interfaces/efl_ui_container_selectable.eo.h"}
{$include "interfaces/efl_ui_zoom.eo.h"}
{$include "interfaces/efl_screen.eo.h"}
{ Core interface  }
{$include "interfaces/efl_interpolator.eo.h"}
{ Graphics  }
{$include "interfaces/efl_gfx_entity.eo.h"}
{$include "interfaces/efl_gfx_color.eo.h"}
{$include "interfaces/efl_gfx_buffer.eo.h"}
{$include "interfaces/efl_gfx_stack.eo.h"}
{$include "interfaces/efl_gfx_fill.eo.h"}
{$include "interfaces/efl_gfx_view.eo.h"}
{$include "interfaces/efl_gfx_path.eo.h"}
{$include "interfaces/efl_gfx_shape.eo.h"}
{$include "interfaces/efl_gfx_gradient.eo.h"}
{$include "interfaces/efl_gfx_gradient_linear.eo.h"}
{$include "interfaces/efl_gfx_gradient_radial.eo.h"}
{$include "interfaces/efl_gfx_filter.eo.h"}
{$include "interfaces/efl_gfx_blur.eo.h"}
{$include "interfaces/efl_gfx_hint.eo.h"}
{$include "interfaces/efl_gfx_color_class.eo.h"}
{$include "interfaces/efl_gfx_text_class.eo.h"}
{$include "interfaces/efl_gfx_size_class.eo.h"}
{ Canvas & UI  }
{$include "interfaces/efl_ui_view.eo.h"}
{$include "interfaces/efl_ui_property_bind.eo.h"}
{$include "interfaces/efl_ui_factory.eo.h"}
{$include "interfaces/efl_ui_view_factory.eo.h"}
{$include "interfaces/efl_ui_factory_bind.eo.h"}
{$include "interfaces/efl_model_provider.eo.h"}
{$include "interfaces/efl_cached_item.eo.h"}
{ Observable interface  }
{$include "interfaces/efl_observer.eo.h"}
{$include "interfaces/efl_observable.eo.h"}
{ Packing & containers  }
{$include "interfaces/efl_container.eo.h"}
{$include "interfaces/efl_content.eo.h"}
{$include "interfaces/efl_pack.eo.h"}
{$include "interfaces/efl_pack_layout.eo.h"}
{$include "interfaces/efl_pack_linear.eo.h"}
{$include "interfaces/efl_pack_table.eo.h"}
{$include "interfaces/efl_gfx_arrangement.eo.h"}
{ Input and Output  }
{$include "interfaces/efl_io_closer.eo.h"}
{$include "interfaces/efl_io_reader.eo.h"}
{$include "interfaces/efl_io_writer.eo.h"}
{$include "interfaces/efl_io_sizer.eo.h"}
{$include "interfaces/efl_io_positioner.eo.h"}
{$include "interfaces/efl_io_buffer.eo.h"}
{$include "interfaces/efl_io_queue.eo.h"}
{ Text interfaces  }
{$include "interfaces/efl_text_font_properties.eo.h"}
{$include "interfaces/efl_text_style.eo.h"}
{$include "interfaces/efl_text_format.eo.h"}
{$include "interfaces/efl_text_markup.eo.h"}
{$include "interfaces/efl_text_markup_util.eo.h"}
{$include "interfaces/efl_input_text_entity.eo.h"}
{*
 * @brief Get a proxy object referring to a part of an object.
 *
 * The returned object is valid for only a single function call.
 * Of course, if the first call is @ref efl_ref, it will last
 * until @ref efl_unref.
 *
 * @param[in] obj The object.
 * @param[in] name The part name.
 *
 * @return A (proxy) object, valid for a single call.
 *
 * @since 1.21
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_part(obj:PEo; name:Pchar):PEfl_Object;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_observable_tuple_free(tuple:PEfl_Observable_Tuple);cdecl;external;
{
static inline Eina_Bool
efl_config_bool_set(Efl_Config *obj, const char * name, Eina_Bool val)

   Eina_Value *v = eina_value_new(EINA_VALUE_TYPE_UCHAR);
   Eina_Bool b;
   eina_value_set(v, val);
   b = efl_config_set(obj, name, v);
   eina_value_free(v);
   return b;


static inline Eina_Bool
efl_config_bool_get(const Efl_Config *obj, const char * name)

   Eina_Value *v = efl_config_get(obj, name);
   Eina_Bool b = 0;
   if (v && eina_value_type_get(v) == EINA_VALUE_TYPE_UCHAR)
     eina_value_get(v, &b);
   eina_value_free(v);
   return b;


static inline Eina_Bool
efl_config_int_set(Efl_Config *obj, const char * name, int val)

   Eina_Value *v = eina_value_new(EINA_VALUE_TYPE_INT);
   Eina_Bool b;
   eina_value_set(v, val);
   b = efl_config_set(obj, name, v);
   eina_value_free(v);
   return b;


static inline int
efl_config_int_get(const Efl_Config *obj, const char * name)

   Eina_Value *v = efl_config_get(obj, name);
   int b = 0;
   if (v && eina_value_type_get(v) == EINA_VALUE_TYPE_INT)
     eina_value_get(v, &b);
   eina_value_free(v);
   return b;


static inline Eina_Bool
efl_config_double_set(Efl_Config *obj, const char * name, double val)

   Eina_Value *v = eina_value_new(EINA_VALUE_TYPE_DOUBLE);
   Eina_Bool b;
   eina_value_set(v, val);
   b = efl_config_set(obj, name, v);
   eina_value_free(v);
   return b;


static inline double
efl_config_double_get(const Efl_Config *obj, const char * name)

   Eina_Value *v = efl_config_get(obj, name);
   double b = 0;
   if (v && eina_value_type_get(v) == EINA_VALUE_TYPE_DOUBLE)
     eina_value_get(v, &b);
   eina_value_free(v);
   return b;


static inline Eina_Bool
efl_config_string_set(Efl_Config *obj, const char *name, const char *val)

   Eina_Value *v = eina_value_new(EINA_VALUE_TYPE_STRING);
   Eina_Bool b;
   eina_value_set(v, val);
   b = efl_config_set(obj, name, v);
   eina_value_free(v);
   return b;


static inline Eina_Stringshare *
efl_config_string_get(const Efl_Config *obj, const char *name)

   Eina_Value *v = efl_config_get(obj, name);
   Eina_Stringshare *s = 0;
   if (v && eina_value_type_get(v) == EINA_VALUE_TYPE_STRING)
     
        const char *b = 0;
        eina_value_get(v, &b);
        s = eina_stringshare_add(b);
     
   eina_value_free(v);
   return s;

 }
{$else}
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "interfaces/efl_gfx_types.eot.h"}
{$include "interfaces/efl_ui_drag_types.eot.h"}
{$include "interfaces/efl_text_types.eot.h"}
{$endif}
{$endif}
{ work-around bug in gcc --as-needed link optimization  }

procedure __efl_internal_init;cdecl;external;

implementation


end.
