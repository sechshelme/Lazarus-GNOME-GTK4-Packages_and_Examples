#ifndef _EFL_CANVAS_GESTURE_MOMENTUM_EO_H_
#define _EFL_CANVAS_GESTURE_MOMENTUM_EO_H_

#ifndef _EFL_CANVAS_GESTURE_MOMENTUM_EO_CLASS_TYPE
#define _EFL_CANVAS_GESTURE_MOMENTUM_EO_CLASS_TYPE

typedef Eo Efl_Canvas_Gesture_Momentum;

#endif

#ifndef _EFL_CANVAS_GESTURE_MOMENTUM_EO_TYPES
#define _EFL_CANVAS_GESTURE_MOMENTUM_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/**
 * @brief Momentum gesture class holding state information. See
 * @ref Efl_Canvas_Gesture to see what this state is and
 * @[Efl.Canvas.Gesture_Events.gesture,momentum] for a description of the
 * Momentum gesture.
 *
 * Application developers receive these objects inside a gesture event and do
 * not typically need to create their own.
 *
 * @ingroup Efl_Canvas_Gesture_Momentum
 */
#define EFL_CANVAS_GESTURE_MOMENTUM_CLASS efl_canvas_gesture_momentum_class_get()

extern  const Efl_Class *efl_canvas_gesture_momentum_class_get(void) ;

/**
 * @brief The momentum value, this is, the direction in which the action
 * occurred.
 *
 * @param[in] obj The object.
 *
 * @return The momentum vector.
 *
 * @ingroup Efl_Canvas_Gesture_Momentum
 */
extern  Eina_Vector2 efl_gesture_momentum_get(const Eo *obj);
#endif /* EFL_BETA_API_SUPPORT */

#endif
