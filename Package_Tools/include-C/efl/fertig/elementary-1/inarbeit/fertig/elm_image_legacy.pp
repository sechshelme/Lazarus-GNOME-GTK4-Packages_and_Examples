
unit elm_image_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_image_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_image_legacy.h
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
PEina_Bool  = ^Eina_Bool;
PEina_File  = ^Eina_File;
PElm_Image  = ^Elm_Image;
PElm_Image_Error  = ^Elm_Image_Error;
PElm_Image_Orient  = ^Elm_Image_Orient;
PElm_Image_Orient_Type  = ^Elm_Image_Orient_Type;
PElm_Image_Progress  = ^Elm_Image_Progress;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new image to the parent.
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @see elm_image_file_set()
 *
 * @ingroup Elm_Image
  }

function elm_image_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{* Structure associated with smart callback 'download,progress'.
 *
 * @since 1.8
 *
 * @ingroup Elm_Image
  }
type
  PElm_Image_Progress = ^TElm_Image_Progress;
  TElm_Image_Progress = record
      now : Tdouble;
      total : Tdouble;
    end;
{* Structure associated with smart callback 'download,progress'.
 *
 * @since 1.8
 *
 * @ingroup Elm_Image
  }

  PElm_Image_Error = ^TElm_Image_Error;
  TElm_Image_Error = record
      status : longint;
      open_error : TEina_Bool;
    end;

  PElm_Image = ^TElm_Image;
  TElm_Image = TEvas_Object;
{*
 * Set the file that will be used as the image's source.
 *
 * @param obj The image object
 * @param file The path to file that will be used as image source
 * @param group The group that the image belongs to, in case it's an
 *              EET (including Edje case) file. This can be used as a key inside
 *              evas image cache if this is a normal image file not eet file.
 *
 * @return (@c EINA_TRUE = success, @c EINA_FALSE = error)
 *
 * @see elm_image_file_get()
 *
 * @note This function will trigger the Edje file case based on the
 * extension of the @a file string (expects @c ".edj", for this
 * case).
 *
 * @note If you use animated gif image and create multiple image objects with
 * one gif image file, you should set the @p group differently for each object.
 * Or image objects will share one evas image cache entry and you will get
 * unwanted frames.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
(* Const before type ignored *)

function elm_image_file_set(obj:PEvas_Object; file:Pchar; group:Pchar):TEina_Bool;cdecl;external;
{*
 * Get the file that will be used as image.
 *
 * @see elm_image_file_set()
 *
 * @ingroup Elm_Image
 *
 * @param[out] file The path to file that will be used as image source
 * @param[out] group The group that the image belongs to, in case it's an
EET (including Edje case) file. This can be used as a key inside
evas image cache if this is a normal image file not eet file.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_image_file_get(obj:PEo; file:PPchar; group:PPchar);cdecl;external;
{*
 * Set the prescale size for the image
 *
 * @param obj The image object
 * @param size The prescale size. This value is used for both width and
 * height.
 *
 * This function sets a new size for pixmap representation of the given
 * image. It allows the image to be loaded already in the specified size,
 * reducing the memory usage and load time when loading a big image with load
 * size set to a smaller size.
 *
 * It's equivalent to the elm_bg_load_size_set() function for bg.
 *
 * @note this is just a hint, the real size of the pixmap may differ
 * depending on the type of image being loaded, being bigger than requested.
 *
 * @see elm_image_prescale_get()
 * @see elm_bg_load_size_set()
 *
 * @ingroup Elm_Image
  }
procedure elm_image_prescale_set(obj:PEvas_Object; size:longint);cdecl;external;
{*
 * Get the prescale size for the image
 *
 * @param obj The image object
 * @return The prescale size
 *
 * @see elm_image_prescale_set()
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_prescale_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * Set the file that will be used as the image's source.
 *
 * @param obj The image object
 * @param file The handler to an Eina_File that will be used as image source
 * @param group The group that the image belongs to, in case it's an
 *              EET (including Edje case) file. This can be used as a key inside
 *              evas image cache if this is a normal image file not eet file.
 *
 * @return (@c EINA_TRUE = success, @c EINA_FALSE = error)
 *
 * @see elm_image_file_set()
 *
 * @note This function will trigger the Edje file case based on the
 * extension of the @a file string use to create the Eina_File (expects
 * @c ".edj", for this case).
 *
 * @note If you use animated gif image and create multiple image objects with
 * one gif image file, you should set the @p group differently for each object.
 * Or image objects will share one evas image cache entry and you will get
 * unwanted frames.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_image_mmap_set(obj:PEvas_Object; file:PEina_File; group:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Control the smooth effect for an image.
 *
 * Set the scaling algorithm to be used when scaling the image. Smooth scaling
 * provides a better resulting image, but is slower.
 *
 * The smooth scaling should be disabled when making animations that change the
 * image size, since it will be faster. Animations that don't require resizing
 * of the image can keep the smooth scaling enabled (even if the image is
 * already scaled, since the scaled image will be cached).
 *
 * @param[in] smooth @c true if smooth scaling should be used, @c false
 * otherwise. Default is @c true.
 *
 * @ingroup Elm_Image
  }
procedure elm_image_smooth_set(obj:PEvas_Object; smooth:TEina_Bool);cdecl;external;
{*
 * @brief Get the smooth effect for an image.
 *
 * Get the scaling algorithm to be used when scaling the image. Smooth scaling
 * provides a better resulting image, but is slower.
 *
 * The smooth scaling should be disabled when making animations that change the
 * image size, since it will be faster. Animations that don't require resizing
 * of the image can keep the smooth scaling enabled (even if the image is
 * already scaled, since the scaled image will be cached).
 *
 * @return @c true if smooth scaling should be used, @c false otherwise.
 * Default is @c true.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_smooth_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * Start or stop an image object's animation.
 *
 * To actually start playing any image object's animation, if it
 * supports it, one must do something like:
 *
 * @code
 * if (elm_image_animated_available_get(img))
 * 
 * elm_image_animated_set(img, EINA_TRUE);
 * elm_image_animated_play_set(img, EINA_TRUE);
 * 
 * @endcode
 *
 * elm_image_animated_set() will enable animation on the image, <b>but
 * not start it yet</b>. This is the function one uses to start and
 * stop animations on image objects.
 *
 * @see elm_image_animated_available_get()
 * @see elm_image_animated_set()
 * @see elm_image_animated_play_get()
 *
 * @ingroup Elm_Image
 * @since 1.7
 *
 * @param obj The image object
 * @param[in] play @c EINA_TRUE to start the animation, @c EINA_FALSE
otherwise. Default is @c EINA_FALSE.
  }
procedure elm_image_animated_play_set(obj:PEvas_Object; play:TEina_Bool);cdecl;external;
{*
 * Get whether an image object is under animation or not.
 *
 * @param obj The image object
 * @return @c EINA_TRUE, if the image is being animated, @c EINA_FALSE
 * otherwise.
 *
 * @see elm_image_animated_play_get()
 *
 * @ingroup Elm_Image
 * @since 1.7
  }
(* Const before type ignored *)
function elm_image_animated_play_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 *
 * Set whether an image object (which supports animation) is to
 * animate itself or not.
 *
 * An image object, even if it supports animation, will be displayed
 * by default without animation. Call this function with @a animated
 * set to @c EINA_TRUE to enable its animation. To start or stop the
 * animation, actually, use elm_image_animated_play_set().
 *
 * @see elm_image_animated_get()
 * @see elm_image_animated_available_get()
 * @see elm_image_animated_play_set()
 *
 * @ingroup Elm_Image
 * @since 1.7
 *
 * @param obj The image object
 * @param[in] anim @c EINA_TRUE if the object is to animate itself,
 * @c EINA_FALSE otherwise. Default is @c EINA_FALSE.
  }
procedure elm_image_animated_set(obj:PEvas_Object; anim:TEina_Bool);cdecl;external;
{*
 *
 * Get whether an image object has animation enabled or not.
 *
 * @param obj The image object
 * @return @c EINA_TRUE if the image has animation enabled,
 * @c EINA_FALSE otherwise.
 *
 * @see elm_image_animated_set()
 *
 * @ingroup Elm_Image
 * @since 1.7
 *
  }
(* Const before type ignored *)
function elm_image_animated_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 *
 * Get whether an image object supports animation or not.
 *
 * @return @c EINA_TRUE if the image supports animation,
 * @c EINA_FALSE otherwise.
 *
 * This function returns if this Elementary image object's internal
 * image can be animated. Currently Evas only supports GIF
 * animation. If the return value is @b EINA_FALSE, other
 * @c elm_image_animated_xxx API calls won't work.
 *
 * @see elm_image_animated_set()
 *
 * @ingroup Elm_Image
 * @since 1.7
 *
  }
(* Const before type ignored *)
function elm_image_animated_available_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Contrtol if the image is 'editable'.
 *
 * This means the image is a valid drag target for drag and drop, and can be
 * cut or pasted too.
 *
 * @param[in] set Turn on or off editability. Default is @c false.
 *
 * @ingroup Elm_Image
  }
