#ifndef _EFL_UI_WIN_PART_EO_H_
#define _EFL_UI_WIN_PART_EO_H_

#ifndef _EFL_UI_WIN_PART_EO_CLASS_TYPE
#define _EFL_UI_WIN_PART_EO_CLASS_TYPE

typedef Eo Efl_Ui_Win_Part;

#endif

#ifndef _EFL_UI_WIN_PART_EO_TYPES
#define _EFL_UI_WIN_PART_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Efl UI window interal part class
 *
 * @ingroup Efl_Ui_Win_Part
 */
#define EFL_UI_WIN_PART_CLASS efl_ui_win_part_class_get()

extern  const Efl_Class *efl_ui_win_part_class_get(void) ;
#endif /* EFL_BETA_API_SUPPORT */

#endif
