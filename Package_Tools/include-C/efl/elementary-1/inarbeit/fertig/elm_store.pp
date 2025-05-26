
unit elm_store;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_store.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_store.h
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
PElm_Genlist_Item_Class  = ^Elm_Genlist_Item_Class;
PElm_Object_Item  = ^Elm_Object_Item;
PElm_Store  = ^Elm_Store;
PElm_Store_Item  = ^Elm_Store_Item;
PElm_Store_Item_Info  = ^Elm_Store_Item_Info;
PElm_Store_Item_Info_Filesystem  = ^Elm_Store_Item_Info_Filesystem;
PElm_Store_Item_Mapping  = ^Elm_Store_Item_Mapping;
PElm_Store_Item_Mapping_Cb  = ^Elm_Store_Item_Mapping_Cb;
PElm_Store_Item_Mapping_Custom  = ^Elm_Store_Item_Mapping_Custom;
PElm_Store_Item_Mapping_Empty  = ^Elm_Store_Item_Mapping_Empty;
PElm_Store_Item_Mapping_Icon  = ^Elm_Store_Item_Mapping_Icon;
PElm_Store_Item_Mapping_Photo  = ^Elm_Store_Item_Mapping_Photo;
PElm_Store_Item_Mapping_Type  = ^Elm_Store_Item_Mapping_Type;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @defgroup Store Elementary Store
 * @ingroup Elementary
 *
 * Store is an abstracting API that is intended to farm off fetching of data
 * to threads running asynchronously from the mainloop that actually fetch
 * data needed for a genlist (or possibly future other widgets) so scrolling
 * never blocks waiting on IO (though normally this should be the users
 * job - if using genlist, to ensure all data genlist needs is in memory at
 * the time it needs it, and if it isn't to queue and defer a fetch and let
 * genlist know later when its ready. Store actually does this and implements
 * the infrastructure of this, leaving the actual fetch and convert up to
 * functions provided by the user).
 *
 * It is possible for store to run inline without a thread, but this is
 * highly inadvisable. you can disable this with:
 *
 * elm_store_fetch_thread_set(store, EINA_FALSE);
 *
 * Store works first by creating a store, setting up functions to list items
 * and fetch items. Currently the only store type supported is the
 * filesystem store, which will list the files inside a directory (not
 * recursively) and then hand each file it finds (the file path) to the
 * list function for evaluation.
 *
 * The list function may look at filename, may open the file or do
 * anything it likes to determine something about the file. Either it
 * filters it out (returns @c EINA_FALSE) and it is discarded or it
 * returns @c EINA_TRUE and also provides a "sort id" which is a string
 * store uses to figure out sorting. This string could be the filename, or
 * some data based on its contents. The strings are sorted alphabetically
 * like any normal ASCII strings, with case being important. As this listing
 * function runs in a thread, it can do blocking IO and parsing without
 * hurting the fluidity of the main loop and GUI. The list function also
 * returns information on how to map fields in the source file to elements
 * of the genlist item. For example, how the fetcher reads the private
 * data struct of the user (what memory offset in the struct the data is at)
 * and what type is there (it's a label of some sort, an icon, or with a
 * custom mapping function that figures it out itself and creates the
 * content needed for the genlist item).
 *
 * Store then uses this sort id to build (over time) a sorted list of items
 * that then map 1:1 to genlist items. When these items are visible and
 * need content, Store calls the fetch function per item, which is responsible
 * for fetching the data from the given item and returning data to store
 * so it can map this to some item content. This function also runs in a
 * thread, and thus can do blocking IO work to later return the data. Sorting
 * is optional and can be enabled or disabled too.
 *
 * When items are no longer needed, store will cal the unfetch function to
 * free data in memory about that item that is no longer needed. This function
 * is called in the mainloop and is expected to take minimal or almost no time
 * to simply free up memory resources.
 *
 * @
  }
