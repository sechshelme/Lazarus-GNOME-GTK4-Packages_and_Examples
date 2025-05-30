{$IFDEF read_interface}


{$ifndef ELM_COLOR_CLASS_H}
{$define ELM_COLOR_CLASS_H}
{*
 * @defgroup Elm_Color_Class_Group Color Class Editor
 * @brief This group provides a UI for editing color classes in applications.
 *
 * @
  }
{#define ELM_COLOR_CLASS_METHOD_BASE "org.elementary.colorclass" }
{*
 * @typedef Elm_Color_Class_Name_Cb
 * @brief A callback used to translate color class descriptions
 * @since 1.14
  }
type
  PElm_Color_Class_Name_Cb = ^TElm_Color_Class_Name_Cb;
  TElm_Color_Class_Name_Cb = function (para1:Pchar):Pchar;cdecl;
{*
 * @typedef Elm_Color_Class_List_Cb
 * @brief A callback used to provide a list of allocated Edje_Color_Class structs used by an application
 * @since 1.14
 *
 * The list and its members will be freed internally.
  }

  PElm_Color_Class_List_Cb = ^TElm_Color_Class_List_Cb;
  TElm_Color_Class_List_Cb = function :PEina_List;cdecl;
{*
 * @brief Create a new color class editor
 * @param obj The parent object
 *
 * A color class editor is a visual representation of the color schemes in an application.
 * Values changed in the editor are stored in Elementary's config and will remain until they
 * are reset or the config is cleared. By default, the editor will load only the currently active
 * color classes in an application.
 *
 * @since 1.14
  }

function elm_color_class_editor_add(obj:PEvas_Object):PEvas_Object;cdecl;external libelementary;
{*
 * @brief Set a callback to provide translations for color class descriptions
 * @param cb The callback to use
 *
 * This callback will be called globally by the application to translate any available color class
 * description strings from the theme's color classes.
 *
 * @since 1.14
 * }
procedure elm_color_class_translate_cb_set(cb:TElm_Color_Class_Name_Cb);cdecl;external libelementary;
{*
 * @brief Set a callback to provide a list of supplementary color classes
 * @param cb The callback to use
 *
 * This callback will be called globally by the application to provide extra color classes
 * that an application may use but which may not be currently loaded.
 *
 * @see Elm_Color_Class_List_Cb
 *
 * @since 1.14
 * }
procedure elm_color_class_list_cb_set(cb:TElm_Color_Class_List_Cb);cdecl;external libelementary;
{*
 * @brief Create an allocated list of allocated Edje_Color_Class structs from an open edje file
 * @param f The file to list color classes from
 * @return The list of color classes present in the file
 *
 * This is a helper function to create a list for use with #Elm_Color_Class_List_Cb callbacks.
 *
 * @see Elm_Color_Class_List_Cb
 *
 * @since 1.14
 * }
function elm_color_class_util_edje_file_list(f:PEina_File):PEina_List;cdecl;external libelementary;
{* @  }
{$endif}

// === Konventiert am: 29-5-25 20:29:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
