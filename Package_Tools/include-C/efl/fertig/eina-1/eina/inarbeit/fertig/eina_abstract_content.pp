
unit eina_abstract_content;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_abstract_content.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_abstract_content.h
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
PEina_Content  = ^Eina_Content;
PEina_Content_Conversion_Callback  = ^Eina_Content_Conversion_Callback;
PEina_Iterator  = ^Eina_Iterator;
PEina_Value  = ^Eina_Value;
PEina_Value_Type  = ^Eina_Value_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EINA_ABSTRACT_CONTENT_H}
{$define EINA_ABSTRACT_CONTENT_H}
{*
 * @typedef Eina_Content
 * Container for any type of content.
 *
 * Each Eina_Content is made of an Eina_Slice of memory and an IANA MIME type:
 * https://www.iana.org/assignments/media-types/media-types.xhtml
 *
 * @note If the type is any kind of text the last byte of the slice must be \0.
 *
 * @since 1.24
  }
type
{*
 * @typedef Eina_Content_Conversion_Callback
 *
 * Method called when conversion from one type to another is requested.
 * The from and to types are specified when the callback is registered.
 * The to type is also passed in the callback here.
 * The type of the from pointer does not need to be checked.
  }
(* Const before type ignored *)

  PEina_Content_Conversion_Callback = ^TEina_Content_Conversion_Callback;
  TEina_Content_Conversion_Callback = function (from:PEina_Content; to_type:Pchar):PEina_Content;cdecl;
{*
 * Get the path to a file, containing the slice memory as content.
 *
 * @param[in] content The content that will be in the file.
 *
 * @return The path to the file. Do not free this.
 *
  }
(* Const before type ignored *)

function eina_content_as_file(content:PEina_Content):Pchar;cdecl;external;
{*
 * Convert the content of the object to another type.
 *
 * In case the conversion cannot be performed, NULL is returned.
 *
 * @param[in] content The content to convert.
 * @param[in] new_type The new type the returned content will have.
 *
 * @return A new content object. The caller of this function is owning this.
  }
(* Const before type ignored *)
function eina_content_convert(content:PEina_Content; new_type:Pchar):PEina_Content;cdecl;external;
{*
 * Get the type of the passed content.
 *
 * @param[in] content The content to fetch the type from.
 *
 * @return The type of this content. Do no free this.
  }
(* Const before type ignored *)
function eina_content_type_get(content:PEina_Content):Pchar;cdecl;external;
{*
 * Get the Eina_Slice of the passed content.
 *
 * @param[in] content The content to fetch the data from.
 *
 * @return An Eina_Slice containing the data. Do not free.
  }
function eina_content_data_get(content:PEina_Content):TEina_Slice;cdecl;external;
{*
 * Create a new content object, with the provided data and type.
 *
 * @param[in] data A slice of memory. The memory is copied.
 * @param[in] type The type this data represents.
 *
 * @return The new content object. The caller owns this object.
  }
(* Const before type ignored *)
function eina_content_new(data:TEina_Slice; _type:Pchar):PEina_Content;cdecl;external;
{*
 * Free the content object.
 *
 * @param[in] content The content to free.
  }
procedure eina_content_free(content:PEina_Content);cdecl;external;
{*
 * Register a new conversion callback.
 *
 * @param[in] from The type to convert from.
 * @param[in] to The type to convert to.
 *
 * @return True if the callback was successfully registered.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_content_converter_conversion_register(from:Pchar; to:Pchar; convertion:TEina_Content_Conversion_Callback):TEina_Bool;cdecl;external;
{*
 * Check if a specific conversion can be performed.
 *
 * A conversion can only be performed if a callback is registered.
 *
 * @param[in] from The type to convert from.
 * @param[in] to The type to convert to.
 *
 * @return True if the conversion can be performed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_content_converter_convert_can(from:Pchar; to:Pchar):TEina_Bool;cdecl;external;
{*
 * Returns an iterator containing all the target types that the provided source type can be converted to.
 *
 * @param[in] from The type to convert from.
 *
 * @return An Iterator containing MIME type strings. Free this via eina_iterator_free.
  }
(* Const before type ignored *)
function eina_content_converter_possible_conversions(from:Pchar):PEina_Iterator;cdecl;external;
(* Const before type ignored *)
  var
    EINA_VALUE_TYPE_CONTENT : PEina_Value_Type;cvar;external;
{*
 * Convert the Eina_Content object to an Eina_Value.
 *
 * @param[in] content The Eina_Content struct that will be converted to an Eina_Value.
 *
 * @return An newly-allocated Eina_Value. Caller owns it.
  }

function eina_value_content_new(content:PEina_Content):PEina_Value;cdecl;external;
{*
 * Creates an Eina_Value from an Eina_Content.
 *
 * @param[in] content The Eina_Content struct that will be converted to an Eina_Value.
 *
 * @return An Eina_Value with type EINA_VALUE_TYPE_CONTENT.
  }
function eina_value_content_init(content:PEina_Content):TEina_Value;cdecl;external;
{*
 * Gets the content from the Eina_Value.
 *
 * If the value is not of the type EINA_VALUE_TYPE_CONTENT, NULL will be returned and an error will be printed.
 *
 * @param[in] value The value to get the content from
 *
 * @return A newly-allocated Eina_Content. Caller owns it.
  }
(* Const before type ignored *)
function eina_value_to_content(value:PEina_Value):PEina_Content;cdecl;external;
{
static inline Eina_Iterator*
eina_content_possible_conversions(Eina_Content *content)

   return eina_content_converter_possible_conversions(eina_content_type_get(content));

 }
{$endif}

implementation


end.
