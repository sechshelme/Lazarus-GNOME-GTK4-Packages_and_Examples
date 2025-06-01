
unit elm_widget_fileselector;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_widget_fileselector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_widget_fileselector.h
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
PEcore_Idler  = ^Ecore_Idler;
PEfl_Model  = ^Efl_Model;
PEina_List  = ^Eina_List;
PEina_Stringshare  = ^Eina_Stringshare;
PElm_Fileselector_Custom_Filter  = ^Elm_Fileselector_Custom_Filter;
PElm_Fileselector_Data  = ^Elm_Fileselector_Data;
PElm_Fileselector_Filter  = ^Elm_Fileselector_Filter;
PElm_Fileselector_Filter_Type  = ^Elm_Fileselector_Filter_Type;
PElm_Fileselector_Item_Data  = ^Elm_Fileselector_Item_Data;
PElm_Fileselector_Type  = ^Elm_Fileselector_Type;
PElm_Object_Item  = ^Elm_Object_Item;
PEvas_Object  = ^Evas_Object;
PListing_Request  = ^Listing_Request;
Psel_data  = ^sel_data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_WIDGET_FILESELECTOR_H}
{$define ELM_WIDGET_FILESELECTOR_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-fileselector-class The Elementary Fileselector Class
 *
 * Elementary, besides having the @ref Fileselector widget, exposes its
 * foundation -- the Elementary Fileselector Class -- in order to create other
 * widgets which are a fileselector with some more logic on top.
  }
type
{*
 * Base layout smart data extended with fileselector instance data.
  }
{ a list of selected paths. only for multi selection  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ a sort method to decide orders of files/directories  }
(* Const before type ignored *)
(* Const before type ignored *)
{ this flag is only for multi selection.
    * If this flag is set to @c EINA_TRUE, it means directory is selected
    * so that fileselector will clear current selection when user clicked
    * another item.  }
  PElm_Fileselector_Data = ^TElm_Fileselector_Data;
  TElm_Fileselector_Data = record
      obj : PEvas_Object;
      path_entry : PEvas_Object;
      name_entry : PEvas_Object;
      search_entry : PEvas_Object;
      files_view : PEvas_Object;
      up_button : PEvas_Object;
      home_button : PEvas_Object;
      spinner : PEvas_Object;
      filter_hoversel : PEvas_Object;
      ok_button : PEvas_Object;
      cancel_button : PEvas_Object;
      files_item_data : PEina_List;
      filter_list : PEina_List;
      current_filter : PElm_Fileselector_Filter;
      multi_selection : PEina_List;
      multi_selection_tmp : PEina_List;
      path : Pchar;
      model : PEfl_Model;
      prev_model : PEfl_Model;
      children : PEina_List;
      path_entry_idler : PEcore_Idler;
      target : PEfl_Model;
      path_separator : Pchar;
      search_string : Pchar;
      current_populate_lreq : PListing_Request;
      thumbnail_size : TEvas_Coord_Size;
      sort_method : function (para1:PElm_Fileselector_Item_Data; para2:PElm_Fileselector_Item_Data):longint;cdecl;
      mode : TElm_Fileselector_Mode;
      sort_type : TElm_Fileselector_Sort;
      flag0 : word;
    end;


const
  bm_TElm_Fileselector_Data_only_folder = $1;
  bp_TElm_Fileselector_Data_only_folder = 0;
  bm_TElm_Fileselector_Data_expand = $2;
  bp_TElm_Fileselector_Data_expand = 1;
  bm_TElm_Fileselector_Data_double_tap_navigation = $4;
  bp_TElm_Fileselector_Data_double_tap_navigation = 2;
  bm_TElm_Fileselector_Data_multi = $8;
  bp_TElm_Fileselector_Data_multi = 3;
  bm_TElm_Fileselector_Data_monitoring = $10;
  bp_TElm_Fileselector_Data_monitoring = 4;
  bm_TElm_Fileselector_Data_dir_selected = $20;
  bp_TElm_Fileselector_Data_dir_selected = 5;
  bm_TElm_Fileselector_Data_hidden_visible = $40;
  bp_TElm_Fileselector_Data_hidden_visible = 6;
  bm_TElm_Fileselector_Data_target_ready = $80;
  bp_TElm_Fileselector_Data_target_ready = 7;

