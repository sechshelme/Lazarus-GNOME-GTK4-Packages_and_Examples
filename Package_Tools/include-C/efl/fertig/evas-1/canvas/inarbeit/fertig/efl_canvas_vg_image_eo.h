#ifndef _EFL_CANVAS_VG_IMAGE_EO_H_
#define _EFL_CANVAS_VG_IMAGE_EO_H_

#ifndef _EFL_CANVAS_VG_IMAGE_EO_CLASS_TYPE
#define _EFL_CANVAS_VG_IMAGE_EO_CLASS_TYPE

typedef Eo Efl_Canvas_Vg_Image;

#endif

#ifndef _EFL_CANVAS_VG_IMAGE_EO_TYPES
#define _EFL_CANVAS_VG_IMAGE_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Efl vector graphics image class
 *
 * @ingroup Efl_Canvas_Vg_Image
 */
#define EFL_CANVAS_VG_IMAGE_CLASS efl_canvas_vg_image_class_get()

extern  const Efl_Class *efl_canvas_vg_image_class_get(void) ;

/**
 * @brief Set image data
 *
 * @param[in] obj The object.
 * @param[in] pixels Image pixels data. The pixel data type is 32bit RGBA
 * @param[in] size The size in pixels.
 *
 * @ingroup Efl_Canvas_Vg_Image
 */
extern  void efl_canvas_vg_image_data_set(Eo *obj, void *pixels, Eina_Size2D size);
#endif /* EFL_BETA_API_SUPPORT */

#endif
