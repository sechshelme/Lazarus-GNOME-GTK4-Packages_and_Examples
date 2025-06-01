
unit elm_cache;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_cache.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_cache.h
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


{*
 * @defgroup Elm_Caches Caches
 * @ingroup Elementary
 *
 * These are functions which let one fine-tune some cache values for
 * Elementary applications, thus allowing for performance adjustments.
 *
 * @
  }
{*
 * @brief Flush all caches.
 *
 * Frees all data that was in cache and is not currently being used to reduce
 * memory usage. This frees Edje's, Evas' and Eet's cache. This is equivalent
 * to calling all of the following functions:
 * @li edje_file_cache_flush()
 * @li edje_collection_cache_flush()
 * @li eet_clearcache()
 * @li evas_image_cache_flush()
 * @li evas_font_cache_flush()
 * @li evas_render_dump()
 * @note Evas caches are flushed for every canvas associated with a window.
 *
 * @ingroup Elm_Caches
  }

procedure elm_cache_all_flush;cdecl;external;
{*
 * @
  }

implementation


end.
