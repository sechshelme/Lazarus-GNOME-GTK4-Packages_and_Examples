
unit Evas_Eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from Evas_Eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Evas_Eo.h
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
PEfl_Canvas_Animation_Player_Event_Running  = ^Efl_Canvas_Animation_Player_Event_Running;
PEfl_Canvas_Object_Animation_Event  = ^Efl_Canvas_Object_Animation_Event;
PEfl_Canvas_Vg_Node  = ^Efl_Canvas_Vg_Node;
PEfl_Event_Description  = ^Efl_Event_Description;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EVAS_H}
{$error You shall not include this header directly}
{$endif}
{$ifndef _EFL_CANVAS_VG_NODE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VG_NODE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Vg_Node = ^TEfl_Canvas_Vg_Node;
  TEfl_Canvas_Vg_Node = TEo;
{$endif}
type
  PEfl_Canvas_Animation_Player_Event_Running = ^TEfl_Canvas_Animation_Player_Event_Running;
  TEfl_Canvas_Animation_Player_Event_Running = record
      progress : Tdouble;
    end;

(* Const before type ignored *)
  PEfl_Canvas_Object_Animation_Event = ^TEfl_Canvas_Object_Animation_Event;
  TEfl_Canvas_Object_Animation_Event = record
      event_desc : PEfl_Event_Description;
    end;

{*
 * @ingroup Evas_Object_Rectangle
 *
 * @
  }
{$include "canvas/efl_canvas_rectangle.eo.h"}
{*
 * @
  }
{*
 * @ingroup Efl_Canvas_Textblock
 *
 * @
  }
{$include "canvas/efl_text_cursor_object.eo.h"}
{$include "canvas/efl_text_formatter.eo.h"}
{$include "canvas/efl_canvas_textblock.eo.h"}
{$include "canvas/efl_canvas_textblock_factory.eo.h"}
{*
 * @
  }
{*
 * @ingroup Evas_Object_Polygon
 *
 * @
  }
{$include "canvas/efl_canvas_polygon.eo.h"}
{*
 * @
  }
{*
 * @ingroup Evas_Smart_Object_Group
 *
 * @
  }
{$include "canvas/efl_canvas_group.eo.h"}
{*
 * @
  }
{*
 * @
  }
{ Input events  }
{$include "canvas/efl_input_types.eot.h"}
{$include "canvas/efl_input_device.eo.h"}
{$include "canvas/efl_canvas_pointer.eo.h"}
{$include "canvas/efl_canvas_scene.eo.h"}
{$include "canvas/efl_input_state.eo.h"}
{$include "canvas/efl_input_event.eo.h"}
{$include "canvas/efl_input_pointer.eo.h"}
{$include "canvas/efl_input_key.eo.h"}
{$include "canvas/efl_input_hold.eo.h"}
{$include "canvas/efl_input_interface.eo.h"}
{$include "canvas/efl_input_focus.eo.h"}
{$include "canvas/efl_input_clickable.eo.h"}
{$include "canvas/efl_canvas_animation_types.eot.h"}
{$include "gesture/efl_canvas_gesture_types.eot.h"}
{$include "gesture/efl_canvas_gesture_touch.eo.h"}
{$include "gesture/efl_canvas_gesture.eo.h"}
{$include "gesture/efl_canvas_gesture_tap.eo.h"}
{$include "gesture/efl_canvas_gesture_long_press.eo.h"}
{$include "gesture/efl_canvas_gesture_double_tap.eo.h"}
{$include "gesture/efl_canvas_gesture_triple_tap.eo.h"}
{$include "gesture/efl_canvas_gesture_momentum.eo.h"}
{$include "gesture/efl_canvas_gesture_flick.eo.h"}
{$include "gesture/efl_canvas_gesture_rotate.eo.h"}
{$include "gesture/efl_canvas_gesture_zoom.eo.h"}
{$include "gesture/efl_canvas_gesture_custom.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_tap.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_long_press.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_double_tap.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_triple_tap.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_momentum.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_flick.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_rotate.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_zoom.eo.h"}
{$include "gesture/efl_canvas_gesture_recognizer_custom.eo.h"}
{$include "gesture/efl_canvas_gesture_manager.eo.h"}
{$include "gesture/efl_canvas_gesture_events.eo.h"}
{$include "canvas/efl_canvas_object.eo.h"}
{$include "canvas/efl_canvas_animation.eo.h"}
{$include "canvas/efl_canvas_alpha_animation.eo.h"}
{$include "canvas/efl_canvas_rotate_animation.eo.h"}
{$include "canvas/efl_canvas_scale_animation.eo.h"}
{$include "canvas/efl_canvas_translate_animation.eo.h"}
{$include "canvas/efl_canvas_group_animation.eo.h"}
{$include "canvas/efl_canvas_parallel_group_animation.eo.h"}
{$include "canvas/efl_canvas_sequential_group_animation.eo.h"}
{$include "canvas/efl_canvas_object_animation.eo.h"}
{$include "canvas/efl_canvas_event_grabber.eo.h"}
{$include "canvas/efl_canvas_image_internal.eo.h"}
{$include "canvas/efl_canvas_image.eo.h"}
{$include "canvas/efl_canvas_snapshot.eo.h"}
{$include "canvas/efl_canvas_proxy.eo.h"}
{$include "canvas/efl_gfx_mapping.eo.h"}
{$include "canvas/efl_gfx_vg_value_provider.eo.h"}
{*
 * @ingroup Evas_Object_VG
 *
 * @
  }
{$include "canvas/efl_canvas_vg_object.eo.h"}
{*
 * @
  }
{$include "canvas/efl_canvas_vg_node.eo.h"}
{$include "canvas/efl_canvas_vg_container.eo.h"}
{$include "canvas/efl_canvas_vg_shape.eo.h"}
{$include "canvas/efl_canvas_vg_image.eo.h"}
{$include "canvas/efl_canvas_vg_gradient.eo.h"}
{$include "canvas/efl_canvas_vg_gradient_linear.eo.h"}
{$include "canvas/efl_canvas_vg_gradient_radial.eo.h"}

implementation


end.
