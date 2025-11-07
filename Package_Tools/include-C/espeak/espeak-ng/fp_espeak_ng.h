/* eSpeak NG API.
 *
 * Copyright (C) 2015-2017 Reece H. Dunn
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef ESPEAK_NG_H
#define ESPEAK_NG_H

#include <espeak-ng/speak_lib.h>

#ifdef __cplusplus
extern "C"
{
#endif


#define ESPEAKNG_DEFAULT_VOICE "en"

typedef enum {
	ENS_GROUP_MASK               = 0x70000000,
	ENS_GROUP_ERRNO              = 0x00000000, /* Values 0-255 map to errno error codes. */
	ENS_GROUP_ESPEAK_NG          = 0x10000000, /* eSpeak NG error codes. */

	/* eSpeak NG 1.49.0 */
	ENS_OK                       = 0,
	ENS_COMPILE_ERROR            = 0x100001FF,
	ENS_VERSION_MISMATCH         = 0x100002FF,
	ENS_FIFO_BUFFER_FULL         = 0x100003FF,
	ENS_NOT_INITIALIZED          = 0x100004FF,
	ENS_AUDIO_ERROR              = 0x100005FF,
	ENS_VOICE_NOT_FOUND          = 0x100006FF,
	ENS_MBROLA_NOT_FOUND         = 0x100007FF,
	ENS_MBROLA_VOICE_NOT_FOUND   = 0x100008FF,
	ENS_EVENT_BUFFER_FULL        = 0x100009FF,
	ENS_NOT_SUPPORTED            = 0x10000AFF,
	ENS_UNSUPPORTED_PHON_FORMAT  = 0x10000BFF,
	ENS_NO_SPECT_FRAMES          = 0x10000CFF,
	ENS_EMPTY_PHONEME_MANIFEST   = 0x10000DFF,
	ENS_SPEECH_STOPPED           = 0x10000EFF,

	/* eSpeak NG 1.49.2 */
	ENS_UNKNOWN_PHONEME_FEATURE  = 0x10000FFF,
	ENS_UNKNOWN_TEXT_ENCODING    = 0x100010FF,
} espeak_ng_STATUS;

typedef enum {
	ENOUTPUT_MODE_SYNCHRONOUS = 0x0001,
	ENOUTPUT_MODE_SPEAK_AUDIO = 0x0002,
} espeak_ng_OUTPUT_MODE;

typedef enum {
	ENGENDER_UNKNOWN = 0,
	ENGENDER_MALE = 1,
	ENGENDER_FEMALE = 2,
	ENGENDER_NEUTRAL = 3,
} espeak_ng_VOICE_GENDER;

typedef struct
{
  void (*outputPhoSymbol)(char* pho_code,int pho_type);
  void (*outputSilence)(short echo_tail);
  void (*outputVoiced)(short sample);
  void (*outputUnvoiced)(short sample);
} espeak_ng_OUTPUT_HOOKS;

/* eSpeak NG 1.49.0 */

typedef struct espeak_ng_ERROR_CONTEXT_ *espeak_ng_ERROR_CONTEXT;

extern void
espeak_ng_ClearErrorContext(espeak_ng_ERROR_CONTEXT *context);

extern void
espeak_ng_GetStatusCodeMessage(espeak_ng_STATUS status,
                               char *buffer,
                               size_t length);

extern void
espeak_ng_PrintStatusCodeMessage(espeak_ng_STATUS status,
                                 FILE *out,
                                 espeak_ng_ERROR_CONTEXT context);

extern void
espeak_ng_InitializePath(const char *path);

extern espeak_ng_STATUS
espeak_ng_Initialize(espeak_ng_ERROR_CONTEXT *context);

extern espeak_ng_STATUS
espeak_ng_InitializeOutput(espeak_ng_OUTPUT_MODE output_mode,
                           int buffer_length,
                           const char *device);

extern int
espeak_ng_GetSampleRate(void);

extern espeak_ng_STATUS
espeak_ng_SetParameter(espeak_PARAMETER parameter,
                       int value,
                       int relative);

extern espeak_ng_STATUS
espeak_ng_SetPunctuationList(const wchar_t *punctlist);

extern espeak_ng_STATUS
espeak_ng_SetVoiceByName(const char *name);

extern espeak_ng_STATUS
espeak_ng_SetVoiceByFile(const char *filename);

extern espeak_ng_STATUS
espeak_ng_SetVoiceByProperties(espeak_VOICE *voice_selector);

extern espeak_ng_STATUS
espeak_ng_Synthesize(const void *text,
                     size_t size,
                     unsigned int position,
                     espeak_POSITION_TYPE position_type,
                     unsigned int end_position,
                     unsigned int flags,
                     unsigned int *unique_identifier,
                     void *user_data);

extern espeak_ng_STATUS
espeak_ng_SynthesizeMark(const void *text,
                         size_t size,
                         const char *index_mark,
                         unsigned int end_position,
                         unsigned int flags,
                         unsigned int *unique_identifier,
                         void *user_data);

extern espeak_ng_STATUS
espeak_ng_SpeakKeyName(const char *key_name);

extern espeak_ng_STATUS
espeak_ng_SpeakCharacter(wchar_t character);

extern espeak_ng_STATUS
espeak_ng_Cancel(void);

extern espeak_ng_STATUS
espeak_ng_Synchronize(void);

extern espeak_ng_STATUS
espeak_ng_Terminate(void);

extern espeak_ng_STATUS
espeak_ng_CompileDictionary(const char *dsource,
                            const char *dict_name,
                            FILE *log,
                            int flags,
                            espeak_ng_ERROR_CONTEXT *context);

extern espeak_ng_STATUS
espeak_ng_CompileMbrolaVoice(const char *path,
                             FILE *log,
                             espeak_ng_ERROR_CONTEXT *context);

extern espeak_ng_STATUS
espeak_ng_CompilePhonemeData(long rate,
                             FILE *log,
                             espeak_ng_ERROR_CONTEXT *context);

extern espeak_ng_STATUS
espeak_ng_CompileIntonation(FILE *log,
                            espeak_ng_ERROR_CONTEXT *context);

/* eSpeak NG 1.49.1 */

extern espeak_ng_STATUS
espeak_ng_CompilePhonemeDataPath(long rate,
                                 const char *source_path,
                                 const char *destination_path,
                                 FILE *log,
                                 espeak_ng_ERROR_CONTEXT *context);
                                 
extern espeak_ng_STATUS
espeak_ng_SetOutputHooks(espeak_ng_OUTPUT_HOOKS* hooks);
extern espeak_ng_STATUS
espeak_ng_SetConstF0(int f0);


#ifdef __cplusplus
}
#endif

#endif
