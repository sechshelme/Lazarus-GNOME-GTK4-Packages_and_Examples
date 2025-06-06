
unit elm_box_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_box_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_box_common.h
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
PElm_Box_Transition  = ^Elm_Box_Transition;
PEvas_Object  = ^Evas_Object;
PEvas_Object_Box_Data  = ^Evas_Object_Box_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Box_Group
 *
 * @
  }
{*
 * @typedef Elm_Box_Transition
 *
 * Opaque handler containing the parameters to perform an animated
 * transition of the layout the box uses.
 *
 * @see elm_box_transition_new()
 * @see elm_box_layout_set()
 * @see elm_box_layout_transition()
  }
type
{*
 * Special layout function that animates the transition from one layout to another
 *
 * @param obj The object.
 * @param priv The smart object instance data.
 * @param data Data will be passed to function.
 *
 * Normally, when switching the layout function for a box, this will be
 * reflected immediately on screen on the next render, but it's also
 * possible to do this through an animated transition.
 *
 * This is done by creating an ::Elm_Box_Transition and setting the box
 * layout to this function.
 *
 * For example:
 * @code
 * Elm_Box_Transition *t = elm_box_transition_new(1.0,
 *                            evas_object_box_layout_vertical, // start
 *                            NULL, // data for initial layout
 *                            NULL, // free function for initial data
 *                            evas_object_box_layout_horizontal, // end
 *                            NULL, // data for final layout
 *                            NULL, // free function for final data
 *                            anim_end, // will be called when animation ends
 *                            NULL); // data for anim_end function
 * elm_box_layout_set(box, elm_box_layout_transition, t,
 *                    elm_box_transition_free);
 * @endcode
 *
 * @note This function can only be used with elm_box_layout_set(). Calling
 * it directly will not have the expected results.
 *
 * @see elm_box_transition_new
 * @see elm_box_transition_free
 * @see elm_box_layout_set
  }

procedure elm_box_layout_transition(obj:PEvas_Object; priv:PEvas_Object_Box_Data; data:pointer);cdecl;external;
{*
 * Create a new ::Elm_Box_Transition to animate the switch of layouts
 *
 * If you want to animate the change from one layout to another, you need
 * to set the layout function of the box to elm_box_layout_transition(),
 * passing as user data to it an instance of ::Elm_Box_Transition with the
 * necessary information to perform this animation. The free function to
 * set for the layout is elm_box_transition_free().
 *
 * The parameters to create an ::Elm_Box_Transition sum up to how long
 * will it be, in seconds, a layout function to describe the initial point,
 * another for the final position of the children and one function to be
 * called when the whole animation ends. This last function is useful to
 * set the definitive layout for the box, usually the same as the end
 * layout for the animation, but could be used to start another transition.
 *
 * @param duration The duration of the transition in seconds
 * @param start_layout The layout function that will be used to start the animation
 * @param start_layout_data The data to be passed the @p start_layout function
 * @param start_layout_free_data Function to free @p start_layout_data
 * @param end_layout The layout function that will be used to end the animation
 * @param end_layout_data Data param passed to @p end_layout
 * @param end_layout_free_data The data to be passed the @p end_layout function
 * @param end_layout_free_data Function to free @p end_layout_data
 * @param transition_end_cb Callback function called when animation ends
 * @param transition_end_data Data to be passed to @p transition_end_cb
 * @return An instance of ::Elm_Box_Transition
 *
 * @see elm_box_transition_new
 * @see elm_box_layout_transition
  }
(* Const before type ignored *)
function elm_box_transition_new(duration:Tdouble; start_layout:TEvas_Object_Box_Layout; start_layout_data:pointer; start_layout_free_data:TEcore_Cb; end_layout:TEvas_Object_Box_Layout; 
           end_layout_data:pointer; end_layout_free_data:TEcore_Cb; transition_end_cb:TEcore_Cb; transition_end_data:pointer):PElm_Box_Transition;cdecl;external;
{*
 * Free a Elm_Box_Transition instance created with elm_box_transition_new().
 *
 * This function is mostly useful as the @c free_data parameter in
 * elm_box_layout_set() when elm_box_layout_transition().
 *
 * @param data The Elm_Box_Transition instance to be freed.
 *
 * @see elm_box_transition_new
 * @see elm_box_layout_transition
  }
procedure elm_box_transition_free(data:pointer);cdecl;external;
{*
 * @
  }

implementation


end.
