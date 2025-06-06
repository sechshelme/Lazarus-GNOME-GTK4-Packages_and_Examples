#ifndef ELM_WIDGET_FILESELECTOR_H
#define ELM_WIDGET_FILESELECTOR_H

#include "Elementary.h"

/* DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
 */

/**
 * @addtogroup Widget
 * @{
 *
 * @section elm-fileselector-class The Elementary Fileselector Class
 *
 * Elementary, besides having the @ref Fileselector widget, exposes its
 * foundation -- the Elementary Fileselector Class -- in order to create other
 * widgets which are a fileselector with some more logic on top.
 */

typedef struct _Elm_Fileselector_Filter Elm_Fileselector_Filter;
typedef struct _Listing_Request Listing_Request;
typedef struct _Elm_Fileselector_Item_Data Elm_Fileselector_Item_Data;

/**
 * Base layout smart data extended with fileselector instance data.
 */
typedef struct _Elm_Fileselector_Data Elm_Fileselector_Data;
struct _Elm_Fileselector_Data
{
   Evas_Object             *obj;
   Evas_Object             *path_entry;
   Evas_Object             *name_entry;
   Evas_Object             *search_entry;
   Evas_Object             *files_view;
   Evas_Object             *up_button;
   Evas_Object             *home_button;
   Evas_Object             *spinner;
   Evas_Object             *filter_hoversel;
   Evas_Object             *ok_button;
   Evas_Object             *cancel_button;

   Eina_List               *files_item_data;

   Eina_List               *filter_list;
   Elm_Fileselector_Filter *current_filter;

   /* a list of selected paths. only for multi selection */
   Eina_List               *multi_selection;
   Eina_List               *multi_selection_tmp;

   const char              *path;
   Efl_Model               *model;
   Efl_Model               *prev_model;
   Eina_List               *children;
   Ecore_Idler             *path_entry_idler;

   Efl_Model               *target;

   const char              *path_separator;
   const char              *search_string;

   Listing_Request         *current_populate_lreq;

   Evas_Coord_Size          thumbnail_size;

   /* a sort method to decide orders of files/directories */
   int                    (*sort_method)(const Elm_Fileselector_Item_Data *, const Elm_Fileselector_Item_Data *);

   Elm_Fileselector_Mode    mode;
   Elm_Fileselector_Sort    sort_type;

   Eina_Bool                only_folder : 1;
   Eina_Bool                expand : 1;
   Eina_Bool                double_tap_navigation : 1;
   Eina_Bool                multi : 1;
   Eina_Bool                monitoring : 1;

   /* this flag is only for multi selection.
    * If this flag is set to @c EINA_TRUE, it means directory is selected
    * so that fileselector will clear current selection when user clicked
    * another item. */
   Eina_Bool                dir_selected : 1;

   Eina_Bool                hidden_visible : 1;
   Eina_Bool                target_ready : 1;
};

struct sel_data
{
   Evas_Object      *fs;
   Efl_Model        *model;
   Efl_Model        *selected;
};

struct _Listing_Request
{
   Elm_Fileselector_Data *sd;
   Elm_Object_Item             *parent_it;

   Evas_Object                 *obj;
   Efl_Model                   *model;
   Efl_Model                   *selected;
   Eina_Stringshare            *path;
   Eina_Stringshare            *selected_path;
   int                          item_total;
   int                          item_processed_count;

   Eina_Bool                    first : 1;
   Eina_Bool                    valid : 1;
};

struct _Elm_Fileselector_Item_Data
{
   void                        *user_data;
   Efl_Model                   *model;
   Eina_Stringshare            *path;
   Eina_Stringshare            *filename;
   Eina_Stringshare            *mime_type;
   Efl_Model                   *parent_model;
   const char                  *parent_path;

   int64_t                      size;
   double                       mtime;

   Eina_Bool                    is_dir : 1;
};

typedef enum {
   ELM_DIRECTORY = 0,
   ELM_FILE_IMAGE = 1,
   ELM_FILE_UNKNOW = 2,
   ELM_FILE_LAST
} Elm_Fileselector_Type;

typedef enum {
   ELM_FILESELECTOR_MIME_FILTER = 0,
   ELM_FILESELECTOR_CUSTOM_FILTER,
   ELM_FILESELECTOR_FILTER_LAST
} Elm_Fileselector_Filter_Type;

typedef struct _Elm_Fileselector_Custom_Filter Elm_Fileselector_Custom_Filter;
struct _Elm_Fileselector_Custom_Filter
{
   Elm_Fileselector_Filter_Func  func;
   void                         *data;
};

struct _Elm_Fileselector_Filter
{
   const char                         *filter_name;
   Elm_Fileselector_Data        *sd;

   union {
      char                           **mime_types;
      Elm_Fileselector_Custom_Filter  *custom;
   } filter;

   Elm_Fileselector_Filter_Type        filter_type;
};

/**
 * @}
 */


