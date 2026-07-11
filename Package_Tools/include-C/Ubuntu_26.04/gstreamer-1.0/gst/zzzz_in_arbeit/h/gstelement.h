/* GStreamer
 * Copyright (C) 1999,2000 Erik Walthinsen <omega@cse.ogi.edu>
 *               2000,2004 Wim Taymans <wim@fluendo.com>
 *
 * gstelement.h: Header for GstElement
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */


#ifndef __GST_ELEMENT_H__
#define __GST_ELEMENT_H__

#include <glib.h>






/* gstelement.h and gstelementfactory.h include each other */
typedef struct _GstElement GstElement;
typedef struct _GstElementClass GstElementClass;

/* gstmessage.h needs State */
/**
 * GstState:
 * @GST_STATE_VOID_PENDING: no pending state.
 * @GST_STATE_NULL        : the NULL state or initial state of an element.
 * @GST_STATE_READY       : the element is ready to go to PAUSED.
 * @GST_STATE_PAUSED      : the element is PAUSED, it is ready to accept and
 *                          process data. Sink elements however only accept one
 *                          buffer and then block.
 * @GST_STATE_PLAYING     : the element is PLAYING, the #GstClock is running and
 *                          the data is flowing.
 *
 * The possible states an element can be in. States can be changed using
 * gst_element_set_state() and checked using gst_element_get_state().
 */
typedef enum {
  GST_STATE_VOID_PENDING        = 0,
  GST_STATE_NULL                = 1,
  GST_STATE_READY               = 2,
  GST_STATE_PAUSED              = 3,
  GST_STATE_PLAYING             = 4
} GstState;

#define GST_TYPE_ELEMENT                (gst_element_get_type ())
#define GST_IS_ELEMENT(obj)             (G_TYPE_CHECK_INSTANCE_TYPE ((obj), GST_TYPE_ELEMENT))
#define GST_IS_ELEMENT_CLASS(klass)     (G_TYPE_CHECK_CLASS_TYPE ((klass), GST_TYPE_ELEMENT))
#define GST_ELEMENT_GET_CLASS(obj)      (G_TYPE_INSTANCE_GET_CLASS ((obj), GST_TYPE_ELEMENT, GstElementClass))
#define GST_ELEMENT(obj)                (G_TYPE_CHECK_INSTANCE_CAST ((obj), GST_TYPE_ELEMENT, GstElement))
#define GST_ELEMENT_CLASS(klass)        (G_TYPE_CHECK_CLASS_CAST ((klass), GST_TYPE_ELEMENT, GstElementClass))
#define GST_ELEMENT_CAST(obj)           ((GstElement*)(obj))

/**
 * GstStateChangeReturn:
 * @GST_STATE_CHANGE_FAILURE   : the state change failed
 * @GST_STATE_CHANGE_SUCCESS   : the state change succeeded
 * @GST_STATE_CHANGE_ASYNC     : the state change will happen asynchronously
 * @GST_STATE_CHANGE_NO_PREROLL: the state change succeeded but the element
 *                               cannot produce data in %GST_STATE_PAUSED.
 *                               This typically happens with live sources.
 *
 * The possible return values from a state change function such as
 * gst_element_set_state(). Only @GST_STATE_CHANGE_FAILURE is a real failure.
 */
typedef enum {
  GST_STATE_CHANGE_FAILURE             = 0,
  GST_STATE_CHANGE_SUCCESS             = 1,
  GST_STATE_CHANGE_ASYNC               = 2,
  GST_STATE_CHANGE_NO_PREROLL          = 3
} GstStateChangeReturn;

#include <gst/gstconfig.h>
#include <gst/gstobject.h>
#include <gst/gstpad.h>
#include <gst/gstbus.h>
#include <gst/gstclock.h>
#include <gst/gstelementfactory.h>
#include <gst/gstplugin.h>
#include <gst/gstpluginfeature.h>
#include <gst/gstiterator.h>
#include <gst/gstmessage.h>
#include <gst/gstquery.h>
#include <gst/gsttaglist.h>
#include <gst/gstcontext.h>

/* NOTE: this probably should be done with an #ifdef to decide
 * whether to safe-cast or to just do the non-checking cast.
 */

