
#pragma once

#if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)
#error "Only <gtk/gtk.h> can be included directly."
#endif

#include <gtk/gtktypes.h>



#define GTK_TYPE_BUILDER_SCOPE               (gtk_builder_scope_get_type ())

// G_DECLARE_INTERFACE (GtkBuilderScope, gtk_builder_scope, GTK, BUILDER_SCOPE, GObject)

typedef enum { /*< prefix=GTK_BUILDER_CLOSURE >*/
  GTK_BUILDER_CLOSURE_SWAPPED = (1 << 0)
} GtkBuilderClosureFlags;

struct _GtkBuilderScopeInterface
{
  /*< private >*/
  GTypeInterface g_iface;

  /*< public >*/
  GType                 (* get_type_from_name)                  (GtkBuilderScope        *self,
                                                                 GtkBuilder             *builder,
                                                                 const char             *type_name);
  GType                 (* get_type_from_function)              (GtkBuilderScope        *self,
                                                                 GtkBuilder             *builder,
                                                                 const char             *function_name);

  GClosure *            (* create_closure)                      (GtkBuilderScope        *self,
                                                                 GtkBuilder             *builder,
                                                                 const char             *function_name,
                                                                 GtkBuilderClosureFlags  flags,
                                                                 GObject                *object,
                                                                 GError                **error);
};



struct _GtkBuilderCScopeClass
{
  GObjectClass parent_class;
};

#define GTK_TYPE_BUILDER_CSCOPE               (gtk_builder_cscope_get_type ())

//G_DECLARE_DERIVABLE_TYPE (GtkBuilderCScope, gtk_builder_cscope, GTK, BUILDER_CSCOPE, GObject)

extern
GtkBuilderScope *       gtk_builder_cscope_new                  (void);
extern
void                    gtk_builder_cscope_add_callback_symbol  (GtkBuilderCScope       *self,
                                                                 const char             *callback_name,
                                                                 GCallback               callback_symbol);
extern
void                    gtk_builder_cscope_add_callback_symbols (GtkBuilderCScope       *self,
                                                                 const char             *first_callback_name,
                                                                 GCallback               first_callback_symbol,
                                                                 ...) ;

// xxxxxx #define gtk_builder_cscope_add_callback(scope, callback) gtk_builder_cscope_add_callback_symbol (GTK_BUILDER_CSCOPE (scope), #callback, G_CALLBACK (callback))

extern
GCallback               gtk_builder_cscope_lookup_callback_symbol(GtkBuilderCScope      *self,
                                                                  const char            *callback_name);




