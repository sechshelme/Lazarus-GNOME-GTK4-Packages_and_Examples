#ifndef _EFL_CANVAS_VIDEO_EO_H_
#define _EFL_CANVAS_VIDEO_EO_H_

#ifndef _EFL_CANVAS_VIDEO_EO_CLASS_TYPE
#define _EFL_CANVAS_VIDEO_EO_CLASS_TYPE

typedef Eo Efl_Canvas_Video;

#endif

#ifndef _EFL_CANVAS_VIDEO_EO_TYPES
#define _EFL_CANVAS_VIDEO_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Efl canvas video class
 *
 * @ingroup Efl_Canvas_Video
 */
#define EFL_CANVAS_VIDEO_CLASS efl_canvas_video_class_get()

extern const Efl_Class *efl_canvas_video_class_get(void) ;

/**
 * @brief Sets options for the current module.
 *
 * This function allows one to mute the video or audio of the emotion object.
 *
 * Please don't use this function, consider using
 * @ref efl_audio_control_mute_get instead.
 *
 * @param[in] obj The object.
 * @param[in] opt The option that is being set. Currently supported options:
 * "video" and "audio".
 * @param[in] val The value of the option. Currently only supports "off"
 * (?!?!?!)
 *
 * @ingroup Efl_Canvas_Video
 */
extern void efl_canvas_video_option_set(Eo *obj, const char *opt, const char *val);

/**
 * @brief Initializes an emotion object with the specified module.
 *
 * This function is required after creating the emotion object, in order to
 * specify which module will be used with this object. Different objects can
 * use different modules to play a media file. The current supported modules
 * are gstreamer and xine.
 *
 * To use any of them, you need to make sure that support for them was compiled
 * correctly.
 *
 * It's possible to disable the build of a module with --disable-module_name.
 *
 * See also @ref efl_file_get.
 *
 * @param[in] obj The object.
 * @param[in] module_filename The name of the module to be used (gstreamer or
 * xine).
 *
 * @return @c true if the specified module was successfully initialized for
 * this object, @c false otherwise.
 *
 * @ingroup Efl_Canvas_Video
 */
extern Eina_Bool efl_canvas_video_engine_set(Eo *obj, const char *module_filename);

extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_REF_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_OPEN_DONE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE;
extern const Efl_Event_Description _EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL;


#define EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE (&(_EFL_CANVAS_VIDEO_EVENT_FRAME_DECODE))
#define EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_POSITION_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_LENGTH_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE (&(_EFL_CANVAS_VIDEO_EVENT_FRAME_RESIZE))
#define EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START (&(_EFL_CANVAS_VIDEO_EVENT_PLAYBACK_START))
#define EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP (&(_EFL_CANVAS_VIDEO_EVENT_PLAYBACK_STOP))
#define EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_VOLUME_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_CHANNELS_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_TITLE_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_PROGRESS_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_REF_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_REF_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_BUTTON_NUM_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE (&(_EFL_CANVAS_VIDEO_EVENT_BUTTON_CHANGE))
#define EFL_CANVAS_VIDEO_EVENT_OPEN_DONE (&(_EFL_CANVAS_VIDEO_EVENT_OPEN_DONE))
#define EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE (&(_EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_DONE))
#define EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL (&(_EFL_CANVAS_VIDEO_EVENT_POSITION_SAVE_FAIL))
#define EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE (&(_EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_DONE))
#define EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL (&(_EFL_CANVAS_VIDEO_EVENT_POSITION_LOAD_FAIL))
#endif /* EFL_BETA_API_SUPPORT */

#endif
