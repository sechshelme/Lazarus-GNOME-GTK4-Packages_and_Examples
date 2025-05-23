#ifndef _EFL_CONTAINER_EO_H_
#define _EFL_CONTAINER_EO_H_

#ifndef _EFL_CONTAINER_EO_CLASS_TYPE
#define _EFL_CONTAINER_EO_CLASS_TYPE

typedef Eo Efl_Container;

#endif

#ifndef _EFL_CONTAINER_EO_TYPES
#define _EFL_CONTAINER_EO_TYPES


#endif
/**
 * @brief Common interface for objects (containers) that can have multiple
 * contents (sub-objects).
 *
 * APIs in this interface deal with containers of multiple sub-objects, not
 * with individual parts.
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
 */
#define EFL_CONTAINER_INTERFACE efl_container_interface_get()

extern  const Efl_Class *efl_container_interface_get(void) ;

/**
 * @brief Begin iterating over this object's contents.
 *
 * @param[in] obj The object.
 *
 * @return Iterator on object's content.
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
 */
extern  Eina_Iterator *efl_content_iterate(Eo *obj) ;

/**
 * @brief Returns the number of contained sub-objects.
 *
 * @param[in] obj The object.
 *
 * @return Number of sub-objects.
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
 */
extern  int efl_content_count(Eo *obj);

  extern const Efl_Event_Description _EFL_CONTAINER_EVENT_CONTENT_ADDED;

/** Sent after a new sub-object was added.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
 */

 extern const Efl_Event_Description _EFL_CONTAINER_EVENT_CONTENT_REMOVED;

/** Sent after a sub-object was removed, before unref.
 * @return Efl_Gfx_Entity *
 *
 * @since 1.22
 *
 * @ingroup Efl_Container
 */
#define EFL_CONTAINER_EVENT_CONTENT_ADDED (&(_EFL_CONTAINER_EVENT_CONTENT_ADDED))
#define EFL_CONTAINER_EVENT_CONTENT_REMOVED (&(_EFL_CONTAINER_EVENT_CONTENT_REMOVED))

#endif