/**
 * GST_STATE:
 * @elem: a #GstElement to return state for.
 *
 * This macro returns the current #GstState of the element.
 */
#define GST_STATE(elem)                 (GST_ELEMENT_CAST(elem)->current_state)

/**
 * GST_STATE_NEXT:
 * @elem: a #GstElement to return the next state for.
 *
 * This macro returns the next #GstState of the element.
 */
#define GST_STATE_NEXT(elem)            (GST_ELEMENT_CAST(elem)->next_state)

/**
 * GST_STATE_PENDING:
 * @elem: a #GstElement to return the pending state for.
 *
 * This macro returns the currently pending #GstState of the element.
 */
#define GST_STATE_PENDING(elem)         (GST_ELEMENT_CAST(elem)->pending_state)

/**
 * GST_STATE_TARGET:
 * @elem: a #GstElement to return the target state for.
 *
 * This macro returns the target #GstState of the element.
 */
#define GST_STATE_TARGET(elem)          (GST_ELEMENT_CAST(elem)->target_state)

/**
 * GST_STATE_RETURN:
 * @elem: a #GstElement to return the last state result for.
 *
 * This macro returns the last #GstStateChangeReturn value.
 */
#define GST_STATE_RETURN(elem)          (GST_ELEMENT_CAST(elem)->last_return)

#define __GST_SIGN(val)                 ((val) < 0 ? -1 : ((val) > 0 ? 1 : 0))
/**
 * GST_STATE_GET_NEXT:
 * @cur: A starting #GstState
 * @pending: A target #GstState
 *
 * Given a current state @cur and a target state @pending, calculate the next (intermediate)
 * #GstState.
 */
#define GST_STATE_GET_NEXT(cur,pending)         ((GstState)((cur) + __GST_SIGN ((gint)(pending) - (gint)(cur))))
/**
 * GST_STATE_TRANSITION:
 * @cur: A current state
 * @next: A next state
 *
 * Given a current state @cur and a next state @next, calculate the associated
 * #GstStateChange transition.
 */
#define GST_STATE_TRANSITION(cur,next)          ((GstStateChange)(((cur)<<3)|(next)))
/**
 * GST_STATE_TRANSITION_CURRENT:
 * @trans: A #GstStateChange
 *
 * Given a state transition @trans, extract the current #GstState.
 */
#define GST_STATE_TRANSITION_CURRENT(trans)     ((GstState)((trans)>>3))
/**
 * GST_STATE_TRANSITION_NEXT:
 * @trans: A #GstStateChange
 *
 * Given a state transition @trans, extract the next #GstState.
 */
#define GST_STATE_TRANSITION_NEXT(trans)        ((GstState)((trans)&0x7))

