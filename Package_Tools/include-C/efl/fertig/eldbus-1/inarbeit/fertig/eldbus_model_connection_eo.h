#ifndef _ELDBUS_MODEL_CONNECTION_EO_H_
#define _ELDBUS_MODEL_CONNECTION_EO_H_

#ifndef _ELDBUS_MODEL_CONNECTION_EO_CLASS_TYPE
#define _ELDBUS_MODEL_CONNECTION_EO_CLASS_TYPE

typedef Eo Eldbus_Model_Connection;

#endif

#ifndef _ELDBUS_MODEL_CONNECTION_EO_TYPES
#define _ELDBUS_MODEL_CONNECTION_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Eldbus model connection class
 *
 * @ingroup Eldbus_Model_Connection
 */
#define ELDBUS_MODEL_CONNECTION_CLASS eldbus_model_connection_class_get()

extern  const Efl_Class *eldbus_model_connection_class_get(void) ;
#endif /* EFL_BETA_API_SUPPORT */

#endif
