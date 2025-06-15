
unit Ecore_IMF_Evas;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_IMF_Evas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_IMF_Evas.h
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
PEcore_IMF_Event_Key_Down  = ^Ecore_IMF_Event_Key_Down;
PEcore_IMF_Event_Key_Up  = ^Ecore_IMF_Event_Key_Up;
PEcore_IMF_Event_Mouse_Down  = ^Ecore_IMF_Event_Mouse_Down;
PEcore_IMF_Event_Mouse_In  = ^Ecore_IMF_Event_Mouse_In;
PEcore_IMF_Event_Mouse_Move  = ^Ecore_IMF_Event_Mouse_Move;
PEcore_IMF_Event_Mouse_Out  = ^Ecore_IMF_Event_Mouse_Out;
PEcore_IMF_Event_Mouse_Up  = ^Ecore_IMF_Event_Mouse_Up;
PEcore_IMF_Event_Mouse_Wheel  = ^Ecore_IMF_Event_Mouse_Wheel;
PEvas_Event_Key_Down  = ^Evas_Event_Key_Down;
PEvas_Event_Key_Up  = ^Evas_Event_Key_Up;
PEvas_Event_Mouse_Down  = ^Evas_Event_Mouse_Down;
PEvas_Event_Mouse_In  = ^Evas_Event_Mouse_In;
PEvas_Event_Mouse_Move  = ^Evas_Event_Mouse_Move;
PEvas_Event_Mouse_Out  = ^Evas_Event_Mouse_Out;
PEvas_Event_Mouse_Up  = ^Evas_Event_Mouse_Up;
PEvas_Event_Mouse_Wheel  = ^Evas_Event_Mouse_Wheel;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_IMF_EVAS_H}
{$define _ECORE_IMF_EVAS_H}
{$include <Ecore_IMF.h>}
{$include <Evas.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{*
 * @defgroup Ecore_IMF_Evas_Group Ecore Input Method Context Evas Helper Functions
 * @ingroup Ecore_IMF_Lib_Group
 *
 * Helper functions to make it easy to use Evas with Ecore_IMF.
 * Converts each event from Evas to the corresponding event of Ecore_IMF.
 *
 * An example of usage of these functions can be found at:
 * @li @ref ecore_imf_example_c
  }
{ C++ extern C conditionnal removed }
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "mouse_in" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
  }

procedure ecore_imf_evas_event_mouse_in_wrap(evas_event:PEvas_Event_Mouse_In; imf_event:PEcore_IMF_Event_Mouse_In);cdecl;external;
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "mouse_out" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
  }
procedure ecore_imf_evas_event_mouse_out_wrap(evas_event:PEvas_Event_Mouse_Out; imf_event:PEcore_IMF_Event_Mouse_Out);cdecl;external;
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "mouse_move" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
  }
procedure ecore_imf_evas_event_mouse_move_wrap(evas_event:PEvas_Event_Mouse_Move; imf_event:PEcore_IMF_Event_Mouse_Move);cdecl;external;
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "mouse_down" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
  }
procedure ecore_imf_evas_event_mouse_down_wrap(evas_event:PEvas_Event_Mouse_Down; imf_event:PEcore_IMF_Event_Mouse_Down);cdecl;external;
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "mouse_up" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
  }
procedure ecore_imf_evas_event_mouse_up_wrap(evas_event:PEvas_Event_Mouse_Up; imf_event:PEcore_IMF_Event_Mouse_Up);cdecl;external;
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "mouse_wheel" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
  }
procedure ecore_imf_evas_event_mouse_wheel_wrap(evas_event:PEvas_Event_Mouse_Wheel; imf_event:PEcore_IMF_Event_Mouse_Wheel);cdecl;external;
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "key_down" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
 *
 * Example
 * @code
 * static void
 * _key_down_cb(void *data, Evas *e, Evas_Object *obj, void *event_info)
 * 
 *    Evas_Event_Key_Down *ev = event_info;
 *    if (!ev->key) return;
 *
 *    if (imf_context)
 *      
 *         Ecore_IMF_Event_Key_Down ecore_ev;
 *         ecore_imf_evas_event_key_down_wrap(ev, &ecore_ev);
 *         if (ecore_imf_context_filter_event(imf_context,
 *                                            ECORE_IMF_EVENT_KEY_DOWN,
 *                                            (Ecore_IMF_Event *)&ecore_ev))
 *           return;
 *      
 * 
 *
 * evas_object_event_callback_add(obj, EVAS_CALLBACK_KEY_DOWN, _key_down_cb, data);
 * @endcode
  }
procedure ecore_imf_evas_event_key_down_wrap(evas_event:PEvas_Event_Key_Down; imf_event:PEcore_IMF_Event_Key_Down);cdecl;external;
{*
 * @ingroup Ecore_IMF_Evas_Group
 * @brief Converts a "key_up" event from Evas to the corresponding event of Ecore_IMF.
 *
 * @param evas_event The received Evas event.
 * @param imf_event The location to store the converted Ecore_IMF event.
 *
 * Example
 * @code
 * static void
 * _key_up_cb(void *data, Evas *e, Evas_Object *obj, void *event_info)
 * 
 *    Evas_Event_Key_Up *ev = event_info;
 *    if (!ev->key) return;
 *
 *    if (imf_context)
 *      
 *         Ecore_IMF_Event_Key_Up ecore_ev;
 *         ecore_imf_evas_event_key_up_wrap(ev, &ecore_ev);
 *         if (ecore_imf_context_filter_event(imf_context,
 *                                            ECORE_IMF_EVENT_KEY_UP,
 *                                            (Ecore_IMF_Event *)&ecore_ev))
 *           return;
 *      
 * 
 *
 * evas_object_event_callback_add(obj, EVAS_CALLBACK_KEY_UP, _key_up_cb, data);
 * @endcode
  }
procedure ecore_imf_evas_event_key_up_wrap(evas_event:PEvas_Event_Key_Up; imf_event:PEcore_IMF_Event_Key_Up);cdecl;external;

implementation


end.
