#ifndef _EFL_UI_CALENDAR_ITEM_EO_H_
#define _EFL_UI_CALENDAR_ITEM_EO_H_

#ifndef _EFL_UI_CALENDAR_ITEM_EO_CLASS_TYPE
#define _EFL_UI_CALENDAR_ITEM_EO_CLASS_TYPE

typedef Eo Efl_Ui_Calendar_Item;

#endif

#ifndef _EFL_UI_CALENDAR_ITEM_EO_TYPES
#define _EFL_UI_CALENDAR_ITEM_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/**
 * @brief Item in a @ref Efl_Ui_Calendar
 *
 * @ref efl_parent_set is the @ref Efl_Ui_Calendar object where this item is
 * in.
 *
 * This object is usally internal and should not be instantiated or used.
 *
 * @ingroup Efl_Ui_Calendar_Item
 */
#define EFL_UI_CALENDAR_ITEM_CLASS efl_ui_calendar_item_class_get()

extern  const Efl_Class *efl_ui_calendar_item_class_get(void) ;

/**
 * @brief Day number
 *
 * @param[in] obj The object.
 * @param[in] i Day number
 *
 * @ingroup Efl_Ui_Calendar_Item
 */
extern  void efl_ui_calendar_item_day_number_set(Eo *obj, int i);

/**
 * @brief Day number
 *
 * @param[in] obj The object.
 *
 * @return Day number
 *
 * @ingroup Efl_Ui_Calendar_Item
 */
extern  int efl_ui_calendar_item_day_number_get(const Eo *obj);
#endif /* EFL_BETA_API_SUPPORT */

#endif
