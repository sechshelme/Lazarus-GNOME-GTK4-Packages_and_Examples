#ifndef _EFL_UI_IMAGE_ZOOMABLE_EO_H_
#define _EFL_UI_IMAGE_ZOOMABLE_EO_H_

#ifndef _EFL_UI_IMAGE_ZOOMABLE_EO_CLASS_TYPE
#define _EFL_UI_IMAGE_ZOOMABLE_EO_CLASS_TYPE

typedef Eo Efl_Ui_Image_Zoomable;

#endif

#ifndef _EFL_UI_IMAGE_ZOOMABLE_EO_TYPES
#define _EFL_UI_IMAGE_ZOOMABLE_EO_TYPES


#endif
/** Elementary Image Zoomable class
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
 */
#define EFL_UI_IMAGE_ZOOMABLE_CLASS efl_ui_image_zoomable_class_get()

extern  const Efl_Class *efl_ui_image_zoomable_class_get(void) ;

/**
 * @brief The gesture state for photocam.
 *
 * This sets the gesture state to on or off for photocam. The default is off.
 * This will start multi touch zooming.
 *
 * @param[in] obj The object.
 * @param[in] gesture The gesture state.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
 */
extern  void efl_ui_image_zoomable_gesture_enabled_set(Eo *obj, Eina_Bool gesture);

/**
 * @brief The gesture state for photocam.
 *
 * This sets the gesture state to on or off for photocam. The default is off.
 * This will start multi touch zooming.
 *
 * @param[in] obj The object.
 *
 * @return The gesture state.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
 */
extern  Eina_Bool efl_ui_image_zoomable_gesture_enabled_get(const Eo *obj);

/**
 * @brief The region of the image that is currently shown
 *
 * Setting it shows the region of the image without using animation.
 *
 * @param[in] obj The object.
 * @param[in] region The region in the original image pixels.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
 */
extern  void efl_ui_image_zoomable_image_region_set(Eo *obj, Eina_Rect region);

/**
 * @brief The region of the image that is currently shown
 *
 * Setting it shows the region of the image without using animation.
 *
 * @param[in] obj The object.
 *
 * @return The region in the original image pixels.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
 */
extern  Eina_Rect efl_ui_image_zoomable_image_region_get(const Eo *obj);

extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE;
extern  const Efl_Event_Description _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR;
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE))
#define EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR (&(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR))

#endif