/**
 * GstStateChange:
 * @GST_STATE_CHANGE_NULL_TO_READY    : state change from NULL to READY.
 *   * The element must check if the resources it needs are available. Device
 *     sinks and -sources typically try to probe the device to constrain their
 *     caps.
 *   * The element opens the device (in case feature need to be probed).
 * @GST_STATE_CHANGE_READY_TO_PAUSED  : state change from READY to PAUSED.
 *   * The element pads are activated in order to receive data in PAUSED.
 *     Streaming threads are started.
 *   * Some elements might need to return %GST_STATE_CHANGE_ASYNC and complete
 *     the state change when they have enough information. It is a requirement
 *     for sinks to return %GST_STATE_CHANGE_ASYNC and complete the state change
 *     when they receive the first buffer or %GST_EVENT_EOS (preroll).
 *     Sinks also block the dataflow when in PAUSED.
 *   * A pipeline resets the running_time to 0.
 *   * Live sources return %GST_STATE_CHANGE_NO_PREROLL and don't generate data.
 * @GST_STATE_CHANGE_PAUSED_TO_PLAYING: state change from PAUSED to PLAYING.
 *   * Most elements ignore this state change.
 *   * The pipeline selects a #GstClock and distributes this to all the children
 *     before setting them to PLAYING. This means that it is only allowed to
 *     synchronize on the #GstClock in the PLAYING state.
 *   * The pipeline uses the #GstClock and the running_time to calculate the
 *     base_time. The base_time is distributed to all children when performing
 *     the state change.
 *   * Sink elements stop blocking on the preroll buffer or event and start
 *     rendering the data.
 *   * Sinks can post %GST_MESSAGE_EOS in the PLAYING state. It is not allowed
 *     to post %GST_MESSAGE_EOS when not in the PLAYING state.
 *   * While streaming in PAUSED or PLAYING elements can create and remove
 *     sometimes pads.
 *   * Live sources start generating data and return %GST_STATE_CHANGE_SUCCESS.
 * @GST_STATE_CHANGE_PLAYING_TO_PAUSED: state change from PLAYING to PAUSED.
 *   * Most elements ignore this state change.
 *   * The pipeline calculates the running_time based on the last selected
 *     #GstClock and the base_time. It stores this information to continue
 *     playback when going back to the PLAYING state.
 *   * Sinks unblock any #GstClock wait calls.
 *   * When a sink does not have a pending buffer to play, it returns
 *     #GST_STATE_CHANGE_ASYNC from this state change and completes the state
 *     change when it receives a new buffer or an %GST_EVENT_EOS.
 *   * Any queued %GST_MESSAGE_EOS items are removed since they will be reposted
 *     when going back to the PLAYING state. The EOS messages are queued in
 *     #GstBin containers.
 *   * Live sources stop generating data and return %GST_STATE_CHANGE_NO_PREROLL.
 * @GST_STATE_CHANGE_PAUSED_TO_READY  : state change from PAUSED to READY.
 *   * Sinks unblock any waits in the preroll.
 *   * Elements unblock any waits on devices
 *   * Chain or get_range functions return %GST_FLOW_FLUSHING.
 *   * The element pads are deactivated so that streaming becomes impossible and
 *     all streaming threads are stopped.
 *   * The sink forgets all negotiated formats
 *   * Elements remove all sometimes pads
 * @GST_STATE_CHANGE_READY_TO_NULL    : state change from READY to NULL.
 *   * Elements close devices
 *   * Elements reset any internal state.
 * @GST_STATE_CHANGE_NULL_TO_NULL       : state change from NULL to NULL. (Since: 1.14)
 * @GST_STATE_CHANGE_READY_TO_READY     : state change from READY to READY,
 * This might happen when going to PAUSED asynchronously failed, in that case
 * elements should make sure they are in a proper, coherent READY state. (Since: 1.14)
 * @GST_STATE_CHANGE_PAUSED_TO_PAUSED   : state change from PAUSED to PAUSED.
 * This might happen when elements were in PLAYING state and 'lost state',
 * they should make sure to go back to real 'PAUSED' state (prerolling for example). (Since: 1.14)
 * @GST_STATE_CHANGE_PLAYING_TO_PLAYING : state change from PLAYING to PLAYING. (Since: 1.14)
 *
 * These are the different state changes an element goes through.
 * %GST_STATE_NULL &rArr; %GST_STATE_PLAYING is called an upwards state change
 * and %GST_STATE_PLAYING &rArr; %GST_STATE_NULL a downwards state change.
 */
typedef enum /*< flags=0 >*/
{
  GST_STATE_CHANGE_NULL_TO_READY        = (GST_STATE_NULL<<3) | GST_STATE_READY,
  GST_STATE_CHANGE_READY_TO_PAUSED      = (GST_STATE_READY<<3) | GST_STATE_PAUSED,
  GST_STATE_CHANGE_PAUSED_TO_PLAYING    = (GST_STATE_PAUSED<<3) | GST_STATE_PLAYING,
  GST_STATE_CHANGE_PLAYING_TO_PAUSED    = (GST_STATE_PLAYING<<3) | GST_STATE_PAUSED,
  GST_STATE_CHANGE_PAUSED_TO_READY      = (GST_STATE_PAUSED<<3) | GST_STATE_READY,
  GST_STATE_CHANGE_READY_TO_NULL        = (GST_STATE_READY<<3) | GST_STATE_NULL,
  GST_STATE_CHANGE_NULL_TO_NULL         = (GST_STATE_NULL<<3) | GST_STATE_NULL,
  GST_STATE_CHANGE_READY_TO_READY       = (GST_STATE_READY<<3) | GST_STATE_READY,
  GST_STATE_CHANGE_PAUSED_TO_PAUSED     = (GST_STATE_PAUSED<<3) | GST_STATE_PAUSED,
  GST_STATE_CHANGE_PLAYING_TO_PLAYING   = (GST_STATE_PLAYING<<3) | GST_STATE_PLAYING
} GstStateChange;

