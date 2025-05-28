
unit Ethumb;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ethumb.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ethumb.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEthumb  = ^Ethumb;
PEthumb_Thumb_Aspect  = ^Ethumb_Thumb_Aspect;
PEthumb_Thumb_FDO_Size  = ^Ethumb_Thumb_FDO_Size;
PEthumb_Thumb_Format  = ^Ethumb_Thumb_Format;
PEthumb_Thumb_Orientation  = ^Ethumb_Thumb_Orientation;
PEthumb_Version  = ^Ethumb_Version;
Plongint  = ^longint;
Psingle  = ^single;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef __ETHUMB_H__}

const
  __ETHUMB_H__ = 1;  
{$include <Eina.h>}
{$include <Efl_Config.h>}
{$ifdef extern}
{$undef extern}
{$endif}

const
  ETHUMB_VERSION_MAJOR = EFL_VERSION_MAJOR;  
  ETHUMB_VERSION_MINOR = EFL_VERSION_MINOR;  
{*
    * @typedef Ethumb_Version
    * Represents the current version of Ethumb
     }
{* < major (binary or source incompatible changes)  }
{* < minor (new features, bugfixes, major improvements version)  }
{* < micro (bugfix, internal improvements, no new features version)  }
{* < git revision (0 if a proper release or the git revision number Ethumb is built from)  }
type
  PEthumb_Version = ^TEthumb_Version;
  TEthumb_Version = record
      major : longint;
      minor : longint;
      micro : longint;
      revision : longint;
    end;
  var
    ethumb_version : PEthumb_Version;cvar;external;
{*
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
  }
{*
 * @defgroup Ethumb Ethumb
 *
 * @
  }
{*
 * @defgroup Ethumb_Basics Ethumb Basics
 *
 * Functions that all users must know of to use Ethumb.
 *
 * @
  }
{*
 * @brief thumbnailer handle.
 *
 * The handle is returned by ethumb_new() and destroyed by ethumb_free().
  }
type
{*
 * @brief reports results of ethumb_generate().
 *
 * @param data extra context given to ethumb_generate().
 * @param e handle of the current thumbnailer.
 * @param success @c EINA_TRUE if generated or @c EINA_FALSE on errors.
  }

  TEthumb_Generate_Cb = procedure (data:pointer; e:PEthumb; success:TEina_Bool);cdecl;
{*
 * @brief Initialize ethumb.
 * @return 1 or greater on success, 0 otherwise.
  }

function ethumb_init:longint;cdecl;external;
{*
 * @brief Shutdown ethumb, unloading all currently-loaded modules.
 * @return 0 if ethumb shuts down, an integer greater than 0 otherwise.
  }
function ethumb_shutdown:longint;cdecl;external;
{*
 * @brief Create a new ethumb object.
 * return The newly-created ethumb object
  }
function ethumb_new:PEthumb;cdecl;external;
{*
 * @brief Free an ethumb object.
  }
