/**
 * @addtogroup Elm_Layout
 *
 * @{
 */

/**
 * @def elm_layout_icon_set
 * Convenience macro to set the icon object in a layout that follows the
 * Elementary naming convention for its parts.
 */
#define elm_layout_icon_get(_ly) \
  elm_layout_content_get((_ly), "elm.swallow.icon")

#define elm_layout_end_get(_ly) \
  elm_layout_content_get((_ly), "elm.swallow.end")

/**
 * @}
 */
