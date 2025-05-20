
unit eina_value;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_value.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_value.h
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
PEina_Hash  = ^Eina_Hash;
PEina_Inarray  = ^Eina_Inarray;
PEina_List  = ^Eina_List;
PEina_Value  = ^Eina_Value;
PEina_Value_Array  = ^Eina_Value_Array;
PEina_Value_Blob  = ^Eina_Value_Blob;
PEina_Value_Blob_Operations  = ^Eina_Value_Blob_Operations;
PEina_Value_Hash  = ^Eina_Value_Hash;
PEina_Value_List  = ^Eina_Value_List;
PEina_Value_Optional  = ^Eina_Value_Optional;
PEina_Value_Struct  = ^Eina_Value_Struct;
PEina_Value_Struct_Desc  = ^Eina_Value_Struct_Desc;
PEina_Value_Struct_Member  = ^Eina_Value_Struct_Member;
PEina_Value_Struct_Operations  = ^Eina_Value_Struct_Operations;
PEina_Value_Type  = ^Eina_Value_Type;
PEina_Value_Union  = ^Eina_Value_Union;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2012 ProFUSION embedded systems
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_VALUE_H_}
{$define EINA_VALUE_H_}
{$include <stdarg.h>}
{$include "eina_types.h"}
{$include "eina_fp.h" /* defines int64_t and uint64_t */}
{$include "eina_inarray.h"}
{$include "eina_list.h"}
{$include "eina_hash.h"}
{$include "eina_rectangle.h"}
{$include "eina_binbuf.h"}
{*
 * @page eina_value_example_01_page Eina_Value usage
 * @dontinclude eina_value_01.c
 *
 * This very simple example shows how to use some of the basic features of eina
 * value: setting and getting values, converting between types and printing a
 * value as a string.
 *
 * Our main function starts out with the basic, declaring some variables and
 * initializing eina:
 * @until eina_init
 *
 * Now we can jump into using eina value. We set a value, get this value and
 * then print it:
 * @until printf
 *
 * In the above snippet of code we printed an @c int value, we can however print
 * the value as a string:
 * @until free
 *
 * And once done with a value it's good practice to destroy it:
 * @until eina_value_flush
 *
 * We now reuse @c v to store a string, get its value and print it:
 * @until printf
 * @note Since @c s is the value and not returned by @c eina_value_to_string()
 * we don't need to free it.
 *
 * Just because we stored a string doesn't mean we can't use the @c
 * eina_value_to_string() function, we can and it's important to note that it
 * will return not the stored string but rather a copy of it (one we have to
 * free):
 * @until eina_value_flush
 *
 * And now to explore conversions between two types we'll create another value:
 * @until eina_value_setup
 *
 * And make sure @c v and @c others have different types:
 * @until eina_value_setup
 *
 * We then set a value to @c v and have it converted, to do this we don't need
 * to tell to which type we want to convert, we just say were we want to store
 * the converted value and eina value will figure out what to convert to, and
 * how:
 * @until eina_value_convert
 *
 * And now let's check the conversion worked:
 * @until printf
 *
 * But converting to strings is not particularly exciting, @c
 * eina_value_to_string() already did that, so now let's make the conversion the
 * other way around, from string to @c int:
 * @until printf
 *
 * And once done, destroy the values:
 * @until 
 *
 * Full source code: @ref eina_value_01_c
  }
{*
 * @page eina_value_01_c eina_value_01.c
 * @include eina_value_01.c
 * @example eina_value_01.c
  }
{*
 * @page eina_value_example_02_page Eina_Value struct usage
 * @dontinclude eina_value_02.c
 *
 * This example will examine a hypothetical situation in which we had a
 * structure(which represented parameters) with two fields, and then need to add
 * a third field to our structure. If using structs directly we'd need to
 * rewrite every piece of code that touches the struct, by using eina value, and
 * thus having the compiler not even know the struct, we can reduce the amount
 * of changes needed and retain interoperability between the old and new format.
 *
 * Our example will start with a function that creates descriptions of both of
 * our structs for eina value usage. The first step is to create a struct and
 * describe its members:
 * @until v1_members[1]
 * @note We can't pass the types of the members to EINA_VALUE_STRUCT_MEMBER
 * macro because they are not constant initializers.
 *
 * So far it should be pretty easy to understand, we said @c My_Struct_V1 has
 * two members, one of type @c int and another of type @c char. We now create
 * the description of the actual struct, again nothing overly complex, we signal
 * which version of EINA_VALUE_STRUCT we're using, we declare no special
 * operations, our members and our size:
 * @until V1_DESC
 *
 * We now repeat the process for the second version of our struct, the only
 * difference is the addition of a third parameter of type @c int :
 * @until V2_DESC
 * @until 
 *
 * We'll now look at a function that sets the values of our structs. For
 * simplicity's sake we initialize it we random values, a real world case would
 * read these values from a file, a database or even from the network. The
 * fundamental detail here is that this function works for both V1 and V2
 * structs, this is because setting a parameter that a struct that doesn't have
 * does nothing without throwing any errors:
 * @until 
 * @note While using eina_value_struct_set() with an in-existing parameter
 * causes no error, it does return #EINA_FALSE, to notify it was not possible
 * to set the value. This could be used to determine that we're handling a V1
 * struct and take some action based on that.
 *
 * The next thing is to do is see what a function that uses the values of the
 * struct looks like. We'll again be very simplistic in our usage, we'll just
 * print the values, but a real world case, might send these values to another
 * process use them to open a network/database connection or anything else.
 * Since all versions of the struct have @c param1 and @c param2 we'll
 * unconditionally use them:
 * @until printf
 *
 * The next step is to conditionally use @c param3, which can fortunately be
 * done in the same step in which we get it's value:
 * @until 
 *
 * There we've now got functions that can both populate and use values from both
 * our structs, so now let's actually use them in our main function by creating
 * a struct of each type, initializing them and them using them:
 * @until 
 *
 * This concludes our example. For the full source code see @ref
 * eina_value_02_c.
  }
{*
 * @page eina_value_02_c eina_value_02.c
 * @include eina_value_02.c
 * @example eina_value_02.c
  }
{*
 * @page eina_value_example_03_page Eina value custom type example
 * @dontinclude eina_value_03.c
 *
 * For this example we'll be creating our own custom type of eina value. Eina
 * value can already store struct timeval(man gettimeofday for more information)
 * but it has no type to store struct timezone, so that's what this example will
 * do.
 * @note Struct timezone is actually obsolete, so using it in real world
 * programs is probably not a good idea, but this is an example so, bear with
 * us.
 *
 * To create our own custom eina value type we need to define functions to
 * do the following operations on it:
 * @li Setup
 * @li Flush
 * @li Copy
 * @li Compare
 * @li Set
 * @li Get
 * @li Conversion
 *
 * Most of this functions are very simple, so let's look at them, starting with
 * setup which only clear the memory so that we can be certain we won't be using
 * stale data:
 * @until 
 *
 * Now the flush function, which is even simpler, it does nothing, that's
 * because there is nothing we need to do, all the necessary steps are taken by
 * eina value itself:
 * @until 
 *
 * Our next function, copy, is a bit more interesting, but not much, it just
 * casts our void pointers to struct timezone pointers and does the copy:
 * @until 
 * @note By now you might be wondering why our functions receive void pointers
 * instead of pointers to struct timezone, and this is a good point. The reason
 * for this is that eina value doesn't know anything about our type so it must
 * use a generic void pointer, casting that pointer into a proper value is the
 * job of the implementer of the new type.
 *
 * Next we have the comparison function, which compares the @c tz_minuteswest
 * field of struct timezone, we don't compare @c tz_dsttime because that field
 * is not used in linux:
 * @until 
 *
 * Next we have setting, this however requires not one but rather two functions,
 * the reason for this is because to be able to receive arguments of any type
 * eina value uses <a href="https://wikipedia.org/wiki/Variadic_functions">
 * variadic functions</a>, so we need a function to get the argument from a
 * va_list and another to actually to the setting.
 *
 * Lets first look at the pset function which sets the received value to a
 * pointer:
 * @until 
 *
 * Next we have the vset function which get the argument from the va_list and
 * passes it to the pset function:
 * @until 
 *
 * And now the function to get the value, a very simple copying of the value to
 * the given pointer:
 * @until 
 *
 * And finally our conversion function, this is our longest and most interesting
 * one. For numeric type we simply assign the value of @c tz_minuteswest to the
 * new type and call a set function using it:
 * @until EINA_VALUE_TYPE_DOUBLE
 * @until return
 * @note It would be a good idea to add checks for over and underflow for these
 * types and return #EINA_FALSE in those cases, we omit this here for brevity.
 *
 * For string types we use @c snprintf() to format our @c tz_minuteswest field
 * and put it in a string(again @c tz_dsttime is ignored because it's not used):
 * @until 
 *
 * Finally we handle any other types by returning an error in that case:
 * @until 
 *
 * Now that we have all the functions, we can populate an @c Eina_Value_Type to
 * later use it with @c eina_value_setup():
 * @until 
 *
 * We can now finally use our new TZ_TYPE with eina value, so lets conclude our
 * example by practicing that by setting its value and printing it:
 * @until 
 *
 * For the full source code see @ref eina_value_03_c.
  }
{*
 * @page eina_value_03_c eina_value_03.c
 * @include eina_value_03.c
 * @example eina_value_03.c
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @since 1.2
 *
 * @
  }
{*
 * @addtogroup Eina_Containers_Group Containers
 *
 * @
  }
{*
 * @defgroup Eina_Value_Group Generic Value Storage
 *
 * Abstracts generic data storage and access to it in an extensible
 * and efficient way.
 *
 * It comes with pre-defined types for numbers, arrays, lists, hashes,
 * blobs and structs. It is able to convert between data types,
 * including to string.
 *
 * It is meant for simple data types, providing uniform access and
 * release functions, useful to exchange data preserving their
 * types. For more complex hierarchical data, with properties and
 * children, reference counting, inheritance and interfaces,
 *
 * Examples of usage of the Eina_Value API:
 * @li @ref eina_value_example_01_page
 * @li @ref eina_value_example_02_page
 * @li @ref eina_value_example_03_page
 *
 * @
  }
{*
 * @typedef Eina_Value
 * Store generic values.
 *
 * @since 1.2
  }
type
{*
 * @def EINA_VALUE_EMPTY
 *
 * This is simply a value with all memory zeroed. It may be used
 * to safely initialize or return a value without a type.
 *
 * @since 1.21
  }
{#define EINA_VALUE_EMPTY ((Eina_Value) NULL,   0, 0, 0, 0, 0, 0, 0, 0   ) }
{*
 * @typedef Eina_Value_Type
 * Describes the data contained by the value.
 *
 * @since 1.2
  }
{*
 * @typedef Eina_Value_Union
 * Union of all known value types.
 *
 * This is only used to specify the minimum payload memory for #Eina_Value.
 *
 * @internal
 * @since 1.2
  }

  PEina_Value_Union = ^TEina_Value_Union;
  TEina_Value_Union = TEina_Value_Union;
{*
 * @union _Eina_Value_Union
 * All possible value types.
 *
 * This is only used to specify the minimum payload memory for #Eina_Value.
 *
 * @internal
 * @since 1.2
  }
{*< just hold 8-bytes, more goes into ptr  }
{*< used as generic pointer  }
{*< guarantees 8-byte alignment  }
  PEina_Value_Union = ^TEina_Value_Union;
  TEina_Value_Union = record
      case longint of
        0 : ( buf : array[0..7] of byte );
        1 : ( ptr : pointer );
        2 : ( _guarantee : Tuint64_t );
      end;

{*
 * @var EINA_VALUE_TYPE_ERROR
 * manages Eina_Error values.
 * This value will hold an Eina_Error number,
 * which can be converted to string to get its message or call
 * eina_error_msg_get() on the number to convert yourself.
 *
 * @since 1.21
  }
(* Const before type ignored *)
  var
    EINA_VALUE_TYPE_ERROR : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_VALUE
 * manages Eina_Value values.
 * This value will hold an Eina_Value,
 * which can be useful for storing data
 * inside an #Eina_Value_Array.
 *
 * @since 1.21
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_VALUE : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_UCHAR
 * manages unsigned char type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_UCHAR : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_UCHAR
 * manages unsigned char type.
 *
 * @since 1.21
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_BOOL : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_USHORT
 * manages unsigned short type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_USHORT : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_UINT
 * manages unsigned int type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_UINT : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_ULONG
 * manages unsigned long type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_ULONG : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_TIMESTAMP
 * manages unsigned long type used for timestamps.
 * @note this is identical in function to EINA_VALUE_TYPE_ULONG
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_TIMESTAMP : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_UINT64
 * manages unsigned integer of 64 bits type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_UINT64 : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_CHAR
 * manages char type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_CHAR : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_SHORT
 * manages short type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_SHORT : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_INT
 * manages int type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_INT : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_LONG
 * manages long type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_LONG : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_INT64
 * manages integer of 64 bits type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_INT64 : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_FLOAT
 * manages float type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_FLOAT : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_DOUBLE
 * manages double type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_DOUBLE : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_STRINGSHARE
 * manages stringshared string type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_STRINGSHARE : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_STRING
 * manages string type.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_STRING : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_ARRAY
 *
 * manages array type. Use the value get/set for arrays:
 *  @li eina_value_array_get() and eina_value_array_set()
 *  @li eina_value_array_vget() and eina_value_array_vset()
 *  @li eina_value_array_pget() and eina_value_array_pset()
 *
 * eina_value_set() takes an #Eina_Value_Array where just @c subtype
 * and @c step are used. If there is an @c array, it will be copied
 * (including each item) and its contents must be properly
 * configurable as @c subtype expects. eina_value_pset() takes a
 * pointer to an #Eina_Value_Array.  For your convenience, use
 * eina_value_array_setup().
 *
 * eina_value_get() and eina_value_pget() takes a pointer
 * to #Eina_Value_Array, it's an exact copy of the current structure in
 * use by value, no copies are done.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_ARRAY : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_LIST
 *
 * manages list type. Use the value get/set for lists:
 *  @li eina_value_list_get() and eina_value_list_set()
 *  @li eina_value_list_vget() and eina_value_list_vset()
 *  @li eina_value_list_pget() and eina_value_list_pset()
 *
 * eina_value_set() takes an #Eina_Value_List where just @c subtype is
 * used. If there is an @c list, it will be copied (including each
 * item) and its contents must be properly configurable as @c
 * subtype expects. eina_value_pset() takes a pointer to an #Eina_Value_List.
 * For your convenience, use eina_value_list_setup().
 *
 * eina_value_get() and eina_value_pget() takes a pointer to #Eina_Value_List,
 * it's an exact copy of the current structure in use by value, no copies are
 * done.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_LIST : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_HASH
 *
 * manages hash type. Use the value get/set for hashes:
 *  @li eina_value_hash_get() and eina_value_hash_set()
 *  @li eina_value_hash_vget() and eina_value_hash_vset()
 *  @li eina_value_hash_pget() and eina_value_hash_pset()
 *
 * eina_value_set() takes an #Eina_Value_Hash where just @c subtype
 * and @c buckets_power_size are used. If there is an @c hash, it will
 * be copied (including each item) and its contents must be
 * properly configurable as @c subtype expects. eina_value_pset()
 * takes a pointer to an #Eina_Value_Hash.  For your convenience, use
 * eina_value_hash_setup().
 *
 * eina_value_get() and eina_value_pget() takes a pointer to #Eina_Value_Hash,
 * it's an exact copy of the current structure in use by value, no copies are
 * done.
 *
 * @note Be aware that hash data is always an allocated memory of size
 *       defined by @c subtype->value_size. If your @c subtype is an
 *       integer, add as data malloc(sizeof(int)). If your @c subtype
 *       is an string, add as data malloc(sizeof(char*)) and this data
 *       value must point to strdup(string)!
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_HASH : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_TIMEVAL
 * manages 'struct timeval' type
 *
 * eina_value_set() takes a "struct timeval" from sys/time.h.
 * eina_value_pset() takes a pointer to "struct timeval".
 *
 * eina_value_get() and eina_value_pget() takes a pointer to "struct
 * timeval" and it's an exact copy of value.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_TIMEVAL : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_BLOB
 * manages blob of bytes type, see @ref Eina_Value_Blob
 *
 * eina_value_set() takes an #Eina_Value_Blob
 * eina_value_pset() takes a pointer to #Eina_Value_Blob.
 *
 * eina_value_get() and eina_value_pget() takes a pointer to #Eina_Value_Blob
 * and it's an exact copy of value, no allocations are made.
 *
 * Memory is untouched unless you provide @c ops (operations) pointer.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_BLOB : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_STRUCT
 *
 * manages struct type. Use the value get/set for structs:
 *  @li eina_value_struct_get() and eina_value_struct_set()
 *  @li eina_value_struct_vget() and eina_value_struct_vset()
 *  @li eina_value_struct_pget() and eina_value_struct_pset()
 *
 * eina_value_set() takes an #Eina_Value_Struct where just @c desc is
 * used. If there is an @c memory, it will be copied (including each
 * member) and its contents must be properly configurable as @c desc
 * expects. eina_value_pset() takes a pointer to an #Eina_Value_Struct. For
 * your convenience, use eina_value_struct_setup().
 *
 * eina_value_get() and eina_value_pget() takes a pointer
 * to #Eina_Value_Struct, it's an exact copy of the current structure in
 * use by value, no copies are done.
 *
 * @since 1.2
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_STRUCT : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_TM
 * manages 'struct tm' type
 *
 * eina_value_set() takes a "struct tm" from time.h.
 * eina_value_pset() takes a pointer to "struct tm".
 *
 * eina_value_get() and eina_value_pget() takes a pointer to "struct
 * tm" and it's an exact copy of value.
 *
 * @since 1.21
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_TM : PEina_Value_Type;cvar;external;
    EINA_ERROR_VALUE_FAILED : TEina_Error;cvar;external;
{*
 * @defgroup Eina_Value_Value_Group Generic Value management
 *
 * @
  }
{*
 * @struct _Eina_Value
 * defines the contents of a value
 *
 * @since 1.2
  }
(* Const before type ignored *)
{*< how to access values  }
{*< to be accessed with type descriptor  }
type
  PEina_Value = ^TEina_Value;
  TEina_Value = record
      _type : PEina_Value_Type;
      value : TEina_Value_Union;
    end;

{*
 * @brief Creates generic value storage.
 * @param[in] type How to manage this value.
 * @return The new value or @c NULL on failure.
 *
 * Create a new generic value storage. The members are managed using
 * the description specified by @a type.
 *
 * Some types may specify more operations:
 * e.g.. #EINA_VALUE_TYPE_ARRAY uses eina_value_array_set(),
 * eina_value_array_get() and so on.
 *
 * On failure, @c NULL is returned.
 *
 * @note This calls creates from mempool and then uses
 *       eina_value_setup(). Consider using eina_value_flush() and
 *       eina_value_setup() instead to avoid memory allocations.
 *
 * @see eina_value_free()
 *
 * @since 1.2
  }
(* Const before type ignored *)

function eina_value_new(_type:PEina_Value_Type):PEina_Value;cdecl;external;
{*
 * @brief Frees value and its data.
 * @param[in] value value object
 *
 * @see eina_value_flush()
 *
 * @since 1.2
  }
procedure eina_value_free(value:PEina_Value);cdecl;external;
{*
 * @brief Initializes generic value storage.
 *
 * @param[out] value Value object
 * @param[out] type How to manage this value.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * Initializes existing generic value storage. The members are managed using the
 * description specified by @a type.
 *
 * Some types may specify more operations, as an example #EINA_VALUE_TYPE_ARRAY
 * uses eina_value_array_set(), eina_value_array_get() and so on.
 *
 * @note Existing contents are ignored! If the value was previously used, then
 *       use eina_value_flush() first.
 *
 * On failure, #EINA_FALSE is returned.
 *
 * @see eina_value_flush()
 *
 * @since 1.2
  }
(* Const before type ignored *)
function eina_value_copy(value:PEina_Value; copy:PEina_Value):TEina_Bool;cdecl;external;
{*
 * @brief Compares generic value storage.
 * @param[in] a left side of comparison
 * @param[in] b right side of comparison
 * @return less than zero if a < b, greater than zero if a > b, zero
 *         if a == b
 *
 * @since 1.2
  }
type
{*
 * @struct _Eina_Value_Array
 * Used to store the array and its subtype.
 * @since 1.2
  }
(* Const before type ignored *)
{*< how to allocate and access items  }
{*< how to grow the members array  }
{*< the array that holds data, members are of subtype->value_size bytes.  }
  PEina_Value_Array = ^TEina_Value_Array;
  TEina_Value_Array = record
      subtype : PEina_Value_Type;
      step : dword;
      array : PEina_Inarray;
    end;

{*
 * @brief Creates generic value storage of type array.
 * @param[in] subtype How to manage this array members.
 * @param[in] step How to grow the members array.
 * @return The new value or @c NULL on failure.
 *
 * Create a new generic value storage of type array. The members are
 * managed using the description specified by @a subtype.
 *
 * On failure, @c NULL is returned.
 *
 * @note This creates from mempool and then uses
 *       eina_value_array_setup().  @see eina_value_free() @see
 *       eina_value_array_setup()
 *
 * @since 1.2
  }
(* Const before type ignored *)

function eina_value_array_new(subtype:PEina_Value_Type; step:dword):PEina_Value;cdecl;external;
{*
 * @brief Initializes generic value storage of type array.
 * @param[out] value Value object
 * @param[in] subtype How to manage array members.
 * @param[in] step How to grow the members array.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * Initializes new generic value storage of type array with the given
 * @a subtype.
 *
 * This is the same as calling eina_value_set()
 * with #EINA_VALUE_TYPE_ARRAY followed by eina_value_pset() with
 * the #Eina_Value_Array description configured.
 *
 * @note Existing contents are ignored! If the value was previously used, then
 *       use eina_value_flush() first.
 *
 * On failure, #EINA_FALSE is returned.
 *
 * @see eina_value_flush()
 *
 * @since 1.2
  }
{*
 * @
  }
{*
 * @defgroup Eina_Value_List_Group Generic Value List management
 *
 * @
  }
{*
 * @typedef Eina_Value_List
 * Value type for #EINA_VALUE_TYPE_LIST.
 *
 * @see #_Eina_Value_List explains fields.
 * @since 1.2
  }
type
{*
 * @struct _Eina_Value_List
 * Used to store the list and its subtype.
 * @since 1.2
  }
(* Const before type ignored *)
{*< how to allocate and access items  }
{*< the list that holds data, members are of subtype->value_size bytes.  }
  PEina_Value_List = ^TEina_Value_List;
  TEina_Value_List = record
      subtype : PEina_Value_Type;
      list : PEina_List;
    end;

{*
 * @brief Creates generic value storage of type list.
 *
 * @param[in] subtype How to manage this list members.
 * @return The new value, or @c NULL on failure.
 *
 * Create a new generic value storage of type list. The members are
 * managed using the description specified by @a subtype.
 *
 * On failure, @c NULL is returned.
 *
 * @note this creates from mempool and then uses
 *       eina_value_list_setup().
 *
 * @see eina_value_free()
 * @see eina_value_list_setup()
 *
 * @since 1.2
  }
(* Const before type ignored *)

function eina_value_list_new(subtype:PEina_Value_Type):PEina_Value;cdecl;external;
{*
 * @brief Initializes generic value storage of type list.
 *
 * @param[out] value Value object
 * @param[in] subtype How to manage this list members.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * Initializes new generic value storage of type list with the given
 * @a subtype.
 *
 * This is the same as calling eina_value_set()
 * with #EINA_VALUE_TYPE_LIST followed by eina_value_pset() with
 * the #Eina_Value_List description configured.
 *
 * @note Existing contents are ignored! If the value was previously used, then
 *       use eina_value_flush() first.
 *
 * On failure, #EINA_FALSE is returned.
 *
 * @see eina_value_flush()
 *
 * @since 1.2
  }
type
{*
 * @struct _Eina_Value_Hash
 * Used to store the hash and its subtype.
 * @since 1.2
  }
(* Const before type ignored *)
{*< how to allocate and access items  }
{*< how to allocate hash buckets, if zero a sane default is chosen.  }
{*< the hash that holds data, members are of subtype->value_size bytes.  }
  PEina_Value_Hash = ^TEina_Value_Hash;
  TEina_Value_Hash = record
      subtype : PEina_Value_Type;
      buckets_power_size : dword;
      hash : PEina_Hash;
    end;

{*
 * @brief Creates generic value storage of type hash.
 *
 * @param[in] subtype How to manage this hash members.
 * @param[in] buckets_power_size How to allocate hash buckets (2 ^
 *        buckets_power_size), if zero then a sane value is chosen.
 * @return The new value, or @c NULL on failure.
 *
 * Creates a new generic value storage of type hash. The members are
 * managed using the description specified by @a subtype.
 *
 * On failure, @c NULL is returned.
 *
 * @note this creates from mempool and then uses
 *       eina_value_hash_setup().
 *
 * @see eina_value_free()
 * @see eina_value_hash_setup()
 *
 * @since 1.2
  }
(* Const before type ignored *)

function eina_value_hash_new(subtype:PEina_Value_Type; buckets_power_size:dword):PEina_Value;cdecl;external;
{*
 * @brief Initializes generic value storage of type hash.
 *
 * @param[in] value Value object
 * @param[in] subtype How to manage this hash members.
 * @param[in] buckets_power_size How to allocate hash buckets (2 ^
 *        buckets_power_size), if zero then a sane value is chosen.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * Initializes new generic value storage of type hash with the given
 * @a subtype.
 *
 * This is the same as calling eina_value_set()
 * with #EINA_VALUE_TYPE_HASH followed by eina_value_pset() with
 * the #Eina_Value_Hash description configured.
 *
 * @note Existing contents are ignored! If the value was previously used, then
 *       use eina_value_flush() first.
 *
 * On failure, #EINA_FALSE is returned.
 *
 * @see eina_value_flush()
 *
 * @since 1.2
  }
type
{*
 * @def EINA_VALUE_BLOB_OPERATIONS_VERSION
 * Current API version, used to validate #_Eina_Value_Blob_Operations.
  }

const
  EINA_VALUE_BLOB_OPERATIONS_VERSION = 1;  
{*
 * @struct _Eina_Value_Blob_Operations
 * How to manage blob. Any @c NULL callback is ignored.
 *
 * @since 1.2
  }
{*< must be #EINA_VALUE_BLOB_OPERATIONS_VERSION  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  PEina_Value_Blob_Operations = ^TEina_Value_Blob_Operations;
  TEina_Value_Blob_Operations = record
      version : dword;
      free : procedure (ops:PEina_Value_Blob_Operations; memory:pointer; size:Tsize_t);cdecl;
      copy : function (ops:PEina_Value_Blob_Operations; memory:pointer; size:Tsize_t):pointer;cdecl;
      compare : function (ops:PEina_Value_Blob_Operations; data1:pointer; size_data1:Tsize_t; data2:pointer; size_data2:Tsize_t):longint;cdecl;
      to_string : function (ops:PEina_Value_Blob_Operations; memory:pointer; size:Tsize_t):Pchar;cdecl;
    end;

{*
 * @var EINA_VALUE_BLOB_OPERATIONS_MALLOC
 *
 * Assumes @c memory was create with malloc() and applies free() to it
 * during flush (Eina_Value_Blob_Operations::free). Copy is done with
 * malloc() as well.
 *
 * No compare or to_string are provided, defaults will be used.
  }
(* Const before type ignored *)
  var
    EINA_VALUE_BLOB_OPERATIONS_MALLOC : PEina_Value_Blob_Operations;cvar;external;
{*
 * @typedef Eina_Value_Blob
 * Value type for #EINA_VALUE_TYPE_BLOB.
 *
 * @see #_Eina_Value_Blob explains fields.
 *
 * @since 1.2
  }
type
{*
 * @struct _Eina_Value_Blob
 * Used to store the blob information and management operations.
 *
 * @since 1.2
  }
(* Const before type ignored *)
{*< if @c NULL, nothing is freed, copy will just copy the memory pointer, not its value.  }
(* Const before type ignored *)
  PEina_Value_Blob = ^TEina_Value_Blob;
  TEina_Value_Blob = record
      ops : PEina_Value_Blob_Operations;
      memory : pointer;
      size : dword;
    end;

{*
 * @
  }
{*
 * @defgroup Eina_Value_Struct_Group Generic Value Struct management
 *
 * @
  }
{*
 * @typedef Eina_Value_Struct_Operations
 * How to manage struct. Any @c NULL callback is ignored.
 *
 * A structure can specify alternative methods to allocate, free and
 * copy itself. See structure definition for all methods.
 *
 * @see #_Eina_Value_Struct_Operations explains fields.
 * @since 1.2
  }
{*
 * @typedef Eina_Value_Struct_Member
 * Describes a single member of struct.
 *
 * The member holds a name, type and its byte offset within the struct
 * memory. Most Eina_Value_Struct functions takes the member name as
 * parameter, as in eina_value_struct_set().
 *
 * @see #_Eina_Value_Struct_Member explains fields.
 *
 * @since 1.2
  }
{*
 * @typedef Eina_Value_Struct_Desc
 * Describes the struct by listing its size, members and operations.
 * @see #_Eina_Value_Struct_Desc explains fields.
 *
 * @since 1.2
  }
{*
 * @typedef Eina_Value_Struct
 * Value type for #EINA_VALUE_TYPE_STRUCT.
 *
 * @see #_Eina_Value_Struct explains fields.
 *
 * @since 1.2
  }
{*
 * @def EINA_VALUE_STRUCT_OPERATIONS_VERSION
 * Current API version, used to validate #_Eina_Value_Struct_Operations.
  }

const
  EINA_VALUE_STRUCT_OPERATIONS_VERSION = 1;  
{*
 * @struct _Eina_Value_Struct_Operations
 * How to manage struct. Any @c NULL callback is ignored.
 *
 * @since 1.2
  }
{*< must be #EINA_VALUE_STRUCT_OPERATIONS_VERSION  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< How to allocate struct memory to be managed by the Eina_Value  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< How to release memory managed by the Eina_Value  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< How to copy struct memory from an existing Eina_Value, if not provided alloc() will be used, then every member is copied using eina_value_type_copy() with member's type.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< How to compare two struct memories  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< How to find description for member. For huge structures consider using binary search, stringshared, hash or gperf. The default function does linear search using strcmp().  }
type
  PEina_Value_Struct_Operations = ^TEina_Value_Struct_Operations;
  TEina_Value_Struct_Operations = record
      version : dword;
      alloc : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc):pointer;cdecl;
      free : procedure (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; memory:pointer);cdecl;
      copy : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; memory:pointer):pointer;cdecl;
      compare : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; data1:pointer; data2:pointer):longint;cdecl;
      find_member : function (ops:PEina_Value_Struct_Operations; desc:PEina_Value_Struct_Desc; name:Pchar):PEina_Value_Struct_Member;cdecl;
    end;

{*
 * @var EINA_VALUE_STRUCT_OPERATIONS_BINSEARCH
 *
 * Assumes @c members is sorted by name and applies binary search for
 * names.
 *
 * Ideally the @c member_count field is set to speed it up.
 *
 * No other methods are set (alloc, free, copy, compare), then it uses
 * the default operations.
  }
(* Const before type ignored *)
  var
    EINA_VALUE_STRUCT_OPERATIONS_BINSEARCH : PEina_Value_Struct_Operations;cvar;external;
{*
 * @var EINA_VALUE_STRUCT_OPERATIONS_STRINGSHARE
 *
 * Assumes @c members name are stringshared and can be compared for
 * equality without using its contents (simple pointer comparison).
 *
 * Ideally the search @c name will be stringshared as well, but it
 * will do a second loop with a forced stringshare if it did not find
 * the member.
 *
 * No other methods are set (alloc, free, copy, compare), then it uses
 * the default operations.
  }
(* Const before type ignored *)
    EINA_VALUE_STRUCT_OPERATIONS_STRINGSHARE : PEina_Value_Struct_Operations;cvar;external;
{*
 * @struct _Eina_Value_Struct_Member
 * Describes a single member of struct.
 *
 * The name is used to lookup the member description. This is done as
 * specified as _Eina_Value_Struct_Operations::find_member(). For
 * structures with huge number of members, consider using a better
 * find_member function to quickly finding it! There are two helper
 * operations provided to help this: #EINA_VALUE_STRUCT_OPERATIONS_BINSEARCH
 * and #EINA_VALUE_STRUCT_OPERATIONS_STRINGSHARE, both depend on properly
 * set #_Eina_Value_Struct_Desc and #_Eina_Value_Struct_Member.
 *
 * @see #EINA_VALUE_STRUCT_MEMBER
 * @see #EINA_VALUE_STRUCT_MEMBER_SENTINEL
 *
 * @since 1.2
  }
(* Const before type ignored *)
{*< member name, used in lookups such as eina_value_struct_get()  }
(* Const before type ignored *)
{*< how to use this member  }
{*< where this member is located within the structure memory  }
type
  PEina_Value_Struct_Member = ^TEina_Value_Struct_Member;
  TEina_Value_Struct_Member = record
      name : Pchar;
      _type : PEina_Value_Type;
      offset : dword;
    end;

{*
 * @def EINA_VALUE_STRUCT_DESC_VERSION
 * Current API version, used to validate #_Eina_Value_Struct_Desc.
  }

const
  EINA_VALUE_STRUCT_DESC_VERSION = 1;  
{*
 * @struct _Eina_Value_Struct_Desc
 * Describes the struct by listing its size, members and operations.
 *
 * This is the root of Eina_Value knowledge about the memory it's
 * handling as a structure. It adds introspection, saying the byte
 * size of the structure, its members and how to manage such members.
 *
 * @since 1.2
  }
{*< must be #EINA_VALUE_STRUCT_DESC_VERSION  }
(* Const before type ignored *)
{*< operations, if @c NULL defaults will be used. You may use operations to optimize member lookup using binary search or gperf hash.  }
(* Const before type ignored *)
{*< array of member descriptions, if @c member_count is zero, then it must be @c NULL terminated.  }
{*< if > 0, specifies number of members. If zero then @c members must be NULL terminated.  }
{*< byte size to allocate, may be bigger than sum of members  }
type
  PEina_Value_Struct_Desc = ^TEina_Value_Struct_Desc;
  TEina_Value_Struct_Desc = record
      version : dword;
      ops : PEina_Value_Struct_Operations;
      members : PEina_Value_Struct_Member;
      member_count : dword;
      size : dword;
    end;

{*
 * @def EINA_VALUE_STRUCT_MEMBER
 *
 * Helper to define Eina_Value_Struct_Member fields, uses offsetof()
 * with type and member.
 *
 * @since 1.2
  }
{*
 * @struct _Eina_Value_Struct
 * Used to store the memory and its description.
 * @since 1.2
  }
(* Const before type ignored *)
{*< How to manage the structure  }
{*< The managed structure memory  }
  PEina_Value_Struct = ^TEina_Value_Struct;
  TEina_Value_Struct = record
      desc : PEina_Value_Struct_Desc;
      memory : pointer;
    end;

{*
 * @brief Creates generic value storage of type struct.
 *
 * @param[in] desc How to manage this struct members.
 * @return The new value, or @c NULL on failure.
 *
 * Create a new generic value storage of type struct. The members are
 * managed using the description specified by @a desc.
 *
 * On failure, @c NULL is returned.
 *
 * @note this creates from mempool and then uses
 *       eina_value_struct_setup().
 *
 * @see eina_value_free()
 * @see eina_value_struct_setup()
 *
 * @since 1.2
  }
(* Const before type ignored *)

function eina_value_struct_new(desc:PEina_Value_Struct_Desc):PEina_Value;cdecl;external;
{*
 * @brief Initializes generic value storage of type struct.
 *
 * @param[out] value Value object
 * @param[in] desc How to manage this struct members.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * Initializes new generic value storage of type struct with the given
 * @a desc.
 *
 * This is the same as calling eina_value_set()
 * with #EINA_VALUE_TYPE_STRUCT followed by eina_value_pset() with
 * the #Eina_Value_Struct description configured.
 *
 * @note Existing contents are ignored! If the value was previously used, then
 *       use eina_value_flush() first.
 *
 * On failure, #EINA_FALSE is returned.
 *
 * @see eina_value_flush()
 *
 * @since 1.2
  }
const
  EINA_VALUE_TYPE_VERSION = 1;  
{*
 * @struct _Eina_Value_Type
 * API to access values.
 *
 * @since 1.2
  }
{*< must be #EINA_VALUE_TYPE_VERSION  }
{*< byte size of value  }
(* Const before type ignored *)
{*< name for debug and introspection  }
(* Const before type ignored *)
{*< mem will be malloc(value_size) and should be configured  }
(* Const before type ignored *)
{*< clear any values from mem  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< how to copy values, both memory are @c value_size  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< how to compare values, both memory are @c value_size  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< how to convert values, both memory are @c value_size  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*< how to convert values, both memory are @c value_size  }
(* Const before type ignored *)
{*< how to set memory from variable argument  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< how to set memory from pointer  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< how to read memory  }
type
  PEina_Value_Type = ^TEina_Value_Type;
  TEina_Value_Type = record
      version : dword;
      value_size : dword;
      name : Pchar;
      setup : function (_type:PEina_Value_Type; mem:pointer):TEina_Bool;cdecl;
      flush : function (_type:PEina_Value_Type; mem:pointer):TEina_Bool;cdecl;
      copy : function (_type:PEina_Value_Type; src:pointer; dst:pointer):TEina_Bool;cdecl;
      compare : function (_type:PEina_Value_Type; a:pointer; b:pointer):longint;cdecl;
      convert_to : function (_type:PEina_Value_Type; convert:PEina_Value_Type; type_mem:pointer; convert_mem:pointer):TEina_Bool;cdecl;
      convert_from : function (_type:PEina_Value_Type; convert:PEina_Value_Type; type_mem:pointer; convert_mem:pointer):TEina_Bool;cdecl;
      vset : function (_type:PEina_Value_Type; mem:pointer; args:Tva_list):TEina_Bool;cdecl;
      pset : function (_type:PEina_Value_Type; mem:pointer; ptr:pointer):TEina_Bool;cdecl;
      pget : function (_type:PEina_Value_Type; mem:pointer; ptr:pointer):TEina_Bool;cdecl;
    end;

{*
 * @brief Queries type name.
 *
 * @param[in] type type reference.
 * @return string or @c NULL if type is invalid.
 *
 * @since 1.2
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eina_value_type_name_get(_type:PEina_Value_Type):Pchar;cdecl;external;
{*
 * @brief Checks if type is valid.
 *
 * @param[in] type Type reference.
 * @return #EINA_TRUE if valid, #EINA_FALSE otherwise.
 *
 * A type is invalid if it's @c NULL or if version field is not the same
 * as runtime #EINA_VALUE_TYPE_VERSION.
 *
 * @since 1.2
  }
(* Const before type ignored *)
function eina_value_type_check(_type:PEina_Value_Type):TEina_Bool;cdecl;external;
{*
 * @brief Initializes memory using type descriptor.
 *
 * @param[in] type type reference.
 * @param[out] mem memory to operate, must be of size @c type->value_size.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.2
  }
(* Const before type ignored *)
  var
    EINA_VALUE_TYPE_OPTIONAL : PEina_Value_Type;cvar;external;
{*
 * @typedef Eina_Value_Optional type to be used with Eina_Value_Struct
 *
 * @since 1.17
  }
type
  PEina_Value_Optional = ^TEina_Value_Optional;
  TEina_Value_Optional = TEina_Value_Union;
{*
 * @brief Creates an empty optional. This is the same as eina_value_new(EINA_VALUE_TYPE_OPTIONAL).
 *
 * @return returns an empty optional eina value.
 *
 * @since 1.17
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eina_value_optional_new(subtype:PEina_Value_Type; value:pointer):PEina_Value;cdecl;external;
{*
 * @brief Function to know if an eina optional is empty or not
 *
 * @param[in] value Eina Value Optional
 * @param[out] is_empty #EINA_TRUE if optional is empty, #EINA_FALSE otherwise.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.17
  }
(* Const before declarator ignored *)
(* Const before type ignored *)
function eina_value_optional_pset(value:PEina_Value; subtype:PEina_Value_Type; subvalue:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Gets the value from an optional
 *
 * @param[in] value Eina Value Optional to get value from
 * @param[out] subvalue Pointer to where value is to be copied to. You must use
 * the correct type according to eina_value_optional_type_get
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.17
  }
function eina_value_optional_pget(value:PEina_Value; subvalue:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Resets eina optional to empty
 *
 * @param[in,out] value Eina Value Optional
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.17
  }
function eina_value_optional_reset(value:PEina_Value):TEina_Bool;cdecl;external;
{*
 *
 * @brief Gets type from value that is stored on Eina Value Optional
 *
 * @param[in] value Eina Value Optional
 * @return The optional sub-type.
 *
 * @since 1.17
  }
(* Const before type ignored *)
  var
    EINA_VALUE_TYPE_FILE : PEina_Value_Type;cvar;external;
{*
 * @var EINA_VALUE_TYPE_RECTANGLE
 * manages Eina_Rectangle type.
 *
 * @since 1.21
  }
(* Const before type ignored *)
    EINA_VALUE_TYPE_RECTANGLE : PEina_Value_Type;cvar;external;
{*
 * @
  }
{$include "eina_inline_value.x"}
{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation


end.
