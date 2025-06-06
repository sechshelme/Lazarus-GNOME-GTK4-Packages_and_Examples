#ifndef _EFL_CANVAS_GESTURE_TRIPLE_TAP_EO_H_
#define _EFL_CANVAS_GESTURE_TRIPLE_TAP_EO_H_

#ifndef _EFL_CANVAS_GESTURE_TRIPLE_TAP_EO_CLASS_TYPE
#define _EFL_CANVAS_GESTURE_TRIPLE_TAP_EO_CLASS_TYPE

typedef Eo Efl_Canvas_Gesture_Triple_Tap;

#endif

#ifndef _EFL_CANVAS_GESTURE_TRIPLE_TAP_EO_TYPES
#define _EFL_CANVAS_GESTURE_TRIPLE_TAP_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/**
 * @brief Triple-tap gesture class holding state information. See
 * @ref Efl_Canvas_Gesture to see what this state is and
 * @[Efl.Canvas.Gesture_Events.gesture,triple_tap] for a description of the
 * Triple-tap gesture.
 *
 * Application developers receive these objects inside a gesture event and do
 * not typically need to create their own.
 *
 * @ingroup Efl_Canvas_Gesture_Triple_Tap
 */
#define EFL_CANVAS_GESTURE_TRIPLE_TAP_CLASS efl_canvas_gesture_triple_tap_class_get()

extern  const Efl_Class *efl_canvas_gesture_triple_tap_class_get(void) ;
#endif /* EFL_BETA_API_SUPPORT */

#endif
