#ifndef _EFL_DUPLICATE_EO_H_
#define _EFL_DUPLICATE_EO_H_

#ifndef _EFL_DUPLICATE_EO_CLASS_TYPE
#define _EFL_DUPLICATE_EO_CLASS_TYPE

typedef Eo Efl_Duplicate;

#endif

#ifndef _EFL_DUPLICATE_EO_TYPES
#define _EFL_DUPLICATE_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/**
 * @brief An interface for duplication of objects.
 *
 * Objects implementing this interface can be duplicated with
 * @ref efl_duplicate.
 *
 * @ingroup Efl_Duplicate
 */
#define EFL_DUPLICATE_INTERFACE efl_duplicate_interface_get()

extern  const Efl_Class *efl_duplicate_interface_get(void) ;

/**
 * @brief Creates a carbon copy of this object and returns it.
 *
 * The newly created object will have no event handlers or anything of the
 * sort.
 *
 * @param[in] obj The object.
 *
 * @return Returned carbon copy
 *
 * @ingroup Efl_Duplicate
 */
extern  Efl_Duplicate *efl_duplicate(const Eo *obj);
#endif /* EFL_BETA_API_SUPPORT */

#endif
