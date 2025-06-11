
unit eldbus_message;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_message.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_message.h
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
PEldbus_Message  = ^Eldbus_Message;
PEldbus_Message_Iter  = ^Eldbus_Message_Iter;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_MESSAGE_H}

const
  ELDBUS_MESSAGE_H = 1;  
{*
 * @defgroup Eldbus_Message Message
 * @ingroup Eldbus
 *
 * @
  }
{*
 * @brief Increase message reference.
 *
 * @param msg The Eldbus_Message object.
 * @return The previous Eldbus_Message with incremented refcount.
  }

function eldbus_message_ref(msg:PEldbus_Message):PEldbus_Message;cdecl;external;
{*
 * @brief Decrease message reference.
 *
 * When refcount reaches zero the message and all its resources will be
 * freed.
 *
 * @param msg The Eldbus_Message object.
  }
procedure eldbus_message_unref(msg:PEldbus_Message);cdecl;external;
{*
 * Get the Eldbus message path.
 *
 * @param msg The Eldbus_Message object.
 * @return A string containing the dbus message path.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_path_get(msg:PEldbus_Message):Pchar;cdecl;external;
{*
 * Get the Eldbus message interface.
 *
 * @param msg The Eldbus_Message object.
 * @return A string containing the dbus message interface.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_interface_get(msg:PEldbus_Message):Pchar;cdecl;external;
{*
 * Get the Eldbus message member.
 *
 * @param msg The Eldbus_Message object.
 * @return A string containing the dbus message member.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_member_get(msg:PEldbus_Message):Pchar;cdecl;external;
{*
 * Get the Eldbus message destination.
 *
 * @param msg The Eldbus_Message object.
 * @return A string containing the dbus message destination.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_destination_get(msg:PEldbus_Message):Pchar;cdecl;external;
{*
 * Get the Eldbus message sender.
 *
 * @param msg The Eldbus_Message object.
 * @return A string containing the dbus message sender.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_sender_get(msg:PEldbus_Message):Pchar;cdecl;external;
{*
 * Get the Eldbus message signature.
 *
 * @param msg The Eldbus_Message object.
 * @return A string containing the dbus message signature.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_signature_get(msg:PEldbus_Message):Pchar;cdecl;external;
{*
 * @brief Create a new message to invoke a method on a remote object.
 *
 * @param dest bus name or unique id of the remote application
 * @param path object path
 * @param iface interface name
 * @param method name of the method to be called
 *
 * @return a new Eldbus_Message, free with eldbus_message_unref()
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_method_call_new(dest:Pchar; path:Pchar; iface:Pchar; method:Pchar):PEldbus_Message;cdecl;external;
{*
 * @brief Create a new signal message.
 *
 * @param path object path
 * @param interface interface name
 * @param name name of the signal to be broadcasted
 *
 * @return a new Eldbus_Message, free with eldbus_message_unref()
 *
 * @since 1.16
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_signal_new(path:Pchar; interface:Pchar; name:Pchar):PEldbus_Message;cdecl;external;
{*
 * @brief Create a new message that is an error reply to another message.
 *
 * @param msg the message we're replying to
 * @param error_name the error name
 * @param error_msg the error message string
 *
 * @return a new Eldbus_Message, free with eldbus_message_unref()
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_error_new(msg:PEldbus_Message; error_name:Pchar; error_msg:Pchar):PEldbus_Message;cdecl;external;
{*
 * @brief Create a message that is a reply to a method call.
 *
 * @param msg the message we're replying to
 *
 * @return new Eldbus_Message, free with eldbus_message_unref()
  }
(* Const before type ignored *)
function eldbus_message_method_return_new(msg:PEldbus_Message):PEldbus_Message;cdecl;external;
{*
 * @brief Get the error text and name from a Eldbus_Message.
 *
 * If @param msg is an error message return EINA_TRUE and fill in the name and
 * text of the error.
 *
 * @param msg The message containing the error
 * @param name Variable in which to store the error name or @c NULL if it's not
 * desired.
 * @param text Variable in which to store the error text or @c NULL if it's not
 * desired.
 * @return EINA_TRUE on success, else EINA_FALSE.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_error_get(msg:PEldbus_Message; name:PPchar; text:PPchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the arguments from an Eldbus_Message
 *
 * Get the arguments of an Eldbus_Message storing them in the locations pointed
 * to by the pointer arguments that follow param signature. Each pointer
 * argument must be of a type that is appropriate for the correspondent complete
 * type in param signature. For complex types such as arrays, structs,
 * dictionaries or variants, a pointer to Eldbus_Message_Iter* must be provided.
 *
 * @param msg The message to get the arguments from.
 * @param signature The signature of the arguments user is expecting to read
 * from @param msg
 * @param ... The pointers in which to store the message arguments
 *
 * @return EINA_TRUE if the arguments were read successfully and stored in the
 * respective pointer arguments.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_arguments_get(msg:PEldbus_Message; signature:Pchar; args:array of const):TEina_Bool;cdecl;external;
function eldbus_message_arguments_get(msg:PEldbus_Message; signature:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get the arguments from an Eldbus_Message using a va_list.
 *
 * @param msg The message to get the arguments from.
 * @param signature The signature user is expecting to read from param msg.
 * @param ap The va_list containing the pointer arguments.
 *
 * @see eldbus_message_arguments_get()
 *
 * @return EINA_TRUE if the arguments were read successfully and stored in the
 * respective pointer arguments.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_message_arguments_vget(msg:PEldbus_Message; signature:Pchar; ap:Tva_list):TEina_Bool;cdecl;external;
{*
 * @brief Append arguments into an Eldbus_Message
 *
 * Append arguments into an Eldbus_Message according to the param signature
 * provided. For each complete type in param signature, a value of the
 * corresponding type must be provided.
 *
 * This function supports only basic types. For complex types use
 * eldbus_message_iter_* family of functions.
 *
 * @param msg The message in which arguments are being appended.
 * @param signature Signature of the arguments that are being appended.
 * @param ... Values of each argument to append in param msg.
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function eldbus_message_arguments_append(msg:PEldbus_Message; signature:Pchar; args:array of const):TEina_Bool;cdecl;external;
function eldbus_message_arguments_append(msg:PEldbus_Message; signature:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Append arguments into an Eldbus_Message using a va_list.
 *
 * @param msg The message in which arguments are being appended.
 * @param signature Signature of the arguments that are being appended.
 * @param ap The va_list containing the arguments to append.
 *
 * @see eldbus_message_arguments_append().
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise.
  }
(* Const before type ignored *)
function eldbus_message_arguments_vappend(msg:PEldbus_Message; signature:Pchar; ap:Tva_list):TEina_Bool;cdecl;external;
{*
 * @defgroup Eldbus_Message_Iter Iterator
 * @
  }
{*
 * @brief Create and append a typed iterator to another iterator.
 *
 * After append data to returned iterator it must be closed calling
 * eldbus_message_iter_container_close().
 *
 * Container types are for example struct, variant, and array.
 * For variants, the contained_signature should be the type of the single
 * value inside the variant. For structs and dict entries, contained_signature
 * should be NULL; it will be set to whatever types you write into the struct.
 * For arrays, contained_signature should be the type of the array elements.
 *
 * @param iter parent of the new iterator
 * @param type of iterator (e.g struct, dict, variant or array)
 * @param contained_signature signature of what iterator will store
 *
 * @return the new iterator
  }
(* Const before type ignored *)
function eldbus_message_iter_container_new(iter:PEldbus_Message_Iter; _type:longint; contained_signature:Pchar):PEldbus_Message_Iter;cdecl;external;
{*
 * @brief Append a basic type into an Eldbus_Iterator.
 *
 * @param iter The iterator in which basic type will be appended.
 * @param type The basic type that will be appended.
 * @param ... The values for the basic type.
 *
 * @return EINA_TRUE on success, else EINA_FALSE.
  }
function eldbus_message_iter_basic_append(iter:PEldbus_Message_Iter; _type:longint; args:array of const):TEina_Bool;cdecl;external;
function eldbus_message_iter_basic_append(iter:PEldbus_Message_Iter; _type:longint):TEina_Bool;cdecl;external;
{*
 * @brief Append an argument into an Eldbus_Message_Iter. For each complete type
 * you need to provide the correspondent value. In case of complex types you
 * need to provide an Eldbus_Message_Iter** to be allocated and then filled in.
 *
 * It's not possible to open two iterators at same iterator with this function.
 * For example, to create a message with signature="aiai" you need to create the
 * first container with eldbus_message_iter_container_new(), fill the array,
 * close it with eldbus_message_iter_container_close() and then do the same for
 * the second array.
 *
 * @param iter iterator in which data will be appended
 * @param signature signature of the contained data
 * @param ... values for each complete type
 * @return EINA_TRUE on success, else EINA_FALSE
 *
 * @see eldbus_message_iter_container_new()
 * @see eldbus_message_iter_container_close()
 *
 * @note This function doesn't support variant, use
 * eldbus_message_iter_container_new() instead to create the variant, fill
 * with data and close it.
  }
(* Const before type ignored *)
function eldbus_message_iter_arguments_append(iter:PEldbus_Message_Iter; signature:Pchar; args:array of const):TEina_Bool;cdecl;external;
function eldbus_message_iter_arguments_append(iter:PEldbus_Message_Iter; signature:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Set data to Eldbus_Message_Iter. For each complete in signature
 * you need pass the value, in case of complex type a pointer to be allocated a
 * Eldbus_Message_Iter that you need fill and close.
 *
 * It's not possible open two iterators at same Iterator. Example:
 * "aiai", to set this you need create and put the first array with
 * eldbus_message_iter_container_new() fill array with data and close then
 * you could open the second array with eldbus_message_iter_container_new().
 *
 * @param iter iterator
 * @param signature of data
 * @param ap va_list with the values
 * @return EINA_TRUE on success, else EINA_FALSE
 *
 * @note This function don't support variant, use instead
 * eldbus_message_iter_container_new() to create the variant fill
 * data and close it.
  }
(* Const before type ignored *)
function eldbus_message_iter_arguments_vappend(iter:PEldbus_Message_Iter; signature:Pchar; ap:Tva_list):TEina_Bool;cdecl;external;
{*
 * Append a array of basic type with fixed size to Eldbus_Message_Iter.
 *
 * @param iter iterator
 * @param type basic type that will be appended
 * @param array data to append
 * @param size of array
 * @return EINA_TRUE on success, else EINA_FALSE
  }
(* Const before type ignored *)
function eldbus_message_iter_fixed_array_append(iter:PEldbus_Message_Iter; _type:longint; array:pointer; size:dword):TEina_Bool;cdecl;external;
{*
 * @brief Closes a container-typed value appended to the message.
 *
 * @param iter parent of the sub-iterator
 * @param sub the iterator that will be closed
 *
 * @return EINA_FALSE if iterator was already close or if not enough memory
  }
function eldbus_message_iter_container_close(iter:PEldbus_Message_Iter; sub:PEldbus_Message_Iter):TEina_Bool;cdecl;external;
{*
 * @brief Get the main Eldbus_Message_Iter from the Eldbus_Message.
 *
 * @param msg The message to get the iterator from.
 *
 * @return The iterator of the message.
  }
(* Const before type ignored *)
function eldbus_message_iter_get(msg:PEldbus_Message):PEldbus_Message_Iter;cdecl;external;
{*
 * @brief Get a basic type from Eldbus_Iterator.
 *
 * @param iter The iterator to get the basic type from.
 * @param value The basic type of the iterator.
  }
procedure eldbus_message_iter_basic_get(iter:PEldbus_Message_Iter; value:pointer);cdecl;external;
{*
 * @brief Returns the current signature of a message iterator.
 *
 * @param iter The iterator on which to query the signature.
 * @return A string containing the message iterator signature.
 *
 * @note The returned string must be freed.
  }
function eldbus_message_iter_signature_get(iter:PEldbus_Message_Iter):Pchar;cdecl;external;
{*
 * @brief Moves the iterator to the next field, if any.
 * @param iter iterator
 *
 * @return if iterator was reach to end return EINA_FALSE
  }
function eldbus_message_iter_next(iter:PEldbus_Message_Iter):TEina_Bool;cdecl;external;
{*
 * @brief Get a complete type from Eldbus_Message_Iter if is not at the end
 * of iterator and move to next field.
 * Useful to iterate over arrays.
 *
 * @param iter iterator
 * @param signature of the next completed type in Iterator
 * @param ... pointer of where data will be stored
 *
 * @return if iterator was reach to end or if type different of the type that
 * iterator points return EINA_FALSE
 *
  }
function eldbus_message_iter_get_and_next(iter:PEldbus_Message_Iter; signature:char; args:array of const):TEina_Bool;cdecl;external;
function eldbus_message_iter_get_and_next(iter:PEldbus_Message_Iter; signature:char):TEina_Bool;cdecl;external;
{*
 * @brief Reads a block of fixed-length values from the message iterator.
 *
 * Fixed-length values are those basic types that are not string-like,
 * such as integers, bool, double. The returned block will be from the
 * current position in the array until the end of the array.
 *
 * There is one exception here: although ELDBUS_TYPE_UNIX_FD is considered a
 * 'fixed' type arrays of this type may not be read with this function.
 *
 * The value argument should be the address of a location to store the returned
 * array. So for int32 it should be a "const dbus_int32_t**" The returned value
 * is by reference and should not be freed.
 *
 * Because the array is not copied, this function runs in constant time and is
 * fast; it's much preferred over walking the entire array with an iterator.
 *
 * @param iter The message iterator
 * @param signature
 * @param value
 * @param n_elements
 * @return EINA_TRUE on success, else EINA_FALSE.
  }
function eldbus_message_iter_fixed_array_get(iter:PEldbus_Message_Iter; signature:longint; value:pointer; n_elements:Plongint):TEina_Bool;cdecl;external;
{*
 * @brief Get data from Eldbus_Message_Iter, for each complete type must have
 * a pointer to store his value, in case of complex type a
 * Eldbus_Message_Iter will be need.
 *
 * @param iter iterator
 * @param signature of the complete data types on iterator
 * @param ... pointers of where data will be stored
 *
 * @return EINA_FALSE if signature different from signature in iterator
  }
(* Const before type ignored *)
function eldbus_message_iter_arguments_get(iter:PEldbus_Message_Iter; signature:Pchar; args:array of const):TEina_Bool;cdecl;external;
function eldbus_message_iter_arguments_get(iter:PEldbus_Message_Iter; signature:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Get data from Eldbus_Message_Iter, for each complete type must have
 * a pointer to store his value, in case of complex type a
 * Eldbus_Message_Iter will be need.
 *
 * @param iter iterator
 * @param signature of the complete data types on iterator
 * @param ap va_list of the pointers of where data will be stored
 *
 * @return EINA_FALSE if signature different from signature in iterator
  }
(* Const before type ignored *)
function eldbus_message_iter_arguments_vget(iter:PEldbus_Message_Iter; signature:Pchar; ap:Tva_list):TEina_Bool;cdecl;external;
{*
 * @brief Manually delete the iterator.
 *
 * Iterators are usually bound to the life of @ref Eldbus_Message
 * they were created from, being deleted automatically once the
 * message is deleted.
 *
 * However when dealing with huge arrays or dicts it may become a
 * major memory impact to leave the unused iterators alive. By
 * calling this function one states the iterator is not used anymore
 * and can be deleted.
 *
 * @param iter the iterator to be deleted.
  }
procedure eldbus_message_iter_del(iter:PEldbus_Message_Iter);cdecl;external;
{*
 * @
  }
{$include "eldbus_message_helper.h"}
{$include "eldbus_message_eina_value.h"}
{*
 * @
  }
{$endif}

implementation


end.
