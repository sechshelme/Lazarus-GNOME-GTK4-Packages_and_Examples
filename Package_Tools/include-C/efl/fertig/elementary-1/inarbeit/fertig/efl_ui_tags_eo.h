#ifndef _EFL_UI_TAGS_EO_H_
#define _EFL_UI_TAGS_EO_H_

#ifndef _EFL_UI_TAGS_EO_CLASS_TYPE
#define _EFL_UI_TAGS_EO_CLASS_TYPE

typedef Eo Efl_Ui_Tags;

#endif

#ifndef _EFL_UI_TAGS_EO_TYPES
#define _EFL_UI_TAGS_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** A widget displaying a list of tags. The user can remove tags by clicking on
 * each tag "close" button and add new tags by typing text in the text entry at
 * the end of the list.
 *
 * @ingroup Efl_Ui_Tags
 */
#define EFL_UI_TAGS_CLASS efl_ui_tags_class_get()

extern  const Efl_Class *efl_ui_tags_class_get(void) ;

/**
 * @brief Control if the tag list is to be editable by the user or not.
 *
 * @param[in] obj The object.
 * @param[in] editable If @c true, the user can add/delete tags to the tag
 * list, if not, the tag list is non-editable.
 *
 * @ingroup Efl_Ui_Tags
 */
extern  void efl_ui_tags_editable_set(Eo *obj, Eina_Bool editable);

/**
 * @brief Control if the tag list is to be editable by the user or not.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the user can add/delete tags to the tag list, if not,
 * the tag list is non-editable.
 *
 * @ingroup Efl_Ui_Tags
 */
extern  Eina_Bool efl_ui_tags_editable_get(const Eo *obj);

/**
 * @brief Control whether the tag list is expanded or not.
 *
 * In the expanded state, all tags will be displayed. Otherwise, only a single
 * line of tags will be displayed with a marker to indicate that there is more
 * content.
 *
 * @param[in] obj The object.
 * @param[in] expanded The expanded state. Set this to @c true to allow
 * multiple lines of tags. Set to @c false for a single line.
 *
 * @ingroup Efl_Ui_Tags
 */
extern  void efl_ui_tags_expanded_set(Eo *obj, Eina_Bool expanded);

/**
 * @brief Control whether the tag list is expanded or not.
 *
 * In the expanded state, all tags will be displayed. Otherwise, only a single
 * line of tags will be displayed with a marker to indicate that there is more
 * content.
 *
 * @param[in] obj The object.
 *
 * @return The expanded state. Set this to @c true to allow multiple lines of
 * tags. Set to @c false for a single line.
 *
 * @ingroup Efl_Ui_Tags
 */
extern  Eina_Bool efl_ui_tags_expanded_get(const Eo *obj);

/**
 * @brief List of tags in the tag list. Tags can be added and removed by the
 * user using the UI, and by the program by modifying this property.
 *
 * @param[in] obj The object.
 * @param[in] items The array of items, or @c NULL if none.
 *
 * @ingroup Efl_Ui_Tags
 */
extern  void efl_ui_tags_items_set(Eo *obj, const Eina_Array *items);

/**
 * @brief List of tags in the tag list. Tags can be added and removed by the
 * user using the UI, and by the program by modifying this property.
 *
 * @param[in] obj The object.
 *
 * @return The array of items, or @c NULL if none.
 *
 * @ingroup Efl_Ui_Tags
 */
extern  const Eina_Array *efl_ui_tags_items_get(const Eo *obj);

extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_ITEM_SELECTED;
extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_ITEM_ADDED;
extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_ITEM_DELETED;
extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_ITEM_CLICKED;
extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED;
extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_EXPANDED;
extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_CONTRACTED;
extern  const Efl_Event_Description _EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED;
#define EFL_UI_TAGS_EVENT_ITEM_SELECTED (&(_EFL_UI_TAGS_EVENT_ITEM_SELECTED))
#define EFL_UI_TAGS_EVENT_ITEM_ADDED (&(_EFL_UI_TAGS_EVENT_ITEM_ADDED))
#define EFL_UI_TAGS_EVENT_ITEM_DELETED (&(_EFL_UI_TAGS_EVENT_ITEM_DELETED))
#define EFL_UI_TAGS_EVENT_ITEM_CLICKED (&(_EFL_UI_TAGS_EVENT_ITEM_CLICKED))
#define EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED (&(_EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED))
#define EFL_UI_TAGS_EVENT_EXPANDED (&(_EFL_UI_TAGS_EVENT_EXPANDED))
#define EFL_UI_TAGS_EVENT_CONTRACTED (&(_EFL_UI_TAGS_EVENT_CONTRACTED))
#define EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED (&(_EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED))
#endif /* EFL_BETA_API_SUPPORT */

#endif
