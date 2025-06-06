#ifndef __ETHUMB_H__
#define __ETHUMB_H__ 1

#include <Eina.h>
#include <Efl_Config.h>

#ifdef extern
# undef extern
#endif


#define ETHUMB_VERSION_MAJOR EFL_VERSION_MAJOR
#define ETHUMB_VERSION_MINOR EFL_VERSION_MINOR
   /**
    * @typedef Ethumb_Version
    * Represents the current version of Ethumb
    */
   typedef struct _Ethumb_Version
     {
        int major; /** < major (binary or source incompatible changes) */
        int minor; /** < minor (new features, bugfixes, major improvements version) */
        int micro; /** < micro (bugfix, internal improvements, no new features version) */
        int revision; /** < git revision (0 if a proper release or the git revision number Ethumb is built from) */
     } Ethumb_Version;

    extern Ethumb_Version *ethumb_version;

/**
 * @page ethumb_main Ethumb
 *
 * @date 2009 (created)
 *
 * @section ethumb_toc Table of Contents
 *
 * @li @ref ethumb_main_intro
 * @li @ref ethumb_main_compiling
 * @li @ref ethumb_main_next_steps
 *
 * @section ethumb_main_intro Introduction
 *
 * Ethumb will use @ref Evas to generate thumbnail images of given
 * files. The API allows great customization of the generated files
 * and also helps compling to FreeDesktop.Org Thumbnail Specification
 * (http://specifications.freedesktop.org/thumbnail-spec/thumbnail-spec-latest.html)
 *
 * However, thumbnailing can be an expensive process that will impact
 * your application experience, blocking animations and user
 * interaction during the generation. Another problem is that one
 * should try to cache the thumbnails in a place that other
 * applications can benefit from the file.
 *
 * @ref Ethumb_Client exists to solve this. It will communicate with a
 * server using standard D-Bus protocol. The server will use @ref
 * Ethumb itself to generate the thumbnail images and cache them using
 * FreeDesktop.Org standard. It is recommended that most applications
 * use @ref Ethumb_Client instead of @ref Ethumb directly.
 *
 * @section ethumb_main_compiling How to compile
 *
 * Ethumb is a library your application links to. The procedure for
 * this is very simple. Note that usually you want the D-Bus client
 * library. You simply have to compile your application with the
 * appropriate compiler flags that the @c pkg-config script
 * outputs. For example:
 *
 * Compiling C or C++ files into object files:
 *
 * @verbatim
   gcc -c -o main.o main.c `pkg-config --cflags ethumb_client`
   @endverbatim
 *
 * Linking object files into a binary executable:
 *
 * @verbatim
   gcc -o my_application main.o `pkg-config --libs ethumb_client`
   @endverbatim
 *
 * See @ref pkgconfig
 *
 * @section ethumb_main_next_steps Next Steps
 *
 * After you understood what Ethumb is and installed it in your system
 * you should proceed understanding the programming interface.
 *
 * Recommended reading:
 *
 * @li @ref Ethumb_Client to generate thumbnails using a server
 *     (recommended).
 * @li @ref Ethumb to generate thumbnails in the local process.
 *
 */

/**
 * @defgroup Ethumb Ethumb
 *
 * @{
 */
/**
 * @defgroup Ethumb_Basics Ethumb Basics
 *
 * Functions that all users must know of to use Ethumb.
 *
 * @{
 */

/**
 * @brief thumbnailer handle.
 *
 * The handle is returned by ethumb_new() and destroyed by ethumb_free().
 */
typedef struct _Ethumb Ethumb;

/**
 * @brief reports results of ethumb_generate().
 *
 * @param data extra context given to ethumb_generate().
 * @param e handle of the current thumbnailer.
 * @param success @c EINA_TRUE if generated or @c EINA_FALSE on errors.
 */
typedef void (*Ethumb_Generate_Cb)(void *data, Ethumb *e, Eina_Bool success);

/**
 * @brief Initialize ethumb.
 * @return 1 or greater on success, 0 otherwise.
 */
extern int ethumb_init(void);
/**
 * @brief Shutdown ethumb, unloading all currently-loaded modules.
 * @return 0 if ethumb shuts down, an integer greater than 0 otherwise.
 */
extern int ethumb_shutdown(void);

/**
 * @brief Create a new ethumb object.
 * return The newly-created ethumb object
 */
extern Ethumb * ethumb_new(void)  ;

/**
 * @brief Free an ethumb object.
 */
extern void ethumb_free(Ethumb *e);

/**
 * @}
 */

/**
 * @defgroup Ethumb_Setup Ethumb Fine Tune Setup
 *
 * How to fine tune thumbnail generation, setting size, aspect,
 * frames, quality and so on.
 *
 * @{
 */