procedure ethumb_free(e:PEthumb);cdecl;external;
{*
 * @
  }
{*
 * @defgroup Ethumb_Setup Ethumb Fine Tune Setup
 *
 * How to fine tune thumbnail generation, setting size, aspect,
 * frames, quality and so on.
 *
 * @
  }
{*
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
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_frame_set(e:PEthumb; theme_file:Pchar; group:Pchar; swallow:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Retreives the current ethumb frame of and Ethumb instance.
 *
 * @param e handle of the current thumbnailer.
 * @param theme_file will be setted with the edje theme
 * @param group will be setted with the edje group
 * @param swallow will be setted with the edje swallow
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ethumb_frame_get(e:PEthumb; theme_file:PPchar; group:PPchar; swallow:PPchar);cdecl;external;
{*
 * @brief Set the ethumb thumbnails path
 *
 * @param e handle of the current thumbnailer.
 * @param path The thumbnails path
 *
  }
(* Const before type ignored *)
procedure ethumb_thumb_dir_path_set(e:PEthumb; path:Pchar);cdecl;external;
{*
 * @brief Get the ethumb thumbnails path
 *
 * @param e handle of the current thumbnailer.
 *
 * @return The thumbnails path for the current thumbnailer
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_thumb_dir_path_get(e:PEthumb):Pchar;cdecl;external;
{*
 * @brief Set the thumbnails category
 *
 * @param e handle of the current thumbnailer.
 * @param category the category to set
  }
(* Const before type ignored *)
procedure ethumb_thumb_category_set(e:PEthumb; category:Pchar);cdecl;external;
{*
 * @brief Get the thumbnails category
 *
 * @param e handle of the current thumbnailer
 *
 * @return the current thumbnailer thumbnails category
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_thumb_category_get(e:PEthumb):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ethumb_thumb_path_set(e:PEthumb; path:Pchar; key:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure ethumb_thumb_path_get(e:PEthumb; path:PPchar; key:PPchar);cdecl;external;
procedure ethumb_thumb_hash(e:PEthumb);cdecl;external;
(* Const before type ignored *)
procedure ethumb_thumb_hash_copy(dst:PEthumb; src:PEthumb);cdecl;external;
{*< 128x128 as defined by FreeDesktop.Org standard  }
{*< 256x256 as defined by FreeDesktop.Org standard  }
type
  PEthumb_Thumb_FDO_Size = ^TEthumb_Thumb_FDO_Size;
  TEthumb_Thumb_FDO_Size =  Longint;
  Const
    ETHUMB_THUMB_NORMAL = 0;
    ETHUMB_THUMB_LARGE = 1;
;
{*< PNG as defined by FreeDesktop.Org standard  }
{*< JPEGs are often smaller and faster to read/write  }
{*< EFL's own storage system, supports key parameter  }
type
  PEthumb_Thumb_Format = ^TEthumb_Thumb_Format;
  TEthumb_Thumb_Format =  Longint;
  Const
    ETHUMB_THUMB_FDO = 0;
    ETHUMB_THUMB_JPEG = 1;
    ETHUMB_THUMB_EET = 2;
;
{*< keep original proportion between width and height  }
{*< ignore aspect and foce it to match thumbnail's width and height  }
{*< keep aspect but crop (cut) the largest dimension  }
type
  PEthumb_Thumb_Aspect = ^TEthumb_Thumb_Aspect;
  TEthumb_Thumb_Aspect =  Longint;
  Const
    ETHUMB_THUMB_KEEP_ASPECT = 0;
    ETHUMB_THUMB_IGNORE_ASPECT = 1;
    ETHUMB_THUMB_CROP = 2;
;
{*< keep orientation as pixel data is  }
{*< rotate 90° clockwise  }
{*< rotate 180°  }
{*< rotate 90° counter-clockwise  }
{*< flip horizontally  }
{*< flip vertically  }
{*< transpose  }
{*< transverse  }
{*< use orientation from metadata (EXIF-only currently)  }
type
  PEthumb_Thumb_Orientation = ^TEthumb_Thumb_Orientation;
  TEthumb_Thumb_Orientation =  Longint;
  Const
    ETHUMB_THUMB_ORIENT_NONE = 0;
    ETHUMB_THUMB_ROTATE_90_CW = 1;
    ETHUMB_THUMB_ROTATE_180 = 2;
    ETHUMB_THUMB_ROTATE_90_CCW = 3;
    ETHUMB_THUMB_FLIP_HORIZONTAL = 4;
    ETHUMB_THUMB_FLIP_VERTICAL = 5;
    ETHUMB_THUMB_FLIP_TRANSPOSE = 6;
    ETHUMB_THUMB_FLIP_TRANSVERSE = 7;
    ETHUMB_THUMB_ORIENT_ORIGINAL = 8;
;

procedure ethumb_thumb_fdo_set(e:PEthumb; s:TEthumb_Thumb_FDO_Size);cdecl;external;
{*
 * @brief Set the size of thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param tw Thumbnail width.
 * @param th Thumbnail height.
  }
procedure ethumb_thumb_size_set(e:PEthumb; tw:longint; th:longint);cdecl;external;
{*
 * @brief Get the size of thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param[out] tw Pointer to an int to store the thumbnail width.
 * @param[out] th Pointer to an int to store the thumbnail height.
  }
(* Const before type ignored *)
procedure ethumb_thumb_size_get(e:PEthumb; tw:Plongint; th:Plongint);cdecl;external;
{*
 * @brief Set the fileformat of the thumbnails
 *
 * Thumbnails are sent compressed; possible formats are PNG, JPEG and EET.
 *
 * @param e A pointer to an Ethumb object.
  }
procedure ethumb_thumb_format_set(e:PEthumb; f:TEthumb_Thumb_Format);cdecl;external;
{*
 * @brief Get the fileformat of the thumbnails
 *
 * @param e A pointer to an Ethumb object.
 * @return The thumbnail fileformat
 *
 * @see ethumb_thumb_format_set
  }
(* Const before type ignored *)
function ethumb_thumb_format_get(e:PEthumb):TEthumb_Thumb_Format;cdecl;external;
{*
 * @brief Set the aspect ratio policy.
 *
 * When the source and thumbnail aspect ratios don't match, this policy sets
 * how to adapt from the former to the latter: resize keeping source aspect
 * ratio, resize ignoring it or crop.
 *
 * @param e A pointer to an Ethumb object.
 * @param aspect  The new aspect ratio policy.
  }
procedure ethumb_thumb_aspect_set(e:PEthumb; aspect:TEthumb_Thumb_Aspect);cdecl;external;
{*
 * @brief Get the aspect ratio policy.
 *
 * @param e A pointer to an Ethumb object.
 * @return The aspect ratio policy.
  }
(* Const before type ignored *)
function ethumb_thumb_aspect_get(e:PEthumb):TEthumb_Thumb_Aspect;cdecl;external;
{*
 * @brief Set the thumbnail rotation or flip.
 *
 * @param e A pointer to an Ethumb object.
 * @param orientation The new orientation.
  }
procedure ethumb_thumb_orientation_set(e:PEthumb; orientation:TEthumb_Thumb_Orientation);cdecl;external;
{*
 * @brief Get the thumbnail rotation.
 *
 * @param e A pointer to an Ethumb object.
 * @return The current rotation.
  }
(* Const before type ignored *)
function ethumb_thumb_orientation_get(e:PEthumb):TEthumb_Thumb_Orientation;cdecl;external;
procedure ethumb_thumb_crop_align_set(e:PEthumb; x:single; y:single);cdecl;external;
(* Const before type ignored *)
procedure ethumb_thumb_crop_align_get(e:PEthumb; x:Psingle; y:Psingle);cdecl;external;
{*
 * @brief Set the thumbnail compression quality.
 *
 * @param e A pointer to an Ethumb object.
 * @param quality Compression quality (from 0 to 100, 100 being the best; default is 80)
  }
procedure ethumb_thumb_quality_set(e:PEthumb; quality:longint);cdecl;external;
{*
 * @brief Get the thumbnail compression quality.
 *
 * @param e A pointer to an Ethumb object.
 * @return The current compression quality (from 0 to 100, 100 being the best)
  }
(* Const before type ignored *)
function ethumb_thumb_quality_get(e:PEthumb):longint;cdecl;external;
{*
 * @brief Set the compression rate
 *
 * @param e handle of the current thumbnailer.
 * @param compress the compression rate (in percentage)
 *
  }
procedure ethumb_thumb_compress_set(e:PEthumb; compress:longint);cdecl;external;
{*
 * @brief Get the compression rate
 *
 * @param e handle of the current thumbnailer.
 *
 * @return the compression rate (in percentage)
  }
(* Const before type ignored *)
function ethumb_thumb_compress_get(e:PEthumb):longint;cdecl;external;
{*
 * @brief set the video play start point
 *
 * Set the start point of video thumbnail
 *
 * @param e handle of the current thumbnailer.
 * @param start the start point (float from 0.0 to 1.0)
  }
procedure ethumb_video_start_set(e:PEthumb; start:single);cdecl;external;
{*
 * @brief get the video play start point
 *
 * Get the start point of video thumbnail
 *
 * @param e handle of the current thumbnailer.
 *
 * @return the start point (float from 0.0 to 1.0)
  }
(* Const before type ignored *)
function ethumb_video_start_get(e:PEthumb):single;cdecl;external;
{*
 * @brief Set the video time (duration) in seconds.
 *
 * @param e handle of the current thumbnailer.
 * @param time the video duration in seconds
  }
procedure ethumb_video_time_set(e:PEthumb; time:single);cdecl;external;
{*
 * @brief Get the video time (duration) in seconds.
 *
 * @param e handle of the current thumbnailer.
 * @return the video duration in seconds
  }
(* Const before type ignored *)
function ethumb_video_time_get(e:PEthumb):single;cdecl;external;
{*
 * @brief Set the video frame interval, in seconds
 *
 * This is useful for animated thumbnail and will define skip time
 * before going to the next frame. Note that video backends might not
 * be able to precisely skip that amount as it will depend on various
 * factors, including video encoding.
 *
 * @param e handle of the current thumbnailer.
 * @param interval the frame display interval in seconds
  }
procedure ethumb_video_interval_set(e:PEthumb; interval:single);cdecl;external;
{*
 * @brief Get the video frame interval, in seconds
 *
 * @param e handle of the current thumbnailer.
 * @return the frame display interval in seconds
  }
(* Const before type ignored *)
function ethumb_video_interval_get(e:PEthumb):single;cdecl;external;
{*
 * @brief Set the number of times the video loops (if applicable).
 *
 * @param e A pointer to an Ethumb object.
 * @param ntimes The number of times the video loops.
  }
procedure ethumb_video_ntimes_set(e:PEthumb; ntimes:dword);cdecl;external;
{*
 * @brief Get the number of times the video loops (if applicable).
 *
 * @param e A pointer to an Ethumb object.
 * @return The number of times the video loops.
  }
(* Const before type ignored *)
function ethumb_video_ntimes_get(e:PEthumb):dword;cdecl;external;
{*
 * @brief Set the thumbnail framerate.
 *
 * @param e A pointer to an Ethumb object.
 * @param fps New framerate of the thumbnail (default 10).
  }
procedure ethumb_video_fps_set(e:PEthumb; fps:dword);cdecl;external;
{*
 * @brief Get the thumbnail framerate.
 *
 * @param e A pointer to an Ethumb object.
 * @return Current framerate of the thumbnail.
  }
(* Const before type ignored *)
function ethumb_video_fps_get(e:PEthumb):dword;cdecl;external;
{*
 * @brief Set the page number to thumbnail in paged documents
 *
 * @param e handle of the current thumbnailer.
 * @param page the page number.
  }
procedure ethumb_document_page_set(e:PEthumb; page:dword);cdecl;external;
{*
 * @brief Get the page number thumbnailed in paged documents
 *
 * @param e handle of the current thumbnailer.
 * @return the page number.
  }
(* Const before type ignored *)
function ethumb_document_page_get(e:PEthumb):dword;cdecl;external;
{*
 * @
  }
{*
 * @addtogroup Ethumb_Basics Ethumb Basics
 * @
  }
{*
 * @brief Set the file for which to generate thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param path The file to use.
 * @param key If @a path allows storing multiple resources in a single file
 *            (EET or Edje for instance), @a key is the key used to locate the
 *            right resource inside the file. NULL if not applicable.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_file_set(e:PEthumb; path:Pchar; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the file for which to generate thumbnails.
 *
 * @param e A pointer to an Ethumb object.
 * @param[out] path The file being used.
 * @param[out] key The key used to locate the right resource in case the file
 *                 can store several of them. NULL if not applicable.
 * @see ethumb_file_set
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure ethumb_file_get(e:PEthumb; path:PPchar; key:PPchar);cdecl;external;
{*
 * @brief Reset the source file information.
 *
 * @param e A pointer to an Ethumb object.
  }
procedure ethumb_file_free(e:PEthumb);cdecl;external;
{*
 * @brief Generate the thumbnail.
 *
 * @param e handle of the current thumbnailer.
 * @param finished_cb The callback function to run on opertaion end
 * @param free_data The callback function to run on free data.
 *
 * @return EINA_TRUE on success and EINA_FALSE on failure
  }
(* Const before type ignored *)
function ethumb_generate(e:PEthumb; finished_cb:TEthumb_Generate_Cb; data:pointer; free_data:TEina_Free_Cb):TEina_Bool;cdecl;external;
{*
 * @brief test if the thumbnailer exists
 *
 * @param e handle of the thumbnailer to test.
 *
 * @return EINA_TRUE if thumbnailer exists and EINA_FALSE otherwise.
  }
function ethumb_exists(e:PEthumb):TEina_Bool;cdecl;external;
{*
 * @brief Duplicate an thumbnailer
 *
 * @param e Handle of the thumbnailer to duplicate
 *
 * @return a new allocated copy of the thumbnailer.
  }
(* Const before type ignored *)
function ethumb_dup(e:PEthumb):PEthumb;cdecl;external;
{*
 * @brief Compare two thumbnailers.
 *
 * @param e1 First handle of thumbnailer to compare
 * @param e2 Second handle of thumbnailer to compare
 *
 * @return EINA_TRUE if the thumbnailers are equal and EINA_FALSE otherwise
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_cmp(e1:PEthumb; e2:PEthumb):TEina_Bool;cdecl;external;
(* Const before type ignored *)
function ethumb_hash(key:pointer; key_length:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ethumb_key_cmp(key1:pointer; key1_length:longint; key2:pointer; key2_length:longint):longint;cdecl;external;
(* Const before type ignored *)
function ethumb_length(key:pointer):dword;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __ETHUMB_H__  }

implementation


end.