/**
 * GstElementFlags:
 * @GST_ELEMENT_FLAG_LOCKED_STATE: ignore state changes from parent
 * @GST_ELEMENT_FLAG_SINK: the element is a sink
 * @GST_ELEMENT_FLAG_SOURCE: the element is a source.
 * @GST_ELEMENT_FLAG_PROVIDE_CLOCK: the element can provide a clock
 * @GST_ELEMENT_FLAG_REQUIRE_CLOCK: the element requires a clock
 * @GST_ELEMENT_FLAG_INDEXABLE: the element can use an index
 * @GST_ELEMENT_FLAG_LAST: offset to define more flags
 *
 * The standard flags that an element may have.
 */
typedef enum
{
  GST_ELEMENT_FLAG_LOCKED_STATE   = (GST_OBJECT_FLAG_LAST << 0),
  GST_ELEMENT_FLAG_SINK           = (GST_OBJECT_FLAG_LAST << 1),
  GST_ELEMENT_FLAG_SOURCE         = (GST_OBJECT_FLAG_LAST << 2),
  GST_ELEMENT_FLAG_PROVIDE_CLOCK  = (GST_OBJECT_FLAG_LAST << 3),
  GST_ELEMENT_FLAG_REQUIRE_CLOCK  = (GST_OBJECT_FLAG_LAST << 4),
  GST_ELEMENT_FLAG_INDEXABLE      = (GST_OBJECT_FLAG_LAST << 5),
  /* padding */
  GST_ELEMENT_FLAG_LAST           = (GST_OBJECT_FLAG_LAST << 10)
} GstElementFlags;



struct _GstElement
{
  GstObject             object;

  /*< public >*/ /* with LOCK */
  GRecMutex             state_lock;

  /* element state */
  GCond                 state_cond;
  guint32               state_cookie;
  GstState              target_state;
  GstState              current_state;
  GstState              next_state;
  GstState              pending_state;
  GstStateChangeReturn  last_return;

  GstBus               *bus;

  /* allocated clock */
  GstClock             *clock;
  GstClockTimeDiff      base_time; /* NULL/READY: 0 - PAUSED: current time - PLAYING: difference to clock */
  GstClockTime          start_time;

  /* element pads, these lists can only be iterated while holding
   * the LOCK or checking the cookie after each LOCK. */
  guint16               numpads;
  GList                *pads;
  guint16               numsrcpads;
  GList                *srcpads;
  guint16               numsinkpads;
  GList                *sinkpads;
  guint32               pads_cookie;

  /* with object LOCK */
  GList                *contexts;

  /*< private >*/
  gpointer _gst_reserved[GST_PADDING-1];
};

/**
 * GstElementClass:
 * @parent_class: the parent class structure
 * @metadata: metadata for elements of this class
 * @elementfactory: the #GstElementFactory that creates these elements
 * @padtemplates: a #GList of #GstPadTemplate
 * @numpadtemplates: the number of padtemplates
 * @pad_templ_cookie: changed whenever the padtemplates change
 * @request_new_pad: called when a new pad is requested
 * @release_pad: called when a request pad is to be released
 * @get_state: get the state of the element
 * @set_state: set a new state on the element
 * @change_state: called by @set_state to perform an incremental state change
 * @set_bus: set a #GstBus on the element
 * @provide_clock: gets the #GstClock provided by the element
 * @set_clock: set the #GstClock on the element
 * @send_event: send a #GstEvent to the element
 * @query: perform a #GstQuery on the element
 * @state_changed: called immediately after a new state was set.
 * @post_message: called when a message is posted on the element. Chain up to
 *                the parent class' handler to have it posted on the bus.
 * @set_context: set a #GstContext on the element
 *
 * GStreamer element class. Override the vmethods to implement the element
 * functionality.
 */
struct _GstElementClass
{
  GstObjectClass         parent_class;

  /*< public >*/
  /* the element metadata */
  gpointer		 metadata;

  /* factory that the element was created from */
  GstElementFactory     *elementfactory;

  /* templates for our pads */
  GList                 *padtemplates;
  gint                   numpadtemplates;
  guint32                pad_templ_cookie;

