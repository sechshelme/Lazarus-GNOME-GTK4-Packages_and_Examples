#ifndef EFL_MODEL_COMMON_H__
# define EFL_MODEL_COMMON_H__

#include <Eina.h>

extern  Eina_Error EFL_MODEL_ERROR_UNKNOWN;
extern  Eina_Error EFL_MODEL_ERROR_NOT_SUPPORTED;
extern  Eina_Error EFL_MODEL_ERROR_NOT_FOUND;
extern  Eina_Error EFL_MODEL_ERROR_READ_ONLY;
extern  Eina_Error EFL_MODEL_ERROR_INIT_FAILED;
extern  Eina_Error EFL_MODEL_ERROR_INCORRECT_VALUE;
extern  Eina_Error EFL_MODEL_ERROR_PERMISSION_DENIED;
extern  Eina_Error EFL_MODEL_ERROR_INVALID_OBJECT; /**< @since 1.19 */

extern  Eina_Error EFL_PROPERTY_ERROR_INVALID_KEY; /**< Returned when the given key during a efl_ui_property_bind does not exist on the object. */

extern  Eina_Error EFL_FACTORY_ERROR_NOT_SUPPORTED; /**< Returned error when factory got a request that it can't fullfil due to a set of unsupported parameters @since 1.22 */

#include "interfaces/efl_model.eo.h"

extern int efl_model_init(void);


/**
 * @brief Notifies a property changed event with an @c EFL_MODEL_EVENT_PROPERTIES_CHANGED
 *
 * @param model The model to be notified
 * @param property The changed property
 *
 * @since 1.17
 */
extern void _efl_model_properties_changed_internal(const Efl_Model *model, ...);


/**
 * @brief Notifies a property invalidated event with an @c EFL_MODEL_EVENT_PROPERTIES_CHANGED
 *
 * @param model The model to be notified
 * @param property The invalidated property
 *
 * @since 1.17
 */
extern void efl_model_property_invalidated_notify(Efl_Model *model, const char *property);

/**
 * @brief Callback to setup a member of @c Eina_Value_Struct
 *
 * @param data The user data
 * @param index The member index
 * @param member The member to fill its name and type. Must use @c Eina_Stringshare for name.
 */
typedef void (*Efl_Model_Value_Struct_Member_Setup_Cb)(void *data, int index, Eina_Value_Struct_Member *member);

/**
 * @brief Creates a new struct description
 *
 * @param member_count The number of struct members
 * @param setup_cb The callback to setup struct members
 * @param data The user data
 * @return Returns the struct description
 *
 * @since 1.17
 */
extern Eina_Value_Struct_Desc *efl_model_value_struct_description_new(unsigned int member_count, Efl_Model_Value_Struct_Member_Setup_Cb setup_cb, void *data) ;

/**
 * @brief Frees the memory allocated to the struct description.
 *
 * @param desc The struct description. If @c NULL, the function returns immediately.
 *
 * @since 1.17
 */
extern void efl_model_value_struct_description_free(Eina_Value_Struct_Desc *desc);

#endif