procedure elm_image_editable_set(obj:PEvas_Object; set:TEina_Bool);cdecl;external;
{*
 * @brief Contrtol if the image is 'editable'.
 *
 * This means the image is a valid drag target for drag and drop, and can be
 * cut or pasted too.
 *
 * @return Turn on or off editability. Default is @c false.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_editable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set a location in memory to be used as an image object's source
 * bitmap.
 *
 * This function is handy when the contents of an image file are mapped in
 * memory, for example.
 *
 * The @c format string should be something like $"png", $"jpg", $"tga",
 * $"tiff", $"bmp" etc, when provided ($NULL, on the contrary). This improves
 * the loader performance as it tries the "correct" loader first, before trying
 * a range of other possible loaders until one succeeds.
 *
 * @param[in] img The binary data that will be used as image source
 * @param[in] size The size of binary data blob @c img
 * @param[in] format (Optional) expected format of @c img bytes
 * @param[in] key Optional indexing key of @c img to be passed to the image
 * loader (eg. if @c img is a memory-mapped EET file)
 *
 * @return @c true = success, @c false = error
 *
 * @since 1.7
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function elm_image_memfile_set(obj:PEvas_Object; img:pointer; size:Tsize_t; format:Pchar; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Control if the image fills the entire object area, when keeping the
 * aspect ratio.
 *
 * When the image should keep its aspect ratio even if resized to another
 * aspect ratio, there are two possibilities to resize it: keep the entire
 * image inside the limits of height and width of the object ($fill_outside is
 * @c false) or let the extra width or height go outside of the object, and the
 * image will fill the entire object ($fill_outside is @c true).
 *
 * @note This option will have no effect if @ref elm_image_aspect_fixed_get is
 * set to @c false.
 *
 * @param[in] fill_outside @c true if the object is filled outside, @c false
 * otherwise. Default is @c false.
 *
 * @ingroup Elm_Image
  }
procedure elm_image_fill_outside_set(obj:PEvas_Object; fill_outside:TEina_Bool);cdecl;external;
{*
 * @brief Control if the image fills the entire object area, when keeping the
 * aspect ratio.
 *
 * When the image should keep its aspect ratio even if resized to another
 * aspect ratio, there are two possibilities to resize it: keep the entire
 * image inside the limits of height and width of the object ($fill_outside is
 * @c false) or let the extra width or height go outside of the object, and the
 * image will fill the entire object ($fill_outside is @c true).
 *
 * @note This option will have no effect if @ref elm_image_aspect_fixed_get is
 * set to @c false.
 *
 * @return @c true if the object is filled outside, @c false otherwise. Default
 * is @c false.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_fill_outside_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Enable or disable preloading of the image
 *
 * @param[in] disabled If true, preloading will be disabled
 *
 * @ingroup Elm_Image
  }
procedure elm_image_preload_disabled_set(obj:PEvas_Object; disabled:TEina_Bool);cdecl;external;
{* Using Evas_Image_Orient enums.
 *
 * @since 1.14
 *
 * @ingroup Elm_Image
  }
{*< no orientation change  }
{*< no orientation change  }
{*< rotate 90 degrees clockwise  }
{*< rotate 90 degrees clockwise  }
{*< rotate 180 degrees clockwise  }
{*< rotate 180 degrees clockwise  }
{*< rotate 90 degrees counter-clockwise (i.e. 270 degrees clockwise)  }
{*< rotate 90 degrees counter-clockwise (i.e. 270 degrees clockwise)  }
{*< flip image horizontally (along the x = width / 2 line)  }
{*< flip image vertically (along the y = height / 2 line)  }
{*< flip image along the y = (width - x) line (bottom-left to top-right)  }
{*< flip image along the y = x line (top-left to bottom-right)  }
type
  PElm_Image_Orient_Type = ^TElm_Image_Orient_Type;
  TElm_Image_Orient_Type =  Longint;
  Const
    ELM_IMAGE_ORIENT_NONE = 0;
    ELM_IMAGE_ORIENT_0 = 0;
    ELM_IMAGE_ROTATE_90 = 1;
    ELM_IMAGE_ORIENT_90 = 1;
    ELM_IMAGE_ROTATE_180 = 2;
    ELM_IMAGE_ORIENT_180 = 2;
    ELM_IMAGE_ROTATE_270 = 3;
    ELM_IMAGE_ORIENT_270 = 3;
    ELM_IMAGE_FLIP_HORIZONTAL = 4;
    ELM_IMAGE_FLIP_VERTICAL = 5;
    ELM_IMAGE_FLIP_TRANSPOSE = 6;
    ELM_IMAGE_FLIP_TRANSVERSE = 7;
;
  TElm_Image_Orient = TElm_Image_Orient_Type;
  PElm_Image_Orient = ^TElm_Image_Orient;
{*
 * @brief Contrtol the image orientation.
 *
 * This function allows to rotate or flip the given image.
 *
 * @param[in] orient The image orientation Elm.Image.Orient Default is
 * #ELM_IMAGE_ORIENT_NONE.
 *
 * @ingroup Elm_Image
  }

procedure elm_image_orient_set(obj:PEvas_Object; orient:TElm_Image_Orient);cdecl;external;
{*
 * @brief Contrtol the image orientation.
 *
 * This function allows to rotate or flip the given image.
 *
 * @return The image orientation Elm.Image.Orient Default is
 * #ELM_IMAGE_ORIENT_NONE.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_orient_get(obj:PEvas_Object):TElm_Image_Orient;cdecl;external;
{*
 * @brief Get the inlined image object of the image widget.
 *
 * This function allows one to get the underlying @c Evas_Object of type Image
 * from this elementary widget. It can be useful to do things like get the
 * pixel data, save the image to a file, etc.
 *
 * @note Be careful to not manipulate it, as it is under control of elementary.
 *
 * @warning It doesn't guarantee the inlined object must be a type of Evas_Object_Image.
 *          It would be one of @c Evas_Object_Image or @c Edje_Object depending
            on image file type.
 *
 * @return The inlined image object, or NULL if none exists
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_object_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Get the current size of the image.
 *
 * This is the real size of the image, not the size of the object.
 *
 * @param[out] w Pointer to store width, or NULL.
 * @param[out] h Pointer to store height, or NULL.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
procedure elm_image_object_size_get(obj:PEvas_Object; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Control if the object is (up/down) resizable.
 *
 * This function limits the image resize ability. If @c size_up is set to
 * @c false, the object can't have its height or width resized to a value
 * higher than the original image size. Same is valid for @c size_down.
 *
 * @param[in] up A bool to set if the object is resizable up. Default is
 * @c true.
 * @param[in] down A bool to set if the object is resizable down. Default is
 * @c true.
 *
 * @ingroup Elm_Image
  }
procedure elm_image_resizable_set(obj:PEvas_Object; up:TEina_Bool; down:TEina_Bool);cdecl;external;
{*
 * @brief Control if the object is (up/down) resizable.
 *
 * This function limits the image resize ability. If @c size_up is set to
 * @c false, the object can't have its height or width resized to a value
 * higher than the original image size. Same is valid for @c size_down.
 *
 * @param[out] up A bool to set if the object is resizable up. Default is
 * @c true.
 * @param[out] down A bool to set if the object is resizable down. Default is
 * @c true.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
procedure elm_image_resizable_get(obj:PEvas_Object; up:PEina_Bool; down:PEina_Bool);cdecl;external;
{*
 * @brief Control scaling behaviour of this object.
 *
 * This function disables scaling of the elm_image widget through the function
 * elm_object_scale_set(). However, this does not affect the widget size/resize
 * in any way. For that effect, take a look at @ref elm_image_resizable_get and
 * @ref efl_gfx_entity_scale_get
 *
 * @param[in] no_scale @c true if the object is not scalable, @c false
 * otherwise. Default is @c false.
 *
 * @ingroup Elm_Image
  }
procedure elm_image_no_scale_set(obj:PEvas_Object; no_scale:TEina_Bool);cdecl;external;
{*
 * @brief Control scaling behaviour of this object.
 *
 * This function disables scaling of the elm_image widget through the function
 * elm_object_scale_set(). However, this does not affect the widget size/resize
 * in any way. For that effect, take a look at @ref elm_image_resizable_get and
 * @ref efl_gfx_entity_scale_get
 *
 * @return @c true if the object is not scalable, @c false otherwise. Default
 * is @c false.
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_no_scale_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Control whether the internal image's aspect ratio
 * is fixed to the original image's aspect ratio
 *
 * @param[in] fixed @ true if the aspect ratio is fixed
 *
 * @ingroup Elm_Image
  }
procedure elm_image_aspect_fixed_set(obj:PEvas_Object; fixed:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the internal image's aspect ratio
 * is fixed to the original image's
 *
 * @return @ true if the aspect ratio is fixed
 *
 * @ingroup Elm_Image
  }
(* Const before type ignored *)
function elm_image_aspect_fixed_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Enable asynchronous file I/O for elm_image_file_set.
 *
 * @param obj The image object
 * @param[in] async @ true will make elm_image_file_set() an asynchronous operation
 *
 * If @c true, this will make elm_image_file_set() an asynchronous operation.
 * Use of this function is not recommended and the standard EO-based
 * asynchronous I/O API should be preferred instead.
 *
 * @since 1.19
 *
 * @ingroup Elm_Image
  }
procedure elm_image_async_open_set(obj:PEvas_Object; async:TEina_Bool);cdecl;external;

implementation


end.