  /*< private >*/
  /* signal callbacks */
  void (*pad_added)     (GstElement *element, GstPad *pad);
  void (*pad_removed)   (GstElement *element, GstPad *pad);
  void (*no_more_pads)  (GstElement *element);

  /*< public >*/
  /* virtual methods for subclasses */

  /* request/release pads */
  /* FIXME 2.0 harmonize naming with gst_element_request_pad */
  /**
   * GstElementClass::request_new_pad:
   * @element: a #GstElement to find a request pad of.
   * @templ: a #GstPadTemplate of which we want a pad of.
   * @name: (transfer none) (nullable): the name of the request #GstPad
   * to retrieve.
   * @caps: (transfer none) (nullable): the caps of the pad we want to request.
   *
   * Returns: (transfer none) (nullable): the requested #GstPad.
   */
  GstPad*               (*request_new_pad)      (GstElement *element, GstPadTemplate *templ,
                                                 const gchar* name, const GstCaps *caps);

  void                  (*release_pad)          (GstElement *element, GstPad *pad);

  /* state changes */
  GstStateChangeReturn (*get_state)             (GstElement * element, GstState * state,
                                                 GstState * pending, GstClockTime timeout);
  GstStateChangeReturn (*set_state)             (GstElement *element, GstState state);
  GstStateChangeReturn (*change_state)          (GstElement *element, GstStateChange transition);
  void                 (*state_changed)         (GstElement *element, GstState oldstate,
                                                 GstState newstate, GstState pending);

  /* bus */
  void                  (*set_bus)              (GstElement * element, GstBus * bus);

  /* set/get clocks */
  GstClock*             (*provide_clock)        (GstElement *element);
  gboolean              (*set_clock)            (GstElement *element, GstClock *clock);

  /* query functions */
  gboolean              (*send_event)           (GstElement *element, GstEvent *event);

  gboolean              (*query)                (GstElement *element, GstQuery *query);

  gboolean              (*post_message)         (GstElement *element, GstMessage *message);

  void                  (*set_context)          (GstElement *element, GstContext *context);

  /*< private >*/
  gpointer _gst_reserved[GST_PADDING_LARGE-2];
};

/* element class pad templates */

extern
void                    gst_element_class_add_pad_template      (GstElementClass *klass, GstPadTemplate *templ);

extern
void                    gst_element_class_add_static_pad_template (GstElementClass *klass, GstStaticPadTemplate *static_templ);

extern
void                    gst_element_class_add_static_pad_template_with_gtype (GstElementClass *klass,
                                                                              GstStaticPadTemplate *static_templ,
                                                                              GType pad_type);

extern
GstPadTemplate*         gst_element_class_get_pad_template      (GstElementClass *element_class, const gchar *name);

extern
GList*                  gst_element_class_get_pad_template_list (GstElementClass *element_class);

/* element class meta data */

extern
void                    gst_element_class_set_metadata          (GstElementClass *klass,
                                                                 const gchar     *longname,
                                                                 const gchar     *classification,
                                                                 const gchar     *description,
                                                                 const gchar     *author);
extern
void                    gst_element_class_set_static_metadata   (GstElementClass *klass,
                                                                 const gchar     *longname,
                                                                 const gchar     *classification,
                                                                 const gchar     *description,
                                                                 const gchar     *author);
extern
void                    gst_element_class_add_metadata          (GstElementClass * klass,
                                                                 const gchar * key, const gchar * value);
extern
void                    gst_element_class_add_static_metadata   (GstElementClass * klass,
                                                                 const gchar * key, const gchar * value);
extern
const gchar *           gst_element_class_get_metadata          (GstElementClass * klass,
                                                                 const gchar * key);


/* element instance */

extern
GType                   gst_element_get_type            (void);

/* basic name and parentage stuff from GstObject */

/**
 * gst_element_get_name:
 * @elem: a #GstElement to get the name of @elem.
 *
 * Returns a copy of the name of @elem.
 * Caller should g_free() the return value after usage.
 * For a nameless element, this returns %NULL, which you can safely g_free()
 * as well.
 *
 * Returns: (transfer full) (nullable): the name of @elem. g_free()
 * after usage. MT safe.
 *
 */
#define                 gst_element_get_name(elem)      gst_object_get_name(GST_OBJECT_CAST(elem))

