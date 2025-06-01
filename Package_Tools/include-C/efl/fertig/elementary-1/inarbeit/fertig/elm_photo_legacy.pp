
unit elm_photo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_photo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_photo_legacy.h
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
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new photo to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Photo
  }

function elm_photo_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 *
 * Set the file that will be used as the photo widget's image.
 *
 * @return @c EINA_TRUE on success, @c EINA_FALSE otherwise
 *
 * @note Use @c NULL on @a file to set the photo widget back to it's
 * initial state, which indicates "no photo".
 *
 * @ingroup Elm_Photo
 *
 * @param[in] file The path to file that will be used as @a obj's image.
  }
(* Const before type ignored *)
function elm_photo_file_set(obj:PEo; file:Pchar):TEina_Bool;cdecl;external;
{*
 * Set editability of the photo.
 *
 * An editable photo can be dragged to or from, and can be cut or pasted too.
 * Note that pasting an image or dropping an item on the image will delete the
 * existing content.
 *
 * @param[in] set To set of clear editability.
 *
 * @ingroup Elm_Photo
  }
procedure elm_photo_editable_set(obj:PEvas_Object; set:TEina_Bool);cdecl;external;
{*
 * Get editability of the photo.
 *
 * @return To set of clear editability.
 *
 * @ingroup Elm_Photo
  }
(* Const before type ignored *)
function elm_photo_editable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set if the photo should be completely visible or not.
 *
 * @param[in] fill Photo visibility.
 *
 * @ingroup Elm_Photo
  }
procedure elm_photo_fill_inside_set(obj:PEvas_Object; fill:TEina_Bool);cdecl;external;
{*
 * @brief Get if the photo should be completely visible or not.
 *
 * @return Photo visibility.
 *
 * @ingroup Elm_Photo
  }
(* Const before type ignored *)
function elm_photo_fill_inside_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set whether the original aspect ratio of the photo should be kept on
 * resize.
 *
 * The original aspect ratio (width / height) of the photo is usually distorted
 * to match the object's size. Enabling this option will fix this original
 * aspect, and the way that the photo is fit into the object's area.
 *
 * See also @ref elm_photo_aspect_fixed_get.
 *
 * @param[in] fixed @c true if the photo should fix the aspect, @c false
 * otherwise.
 *
 * @ingroup Elm_Photo
  }
procedure elm_photo_aspect_fixed_set(obj:PEvas_Object; fixed:TEina_Bool);cdecl;external;
{*
 * @brief Get if the object keeps the original aspect ratio.
 *
 * @return @c true if the photo should fix the aspect, @c false otherwise.
 *
 * @ingroup Elm_Photo
  }
(* Const before type ignored *)
function elm_photo_aspect_fixed_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the size that will be used on the photo
 *
 * @param[in] size The size of the photo
 *
 * @ingroup Elm_Photo
  }
procedure elm_photo_size_set(obj:PEvas_Object; size:longint);cdecl;external;
{*
 * @brief Get the size that will be used on the photo
 *
 * @return The size of the photo
 *
 * @ingroup Elm_Photo
  }
(* Const before type ignored *)
function elm_photo_size_get(obj:PEvas_Object):longint;cdecl;external;
{*
 * @brief Set the file that will be used as thumbnail in the photo.
 *
 * @param[in] group The key used in case of an EET file.
 *
 * @ingroup Elm_Photo
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_photo_thumb_set(obj:PEvas_Object; file:Pchar; group:Pchar);cdecl;external;
{$include "elm_photo_eo.legacy.h"}

implementation


end.