/**
 *
 * @brief Set the Ethumb Frame
 *
 * This can be used to simulate wood frames in the Thumbnails
 *
 * @param e handle of the current thumbnailer.
 * @param theme_file the edje theme file
 * @param group the edje group in theme
 * @param swallow the edje swallow in theme
 *
 * @return EINA_TRUE on success and EINA_FALSE on failure
 */
extern Eina_Bool    ethumb_frame_set(Ethumb *e, const char *theme_file, const char *group, const char *swallow) ;

/**
 * @brief Retreives the current ethumb frame of and Ethumb instance.
 *
 * @param e handle of the current thumbnailer.
 * @param theme_file will be setted with the edje theme
 * @param group will be setted with the edje group
 * @param swallow will be setted with the edje swallow
 */
extern void         ethumb_frame_get(const Ethumb *e, const char **theme_file, const char **group, const char **swallow) ;

/**
 * @brief Set the ethumb thumbnails path
 *
 * @param e handle of the current thumbnailer.
 * @param path The thumbnails path
 *
 */
extern void         ethumb_thumb_dir_path_set(Ethumb *e, const char *path) ;

/**
 * @brief Get the ethumb thumbnails path
 *
 * @param e handle of the current thumbnailer.
 *
 * @return The thumbnails path for the current thumbnailer
 */
extern const char  *ethumb_thumb_dir_path_get(const Ethumb *e)   ;

/**
 * @brief Set the thumbnails category
 *
 * @param e handle of the current thumbnailer.
 * @param category the category to set
 */
extern void         ethumb_thumb_category_set(Ethumb *e, const char *category) ;

/**
 * @brief Get the thumbnails category
 *
 * @param e handle of the current thumbnailer
 *
 * @return the current thumbnailer thumbnails category
 */
extern const char  *ethumb_thumb_category_get(const Ethumb *e)   ;

extern void         ethumb_thumb_path_set(Ethumb *e, const char *path, const char *key) ;
extern void         ethumb_thumb_path_get(Ethumb *e, const char **path, const char **key) ;
extern void         ethumb_thumb_hash(Ethumb *e) ;
extern void         ethumb_thumb_hash_copy(Ethumb *dst, const Ethumb *src) ;

typedef enum _Ethumb_Thumb_FDO_Size
{
  ETHUMB_THUMB_NORMAL, /**< 128x128 as defined by FreeDesktop.Org standard */
  ETHUMB_THUMB_LARGE   /**< 256x256 as defined by FreeDesktop.Org standard */
} Ethumb_Thumb_FDO_Size;

typedef enum _Ethumb_Thumb_Format
{
   ETHUMB_THUMB_FDO,   /**< PNG as defined by FreeDesktop.Org standard */
   ETHUMB_THUMB_JPEG,  /**< JPEGs are often smaller and faster to read/write */
   ETHUMB_THUMB_EET    /**< EFL's own storage system, supports key parameter */
} Ethumb_Thumb_Format;

typedef enum _Ethumb_Thumb_Aspect
{
  ETHUMB_THUMB_KEEP_ASPECT, /**< keep original proportion between width and height */
  ETHUMB_THUMB_IGNORE_ASPECT, /**< ignore aspect and foce it to match thumbnail's width and height */
  ETHUMB_THUMB_CROP /**< keep aspect but crop (cut) the largest dimension */
} Ethumb_Thumb_Aspect;

typedef enum _Ethumb_Thumb_Orientation
{
  ETHUMB_THUMB_ORIENT_NONE,     /**< keep orientation as pixel data is */
  ETHUMB_THUMB_ROTATE_90_CW,    /**< rotate 90° clockwise */
  ETHUMB_THUMB_ROTATE_180,      /**< rotate 180° */
  ETHUMB_THUMB_ROTATE_90_CCW,   /**< rotate 90° counter-clockwise */
  ETHUMB_THUMB_FLIP_HORIZONTAL, /**< flip horizontally */
  ETHUMB_THUMB_FLIP_VERTICAL,   /**< flip vertically */
  ETHUMB_THUMB_FLIP_TRANSPOSE,  /**< transpose */
  ETHUMB_THUMB_FLIP_TRANSVERSE, /**< transverse */
  ETHUMB_THUMB_ORIENT_ORIGINAL  /**< use orientation from metadata (EXIF-only currently) */
} Ethumb_Thumb_Orientation;

extern void ethumb_thumb_fdo_set(Ethumb *e, Ethumb_Thumb_FDO_Size s) ;

/**
 * @brief Set the size of thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param tw Thumbnail width.
 * @param th Thumbnail height.
 */