function only_folder(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_only_folder(var a : TElm_Fileselector_Data; __only_folder : TEina_Bool);
function expand(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_expand(var a : TElm_Fileselector_Data; __expand : TEina_Bool);
function double_tap_navigation(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_double_tap_navigation(var a : TElm_Fileselector_Data; __double_tap_navigation : TEina_Bool);
function multi(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_multi(var a : TElm_Fileselector_Data; __multi : TEina_Bool);
function monitoring(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_monitoring(var a : TElm_Fileselector_Data; __monitoring : TEina_Bool);
function dir_selected(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_dir_selected(var a : TElm_Fileselector_Data; __dir_selected : TEina_Bool);
function hidden_visible(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_hidden_visible(var a : TElm_Fileselector_Data; __hidden_visible : TEina_Bool);
function target_ready(var a : TElm_Fileselector_Data) : TEina_Bool;
procedure set_target_ready(var a : TElm_Fileselector_Data; __target_ready : TEina_Bool);
type
  Psel_data = ^Tsel_data;
  Tsel_data = record
      fs : PEvas_Object;
      model : PEfl_Model;
      selected : PEfl_Model;
    end;

  PListing_Request = ^TListing_Request;
  TListing_Request = record
      sd : PElm_Fileselector_Data;
      parent_it : PElm_Object_Item;
      obj : PEvas_Object;
      model : PEfl_Model;
      selected : PEfl_Model;
      path : PEina_Stringshare;
      selected_path : PEina_Stringshare;
      item_total : longint;
      item_processed_count : longint;
      flag0 : word;
    end;


const
  bm_TListing_Request_first = $1;
  bp_TListing_Request_first = 0;
  bm_TListing_Request_valid = $2;
  bp_TListing_Request_valid = 1;

function first(var a : TListing_Request) : TEina_Bool;
procedure set_first(var a : TListing_Request; __first : TEina_Bool);
function valid(var a : TListing_Request) : TEina_Bool;
procedure set_valid(var a : TListing_Request; __valid : TEina_Bool);
(* Const before type ignored *)
type
  PElm_Fileselector_Item_Data = ^TElm_Fileselector_Item_Data;
  TElm_Fileselector_Item_Data = record
      user_data : pointer;
      model : PEfl_Model;
      path : PEina_Stringshare;
      filename : PEina_Stringshare;
      mime_type : PEina_Stringshare;
      parent_model : PEfl_Model;
      parent_path : Pchar;
      size : Tint64_t;
      mtime : Tdouble;
      flag0 : word;
    end;


const
  bm_TElm_Fileselector_Item_Data_is_dir = $1;
  bp_TElm_Fileselector_Item_Data_is_dir = 0;

function is_dir(var a : TElm_Fileselector_Item_Data) : TEina_Bool;
procedure set_is_dir(var a : TElm_Fileselector_Item_Data; __is_dir : TEina_Bool);
type
  PElm_Fileselector_Type = ^TElm_Fileselector_Type;
  TElm_Fileselector_Type =  Longint;
  Const
    ELM_DIRECTORY = 0;
    ELM_FILE_IMAGE = 1;
    ELM_FILE_UNKNOW = 2;
    ELM_FILE_LAST = 3;
;
type
  PElm_Fileselector_Filter_Type = ^TElm_Fileselector_Filter_Type;
  TElm_Fileselector_Filter_Type =  Longint;
  Const
    ELM_FILESELECTOR_MIME_FILTER = 0;
    ELM_FILESELECTOR_CUSTOM_FILTER = 1;
    ELM_FILESELECTOR_FILTER_LAST = 2;
;
type
  PElm_Fileselector_Custom_Filter = ^TElm_Fileselector_Custom_Filter;
  TElm_Fileselector_Custom_Filter = record
      func : TElm_Fileselector_Filter_Func;
      data : pointer;
    end;

(* Const before type ignored *)
  PElm_Fileselector_Filter = ^TElm_Fileselector_Filter;
  TElm_Fileselector_Filter = record
      filter_name : Pchar;
      sd : PElm_Fileselector_Data;
      filter : record
          case longint of
            0 : ( mime_types : ^Pchar );
            1 : ( custom : PElm_Fileselector_Custom_Filter );
          end;
      filter_type : TElm_Fileselector_Filter_Type;
    end;

{*
 * @
  }

implementation

function only_folder(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  only_folder:=(a.flag0 and bm_TElm_Fileselector_Data_only_folder) shr bp_TElm_Fileselector_Data_only_folder;
end;

procedure set_only_folder(var a : TElm_Fileselector_Data; __only_folder : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__only_folder shl bp_TElm_Fileselector_Data_only_folder) and bm_TElm_Fileselector_Data_only_folder);
end;

function expand(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  expand:=(a.flag0 and bm_TElm_Fileselector_Data_expand) shr bp_TElm_Fileselector_Data_expand;
end;

procedure set_expand(var a : TElm_Fileselector_Data; __expand : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__expand shl bp_TElm_Fileselector_Data_expand) and bm_TElm_Fileselector_Data_expand);
end;

function double_tap_navigation(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  double_tap_navigation:=(a.flag0 and bm_TElm_Fileselector_Data_double_tap_navigation) shr bp_TElm_Fileselector_Data_double_tap_navigation;
end;

procedure set_double_tap_navigation(var a : TElm_Fileselector_Data; __double_tap_navigation : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__double_tap_navigation shl bp_TElm_Fileselector_Data_double_tap_navigation) and bm_TElm_Fileselector_Data_double_tap_navigation);
end;

function multi(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  multi:=(a.flag0 and bm_TElm_Fileselector_Data_multi) shr bp_TElm_Fileselector_Data_multi;
end;

procedure set_multi(var a : TElm_Fileselector_Data; __multi : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__multi shl bp_TElm_Fileselector_Data_multi) and bm_TElm_Fileselector_Data_multi);
end;

function monitoring(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  monitoring:=(a.flag0 and bm_TElm_Fileselector_Data_monitoring) shr bp_TElm_Fileselector_Data_monitoring;
end;

procedure set_monitoring(var a : TElm_Fileselector_Data; __monitoring : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__monitoring shl bp_TElm_Fileselector_Data_monitoring) and bm_TElm_Fileselector_Data_monitoring);
end;

function dir_selected(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  dir_selected:=(a.flag0 and bm_TElm_Fileselector_Data_dir_selected) shr bp_TElm_Fileselector_Data_dir_selected;
end;

procedure set_dir_selected(var a : TElm_Fileselector_Data; __dir_selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__dir_selected shl bp_TElm_Fileselector_Data_dir_selected) and bm_TElm_Fileselector_Data_dir_selected);
end;

function hidden_visible(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  hidden_visible:=(a.flag0 and bm_TElm_Fileselector_Data_hidden_visible) shr bp_TElm_Fileselector_Data_hidden_visible;
end;

procedure set_hidden_visible(var a : TElm_Fileselector_Data; __hidden_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__hidden_visible shl bp_TElm_Fileselector_Data_hidden_visible) and bm_TElm_Fileselector_Data_hidden_visible);
end;

function target_ready(var a : TElm_Fileselector_Data) : TEina_Bool;
begin
  target_ready:=(a.flag0 and bm_TElm_Fileselector_Data_target_ready) shr bp_TElm_Fileselector_Data_target_ready;
end;

procedure set_target_ready(var a : TElm_Fileselector_Data; __target_ready : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__target_ready shl bp_TElm_Fileselector_Data_target_ready) and bm_TElm_Fileselector_Data_target_ready);
end;

function first(var a : TListing_Request) : TEina_Bool;
begin
  first:=(a.flag0 and bm_TListing_Request_first) shr bp_TListing_Request_first;
end;

procedure set_first(var a : TListing_Request; __first : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__first shl bp_TListing_Request_first) and bm_TListing_Request_first);
end;

function valid(var a : TListing_Request) : TEina_Bool;
begin
  valid:=(a.flag0 and bm_TListing_Request_valid) shr bp_TListing_Request_valid;
end;

procedure set_valid(var a : TListing_Request; __valid : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__valid shl bp_TListing_Request_valid) and bm_TListing_Request_valid);
end;

function is_dir(var a : TElm_Fileselector_Item_Data) : TEina_Bool;
begin
  is_dir:=(a.flag0 and bm_TElm_Fileselector_Item_Data_is_dir) shr bp_TElm_Fileselector_Item_Data_is_dir;
end;

procedure set_is_dir(var a : TElm_Fileselector_Item_Data; __is_dir : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__is_dir shl bp_TElm_Fileselector_Item_Data_is_dir) and bm_TElm_Fileselector_Item_Data_is_dir);
end;


end.
