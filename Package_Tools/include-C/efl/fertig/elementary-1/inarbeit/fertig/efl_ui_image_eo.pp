
unit efl_ui_image_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_image_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_image_eo.h
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
PEfl_Ui_Image  = ^Efl_Ui_Image;
PEfl_Ui_Image_Error  = ^Efl_Ui_Image_Error;
PEfl_Ui_Image_Progress  = ^Efl_Ui_Image_Progress;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_IMAGE_EO_H_}
{$define _EFL_UI_IMAGE_EO_H_}
{$ifndef _EFL_UI_IMAGE_EO_CLASS_TYPE}
{$define _EFL_UI_IMAGE_EO_CLASS_TYPE}
type
  PEfl_Ui_Image = ^TEfl_Ui_Image;
  TEfl_Ui_Image = TEo;
{$endif}
{$ifndef _EFL_UI_IMAGE_EO_TYPES}
{$define _EFL_UI_IMAGE_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Structure associated with smart callback 'download,progress'.
 *
 * @ingroup Efl_Ui_Image_Progress
  }
{*< Current percentage  }
{*< Total percentage  }
type
  PEfl_Ui_Image_Progress = ^TEfl_Ui_Image_Progress;
  TEfl_Ui_Image_Progress = record
      now : Tdouble;
      total : Tdouble;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Structure associated with smart callback 'download,progress'.
 *
 * @ingroup Efl_Ui_Image_Error
  }
{*< Error status of the download  }
{*< @c true if the error happened when opening the
                         * file, @c false otherwise  }
type
  PEfl_Ui_Image_Error = ^TEfl_Ui_Image_Error;
  TEfl_Ui_Image_Error = record
      status : longint;
      open_error : TEina_Bool;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{*
 * @brief Efl UI image class
 *
 * When loading images from a file, the @ref efl_file_key_get property can be
 * used to access different streams. For example, when accessing Evas image
 * caches.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image
  }

{ was #define dname def_expr }
function EFL_UI_IMAGE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_image_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The image name, using icon standards names.
 *
 * For example, freedesktop.org defines standard icon names such as "home" and
 * "network". There can be different icon sets to match those icon keys. The
 * "name" given as parameter is one of these "keys" and will be used to look in
 * the freedesktop.org paths and elementary theme.
 *
 * If the name is not found in any of the expected locations and is the
 * absolute path of an image file, this image will be used. Lookup order used
 * by @ref efl_ui_image_icon_set can be set using "icon_theme" in config.
 *
 * If the image was set using @ref efl_file_get instead of
 * @ref efl_ui_image_icon_set, then reading this property will return null.
 *
 * @note The image set by this function is changed when @ref efl_file_load is
 * called.
 *
 * @note This function does not accept relative icon paths.
 *
 * @param[in] obj The object.
 * @param[in] name The icon name
 *
 * @return @c true on success, @c false on error
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image
  }
(* Const before type ignored *)
function efl_ui_image_icon_set(obj:PEo; name:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief The image name, using icon standards names.
 *
 * For example, freedesktop.org defines standard icon names such as "home" and
 * "network". There can be different icon sets to match those icon keys. The
 * "name" given as parameter is one of these "keys" and will be used to look in
 * the freedesktop.org paths and elementary theme.
 *
 * If the name is not found in any of the expected locations and is the
 * absolute path of an image file, this image will be used. Lookup order used
 * by @ref efl_ui_image_icon_set can be set using "icon_theme" in config.
 *
 * If the image was set using @ref efl_file_get instead of
 * @ref efl_ui_image_icon_set, then reading this property will return null.
 *
 * @note The image set by this function is changed when @ref efl_file_load is
 * called.
 *
 * @note This function does not accept relative icon paths.
 *
 * @param[in] obj The object.
 *
 * @return The icon name
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_image_icon_get(obj:PEo):Pchar;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
(* Const before type ignored *)
  var
    _EFL_UI_IMAGE_EVENT_DROP : TEfl_Event_Description;cvar;external;
{* Called when drop from drag and drop happened
 * @return const char *
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image
  }

{ was #define dname def_expr }
function EFL_UI_IMAGE_EVENT_DROP : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_IMAGE_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_CLASS:=efl_ui_image_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_EVENT_DROP : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_EVENT_DROP:=@(_EFL_UI_IMAGE_EVENT_DROP);
  end;


end.