extern void ethumb_thumb_size_set(Ethumb *e, int tw, int th) ;
/**
 * @brief Get the size of thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param[out] tw Pointer to an int to store the thumbnail width.
 * @param[out] th Pointer to an int to store the thumbnail height.
 */
extern void ethumb_thumb_size_get(const Ethumb *e, int *tw, int *th) ;

/**
 * @brief Set the fileformat of the thumbnails
 *
 * Thumbnails are sent compressed; possible formats are PNG, JPEG and EET.
 *
 * @param e A pointer to an Ethumb object.
 */
extern void                     ethumb_thumb_format_set(Ethumb *e, Ethumb_Thumb_Format f) ;
/**
 * @brief Get the fileformat of the thumbnails
 *
 * @param e A pointer to an Ethumb object.
 * @return The thumbnail fileformat
 *
 * @see ethumb_thumb_format_set
 */
extern Ethumb_Thumb_Format      ethumb_thumb_format_get(const Ethumb *e)   ;

/**
 * @brief Set the aspect ratio policy.
 *
 * When the source and thumbnail aspect ratios don't match, this policy sets
 * how to adapt from the former to the latter: resize keeping source aspect
 * ratio, resize ignoring it or crop.
 *
 * @param e A pointer to an Ethumb object.
 * @param aspect  The new aspect ratio policy.
 */
extern void                     ethumb_thumb_aspect_set(Ethumb *e, Ethumb_Thumb_Aspect aspect) ;
/**
 * @brief Get the aspect ratio policy.
 *
 * @param e A pointer to an Ethumb object.
 * @return The aspect ratio policy.
 */
extern Ethumb_Thumb_Aspect      ethumb_thumb_aspect_get(const Ethumb *e)   ;

/**
 * @brief Set the thumbnail rotation or flip.
 *
 * @param e A pointer to an Ethumb object.
 * @param orientation The new orientation.
 */
extern void                     ethumb_thumb_orientation_set(Ethumb *e, Ethumb_Thumb_Orientation orientation) ;
/**
 * @brief Get the thumbnail rotation.
 *
 * @param e A pointer to an Ethumb object.
 * @return The current rotation.
 */
extern Ethumb_Thumb_Orientation ethumb_thumb_orientation_get(const Ethumb *e)   ;

extern void         ethumb_thumb_crop_align_set(Ethumb *e, float x, float y) ;
extern void         ethumb_thumb_crop_align_get(const Ethumb *e, float *x, float *y) ;

/**
 * @brief Set the thumbnail compression quality.
 *
 * @param e A pointer to an Ethumb object.
 * @param quality Compression quality (from 0 to 100, 100 being the best; default is 80)
 */
extern void         ethumb_thumb_quality_set(Ethumb *e, int quality) ;
/**
 * @brief Get the thumbnail compression quality.
 *
 * @param e A pointer to an Ethumb object.
 * @return The current compression quality (from 0 to 100, 100 being the best)
 */
extern int          ethumb_thumb_quality_get(const Ethumb *e)   ;

/**
 * @brief Set the compression rate
 *
 * @param e handle of the current thumbnailer.
 * @param compress the compression rate (in percentage)
 *
 */
extern void         ethumb_thumb_compress_set(Ethumb *e, int compress) ;

/**
 * @brief Get the compression rate
 *
 * @param e handle of the current thumbnailer.
 *
 * @return the compression rate (in percentage)
 */
extern int          ethumb_thumb_compress_get(const Ethumb *e)   ;

/**
 * @brief set the video play start point
 *
 * Set the start point of video thumbnail
 *
 * @param e handle of the current thumbnailer.
 * @param start the start point (float from 0.0 to 1.0)
 */
extern void         ethumb_video_start_set(Ethumb *e, float start) ;

/**
 * @brief get the video play start point
 *
 * Get the start point of video thumbnail
 *
 * @param e handle of the current thumbnailer.
 *
 * @return the start point (float from 0.0 to 1.0)
 */
extern float        ethumb_video_start_get(const Ethumb *e)   ;

/**
 * @brief Set the video time (duration) in seconds.
 *
 * @param e handle of the current thumbnailer.
 * @param time the video duration in seconds
 */
extern void         ethumb_video_time_set(Ethumb *e, float time) ;

/**
 * @brief Get the video time (duration) in seconds.
 *
 * @param e handle of the current thumbnailer.
 * @return the video duration in seconds
 */
extern float        ethumb_video_time_get(const Ethumb *e)   ;