/**
 * gst_element_set_name:
 * @elem: a #GstElement to set the name of.
 * @name: the new name
 *
 * Sets the name of the element, getting rid of the old name if there was one.
 */
#define                 gst_element_set_name(elem,name) gst_object_set_name(GST_OBJECT_CAST(elem),name)

/**
 * gst_element_get_parent:
 * @elem: a #GstElement to get the parent of.
 *
 * Get the parent of an element.
 *
 * Returns: (transfer full): the parent of an element.
 */
#define                 gst_element_get_parent(elem)    gst_object_get_parent(GST_OBJECT_CAST(elem))

/**
 * gst_element_set_parent:
 * @elem: a #GstElement to set the parent of.
 * @parent: the new parent #GstObject of the element.
 *
 * Sets the parent of an element.
 */
#define                 gst_element_set_parent(elem,parent)     gst_object_set_parent(GST_OBJECT_CAST(elem),parent)

/* clocking */

extern
GstClock*               gst_element_provide_clock       (GstElement *element) ;

extern
GstClock*               gst_element_get_clock           (GstElement *element) ;

extern
gboolean                gst_element_set_clock           (GstElement *element, GstClock *clock);

extern
void                    gst_element_set_base_time       (GstElement *element, GstClockTime time);

extern
GstClockTime            gst_element_get_base_time       (GstElement *element);

extern
void                    gst_element_set_start_time      (GstElement *element, GstClockTime time);

extern
GstClockTime            gst_element_get_start_time      (GstElement *element);

extern
GstClockTime            gst_element_get_current_running_time (GstElement *element);

extern
GstClockTime            gst_element_get_current_clock_time (GstElement *element);

/* bus */

extern
void                    gst_element_set_bus             (GstElement * element, GstBus * bus);

extern
GstBus *                gst_element_get_bus             (GstElement * element) ;

/* context */

extern
void                    gst_element_set_context         (GstElement * element, GstContext * context);

extern
GList *                 gst_element_get_contexts        (GstElement * element) ;

extern
GstContext *            gst_element_get_context         (GstElement * element, const gchar * context_type) ;

extern
GstContext *            gst_element_get_context_unlocked (GstElement * element, const gchar * context_type) ;

/* pad management */

extern
gboolean                gst_element_add_pad             (GstElement *element, GstPad *pad);

extern
gboolean                gst_element_remove_pad          (GstElement *element, GstPad *pad);

extern
void                    gst_element_no_more_pads        (GstElement *element);

extern
GstPad*                 gst_element_get_static_pad      (GstElement *element, const gchar *name) ;

extern //xxxxxxxxG_DEPRECATED_FOR(gst_element_request_pad_simple)
GstPad*                 gst_element_get_request_pad     (GstElement *element, const gchar *name) ;

extern
GstPad*                 gst_element_request_pad_simple  (GstElement *element, const gchar *name) ;

extern
GstPad*                 gst_element_request_pad         (GstElement *element, GstPadTemplate *templ,
							 const gchar * name, const GstCaps *caps) ;
extern
void                    gst_element_release_request_pad (GstElement *element, GstPad *pad);

extern
GstIterator *           gst_element_iterate_pads        (GstElement * element) ;

extern
GstIterator *           gst_element_iterate_src_pads    (GstElement * element) ;

extern
GstIterator *           gst_element_iterate_sink_pads   (GstElement * element) ;

/**
 * GstElementForeachPadFunc:
 * @element: the #GstElement
 * @pad: a #GstPad
 * @user_data: user data passed to the foreach function
 *
 * Function called for each pad when using gst_element_foreach_sink_pad(),
 * gst_element_foreach_src_pad(), or gst_element_foreach_pad().
 *
 * Returns: %FALSE to stop iterating pads, %TRUE to continue
 *
 * Since: 1.14
 */
typedef gboolean (*GstElementForeachPadFunc) (GstElement * element,
                                              GstPad     * pad,
                                              gpointer     user_data);

extern
gboolean                gst_element_foreach_sink_pad    (GstElement * element,
                                                         GstElementForeachPadFunc func,
                                                         gpointer     user_data);
extern
gboolean                gst_element_foreach_src_pad     (GstElement * element,
                                                         GstElementForeachPadFunc func,
                                                         gpointer     user_data);