type
{*< A store object  }
{*< A handle of a store item passed to store fetch/unfetch functions  }
{*< Basic information about a store item - always cast into a specific type like Elm_Store_Item_Info_Filesystem  }
{*< Filesystem specific information about a store item  }
{*< A basic way of telling Store how to take your return data (string, or something else from your struct) and convert it into something genlist can use  }
{*< An empty piece of mapping information. Useful for String labels as they get used directly  }
{**< The data being mapped at the given address is an icon, so use these properties for finding it  }
{*< The data is a photo, so use these parameters to find it  }
{*> The item needs a custom mapping which means calling a function and returning a string from it, as opposed to a static lookup. It should not be allocated, and should live in a buffer in memory that survives the return of this function if its a label, or an allocated icon object if its an icon needed etc.  }

  TElm_Store_Item_List_Cb = function (data:pointer; info:PElm_Store_Item_Info):TEina_Bool;cdecl;
{*< Function to call for listing an item  }

  TElm_Store_Item_Fetch_Cb = procedure (data:pointer; sti:PElm_Store_Item);cdecl;
{*< Function to call to fetch item data  }

  TElm_Store_Item_Unfetch_Cb = procedure (data:pointer; sti:PElm_Store_Item);cdecl;
{*< Function to cal lto un-fetch (free) an item  }
(* Const before type ignored *)

  PElm_Store_Item_Mapping_Cb = ^TElm_Store_Item_Mapping_Cb;
  TElm_Store_Item_Mapping_Cb = function (data:pointer; sti:PElm_Store_Item; part:Pchar):pointer;cdecl;
{*< Custom mapping function to call  }
{*
 * Possible mappings types.
 * @since 1.7
  }
{*< const char * -> label  }
{*< Eina_Bool -> state  }
{*< char * -> icon path  }
{*< char * -> photo path  }
{*< item->custom(it->data, it, part) -> void * (-> any)  }
{* canary value: any value greater or equal to ELM_STORE_ITEM_MAPPING_LAST is forbidden.  }

  PElm_Store_Item_Mapping_Type = ^TElm_Store_Item_Mapping_Type;
  TElm_Store_Item_Mapping_Type =  Longint;
  Const
    ELM_STORE_ITEM_MAPPING_NONE = 0;
    ELM_STORE_ITEM_MAPPING_LABEL = 1;
    ELM_STORE_ITEM_MAPPING_STATE = 2;
    ELM_STORE_ITEM_MAPPING_ICON = 3;
    ELM_STORE_ITEM_MAPPING_PHOTO = 4;
    ELM_STORE_ITEM_MAPPING_CUSTOM = 5;
    ELM_STORE_ITEM_MAPPING_LAST = 6;
