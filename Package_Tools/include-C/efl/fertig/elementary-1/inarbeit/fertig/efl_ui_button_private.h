#ifndef EFL_UI_BUTTON_PRIVATE_H
#define EFL_UI_BUTTON_PRIVATE_H

#include "Elementary.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-button-class The Elementary Button Class
 *
 * Elementary, besides having the @ref Button widget, exposes its
 * foundation -- the Elementary Button Class -- in order to create
 * other widgets which are, basically, a button with some more logic
 * on top.
 */

/**
 * Base widget smart data extended with button instance data.
 */
typedef struct _Efl_Ui_button_Data
{
   /* auto-repeat stuff */
   double                ar_initial_timeout; /**< Time to wait until first auto-repeated click is generated */
   double                ar_gap_timeout; /**< Time frame for subsequent auto-repeated clicks, after the first automatic one is triggerred */

   Ecore_Timer          *timer; /**< Internal timer object for auto-repeat behavior */

   Eina_Bool             autorepeat : 1; /**< Whether auto-repetition of clicks is enabled or not (bound to _Elm_Button_Smart_Class::admits_autorepeat) */
   Eina_Bool             repeating : 1; /**< Whether auto-repetition is going on */
} Efl_Ui_Button_Data;

/**
 * @}
 */


