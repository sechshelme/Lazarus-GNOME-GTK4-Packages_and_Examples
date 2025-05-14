unit eina_value;

interface

uses
  ctypes, efl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

type
  TEina_Value_Union = record
      case longint of
        0 : ( buf : array[0..7] of byte );
        1 : ( ptr : pointer );
        2 : ( _guarantee : uint64 );
      end;
  PEina_Value_Union = ^TEina_Value_Union;

  var
    EINA_VALUE_TYPE_ERROR : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_VALUE : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_UCHAR : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_BOOL : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_USHORT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_UINT : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_ULONG : PEina_Value_Type;cvar;external libeina;
    EINA_VALUE_TYPE_TIMESTAMP : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_UINT64
 * manages unsigned integer of 64 bits type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_UINT64 : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_CHAR
 * manages char type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_CHAR : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_SHORT
 * manages short type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_SHORT : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_INT
 * manages int type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_INT : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_LONG
 * manages long type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_LONG : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_INT64
 * manages integer of 64 bits type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_INT64 : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_FLOAT
 * manages float type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_FLOAT : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_DOUBLE
 * manages double type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_DOUBLE : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_STRINGSHARE
 * manages stringshared string type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_STRINGSHARE : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_STRING
 * manages string type.
 *
 * @since 1.2
  }
    EINA_VALUE_TYPE_STRING : PEina_Value_Type;cvar;external libeina;
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
    EINA_VALUE_TYPE_ARRAY : PEina_Value_Type;cvar;external libeina;
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
    EINA_VALUE_TYPE_LIST : PEina_Value_Type;cvar;external libeina;
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
    EINA_VALUE_TYPE_HASH : PEina_Value_Type;cvar;external libeina;
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
    EINA_VALUE_TYPE_TIMEVAL : PEina_Value_Type;cvar;external libeina;
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
    EINA_VALUE_TYPE_BLOB : PEina_Value_Type;cvar;external libeina;
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
    EINA_VALUE_TYPE_STRUCT : PEina_Value_Type;cvar;external libeina;
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
    EINA_VALUE_TYPE_TM : PEina_Value_Type;cvar;external libeina;
    EINA_ERROR_VALUE_FAILED : TEina_Error;cvar;external libeina;
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

function eina_value_new(_type:PEina_Value_Type):PEina_Value;cdecl;external libeina;
{*
 * @brief Frees value and its data.
 * @param[in] value value object
 *
 * @see eina_value_flush()
 *
 * @since 1.2
  }
procedure eina_value_free(value:PEina_Value);cdecl;external libeina;
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
function eina_value_copy(value:PEina_Value; copy:PEina_Value):TEina_Bool;cdecl;external libeina;
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

function eina_value_array_new(subtype:PEina_Value_Type; step:dword):PEina_Value;cdecl;external libeina;
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

function eina_value_list_new(subtype:PEina_Value_Type):PEina_Value;cdecl;external libeina;
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

function eina_value_hash_new(subtype:PEina_Value_Type; buckets_power_size:dword):PEina_Value;cdecl;external libeina;
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
  var
    EINA_VALUE_BLOB_OPERATIONS_MALLOC : PEina_Value_Blob_Operations;cvar;external libeina;
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
{*< if @c NULL, nothing is freed, copy will just copy the memory pointer, not its value.  }
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
{*< How to allocate struct memory to be managed by the Eina_Value  }
{*< How to release memory managed by the Eina_Value  }
{*< How to copy struct memory from an existing Eina_Value, if not provided alloc() will be used, then every member is copied using eina_value_type_copy() with member's type.  }
{*< How to compare two struct memories  }
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
  var
    EINA_VALUE_STRUCT_OPERATIONS_BINSEARCH : PEina_Value_Struct_Operations;cvar;external libeina;
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
    EINA_VALUE_STRUCT_OPERATIONS_STRINGSHARE : PEina_Value_Struct_Operations;cvar;external libeina;
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
{*< member name, used in lookups such as eina_value_struct_get()  }
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
{*< operations, if @c NULL defaults will be used. You may use operations to optimize member lookup using binary search or gperf hash.  }
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

function eina_value_struct_new(desc:PEina_Value_Struct_Desc):PEina_Value;cdecl;external libeina;
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
{*< name for debug and introspection  }
{*< mem will be malloc(value_size) and should be configured  }
{*< clear any values from mem  }
{*< how to copy values, both memory are @c value_size  }
{*< how to compare values, both memory are @c value_size  }
{*< how to convert values, both memory are @c value_size  }
{*< how to convert values, both memory are @c value_size  }
{*< how to set memory from variable argument  }
{*< how to set memory from pointer  }
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

function eina_value_type_name_get(_type:PEina_Value_Type):Pchar;cdecl;external libeina;
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
function eina_value_type_check(_type:PEina_Value_Type):TEina_Bool;cdecl;external libeina;
{*
 * @brief Initializes memory using type descriptor.
 *
 * @param[in] type type reference.
 * @param[out] mem memory to operate, must be of size @c type->value_size.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.2
  }
  var
    EINA_VALUE_TYPE_OPTIONAL : PEina_Value_Type;cvar;external libeina;
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

function eina_value_optional_new(subtype:PEina_Value_Type; value:pointer):PEina_Value;cdecl;external libeina;
{*
 * @brief Function to know if an eina optional is empty or not
 *
 * @param[in] value Eina Value Optional
 * @param[out] is_empty #EINA_TRUE if optional is empty, #EINA_FALSE otherwise.
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.17
  }
function eina_value_optional_pset(value:PEina_Value; subtype:PEina_Value_Type; subvalue:pointer):TEina_Bool;cdecl;external libeina;
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
function eina_value_optional_pget(value:PEina_Value; subvalue:pointer):TEina_Bool;cdecl;external libeina;
{*
 * @brief Resets eina optional to empty
 *
 * @param[in,out] value Eina Value Optional
 * @return #EINA_TRUE on success, #EINA_FALSE otherwise.
 *
 * @since 1.17
  }
function eina_value_optional_reset(value:PEina_Value):TEina_Bool;cdecl;external libeina;
{*
 *
 * @brief Gets type from value that is stored on Eina Value Optional
 *
 * @param[in] value Eina Value Optional
 * @return The optional sub-type.
 *
 * @since 1.17
  }
  var
    EINA_VALUE_TYPE_FILE : PEina_Value_Type;cvar;external libeina;
{*
 * @var EINA_VALUE_TYPE_RECTANGLE
 * manages Eina_Rectangle type.
 *
 * @since 1.21
  }
    EINA_VALUE_TYPE_RECTANGLE : PEina_Value_Type;cvar;external libeina;
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

// === Konventiert am: 14-5-25 17:50:53 ===


implementation



end.