;
{*< The desired icon size in addition to the file path returned from the mapping  }
{*< The order in which to find the icon  }
{*< Use a standard name to find it (@c EINA_TRUE) or not  }
{*< @c EINA_TRUE is you don't want the icon scaled  }
{*< @c EINA_TRUE if icon is to be smooth scaled  }
{*< @c EINA_TRUE if scaling up is allowed  }
{*< @c EINA_TRUE if scaling down is allowed  }
type
  PElm_Store_Item_Mapping_Icon = ^TElm_Store_Item_Mapping_Icon;
  TElm_Store_Item_Mapping_Icon = record
      w : longint;
      h : longint;
      lookup_order : TElm_Icon_Lookup_Order;
      flag0 : word;
    end;


const
  bm_TElm_Store_Item_Mapping_Icon_standard_name = $1;
  bp_TElm_Store_Item_Mapping_Icon_standard_name = 0;
  bm_TElm_Store_Item_Mapping_Icon_no_scale = $2;
  bp_TElm_Store_Item_Mapping_Icon_no_scale = 1;
  bm_TElm_Store_Item_Mapping_Icon_smooth = $4;
  bp_TElm_Store_Item_Mapping_Icon_smooth = 2;
  bm_TElm_Store_Item_Mapping_Icon_scale_up = $8;
  bp_TElm_Store_Item_Mapping_Icon_scale_up = 3;
  bm_TElm_Store_Item_Mapping_Icon_scale_down = $10;
  bp_TElm_Store_Item_Mapping_Icon_scale_down = 4;

function standard_name(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
procedure set_standard_name(var a : TElm_Store_Item_Mapping_Icon; __standard_name : TEina_Bool);
function no_scale(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
procedure set_no_scale(var a : TElm_Store_Item_Mapping_Icon; __no_scale : TEina_Bool);
function smooth(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
procedure set_smooth(var a : TElm_Store_Item_Mapping_Icon; __smooth : TEina_Bool);
function scale_up(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
procedure set_scale_up(var a : TElm_Store_Item_Mapping_Icon; __scale_up : TEina_Bool);
function scale_down(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
procedure set_scale_down(var a : TElm_Store_Item_Mapping_Icon; __scale_down : TEina_Bool);
{*< dummy entry - set to anything you like  }
type
  PElm_Store_Item_Mapping_Empty = ^TElm_Store_Item_Mapping_Empty;
  TElm_Store_Item_Mapping_Empty = record
      dummy : TEina_Bool;
    end;

{*< Photo size to use (see elm_photo_add()) with the given photo path  }
  PElm_Store_Item_Mapping_Photo = ^TElm_Store_Item_Mapping_Photo;
  TElm_Store_Item_Mapping_Photo = record
      size : longint;
    end;

{*< The function called to do the custom mapping and return it  }
  PElm_Store_Item_Mapping_Custom = ^TElm_Store_Item_Mapping_Custom;
  TElm_Store_Item_Mapping_Custom = record
      func : TElm_Store_Item_Mapping_Cb;
    end;

{*< what kind of mapping is this  }
(* Const before type ignored *)
{*< what part name in the genlist item is this filling in  }
{*< offset in memory (in bytes) relative to base of structure for item data where the data for the mapping lives  }
{ add more types here }
{*< Allowed to be one of these possible mapping types  }
  PElm_Store_Item_Mapping = ^TElm_Store_Item_Mapping;
  TElm_Store_Item_Mapping = record
      _type : TElm_Store_Item_Mapping_Type;
      part : Pchar;
      offset : longint;
      details : record
          case longint of
            0 : ( empty : TElm_Store_Item_Mapping_Empty );
            1 : ( icon : TElm_Store_Item_Mapping_Icon );
            2 : ( photo : TElm_Store_Item_Mapping_Photo );
            3 : ( custom : TElm_Store_Item_Mapping_Custom );
          end;
    end;

{*< The genlist item class that should be used for the item that has been listed  }
(* Const before type ignored *)
{*< What kind of mappings do we use for the fields of this item to fill in the genlist item. Terminate array pointed to here with ELM_STORE_ITEM_MAPPING_END  }
{*< Pointer to pass to struct data in memory if its already there, of not, NULL  }
{*< Sort ID string (strduped()) to know how to wort items, or NULL, if you don't care  }
  PElm_Store_Item_Info = ^TElm_Store_Item_Info;
  TElm_Store_Item_Info = record
      item_class : PElm_Genlist_Item_Class;
      mapping : PElm_Store_Item_Mapping;
      data : pointer;
      sort_id : Pchar;
    end;

{*< Base information about an item  }
{*< Extra information specific to the filesystem store  }
  PElm_Store_Item_Info_Filesystem = ^TElm_Store_Item_Info_Filesystem;
  TElm_Store_Item_Info_Filesystem = record
      base : TElm_Store_Item_Info;
      path : Pchar;
    end;

{*< Use this to get the offset in bytes in memory for where the data for the mapping lives relative to the item data (a private struct pointed to owned by the user  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function ELM_STORE_ITEM_MAPPING_OFFSET(st,it : longint) : longint;

{*
 * Create a new store object
 *
 * This creates a new store object to then configure so it works.
 *
 * @return A new store object, or NULL if creation fails
 *
 * @ingroup Store
  }
function elm_store_filesystem_new:PElm_Store;cdecl;external;
{*
 * Free the store object and all items it manages
 *
 * This frees the given @p st store and all the items it manages. It will
 * clear the List that it populated, but otherwise leave it alone. It will
 * cancel background threads (and may have to wait for them to complete a
 * pending operation to do this).
 *
 * @param st The store to free
 *
 * @ingroup Store
  }
procedure elm_store_free(st:PElm_Store);cdecl;external;
{*
 * Set the path to the directory to scan for a filesystem store
 *
 * This sets the directory (@p dir) to scan and begins scanning in the
 * the background in threads (or not if threading is disabled with
 * elm_store_fetch_thread_set()). Note that Listing is always done in a thread
 * but fetching may not be if disabled here. This should be the last thing
 * called after fetch, list and unfetch functions are set, as well as target
 * genlist etc. You also should not change the directory once set. If you
 * need a new directory scanned, create a new store.
 *
 * @param st The store to modify
 * @param dir A string giving the path to the directory to scan
 *
 * @ingroup Store
  }
(* Const before type ignored *)
procedure elm_store_filesystem_directory_set(st:PElm_Store; dir:Pchar);cdecl;external;
{*
 * Get the directory set on a filesystem store
 *
 * This gets the directory set by elm_store_filesystem_directory_set(). This
 * string returned will be valid until elm_store_filesystem_directory_set()
 * changes it or until the store is freed with elm_store_free().
 *
 * @return A string with the path set, or NULL if none set.
 *
 * @ingroup Store
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_store_filesystem_directory_get(st:PElm_Store):Pchar;cdecl;external;
{*
 * Get the path of a specific store item
 *
 * This returns the full path of a store item. This string is valid only
 * during the list function set by elm_store_list_func_set() or during the
 * fetch function set by elm_store_fetch_func_set() or during the unfetch
 * function set by elm_store_unfetch_func_set().
 *
 * @param sti The store item to get the path from
 * @return A full path in a string or NULL if none available
 *
 * @ingroup Store
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_store_item_filesystem_path_get(sti:PElm_Store_Item):Pchar;cdecl;external;
{*
 * Set the target genlist to fill in from the store
 *
 * This tells the store the target genlist to use to fill in content from
 * the store. Once a store starts "going" via elm_store_filesystem_directory_set()
 * The target should never be changed again.
 *
 * @param st The store to do the filling.
 * @param obj The genlist object to fill in and control the content of from the store.
 *
 * @ingroup Store
  }
procedure elm_store_target_genlist_set(st:PElm_Store; obj:PEvas_Object);cdecl;external;
{*
 * Set the maximum number of items that are not visible to keep cached
 *
 * Store may keep some items around for caching purposes that cannot be seen,
 * so this controls the maximum number. The default is 128, but may change
 * at any point in time in the future.
 *
 * @param st The store to modify
 * @param max The number of items to keep (should be greater than or equal to 0)
 *
 * @ingroup Store
  }
procedure elm_store_cache_set(st:PElm_Store; max:longint);cdecl;external;
{*
 * Get the maximum number if items to cache
 *
 * This returns the number of items at most to cache.
 *
 * @param st The store to query
 * @return The maximum number of items to cache (>= 0)
 * @see elm_store_cache_set()
 *
 * @ingroup Store
  }
(* Const before type ignored *)
function elm_store_cache_get(st:PElm_Store):longint;cdecl;external;
{*
 * Set the function used to deal with listing of items
 *
 * This function is called per item that is found so it can examine the item
 * and discard it (return @c EINA_FALSE to discard, or @c EINA_TRUE to accept),
 * and work out some sorting ID (that may be filename or anything else based on
 * content). This function is always called from a thread.
 *
 * @param st The store to set the function of
 * @param func The function to be called
 * @param data the data pointer to be passed to the @p func function when called
 *
 * @ingroup Store
  }
(* Const before type ignored *)
procedure elm_store_list_func_set(st:PElm_Store; func:TElm_Store_Item_List_Cb; data:pointer);cdecl;external;
{*
 * Set the function used to deal with fetching of items
 *
 * This function is called per item that needs data to be fetched when it
 * becomes visible and such data is needed. This function is normally run
 * from a thread (unless elm_store_fetch_thread_set() disables this). The
 * fetch function is to read data from the source and fill a structure
 * allocated for this item with fields and then rely on the mapping setup
 * to tell Store how to take a field in the structure and apply it to a
 * genlist item.
 *
 * @param st The store to set the function of
 * @param func The function to be called
 * @param data the data pointer to be passed to the @p func function when called
 *
 * @ingroup Store
  }
(* Const before type ignored *)
procedure elm_store_fetch_func_set(st:PElm_Store; func:TElm_Store_Item_Fetch_Cb; data:pointer);cdecl;external;
{*
 * Set the function used to free the structure allocated for the item
 *
 * This function is called per item when it is not needed in memory anymore
 * and should free the structure allocated in and filled in the function set
 * by elm_store_fetch_func_set().
 *
 * @param st The store to set the function of
 * @param func The function to be called
 * @param data the data pointer to be passed to the @p func function when called
 *
 * @ingroup Store
  }
(* Const before type ignored *)
procedure elm_store_unfetch_func_set(st:PElm_Store; func:TElm_Store_Item_Unfetch_Cb; data:pointer);cdecl;external;
{*
 * Enable or disable fetching in a thread for Store
 *
 * @param st The store to modify
 * @param use_thread @c EINA_TRUE to use a thread to fetch, @c EINA_FALSE don't
 * use a thread.
 *
 * @ingroup Store
  }
procedure elm_store_fetch_thread_set(st:PElm_Store; use_thread:TEina_Bool);cdecl;external;
{*
 * Get the thread enabled fetching option for Store
 *
 * @return The state set currently for the store.
 * @see elm_store_fetch_thread_set()
 *
 * @ingroup Store
  }
(* Const before type ignored *)
function elm_store_fetch_thread_get(st:PElm_Store):TEina_Bool;cdecl;external;
{*
 * Set if items are to be sorted or not.
 *
 * By default items are not sorted, but read "in order" as they are found. If
 * you want to sort, your list function set by elm_store_list_func_set() must
 * provide a sort ID to sort by, and then Store will take care of sorting when
 * it inserts items. You should set this up before you begin listing items
 * in the store and then never change it again.
 *
 * @param st The store to modify
 * @param sorted @c EINA_TRUE if we are to sort, @c EINA_FALSE if not.
 *
 * @ingroup Store
  }
procedure elm_store_sorted_set(st:PElm_Store; sorted:TEina_Bool);cdecl;external;
{*
 * Get the sorting flag
 *
 * Get the sorted flag as set by elm_store_sorted_set().
 *
 * @param st The store to query
 * @return @c EINA_TRUE if sorted, @c EINA_FALSE if not.
 *
 * @ingroup Store
  }
(* Const before type ignored *)
function elm_store_sorted_get(st:PElm_Store):TEina_Bool;cdecl;external;
{*
 * Set the item data holding item fields to map to item values in genlist
 *
 * Once you decode an item, allocate a structure for it and fill the structure,
 * you should set the item data with this function (eg in the fetch function).
 * This item pointer is the base offset to use when mapping fields to item
 * values. Once you unfetch, store will handle NULLing the data pointer for you.
 *
 * @param sti The store item to set the data pointer of
 * @param data The data pointer to set.
 *
 * @ingroup Store
  }
procedure elm_store_item_data_set(sti:PElm_Store_Item; data:pointer);cdecl;external;
{*
 * Get the item data
 *
 * This gets the data pointer set by elm_store_item_data_set().
 *
 * @param sti The store item to query
 * @return The data pointer set on the item
 *
 * @ingroup Store
  }
function elm_store_item_data_get(sti:PElm_Store_Item):pointer;cdecl;external;
{*
 * Fetch the store than a store item belongs to
 *
 * This fetches the store object that owns the store item.
 *
 * @param sti The store item to query
 * @return The store the item belongs to
 *
 * @ingroup Store
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_store_item_store_get(sti:PElm_Store_Item):PElm_Store;cdecl;external;
{*
 * Fetch the genlist item that this store item controls
 *
 * @param sti The store item to query
 * @return The genlist object item handle controlled by this store item
 *
 * @ingroup Store
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_store_item_genlist_item_get(sti:PElm_Store_Item):PElm_Object_Item;cdecl;external;
{*
 * @
  }

implementation

function standard_name(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
begin
  standard_name:=(a.flag0 and bm_TElm_Store_Item_Mapping_Icon_standard_name) shr bp_TElm_Store_Item_Mapping_Icon_standard_name;
end;

procedure set_standard_name(var a : TElm_Store_Item_Mapping_Icon; __standard_name : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__standard_name shl bp_TElm_Store_Item_Mapping_Icon_standard_name) and bm_TElm_Store_Item_Mapping_Icon_standard_name);
end;

function no_scale(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
begin
  no_scale:=(a.flag0 and bm_TElm_Store_Item_Mapping_Icon_no_scale) shr bp_TElm_Store_Item_Mapping_Icon_no_scale;
end;

procedure set_no_scale(var a : TElm_Store_Item_Mapping_Icon; __no_scale : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__no_scale shl bp_TElm_Store_Item_Mapping_Icon_no_scale) and bm_TElm_Store_Item_Mapping_Icon_no_scale);
end;

function smooth(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
begin
  smooth:=(a.flag0 and bm_TElm_Store_Item_Mapping_Icon_smooth) shr bp_TElm_Store_Item_Mapping_Icon_smooth;
end;

procedure set_smooth(var a : TElm_Store_Item_Mapping_Icon; __smooth : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__smooth shl bp_TElm_Store_Item_Mapping_Icon_smooth) and bm_TElm_Store_Item_Mapping_Icon_smooth);
end;

function scale_up(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
begin
  scale_up:=(a.flag0 and bm_TElm_Store_Item_Mapping_Icon_scale_up) shr bp_TElm_Store_Item_Mapping_Icon_scale_up;
end;

procedure set_scale_up(var a : TElm_Store_Item_Mapping_Icon; __scale_up : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scale_up shl bp_TElm_Store_Item_Mapping_Icon_scale_up) and bm_TElm_Store_Item_Mapping_Icon_scale_up);
end;

function scale_down(var a : TElm_Store_Item_Mapping_Icon) : TEina_Bool;
begin
  scale_down:=(a.flag0 and bm_TElm_Store_Item_Mapping_Icon_scale_down) shr bp_TElm_Store_Item_Mapping_Icon_scale_down;
end;

procedure set_scale_down(var a : TElm_Store_Item_Mapping_Icon; __scale_down : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__scale_down shl bp_TElm_Store_Item_Mapping_Icon_scale_down) and bm_TElm_Store_Item_Mapping_Icon_scale_down);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ELM_STORE_ITEM_MAPPING_OFFSET(st,it : longint) : longint;
begin
  ELM_STORE_ITEM_MAPPING_OFFSET:=offsetof(st,it);
end;


end.