extern
gboolean                gst_element_foreach_pad         (GstElement * element,
                                                         GstElementForeachPadFunc func,
                                                         gpointer     user_data);
/* event/query/format stuff */

extern
gboolean                gst_element_send_event          (GstElement *element, GstEvent *event);

extern
gboolean                gst_element_seek                (GstElement *element, gdouble rate,
                                                         GstFormat format, GstSeekFlags flags,
                                                         GstSeekType start_type, gint64 start,
                                                         GstSeekType stop_type, gint64 stop);
extern
gboolean                gst_element_query               (GstElement *element, GstQuery *query);

/* messages */

extern
gboolean                gst_element_post_message        (GstElement * element, GstMessage * message);

/* error handling */
/* gcc versions < 3.3 warn about NULL being passed as format to printf */
#if (!defined(__GNUC__) || (__GNUC__ < 3) || (__GNUC__ == 3 && __GNUC_MINOR__ < 3))
extern
gchar *                 _gst_element_error_printf       (const gchar *format, ...);
#else
extern
gchar *                 _gst_element_error_printf       (const gchar *format, ...) ;// (1, 2);
#endif

extern
void                    gst_element_message_full        (GstElement * element, GstMessageType type,
                                                         GQuark domain, gint code, gchar * text,
                                                         gchar * debug, const gchar * file,
                                                         const gchar * function, gint line);
extern
void                    gst_element_message_full_with_details (GstElement * element, GstMessageType type,
                                                         GQuark domain, gint code, gchar * text,
                                                         gchar * debug, const gchar * file,
                                                         const gchar * function, gint line,
                                                         GstStructure * structure);

/* state management */

extern
gboolean                gst_element_is_locked_state     (GstElement *element);

extern
gboolean                gst_element_set_locked_state    (GstElement *element, gboolean locked_state);

extern
gboolean                gst_element_sync_state_with_parent (GstElement *element);

extern
GstStateChangeReturn    gst_element_get_state           (GstElement * element,
                                                         GstState * state,
                                                         GstState * pending,
                                                         GstClockTime timeout);
extern
GstStateChangeReturn    gst_element_set_state           (GstElement *element, GstState state);

extern
void                    gst_element_abort_state         (GstElement * element);

extern
GstStateChangeReturn    gst_element_change_state        (GstElement * element,
                                                         GstStateChange transition);

extern
GstStateChangeReturn    gst_element_continue_state      (GstElement * element,
                                                         GstStateChangeReturn ret);
extern
void                    gst_element_lost_state          (GstElement * element);


/**
 * GstElementCallAsyncFunc:
 * @element: The #GstElement this function has been called against
 * @user_data: Data passed in the function where that callback has been passed
 *
 * Callback prototype used in #gst_element_call_async
 *
 * Deprecated: 1.28: Use #GstObjectCallAsyncFunc with gst_object_call_async()
 * or #GstCallAsyncFunc with gst_call_async() instead.
 */
typedef void          (*GstElementCallAsyncFunc)        (GstElement * element,
                                                         gpointer     user_data);
extern //xxxxxGLIB_DEPRECATED_IN(gst_object_call_async)
void                    gst_element_call_async          (GstElement * element,
                                                         GstElementCallAsyncFunc func, gpointer user_data,
                                                         GDestroyNotify destroy_notify);

/* factory management */

extern
GstElementFactory*      gst_element_get_factory         (GstElement *element);

/* utility functions */

extern
gulong                  gst_element_add_property_notify_watch (GstElement  * element,
                                                               const gchar * property_name,
                                                               gboolean      include_value);
extern
gulong                  gst_element_add_property_deep_notify_watch (GstElement  * element,
                                                                    const gchar * property_name,
                                                                    gboolean      include_value);
extern
void                    gst_element_remove_property_notify_watch (GstElement * element,
                                                                  gulong       watch_id);

extern
GstPadTemplate*         gst_element_get_pad_template           (GstElement *element, const gchar *name);

extern
GList*                  gst_element_get_pad_template_list      (GstElement *element);
extern
const gchar *           gst_element_get_metadata               (GstElement * element, const gchar * key);

////////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstElement, gst_object_unref)



#endif /* __GST_ELEMENT_H__ */
