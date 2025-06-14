#ifndef _EFL_CANVAS_WL_SURFACE_EO_H_
#define _EFL_CANVAS_WL_SURFACE_EO_H_

#ifndef _EFL_CANVAS_WL_SURFACE_EO_CLASS_TYPE
#define _EFL_CANVAS_WL_SURFACE_EO_CLASS_TYPE

typedef Eo Efl_Canvas_Wl_Surface;

#endif

#ifndef _EFL_CANVAS_WL_SURFACE_EO_TYPES
#define _EFL_CANVAS_WL_SURFACE_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/**
 * @brief A canvas object representing a Wayland toplevel or popup surface.
 *
 * This object's geometry properties reflect the properties of the underlying
 * surface. If the client is using a protocol to export its size hints, those
 * hints will be directly applied to this object any time they change in the
 * application.
 *
 * Changes to geometry and visibility of this object must not be made while
 * @ref efl_canvas_wl_surface_extracted_get is @c false.
 *
 * Changes to size of this object will be immediately propagated to the
 * underlying application.
 *
 * Hiding this object will have differing effects based on the surface's
 * xdg-shell role. If the surface is a popup, it will be sent the 'done'
 * protocol event which will close it. If the surface is a toplevel, it will be
 * deactivated if it was active.
 *
 * This object's lifetime is bound to the lifetime of the underlying surface or
 * the compositor widget.
 *
 * This object must not be manually deleted.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
 */
#define EFL_CANVAS_WL_SURFACE_CLASS efl_canvas_wl_surface_class_get()

extern  const Efl_Class *efl_canvas_wl_surface_class_get(void) ;

/**
 * @brief Extract a surface from the compositor widget.
 *
 * Call this prior to making any calls which directly modify the geometry of
 * the surface. Once extracted, the compositor will no longer attempt to
 * automatically apply geometry or stacking changes to the surface.
 *
 * Once extracted, a surface cannot be un-extracted.
 *
 * @param[in] obj The object.
 *
 * @return Returns @c true if the surface was successfully extracted.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
 */
extern  Eina_Bool efl_canvas_wl_surface_extract(Eo *obj);

/**
 * @brief The process id of the surface's application.
 *
 * @param[in] obj The object.
 *
 * @return The process id, or -1 if the surface has been asynchronously
 * destroyed.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
 */
extern  int efl_canvas_wl_surface_pid_get(const Eo *obj);

/**
 * @brief The parent surface of the given surface. This value is @c NULL for
 * toplevel surfaces without a parent.
 *
 * For popup surfaces, this may be another popup or a toplevel. For toplevel
 * surfaces, this will always be another toplevel or @c NULL.
 *
 * @param[in] obj The object.
 *
 * @return The parent surface. @c NULL if no parent exists or the surface was
 * asynchronously destroyed.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
 */
extern  Efl_Canvas_Wl_Surface *efl_canvas_wl_surface_parent_surface_get(const Eo *obj);

/**
 * @brief The extracted state of the surface.
 *
 * @param[in] obj The object.
 *
 * @return @c true if @ref efl_canvas_wl_surface_extract was successfully
 * called previously.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
 */
extern  Eina_Bool efl_canvas_wl_surface_extracted_get(const Eo *obj);
#endif /* EFL_BETA_API_SUPPORT */

#endif
