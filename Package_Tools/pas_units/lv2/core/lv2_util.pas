unit lv2_util;

interface

uses
  lv2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{xxxxxxxxxxx
static inline void*
lv2_features_data(const LV2_Feature* const* features, const char* const uri)

  if (features) 
    for (const LV2_Feature* const* f = features; *f; ++f) 
      if (!strcmp(uri, (*f)->URI)) 
        return (*f)->data;
      
    
  
  return NULL;


static inline const char*
lv2_features_query(const LV2_Feature* const* features, ...)

  va_list args;
  va_start(args, features);

  const char* uri = NULL;
  while ((uri = va_arg(args, const char*))) 
    void** data     = va_arg(args, void**);
    bool   required = (bool)va_arg(args, int);

    *data = lv2_features_data(features, uri);
    if (required && !*data) 
      va_end(args);
      return uri;
    
  

  va_end(args);
  return NULL;

 }

// === Konventiert am: 30-11-25 17:25:00 ===


implementation



end.