/**
 * @brief Set the video frame interval, in seconds
 *
 * This is useful for animated thumbnail and will define skip time
 * before going to the next frame. Note that video backends might not
 * be able to precisely skip that amount as it will depend on various
 * factors, including video encoding.
 *
 * @param e handle of the current thumbnailer.
 * @param interval the frame display interval in seconds
 */
extern void         ethumb_video_interval_set(Ethumb *e, float interval) ;

/**
 * @brief Get the video frame interval, in seconds
 *
 * @param e handle of the current thumbnailer.
 * @return the frame display interval in seconds
 */
extern float        ethumb_video_interval_get(const Ethumb *e)   ;

/**
 * @brief Set the number of times the video loops (if applicable).
 *
 * @param e A pointer to an Ethumb object.
 * @param ntimes The number of times the video loops.
 */
extern void         ethumb_video_ntimes_set(Ethumb *e, unsigned int ntimes) ;
/**
 * @brief Get the number of times the video loops (if applicable).
 *
 * @param e A pointer to an Ethumb object.
 * @return The number of times the video loops.
 */
extern unsigned int ethumb_video_ntimes_get(const Ethumb *e)   ;

/**
 * @brief Set the thumbnail framerate.
 *
 * @param e A pointer to an Ethumb object.
 * @param fps New framerate of the thumbnail (default 10).
 */
extern void         ethumb_video_fps_set(Ethumb *e, unsigned int fps) ;
/**
 * @brief Get the thumbnail framerate.
 *
 * @param e A pointer to an Ethumb object.
 * @return Current framerate of the thumbnail.
 */
extern unsigned int ethumb_video_fps_get(const Ethumb *e)   ;

/**
 * @brief Set the page number to thumbnail in paged documents
 *
 * @param e handle of the current thumbnailer.
 * @param page the page number.
 */
extern void         ethumb_document_page_set(Ethumb *e, unsigned int page) ;

/**
 * @brief Get the page number thumbnailed in paged documents
 *
 * @param e handle of the current thumbnailer.
 * @return the page number.
 */
extern unsigned int ethumb_document_page_get(const Ethumb *e)   ;
/**
 * @}
 */

/**
 * @addtogroup Ethumb_Basics Ethumb Basics
 * @{
 */

/**
 * @brief Set the file for which to generate thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param path The file to use.
 * @param key If @a path allows storing multiple resources in a single file
 *            (EET or Edje for instance), @a key is the key used to locate the
 *            right resource inside the file. NULL if not applicable.
 */
extern Eina_Bool ethumb_file_set(Ethumb *e, const char *path, const char *key) ;
/**
 * @brief Get the file for which to generate thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param[out] path The file being used.
 * @param[out] key The key used to locate the right resource in case the file
 *                 can store several of them. NULL if not applicable.
 * @see ethumb_file_set
 */
extern void      ethumb_file_get(const Ethumb *e, const char **path, const char **key) ;

/**
 * @brief Reset the source file information.
 *
 * @param e A pointer to an Ethumb object.
 */
extern void      ethumb_file_free(Ethumb *e) ;

/**
 * @brief Generate the thumbnail.
 *
 * @param e handle of the current thumbnailer.
 * @param finished_cb The callback function to run on opertaion end
 * @param free_data The callback function to run on free data.
 *
 * @return EINA_TRUE on success and EINA_FALSE on failure
 */
extern Eina_Bool ethumb_generate(Ethumb *e, Ethumb_Generate_Cb finished_cb, const void *data, Eina_Free_Cb free_data) ;

/**
 * @brief test if the thumbnailer exists
 *
 * @param e handle of the thumbnailer to test.
 *
 * @return EINA_TRUE if thumbnailer exists and EINA_FALSE otherwise.
 */
extern Eina_Bool ethumb_exists(Ethumb *e)   ;

/**
 * @brief Duplicate an thumbnailer
 *
 * @param e Handle of the thumbnailer to duplicate
 *
 * @return a new allocated copy of the thumbnailer.
 */
extern Ethumb *ethumb_dup(const Ethumb *e) ;

/**
 * @brief Compare two thumbnailers.
 *
 * @param e1 First handle of thumbnailer to compare
 * @param e2 Second handle of thumbnailer to compare
 *
 * @return EINA_TRUE if the thumbnailers are equal and EINA_FALSE otherwise
 */
extern Eina_Bool ethumb_cmp(const Ethumb *e1, const Ethumb *e2)   ;

extern int ethumb_hash(const void *key, int key_length)   ;
extern int ethumb_key_cmp(const void *key1, int key1_length,
                        const void *key2, int key2_length)   ;
extern unsigned int ethumb_length(const void *key)  ;

  /**
 * @}
 */

/**
 * @}
 */
#ifdef __cplusplus
}
#endif


#endif /* __ETHUMB_H__ */
