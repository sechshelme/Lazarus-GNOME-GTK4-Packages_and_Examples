#ifndef _EFL_ACCESS_WINDOW_EO_H_
#define _EFL_ACCESS_WINDOW_EO_H_

#ifndef _EFL_ACCESS_WINDOW_EO_CLASS_TYPE
#define _EFL_ACCESS_WINDOW_EO_CLASS_TYPE

typedef Eo Efl_Access_Window;

#endif

#ifndef _EFL_ACCESS_WINDOW_EO_TYPES
#define _EFL_ACCESS_WINDOW_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Elementary accessible window interface
 *
 * @ingroup Efl_Access_Window
 */

extern  const Efl_Class *efl_access_window_interface_get(void) ;

extern const Efl_Event_Description _EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED;

/** Called when new window has been created.
 *
 * @ingroup Efl_Access_Window
 */

extern const Efl_Event_Description _EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED;

/** Called when window has been destroyed.
 *
 * @ingroup Efl_Access_Window
 */

extern const Efl_Event_Description _EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED;

/** Called when window has been activated. (focused)
 *
 * @ingroup Efl_Access_Window
 */

extern const Efl_Event_Description _EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED;

/** Called when window has been deactivated (unfocused).
 *
 * @ingroup Efl_Access_Window
 */

extern const Efl_Event_Description _EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED;

/** Called when window has been maximized
 *
 * @ingroup Efl_Access_Window
 */

extern const Efl_Event_Description _EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED;

/** Called when window has been minimized
 *
 * @ingroup Efl_Access_Window
 */

extern const Efl_Event_Description _EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED;

/** Called when window has been restored
 *
 * @ingroup Efl_Access_Window
 */
#define EFL_ACCESS_WINDOW_INTERFACE efl_access_window_interface_get()
#define EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED (&(_EFL_ACCESS_WINDOW_EVENT_WINDOW_CREATED))
#define EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED (&(_EFL_ACCESS_WINDOW_EVENT_WINDOW_DESTROYED))
#define EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED (&(_EFL_ACCESS_WINDOW_EVENT_WINDOW_ACTIVATED))
#define EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED (&(_EFL_ACCESS_WINDOW_EVENT_WINDOW_DEACTIVATED))
#define EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED (&(_EFL_ACCESS_WINDOW_EVENT_WINDOW_MAXIMIZED))
#define EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED (&(_EFL_ACCESS_WINDOW_EVENT_WINDOW_MINIMIZED))
#define EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED (&(_EFL_ACCESS_WINDOW_EVENT_WINDOW_RESTORED))
#endif /* EFL_BETA_API_SUPPORT */

#endif
