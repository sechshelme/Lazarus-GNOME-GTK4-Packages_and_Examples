/*
 * Copyright © 2019 Benjamin Otte
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
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
 */


#pragma once

#include <gtk/gtktypes.h>



#define GTK_TYPE_EXPRESSION (gtk_expression_get_type ())
#define GTK_TYPE_EXPRESSION_WATCH (gtk_expression_watch_get_type())

#define GTK_IS_EXPRESSION(obj)  (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_EXPRESSION))
#define GTK_EXPRESSION(obj)     (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_EXPRESSION, GtkExpression))

typedef struct _GtkExpression GtkExpression;
typedef struct _GtkExpressionWatch GtkExpressionWatch;

/**
 * GtkExpressionNotify:
 * @user_data: data passed to gtk_expression_watch()
 *
 * Callback called by gtk_expression_watch() when the
 * expression value changes.
 */
typedef void            (* GtkExpressionNotify)                 (gpointer                        user_data);

extern
GType                   gtk_expression_get_type                 (void) ;

extern
GtkExpression *         gtk_expression_ref                      (GtkExpression                  *self);
extern
void                    gtk_expression_unref                    (GtkExpression                  *self);
////G_DEFINE_AUTOPTR_CLEANUP_FUNC  (GtkExpression, gtk_expression_unref)

extern
GType                   gtk_expression_get_value_type           (GtkExpression                  *self);
extern
gboolean                gtk_expression_is_static                (GtkExpression                  *self);
extern
gboolean                gtk_expression_evaluate                 (GtkExpression                  *self,
                                                                 gpointer                        this_,
                                                                 GValue                         *value);
extern
GtkExpressionWatch *    gtk_expression_watch                    (GtkExpression                  *self,
                                                                 gpointer                        this_,
                                                                 GtkExpressionNotify             notify,
                                                                 gpointer                        user_data,
                                                                 GDestroyNotify                  user_destroy);
extern
GtkExpressionWatch *    gtk_expression_bind                     (GtkExpression                  *self,
                                                                 gpointer                        target,
                                                                 const char *                    property,
                                                                 gpointer                        this_);

extern
GType                   gtk_expression_watch_get_type           (void) ;
extern
GtkExpressionWatch *    gtk_expression_watch_ref                (GtkExpressionWatch             *watch);
extern
void                    gtk_expression_watch_unref              (GtkExpressionWatch             *watch);
extern
gboolean                gtk_expression_watch_evaluate           (GtkExpressionWatch             *watch,
                                                                 GValue                         *value);
extern
void                    gtk_expression_watch_unwatch            (GtkExpressionWatch             *watch);

#define GTK_TYPE_PROPERTY_EXPRESSION (gtk_property_expression_get_type())
typedef struct _GtkPropertyExpression   GtkPropertyExpression;

extern
GType                   gtk_property_expression_get_type        (void) ;

extern
GtkExpression *         gtk_property_expression_new             (GType                           this_type,
                                                                 GtkExpression                  *expression,
                                                                 const char                     *property_name);
extern
GtkExpression *         gtk_property_expression_new_for_pspec   (GtkExpression                  *expression,
                                                                 GParamSpec                     *pspec);

extern
GtkExpression *         gtk_property_expression_get_expression  (GtkExpression                  *expression);
extern
GParamSpec *            gtk_property_expression_get_pspec       (GtkExpression                  *expression);

#define GTK_TYPE_CONSTANT_EXPRESSION (gtk_constant_expression_get_type())
typedef struct _GtkConstantExpression   GtkConstantExpression;

extern
GType                   gtk_constant_expression_get_type        (void) ;

extern
GtkExpression *         gtk_constant_expression_new             (GType                           value_type,
                                                                 ...);
extern
GtkExpression *         gtk_constant_expression_new_for_value   (const GValue                   *value);

extern
const GValue *          gtk_constant_expression_get_value       (GtkExpression                  *expression);

#define GTK_TYPE_OBJECT_EXPRESSION (gtk_object_expression_get_type())
typedef struct _GtkObjectExpression     GtkObjectExpression;

extern
GType                   gtk_object_expression_get_type          (void) ;

extern
GtkExpression *         gtk_object_expression_new               (GObject                        *object);

extern
GObject *               gtk_object_expression_get_object        (GtkExpression                  *expression);

#define GTK_TYPE_CLOSURE_EXPRESSION (gtk_closure_expression_get_type())
typedef struct _GtkClosureExpression    GtkClosureExpression;

extern
GType                   gtk_closure_expression_get_type         (void) ;

extern
GtkExpression *         gtk_closure_expression_new              (GType                           value_type,
                                                                 GClosure                       *closure,
                                                                 guint                           n_params,
                                                                 GtkExpression                 **params);

#define GTK_TYPE_CCLOSURE_EXPRESSION (gtk_cclosure_expression_get_type())
typedef struct _GtkCClosureExpression   GtkCClosureExpression;

extern
GType                   gtk_cclosure_expression_get_type        (void) ;

extern
GtkExpression *         gtk_cclosure_expression_new             (GType                           value_type,
                                                                 GClosureMarshal                 marshal,
                                                                 guint                           n_params,
                                                                 GtkExpression                 **params,
                                                                 GCallback                       callback_func,
                                                                 gpointer                        user_data,
                                                                 GClosureNotify                  user_destroy);

#define GTK_TYPE_TRY_EXPRESSION (gtk_try_expression_get_type())
typedef struct _GtkTryExpression   GtkTryExpression;

extern
GType                   gtk_try_expression_get_type             (void) ;

extern
GtkExpression *         gtk_try_expression_new                  (guint                           n_expressions,
                                                                 GtkExpression                 **expressions);

/* GObject integration, so we can use GtkBuilder */

/**
 * GTK_VALUE_HOLDS_EXPRESSION:
 * @value: a `GValue`
 *
 * Evaluates to true if @value was initialized with `GTK_TYPE_EXPRESSION`
 */
#define GTK_VALUE_HOLDS_EXPRESSION(value)       (G_VALUE_HOLDS ((value), GTK_TYPE_EXPRESSION))

extern
void            gtk_value_set_expression        (GValue        *value,
                                                 GtkExpression *expression);
extern
void            gtk_value_take_expression       (GValue        *value,
                                                 GtkExpression *expression);
extern
GtkExpression * gtk_value_get_expression        (const GValue  *value);
extern
GtkExpression * gtk_value_dup_expression        (const GValue  *value);

#define GTK_TYPE_PARAM_SPEC_EXPRESSION (gtk_param_expression_get_type())
#define GTK_PARAM_SPEC_EXPRESSION(obj)          (G_TYPE_CHECK_INSTANCE_CAST ((obj), GTK_TYPE_PARAM_SPEC_EXPRESSION, GtkParamSpecExpression))
#define GTK_IS_PARAM_SPEC_EXPRESSION(obj)       (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GTK_TYPE_PARAM_SPEC_EXPRESSION))

/**
 * GtkParamSpecExpression:
 *
 * A `GParamSpec` for properties holding a `GtkExpression`.
 */
typedef struct {
  /*< private >*/
  GParamSpec parent_instance;
} GtkParamSpecExpression;

extern
GType           gtk_param_expression_get_type   (void) ;
extern
GParamSpec *    gtk_param_spec_expression       (const char    *name,
                                                 const char    *nick,
                                                 const char    *blurb,
                                                 GParamFlags    flags);



