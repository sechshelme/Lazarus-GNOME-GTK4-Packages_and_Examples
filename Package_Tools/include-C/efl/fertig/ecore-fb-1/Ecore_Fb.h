#ifndef _ECORE_FB_H
#define _ECORE_FB_H

#include <Eina.h>

#ifdef extern
# undef extern
#endif


/* FIXME:
 * maybe a new module?
 * - code to get battery info
 * - code to get thermal info
 * ecore evas fb isn't good enough for weird things, like multiple fb's, same happens here.
 * backlight support using new kernel interface
 * absolute axis
 * joystick
 * ecore_fb_li_device_close_all ? or a shutdown of the subsystem?
 *
 */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * @defgroup Ecore_FB_Group Ecore_FB - Frame buffer convenience functions.
 * @ingroup Ecore
 *
 * Functions used to set up and shut down the Ecore_Framebuffer functions.
 *
 * @{
 */

/**
 * @typedef Ecore_Fb_Input_Device
 * Input device handler.
 */
typedef struct _Ecore_Fb_Input_Device Ecore_Fb_Input_Device;

/**
 * @enum _Ecore_Fb_Input_Device_Cap
 * Device capabilities.
 */
enum _Ecore_Fb_Input_Device_Cap
{
   ECORE_FB_INPUT_DEVICE_CAP_NONE            = 0x00000000,
   ECORE_FB_INPUT_DEVICE_CAP_RELATIVE        = 0x00000001,
   ECORE_FB_INPUT_DEVICE_CAP_ABSOLUTE        = 0x00000002,
   ECORE_FB_INPUT_DEVICE_CAP_KEYS_OR_BUTTONS = 0x00000004
};

/**
 * @typedef Ecore_Fb_Input_Device_Cap
 * Device capabilities.
 */
typedef enum   _Ecore_Fb_Input_Device_Cap Ecore_Fb_Input_Device_Cap;

/* ecore_fb_vt.c */
extern void                      ecore_fb_callback_gain_set(void (*func) (void *data), void *data);
extern void                      ecore_fb_callback_lose_set(void (*func) (void *data), void *data);

/* ecore_fb_li.c */
extern Ecore_Fb_Input_Device    *ecore_fb_input_device_open(const char *dev);
extern void                      ecore_fb_input_device_close(Ecore_Fb_Input_Device *dev);
extern void                      ecore_fb_input_device_listen(Ecore_Fb_Input_Device *dev, Eina_Bool listen);
extern const char               *ecore_fb_input_device_name_get(Ecore_Fb_Input_Device *dev);
extern Ecore_Fb_Input_Device_Cap ecore_fb_input_device_cap_get(Ecore_Fb_Input_Device *dev);
extern void                      ecore_fb_input_device_axis_size_set(Ecore_Fb_Input_Device *dev, int w, int h);
extern void                      ecore_fb_input_threshold_click_set(Ecore_Fb_Input_Device *dev, double threshold);
extern double                    ecore_fb_input_threshold_click_get(Ecore_Fb_Input_Device *dev);
extern void                      ecore_fb_input_device_window_set(Ecore_Fb_Input_Device *dev, void *window);

/* ecore_fb.c */

extern int                       ecore_fb_init(const char *name);
extern int                       ecore_fb_shutdown(void);
extern void                      ecore_fb_size_get(int *w, int *h);

extern void                      ecore_fb_touch_screen_calibrate_set(int xscale, int xtrans, int yscale, int ytrans, int xyswap);
extern void                      ecore_fb_touch_screen_calibrate_get(int *xscale, int *xtrans, int *yscale, int *ytrans, int *xyswap);


#endif
