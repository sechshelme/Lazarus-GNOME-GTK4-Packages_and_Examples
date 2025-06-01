#ifndef _ELM_PART_HELPER_H
#define _ELM_PART_HELPER_H

#include "Elementary.h"
#include "elm_priv.h"
#include "efl_ui_layout_part_legacy.eo.h"

//#define ELM_PART_HOOK do { ERR("%s@%p:%s [%d]", efl_class_name_get(pd->obj), pd->obj, pd->part, (int) pd->temp); } while(0)

typedef struct _Elm_Part_Data Elm_Part_Data;
struct _Elm_Part_Data
{
   Eo             *obj;
   Eina_Tmpstr    *part;
};

// Note: this generic implementation can be improved to support part object
// caching or something...



#endif
