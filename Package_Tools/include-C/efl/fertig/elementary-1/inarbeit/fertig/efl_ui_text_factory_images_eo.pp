
unit efl_ui_text_factory_images_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_text_factory_images_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_text_factory_images_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Text_Factory_Images  = ^Efl_Ui_Text_Factory_Images;
PEina_File  = ^Eina_File;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TEXT_FACTORY_IMAGES_EO_H_}
{$define _EFL_UI_TEXT_FACTORY_IMAGES_EO_H_}
{$ifndef _EFL_UI_TEXT_FACTORY_IMAGES_EO_CLASS_TYPE}
{$define _EFL_UI_TEXT_FACTORY_IMAGES_EO_CLASS_TYPE}
type
  PEfl_Ui_Text_Factory_Images = ^TEfl_Ui_Text_Factory_Images;
  TEfl_Ui_Text_Factory_Images = TEo;
{$endif}
{$ifndef _EFL_UI_TEXT_FACTORY_IMAGES_EO_TYPES}
{$define _EFL_UI_TEXT_FACTORY_IMAGES_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Factory that creates images given key string
 *
 * The key can be either a full image path, or associated with one. The factory
 * will fallback if key was not matches with an image, and try to load it as a
 * full path.
 *
 * @ingroup Efl_Ui_Text_Factory_Images
  }

{ was #define dname def_expr }
function EFL_UI_TEXT_FACTORY_IMAGES_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_text_factory_images_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Associates given name with a path of an image or EET file.
 *
 * This can be used for quick retrieval (instead of providing actual filenames.
 *
 * This @c file is associated with @c name is considered a full file path.
 *
 * see @ref efl_ui_text_factory_images_matches_mmap_add for mmap version see
 * @ref efl_ui_text_factory_images_matches_del
 *
 * @param[in] obj The object.
 * @param[in] name the name associated with filename
 * @param[in] path the image or EET file path
 * @param[in] key the key to use (in cases of loading an EET file
 *
 * @return @c true if successful, @c false otherwise
 *
 * @ingroup Efl_Ui_Text_Factory_Images
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_text_factory_images_matches_add(obj:PEo; name:Pchar; path:Pchar; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes an association of @c key with its respective file path.
 *
 * see @ref efl_ui_text_factory_images_matches_add
 *
 * @param[in] obj The object.
 * @param[in] key the entry's key to delete
 *
 * @return @c true if successful, @c false otherwise
 *
 * @ingroup Efl_Ui_Text_Factory_Images
  }
(* Const before type ignored *)
function efl_ui_text_factory_images_matches_del(obj:PEo; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Associates given name with a mmap'd image or EET file and key.
 *
 * see @ref efl_ui_text_factory_images_matches_add for string file path version
 * see @ref efl_ui_text_factory_images_matches_mmap_del
 *
 * @param[in] obj The object.
 * @param[in] name the name associated with filename
 * @param[in] file the image or EET file
 * @param[in] key the key to use (in cases of loading an EET file
 *
 * @return @c true if successful, @c false otherwise
 *
 * @ingroup Efl_Ui_Text_Factory_Images
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_text_factory_images_matches_mmap_add(obj:PEo; name:Pchar; file:PEina_File; key:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Deletes an association of @c key with its respective file.
 *
 * see @ref efl_ui_text_factory_images_matches_mmap_add
 *
 * @param[in] obj The object.
 * @param[in] key the entry's key to delete
 *
 * @return @c true if successful, @c false otherwise
 *
 * @ingroup Efl_Ui_Text_Factory_Images
  }
(* Const before type ignored *)
function efl_ui_text_factory_images_matches_mmap_del(obj:PEo; key:Pchar):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TEXT_FACTORY_IMAGES_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TEXT_FACTORY_IMAGES_CLASS:=efl_ui_text_factory_images_class_get;
  end;


end.
