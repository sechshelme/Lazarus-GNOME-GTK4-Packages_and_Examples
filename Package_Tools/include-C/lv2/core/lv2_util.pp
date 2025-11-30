
unit lv2_util;
interface

{
  Automatically converted by H2Pas 1.0.0 from lv2_util.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lv2_util.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright 2016 David Robillard <d@drobilla.net> }
{ SPDX-License-Identifier: ISC }
{*
   @defgroup util Utilities
   @ingroup lv2core
   @
 }
{$include "lv2/core/lv2.h"}
{$include <stdarg.h>}
{$include <stdbool.h>}
{$include <string.h>}

const
  xxxxxxxxxxxxxxxx = 111111111;  
{ C++ extern C conditionnal removed }
{*
   Return the data for a feature in a features array.

   If the feature is not found, NULL is returned.  Note that this function is
   only useful for features with data, and can not detect features that are
   present but have NULL data.
 }
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

implementation


end.
