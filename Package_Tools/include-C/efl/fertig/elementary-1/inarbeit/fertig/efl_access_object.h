#ifndef EFL_ACCESS_H
#define EFL_ACCESS_H

#ifdef EFL_BETA_API_SUPPORT
#include "efl_access_object.eo.h"


/**
 * Free Efl_Access_Attributes_List
 */
extern void efl_access_attributes_list_free(Eina_List *list);

/**
 * Free the Efl_Access_Attribute type
 */
extern void
efl_access_attribute_free(Efl_Access_Attribute *attr);

/**
 * Emits Accessible 'StateChanged' signal.
 */

/**
 * Emits Accessible 'PropertyChanged' signal for 'Name' property.
 */

/**
 * Emits Accessible 'ChildrenChanged' signal with deleted child as argument.
 */

#endif
#endif
