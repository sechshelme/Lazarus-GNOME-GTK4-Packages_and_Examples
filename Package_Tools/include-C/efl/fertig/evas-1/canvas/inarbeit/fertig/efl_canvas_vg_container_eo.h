#ifndef _EFL_CANVAS_VG_CONTAINER_EO_H_
#define _EFL_CANVAS_VG_CONTAINER_EO_H_

#ifndef _EFL_CANVAS_VG_CONTAINER_EO_CLASS_TYPE
#define _EFL_CANVAS_VG_CONTAINER_EO_CLASS_TYPE

typedef Eo Efl_Canvas_Vg_Container;

#endif

#ifndef _EFL_CANVAS_VG_CONTAINER_EO_TYPES
#define _EFL_CANVAS_VG_CONTAINER_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Efl vector graphics container class
 *
 * @ingroup Efl_Canvas_Vg_Container
 */
#define EFL_CANVAS_VG_CONTAINER_CLASS efl_canvas_vg_container_class_get()

extern  const Efl_Class *efl_canvas_vg_container_class_get(void) ;

/**
 * @brief Get child of container
 *
 * @param[in] obj The object.
 * @param[in] name Child node name
 *
 * @return Child object
 *
 * @ingroup Efl_Canvas_Vg_Container
 */
extern  Efl_Canvas_Vg_Node *efl_canvas_vg_container_child_get(Eo *obj, const char *name);

/**
 * @brief Get all children of container
 *
 * @param[in] obj The object.
 *
 * @return Iterator to children
 *
 * @ingroup Efl_Canvas_Vg_Container
 */
extern  Eina_Iterator *efl_canvas_vg_container_children_get(Eo *obj) ;

/**
 * @brief Get all children of container
 *
 * @param[in] obj The object.
 *
 * @return List to children
 *
 * @ingroup Efl_Canvas_Vg_Container
 */
extern  const Eina_List *efl_canvas_vg_container_children_direct_get(Eo *obj) ;
#endif /* EFL_BETA_API_SUPPORT */

#endif
