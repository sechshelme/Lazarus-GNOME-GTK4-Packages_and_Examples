#ifndef _EFL_CANVAS_WL_EO_H_
#define _EFL_CANVAS_WL_EO_H_

#ifndef _EFL_CANVAS_WL_EO_CLASS_TYPE
#define _EFL_CANVAS_WL_EO_CLASS_TYPE

typedef Eo Efl_Canvas_Wl;

#endif

#ifndef _EFL_CANVAS_WL_EO_TYPES
#define _EFL_CANVAS_WL_EO_TYPES

#ifdef EFL_BETA_API_SUPPORT
/** Orientation of the internal compositor object in degrees. These values are
 * COUNTER-CLOCKWISE.
 *
 * @ingroup Efl_Canvas_Wl_Rotation
 */
typedef enum
{
  EFL_CANVAS_WL_ROTATION_ROTATE_0 = 0,
  EFL_CANVAS_WL_ROTATION_ROTATE_90 = 1,
  EFL_CANVAS_WL_ROTATION_ROTATE_180 = 2,
  EFL_CANVAS_WL_ROTATION_ROTATE_270 = 3
} Efl_Canvas_Wl_Rotation;
#endif /* EFL_BETA_API_SUPPORT */


#endif
#ifdef EFL_BETA_API_SUPPORT
/**
 * @brief A multiseat xdg-shell compliant Wayland compositor which runs in a
 * canvas object.
 *
 * All toplevel windows will be sized to the size of the compositor object
 * unless extracted with @ref efl_canvas_wl_surface_extract.
 *
 * Only clients executed with @ref efl_canvas_wl_run or added with
 * @ref efl_canvas_wl_allowed_pid_add will be permitted to connect to this
 * compositor.
 *
 * If no surface is activated at the time of the first toplevel surface's first
 * buffer commit, this first surface will automatically be activated so long as
 * its geometry is not externally modified during this time. If regularly
 * modifying geometry is necessary, surfaces should be manually activated with
 * the @ref efl_canvas_wl_active_surface_get property.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
#define EFL_CANVAS_WL_CLASS efl_canvas_wl_class_get()

extern extern_WEAK const Efl_Class *efl_canvas_wl_class_get(void) EINA_CONST;

/**
 * @brief Run a specified command in the compositor widget. If GL is available,
 * the ELM_ACCEL environment variable will be set to "gl" while executing the
 * command.
 *
 * @param[in] obj The object.
 * @param[in] cmd The command to execute.
 *
 * @return The exe object for the executed process. @c NULL on failure.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Efl_Exe *efl_canvas_wl_run(Eo *obj, const char *cmd);

/**
 * @brief The flags to be used when running commands with
 * @ref efl_canvas_wl_run. Changing this value will only affect commands run
 * after this call.
 *
 * The default is @ref EFL_EXE_FLAGS_TERM_WITH_PARENT.
 *
 * @param[in] obj The object.
 * @param[in] flags A bitmask of flags.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_exec_flags_set(Eo *obj, Efl_Exe_Flags flags);

/**
 * @brief The flags to be used when running commands with
 * @ref efl_canvas_wl_run. Changing this value will only affect commands run
 * after this call.
 *
 * The default is @ref EFL_EXE_FLAGS_TERM_WITH_PARENT.
 *
 * @param[in] obj The object.
 *
 * @return A bitmask of flags.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Efl_Exe_Flags efl_canvas_wl_exec_flags_get(const Eo *obj);

/**
 * @brief Add a process to the list of allowed clients for the compositor
 * widget.
 *
 * Once called, this client will be capable of connecting to the internal
 * compositor even if it was not executed by the widget.
 *
 * @param[in] obj The object.
 * @param[in] pid The pid to add.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_allowed_pid_add(Eo *obj, int pid);

/**
 * @brief Remove a process from the list of allowed clients for the compositor
 * widget.
 *
 * Once called, this client will be incapable of connecting to the internal
 * compositor even if it was executed by the widget.
 *
 * @param[in] obj The object.
 * @param[in] pid The pid to remove.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_allowed_pid_del(Eo *obj, int pid);

/**
 * @brief Activate and raise the bottom-most toplevel surface.
 *
 * @param[in] obj The object.
 *
 * @return The surface that was activated, or @c NULL if no change was made.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Efl_Canvas_Wl_Surface *efl_canvas_wl_surface_next(Eo *obj);

/**
 * @brief Activate and raise the second top-most toplevel surface.
 *
 * @param[in] obj The object.
 *
 * @return The surface that was activated, or @c NULL if no change was made.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Efl_Canvas_Wl_Surface *efl_canvas_wl_surface_prev(Eo *obj);

/**
 * @brief This is the currently activated surface in the compositor widget.
 * Only one surface can be activated at a time.
 *
 * @param[in] obj The object.
 * @param[in] surface The activated surface.
 *
 * @return Returns @c true if a change was successfully made.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Eina_Bool efl_canvas_wl_active_surface_set(Eo *obj, Efl_Canvas_Wl_Surface *surface);

/**
 * @brief This is the currently activated surface in the compositor widget.
 * Only one surface can be activated at a time.
 *
 * @param[in] obj The object.
 *
 * @return The activated surface.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Efl_Canvas_Wl_Surface *efl_canvas_wl_active_surface_get(const Eo *obj);

/**
 * @brief When set to @c true, the compositor will propagate the aspect ratio
 * of the top-most surface to the @ref efl_gfx_hint_aspect_get of the
 * compositor widget.
 *
 * @param[in] obj The object.
 * @param[in] set Whether to propagate the hint.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_aspect_propagate_set(Eo *obj, Eina_Bool set);

/**
 * @brief When set to @c true, the compositor will propagate the aspect ratio
 * of the top-most surface to the @ref efl_gfx_hint_aspect_get of the
 * compositor widget.
 *
 * @param[in] obj The object.
 *
 * @return Whether to propagate the hint.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Eina_Bool efl_canvas_wl_aspect_propagate_get(const Eo *obj);

/**
 * @brief When set to @c true, the compositor will propagate the min and max
 * hints of the top-most surface to the @ref efl_gfx_hint_size_min_get and
 * @ref efl_gfx_hint_size_max_get of the compositor widget.
 *
 * @param[in] obj The object.
 * @param[in] set Whether to propagate the hints.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_minmax_propagate_set(Eo *obj, Eina_Bool set);

/**
 * @brief When set to @c true, the compositor will propagate the min and max
 * hints of the top-most surface to the @ref efl_gfx_hint_size_min_get and
 * @ref efl_gfx_hint_size_max_get of the compositor widget.
 *
 * @param[in] obj The object.
 *
 * @return Whether to propagate the hints.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Eina_Bool efl_canvas_wl_minmax_propagate_get(const Eo *obj);

/**
 * @brief Set the rotation and flip for the compositor's internal output, which
 * is passed to clients.
 *
 * Note that the rotation provided here is counter-clockwise.
 *
 * @param[in] obj The object.
 * @param[in] rotation The rotation to apply to the internal output.
 * @param[in] rtl The horizontal flip to apply to the internal output.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_rotation_set(Eo *obj, Efl_Canvas_Wl_Rotation rotation, Eina_Bool rtl);

/**
 * @brief Set the rotation and flip for the compositor's internal output, which
 * is passed to clients.
 *
 * Note that the rotation provided here is counter-clockwise.
 *
 * @param[in] obj The object.
 * @param[out] rotation The rotation to apply to the internal output.
 * @param[out] rtl The horizontal flip to apply to the internal output.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_rotation_get(const Eo *obj, Efl_Canvas_Wl_Rotation *rotation, Eina_Bool *rtl);

/**
 * @brief Add a new wl_global to the internal compositor.
 *
 * Use this to add implementations of custom extensions for use in the
 * compositor. Globals are removed with wl_global_destroy in libwayland.
 *
 * Read Wayland documentation for more info.
 *
 * @param[in] obj The object.
 * @param[in] interface The wl_interface of callbacks for the protocol.
 * @param[in] version The version of the protocol.
 * @param[in] data The data to be passed to the callback functions.
 * @param[in] bind_cb The callback to trigger when a client has bound this
 * global.
 *
 * @return The @c wl_global or @c NULL on failure.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK Efl_Canvas_Wl_Wl_Global *efl_canvas_wl_global_add(Eo *obj, const Efl_Canvas_Wl_Wl_Interface *interface, unsigned int version, Efl_Canvas_Wl_Wl_Interface_Data *data, Efl_Canvas_Wl_Wl_Interface_Bind_Cb *bind_cb);

/**
 * @brief Sets the keymap for the internal compositor's seat.
 *
 * This is useful when nesting the compositor widget inside another compositor
 * in order to reuse the existing keymap and state.
 *
 * @param[in] obj The object.
 * @param[in] seat The seat to set the keymap of, or @c NULL for all seats.
 * @param[in] state The @c xkb_state to apply.
 * @param[in] keymap_str The keymap type as a string, as reported by
 * libxkbcommon. The lifetime of the passed string must exceed the lifetime of
 * the compositor widget.
 * @param[in] key_array The current @c wl_array of keys.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_seat_keymap_set(Eo *obj, Efl_Input_Device *seat, Efl_Canvas_Wl_Xkb_State *state, const char *keymap_str, Efl_Canvas_Wl_Wl_Array *key_array);

/**
 * @brief Modify the key repeat rate and delay of the internal compositor for a
 * given seat. This is the value sent to clients.
 *
 * @param[in] obj The object.
 * @param[in] seat The seat to set the repeat rate and delay of, or @c NULL for
 * all seats.
 * @param[in] repeat_rate The repeat rate to set in number of times per second
 * keys should repeat.
 * @param[in] repeat_delay The delay before repeating should begin in
 * milliseconds.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
extern extern_WEAK void efl_canvas_wl_seat_key_repeat_set(Eo *obj, Efl_Input_Device *seat, int repeat_rate, int repeat_delay);

extern extern_WEAK extern const Efl_Event_Description _EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED;

/** Contains the toplevel surface which was added.
 * @return Efl_Canvas_Wl_Surface *
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
#define EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED (&(_EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED))

extern extern_WEAK extern const Efl_Event_Description _EFL_CANVAS_WL_EVENT_CHILD_ADDED;

/** Contains the toplevel child surface which was added.
 * @return Efl_Canvas_Wl_Surface *
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
#define EFL_CANVAS_WL_EVENT_CHILD_ADDED (&(_EFL_CANVAS_WL_EVENT_CHILD_ADDED))

extern extern_WEAK extern const Efl_Event_Description _EFL_CANVAS_WL_EVENT_POPUP_ADDED;

/** Contains the popup surface which was added.
 * @return Efl_Canvas_Wl_Surface *
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
#define EFL_CANVAS_WL_EVENT_POPUP_ADDED (&(_EFL_CANVAS_WL_EVENT_POPUP_ADDED))

extern extern_WEAK extern const Efl_Event_Description _EFL_CANVAS_WL_EVENT_SEAT_ADDED;

/** Contains the seat object that was added.
 * @return Efl_Input_Device *
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl
 */
#define EFL_CANVAS_WL_EVENT_SEAT_ADDED (&(_EFL_CANVAS_WL_EVENT_SEAT_ADDED))
#endif /* EFL_BETA_API_SUPPORT */

#endif
