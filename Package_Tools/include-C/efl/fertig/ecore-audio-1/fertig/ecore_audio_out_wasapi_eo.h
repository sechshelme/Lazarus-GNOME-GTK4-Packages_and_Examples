#ifndef _ECORE_AUDIO_OUT_WASAPI_EO_H_
#define _ECORE_AUDIO_OUT_WASAPI_EO_H_

#ifndef _ECORE_AUDIO_OUT_WASAPI_EO_CLASS_TYPE
#define _ECORE_AUDIO_OUT_WASAPI_EO_CLASS_TYPE

typedef Eo Ecore_Audio_Out_Wasapi;

#endif

#ifndef _ECORE_AUDIO_OUT_WASAPI_EO_TYPES
#define _ECORE_AUDIO_OUT_WASAPI_EO_TYPES


#endif
#ifdef EFL_BETA_API_SUPPORT
/** Ecore audio ouput for WasapiAudio.
 *
 * @ingroup Ecore_Audio_Out_Wasapi
 */
#define ECORE_AUDIO_OUT_WASAPI_CLASS ecore_audio_out_wasapi_class_get()

extern  const Efl_Class *ecore_audio_out_wasapi_class_get(void) ;

  extern const Efl_Event_Description _ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY;

/** Called when the output is ready for playback.
 *
 * @ingroup Ecore_Audio_Out_Wasapi
 */

  extern const Efl_Event_Description _ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL;

/** Called when context fails.
 *
 * @ingroup Ecore_Audio_Out_Wasapi
 */

  extern const Efl_Event_Description _ECORE_AUDIO_OUT_WASAPI_EVENT_STOP;

/** Called when need to stop.
 *
 * @ingroup Ecore_Audio_Out_Wasapi
 */
#define ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY (&(_ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_READY))
#define ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL (&(_ECORE_AUDIO_OUT_WASAPI_EVENT_CONTEXT_FAIL))
#define ECORE_AUDIO_OUT_WASAPI_EVENT_STOP (&(_ECORE_AUDIO_OUT_WASAPI_EVENT_STOP))
#endif /* EFL_BETA_API_SUPPORT */

#endif
