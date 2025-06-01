
unit elm_slider_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_slider_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_slider_legacy.h
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
Pdouble  = ^double;
PElm_Slider  = ^Elm_Slider;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Slider = ^TElm_Slider;
  TElm_Slider = TEo;
{*
 * Add a new slider widget to the given parent Elementary
 * (container) object.
 *
 * @param parent The parent object.
 * @return a new slider widget handle or @c NULL, on errors.
 *
 * This function inserts a new slider widget on the canvas.
 *
 * @ingroup Elm_Slider
  }

function elm_slider_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the orientation of a given slider widget.
 *
 * Use this function to change how your slider is to be disposed: vertically or
 * horizontally.
 *
 * By default it's displayed horizontally.
 *
 * @param[in] horizontal
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_horizontal_set(obj:PEvas_Object; horizontal:TEina_Bool);cdecl;external;
{* Get the orientation of a given slider widget.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_horizontal_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the value the slider displays.
 *
 * Value will be presented on the unit label following format specified with
 * @ref elm_slider_unit_format_set and on indicator with
 * @ref elm_slider_indicator_format_set.
 *
 * @note The value must to be between min and max values. This values are set
 * by @ref elm_slider_min_max_set.
 *
 * @param[in] val The value to be displayed.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_value_set(obj:PEvas_Object; val:Tdouble);cdecl;external;
{*
 * @brief Get the value displayed by the slider.
 *
 * @return The value to be displayed.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_value_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Invert a given slider widget's displaying values order
 *
 * A slider may be inverted, in which state it gets its values inverted, with
 * high vales being on the left or top and low values on the right or bottom,
 * as opposed to normally have the low values on the former and high values on
 * the latter, respectively, for horizontal and vertical modes.
 *
 * @param[in] inverted Use @c true to make @c obj inverted, @c false to bring
 * it back to default, non-inverted values.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_inverted_set(obj:PEvas_Object; inverted:TEina_Bool);cdecl;external;
{*
 * @brief Get whether a given slider widget's displaying values are inverted or
 * not.
 *
 * @return Use @c true to make @c obj inverted, @c false to bring it back to
 * default, non-inverted values.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_inverted_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the (exact) length of the bar region of a given slider widget.
 *
 * This sets the minimum width (when in horizontal mode) or height (when in
 * vertical mode) of the actual bar area of the slider @c obj. This in turn
 * affects the object's minimum size. Use this when you're not setting other
 * size hints expanding on the given direction (like weight and alignment
 * hints) and you would like it to have a specific size.
 *
 * @note Icon, end, label, indicator and unit text around @c obj will require
 * their own space, which will make @c obj to require more the @c size,
 * actually.
 *
 * @param[in] size The length of the slider's bar region.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_span_size_set(obj:PEvas_Object; size:TEvas_Coord);cdecl;external;
{*
 * @brief Get the length set for the bar region of a given slider widget
 *
 * If that size was not set previously, with @ref elm_slider_span_size_set,
 * this call will return $0.
 *
 * @return The length of the slider's bar region.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_span_size_get(obj:PEvas_Object):TEvas_Coord;cdecl;external;
{*
 * @brief Set the format string for the unit label.
 *
 * Unit label is displayed all the time, if set, after slider's bar. In
 * horizontal mode, at right and in vertical mode, at bottom.
 *
 * If @c null, unit label won't be visible. If not it sets the format string
 * for the label text. To the label text is provided a floating point value, so
 * the label text can display up to 1 floating point value. Note that this is
 * optional.
 *
 * Use a format string such as "%1.2f meters" for example, and it will display
 * values like: "3.14 meters" for a value equal to 3.14159.
 *
 * Default is unit label disabled.
 *
 * @param[in] units The format string for the unit display.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
procedure elm_slider_unit_format_set(obj:PEvas_Object; units:Pchar);cdecl;external;
{*
 * @brief Get the unit label format of the slider.
 *
 * Unit label is displayed all the time, if set, after slider's bar. In
 * horizontal mode, at right and in vertical mode, at bottom.
 *
 * @return The format string for the unit display.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slider_unit_format_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Set the format function pointer for the units label
 *
 * Set the callback function to format the units string.
 *
 * @param[in] func The units format function.
 * @param[in] free_func The freeing function for the format string.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_units_format_function_set(obj:PEvas_Object; func:Tslider_func_type; free_func:Tslider_freefunc_type);cdecl;external;
{*
 * @brief Set the format function pointer for the units label
 *
 * Set the callback function to format the units string.
 *
 * @param[in] func The units format function.
 * @param[in] free_func The freeing function for the format string.
 * @param[in] The data pointer to be passed to @p func
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_units_format_function_set_full(obj:PEvas_Object; func:Tslider_func_full_type; free_func:Tslider_freefunc_type; data:pointer);cdecl;external;
{*
 * @brief Set the minimum and maximum values for the slider.
 *
 * Define the allowed range of values to be selected by the user.
 *
 * If actual value is less than @c min, it will be updated to @c min. If it is
 * bigger then @c max, will be updated to @c max. Actual value can be get with
 * @ref Efl.Ui.Progress.progress_value.get
 *
 * By default, min is equal to 0.0, and max is equal to 1.0.
 *
 * @warning maximum must be greater than minimum, otherwise behavior is
 * undefined.
 *
 * @param[in] min The minimum value.
 * @param[in] max The maximum value.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_min_max_set(obj:PEvas_Object; min:Tdouble; max:Tdouble);cdecl;external;
{*
 * @brief Get the minimum and maximum values of the slider.
 *
 * @note If only one value is needed, the other pointer can be passed as
 * @c null.
 *
 * @param[out] min The minimum value.
 * @param[out] max The maximum value.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
procedure elm_slider_min_max_get(obj:PEvas_Object; min:Pdouble; max:Pdouble);cdecl;external;
{*
 * @brief This enables two indicators in slider.
 *
 * @param[in] enable @c true if two indicators are enabled, @c false otherwise
 *
 * @since 1.18
  }
procedure elm_slider_range_enabled_set(obj:PEvas_Object; enable:TEina_Bool);cdecl;external;
{*
 * @brief This enables two indicators in slider.
 *
 * @return @c true if two indicators are enabled, @c false otherwise
 *
 * @since 1.18
  }
(* Const before type ignored *)
function elm_slider_range_enabled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Sets up a start and end range point for the slider
 *
 * @param[in] from Range minimum value
 * @param[in] to Range maximum value
 *
 * @since 1.18
  }
procedure elm_slider_range_set(obj:PEvas_Object; from:Tdouble; to:Tdouble);cdecl;external;
{*
 * @brief Sets up a start and end range point for the slider
 *
 * @param[out] from Range minimum value
 * @param[out] to Range maximum value
 *
 * @since 1.18
  }
(* Const before type ignored *)
procedure elm_slider_range_get(obj:PEvas_Object; from:Pdouble; to:Pdouble);cdecl;external;
{*
 * @brief Set the format string for the indicator label.
 *
 * The slider may display its value somewhere else then unit label, for
 * example, above the slider knob that is dragged around. This function sets
 * the format string used for this.
 *
 * If @c null, indicator label won't be visible. If not it sets the format
 * string for the label text. To the label text is provided a floating point
 * value, so the label text can display up to 1 floating point value. Note that
 * this is optional.
 *
 * Use a format string such as "%1.2f meters" for example, and it will display
 * values like: "3.14 meters" for a value equal to 3.14159.
 *
 * Default is indicator label disabled.
 *
 * @param[in] obj The object.
 * @param[in] indicator The format string for the indicator display.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
procedure elm_slider_indicator_format_set(obj:PEvas_Object; indicator:Pchar);cdecl;external;
{*
  * @brief Get the indicator label format of the slider.
  *
  * The slider may display its value somewhere else then unit label, for
  * example, above the slider knob that is dragged around. This function gets
  * the format string used for this.
  *
  * @param[in] obj The object.
  *
  * @return The format string for the indicator display.
  *
  * @ingroup Elm_Slider
   }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_slider_indicator_format_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Set the format function pointer for the indicator label
 *
 * Set the callback function to format the indicator string.
 *
 * @param[in] obj The object.
 * @param[in] func The indicator format function.
 * @param[in] free_func The freeing function for the format string.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_indicator_format_function_set(obj:PEvas_Object; func:Tslider_func_type; free_func:Tslider_freefunc_type);cdecl;external;
{*
 * @brief Set the format function pointer for the indicator label
 *
 * Set the callback function to format the indicator string.
 *
 * @param[in] obj The object.
 * @param[in] func The indicator format function.
 * @param[in] free_func The freeing function for the format string.
 * @param[in] The data pointer to be passed to @p func
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_indicator_format_function_set_full(obj:PEvas_Object; func:Tslider_func_full_type; free_func:Tslider_freefunc_type; data:pointer);cdecl;external;
{*
 * @brief Show the indicator of slider on focus.
 *
 * @param[in] obj The object.
 * @param[in] flag @c true if indicator is shown on focus, @c false otherwise
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_indicator_show_on_focus_set(obj:PEvas_Object; flag:TEina_Bool);cdecl;external;
{*
 * @brief Get whether the indicator of the slider is set or not.
 *
 * @param[in] obj The object.
 *
 * @return @c true if indicator is shown on focus, @c false otherwise
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_indicator_show_on_focus_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set whether to enlarge slider indicator (augmented knob) or not.
 *
 * By default, indicator will be bigger while dragged by the user.
 *
 * @param[in] obj The object.
 * @param[in] show @c true will make it enlarge, @c false will let the knob
 * always at default size.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_indicator_show_set(obj:PEvas_Object; show:TEina_Bool);cdecl;external;
{*
 * @brief Get whether a given slider widget's enlarging indicator or not.
 *
 * @param[in] obj The object.
 *
 * @return @c true will make it enlarge, @c false will let the knob always at
 * default size.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_indicator_show_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set/Get the visible mode of indicator.
 *
 * @param[in] obj The object.
 * @param[in] indicator_visible_mode The indicator visible mode.
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_indicator_visible_mode_set(obj:PEvas_Object; indicator_visible_mode:TElm_Slider_Indicator_Visible_Mode);cdecl;external;
{*
 * @brief Set/Get the visible mode of indicator.
 *
 * @param[in] obj The object.
 *
 * @return The indicator visible mode.
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_indicator_visible_mode_get(obj:PEvas_Object):TElm_Slider_Indicator_Visible_Mode;cdecl;external;
{*
 * @brief Get the step by which slider indicator moves.
 *
 * @param[in] obj The object.
 *
 * @return The step value.
 *
 * @since 1.8
 *
 * @ingroup Elm_Slider
  }
(* Const before type ignored *)
function elm_slider_step_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Set the step by which slider indicator will move.
 *
 * This value is used when a draggable object is moved automatically such as
 * when key events like the up/down/left/right key are pressed or in case
 * accessibility is set and flick event is used to inc/dec slider values. By
 * default step value is 0.05.
 *
 * @param[in] obj The object.
 * @param[in] step The step value.
 *
 * @since 1.8
 *
 * @ingroup Elm_Slider
  }
procedure elm_slider_step_set(obj:PEvas_Object; step:Tdouble);cdecl;external;

implementation


end.
