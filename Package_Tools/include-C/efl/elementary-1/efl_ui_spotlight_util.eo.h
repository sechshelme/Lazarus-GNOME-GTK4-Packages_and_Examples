#ifndef _EFL_UI_SPOTLIGHT_UTIL_EO_H_
#define _EFL_UI_SPOTLIGHT_UTIL_EO_H_

#ifndef _EFL_UI_SPOTLIGHT_UTIL_EO_CLASS_TYPE
#define _EFL_UI_SPOTLIGHT_UTIL_EO_CLASS_TYPE

typedef Eo Efl_Ui_Spotlight_Util;

#endif

#ifndef _EFL_UI_SPOTLIGHT_UTIL_EO_TYPES
#define _EFL_UI_SPOTLIGHT_UTIL_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
#define EFL_UI_SPOTLIGHT_UTIL_CLASS efl_ui_spotlight_util_class_get()

extern  const Efl_Class *efl_ui_spotlight_util_class_get(void) ;

/**
 * @brief Get a preconfigured stack obejct
 *
 * @param[in] parent
 *
 * @ingroup Efl_Ui_Spotlight_Util
 */
extern  Efl_Ui_Spotlight_Container *efl_ui_spotlight_util_stack_gen(Efl_Ui_Widget *parent);
#endif /* EFL_BETA_API_SUPPORT */

#endif
