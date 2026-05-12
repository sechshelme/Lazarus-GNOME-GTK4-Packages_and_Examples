/*
 * Copyright 2015 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "mongoc-prelude.h"

#ifndef MONGOC_APM_H
#define MONGOC_APM_H

#include <bson/bson.h>

#include "mongoc-macros.h"
#include "mongoc-host-list.h"
#include "mongoc-server-description.h"
#include "mongoc-topology-description.h"



/*
 * Application Performance Management (APM) interface, complies with two specs.
 * MongoDB's Command Logging and Monitoring Spec:
 *
 * https://github.com/mongodb/specifications/tree/master/source/command-logging-and-monitoring
 *
 * MongoDB's Spec for Monitoring Server Discovery and Monitoring (SDAM) events:
 *
 * https://github.com/mongodb/specifications/tree/master/source/server-discovery-and-monitoring
 *
 */

/*
 * callbacks to receive APM events
 */

typedef struct _mongoc_apm_callbacks_t mongoc_apm_callbacks_t;


/*
 * command monitoring events
 */

typedef struct _mongoc_apm_command_started_t mongoc_apm_command_started_t;
typedef struct _mongoc_apm_command_succeeded_t mongoc_apm_command_succeeded_t;
typedef struct _mongoc_apm_command_failed_t mongoc_apm_command_failed_t;


/*
 * SDAM monitoring events
 */

typedef struct _mongoc_apm_server_changed_t mongoc_apm_server_changed_t;
typedef struct _mongoc_apm_server_opening_t mongoc_apm_server_opening_t;
typedef struct _mongoc_apm_server_closed_t mongoc_apm_server_closed_t;
typedef struct _mongoc_apm_topology_changed_t mongoc_apm_topology_changed_t;
typedef struct _mongoc_apm_topology_opening_t mongoc_apm_topology_opening_t;
typedef struct _mongoc_apm_topology_closed_t mongoc_apm_topology_closed_t;
typedef struct _mongoc_apm_server_heartbeat_started_t
   mongoc_apm_server_heartbeat_started_t;
typedef struct _mongoc_apm_server_heartbeat_succeeded_t
   mongoc_apm_server_heartbeat_succeeded_t;
typedef struct _mongoc_apm_server_heartbeat_failed_t
   mongoc_apm_server_heartbeat_failed_t;

/*
 * event field accessors
 */

/* command-started event fields */

extern const bson_t *
mongoc_apm_command_started_get_command (
   const mongoc_apm_command_started_t *event);
extern const char *
mongoc_apm_command_started_get_database_name (
   const mongoc_apm_command_started_t *event);
extern const char *
mongoc_apm_command_started_get_command_name (
   const mongoc_apm_command_started_t *event);
extern int64_t
mongoc_apm_command_started_get_request_id (
   const mongoc_apm_command_started_t *event);
extern int64_t
mongoc_apm_command_started_get_operation_id (
   const mongoc_apm_command_started_t *event);
extern const mongoc_host_list_t *
mongoc_apm_command_started_get_host (const mongoc_apm_command_started_t *event);
extern uint32_t
mongoc_apm_command_started_get_server_id (
   const mongoc_apm_command_started_t *event);
extern const bson_oid_t *
mongoc_apm_command_started_get_service_id (
   const mongoc_apm_command_started_t *event);
extern int32_t
mongoc_apm_command_started_get_server_connection_id (
   const mongoc_apm_command_started_t *event);
//xxxxxxxxxxxxxxx   ;//xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (      "mongoc_apm_command_started_get_server_connection_id_int64");
extern int64_t
mongoc_apm_command_started_get_server_connection_id_int64 (
   const mongoc_apm_command_started_t *event);
extern void *
mongoc_apm_command_started_get_context (
   const mongoc_apm_command_started_t *event);

/* command-succeeded event fields */

extern int64_t
mongoc_apm_command_succeeded_get_duration (
   const mongoc_apm_command_succeeded_t *event);
extern const bson_t *
mongoc_apm_command_succeeded_get_reply (
   const mongoc_apm_command_succeeded_t *event);
extern const char *
mongoc_apm_command_succeeded_get_command_name (
   const mongoc_apm_command_succeeded_t *event);
extern int64_t
mongoc_apm_command_succeeded_get_request_id (
   const mongoc_apm_command_succeeded_t *event);
extern int64_t
mongoc_apm_command_succeeded_get_operation_id (
   const mongoc_apm_command_succeeded_t *event);
extern const mongoc_host_list_t *
mongoc_apm_command_succeeded_get_host (
   const mongoc_apm_command_succeeded_t *event);
extern uint32_t
mongoc_apm_command_succeeded_get_server_id (
   const mongoc_apm_command_succeeded_t *event);
extern const bson_oid_t *
mongoc_apm_command_succeeded_get_service_id (
   const mongoc_apm_command_succeeded_t *event);
extern int32_t
mongoc_apm_command_succeeded_get_server_connection_id (
   const mongoc_apm_command_succeeded_t *event);
//xxxxxxxxxxxx   ;//xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (      "mongoc_apm_command_succeeded_get_server_connection_id_int64");
extern int64_t
mongoc_apm_command_succeeded_get_server_connection_id_int64 (
   const mongoc_apm_command_succeeded_t *event);
extern void *
mongoc_apm_command_succeeded_get_context (
   const mongoc_apm_command_succeeded_t *event);

/* command-failed event fields */

extern int64_t
mongoc_apm_command_failed_get_duration (
   const mongoc_apm_command_failed_t *event);
extern const char *
mongoc_apm_command_failed_get_command_name (
   const mongoc_apm_command_failed_t *event);
/* retrieve the error by filling out the passed-in "error" struct */
extern void
mongoc_apm_command_failed_get_error (const mongoc_apm_command_failed_t *event,
                                     bson_error_t *error);
extern const bson_t *
mongoc_apm_command_failed_get_reply (const mongoc_apm_command_failed_t *event);
extern int64_t
mongoc_apm_command_failed_get_request_id (
   const mongoc_apm_command_failed_t *event);
extern int64_t
mongoc_apm_command_failed_get_operation_id (
   const mongoc_apm_command_failed_t *event);
extern const mongoc_host_list_t *
mongoc_apm_command_failed_get_host (const mongoc_apm_command_failed_t *event);
extern uint32_t
mongoc_apm_command_failed_get_server_id (
   const mongoc_apm_command_failed_t *event);
extern const bson_oid_t *
mongoc_apm_command_failed_get_service_id (
   const mongoc_apm_command_failed_t *event);
extern int32_t
mongoc_apm_command_failed_get_server_connection_id (
   const mongoc_apm_command_failed_t *event);
//xxxxxxxxxxx   ;//xxxxxxxx BSON_GNUC_DEPRECATED;_FOR (      "mongoc_apm_command_failed_get_server_connection_id_int64");
extern int64_t
mongoc_apm_command_failed_get_server_connection_id_int64 (
   const mongoc_apm_command_failed_t *event);
extern void *
mongoc_apm_command_failed_get_context (
   const mongoc_apm_command_failed_t *event);

/* server-changed event fields */

extern const mongoc_host_list_t *
mongoc_apm_server_changed_get_host (const mongoc_apm_server_changed_t *event);
extern void
mongoc_apm_server_changed_get_topology_id (
   const mongoc_apm_server_changed_t *event, bson_oid_t *topology_id);
extern const mongoc_server_description_t *
mongoc_apm_server_changed_get_previous_description (
   const mongoc_apm_server_changed_t *event);
extern const mongoc_server_description_t *
mongoc_apm_server_changed_get_new_description (
   const mongoc_apm_server_changed_t *event);
extern void *
mongoc_apm_server_changed_get_context (
   const mongoc_apm_server_changed_t *event);

/* server-opening event fields */

extern const mongoc_host_list_t *
mongoc_apm_server_opening_get_host (const mongoc_apm_server_opening_t *event);
extern void
mongoc_apm_server_opening_get_topology_id (
   const mongoc_apm_server_opening_t *event, bson_oid_t *topology_id);
extern void *
mongoc_apm_server_opening_get_context (
   const mongoc_apm_server_opening_t *event);

/* server-closed event fields */

extern const mongoc_host_list_t *
mongoc_apm_server_closed_get_host (const mongoc_apm_server_closed_t *event);
extern void
mongoc_apm_server_closed_get_topology_id (
   const mongoc_apm_server_closed_t *event, bson_oid_t *topology_id);
extern void *
mongoc_apm_server_closed_get_context (const mongoc_apm_server_closed_t *event);

/* topology-changed event fields */

extern void
mongoc_apm_topology_changed_get_topology_id (
   const mongoc_apm_topology_changed_t *event, bson_oid_t *topology_id);
extern const mongoc_topology_description_t *
mongoc_apm_topology_changed_get_previous_description (
   const mongoc_apm_topology_changed_t *event);
extern const mongoc_topology_description_t *
mongoc_apm_topology_changed_get_new_description (
   const mongoc_apm_topology_changed_t *event);
extern void *
mongoc_apm_topology_changed_get_context (
   const mongoc_apm_topology_changed_t *event);

/* topology-opening event field */

extern void
mongoc_apm_topology_opening_get_topology_id (
   const mongoc_apm_topology_opening_t *event, bson_oid_t *topology_id);
extern void *
mongoc_apm_topology_opening_get_context (
   const mongoc_apm_topology_opening_t *event);

/* topology-closed event field */

extern void
mongoc_apm_topology_closed_get_topology_id (
   const mongoc_apm_topology_closed_t *event, bson_oid_t *topology_id);
extern void *
mongoc_apm_topology_closed_get_context (
   const mongoc_apm_topology_closed_t *event);

/* heartbeat-started event field */

extern const mongoc_host_list_t *
mongoc_apm_server_heartbeat_started_get_host (
   const mongoc_apm_server_heartbeat_started_t *event);
extern void *
mongoc_apm_server_heartbeat_started_get_context (
   const mongoc_apm_server_heartbeat_started_t *event);
extern bool
mongoc_apm_server_heartbeat_started_get_awaited (
   const mongoc_apm_server_heartbeat_started_t *event);

/* heartbeat-succeeded event fields */

extern int64_t
mongoc_apm_server_heartbeat_succeeded_get_duration (
   const mongoc_apm_server_heartbeat_succeeded_t *event);
extern const bson_t *
mongoc_apm_server_heartbeat_succeeded_get_reply (
   const mongoc_apm_server_heartbeat_succeeded_t *event);
extern const mongoc_host_list_t *
mongoc_apm_server_heartbeat_succeeded_get_host (
   const mongoc_apm_server_heartbeat_succeeded_t *event);
extern void *
mongoc_apm_server_heartbeat_succeeded_get_context (
   const mongoc_apm_server_heartbeat_succeeded_t *event);
extern bool
mongoc_apm_server_heartbeat_succeeded_get_awaited (
   const mongoc_apm_server_heartbeat_succeeded_t *event);

/* heartbeat-failed event fields */

extern int64_t
mongoc_apm_server_heartbeat_failed_get_duration (
   const mongoc_apm_server_heartbeat_failed_t *event);
extern void
mongoc_apm_server_heartbeat_failed_get_error (
   const mongoc_apm_server_heartbeat_failed_t *event, bson_error_t *error);
extern const mongoc_host_list_t *
mongoc_apm_server_heartbeat_failed_get_host (
   const mongoc_apm_server_heartbeat_failed_t *event);
extern void *
mongoc_apm_server_heartbeat_failed_get_context (
   const mongoc_apm_server_heartbeat_failed_t *event);
extern bool
mongoc_apm_server_heartbeat_failed_get_awaited (
   const mongoc_apm_server_heartbeat_failed_t *event);


/*
 * callbacks
 */

typedef void (*mongoc_apm_command_started_cb_t) (
   const mongoc_apm_command_started_t *event);
typedef void (*mongoc_apm_command_succeeded_cb_t) (
   const mongoc_apm_command_succeeded_t *event);
typedef void (*mongoc_apm_command_failed_cb_t) (
   const mongoc_apm_command_failed_t *event);
typedef void (*mongoc_apm_server_changed_cb_t) (
   const mongoc_apm_server_changed_t *event);
typedef void (*mongoc_apm_server_opening_cb_t) (
   const mongoc_apm_server_opening_t *event);
typedef void (*mongoc_apm_server_closed_cb_t) (
   const mongoc_apm_server_closed_t *event);
typedef void (*mongoc_apm_topology_changed_cb_t) (
   const mongoc_apm_topology_changed_t *event);
typedef void (*mongoc_apm_topology_opening_cb_t) (
   const mongoc_apm_topology_opening_t *event);
typedef void (*mongoc_apm_topology_closed_cb_t) (
   const mongoc_apm_topology_closed_t *event);
typedef void (*mongoc_apm_server_heartbeat_started_cb_t) (
   const mongoc_apm_server_heartbeat_started_t *event);
typedef void (*mongoc_apm_server_heartbeat_succeeded_cb_t) (
   const mongoc_apm_server_heartbeat_succeeded_t *event);
typedef void (*mongoc_apm_server_heartbeat_failed_cb_t) (
   const mongoc_apm_server_heartbeat_failed_t *event);

/*
 * registering callbacks
 */

extern mongoc_apm_callbacks_t *
mongoc_apm_callbacks_new (void);
extern void
mongoc_apm_callbacks_destroy (mongoc_apm_callbacks_t *callbacks);
extern void
mongoc_apm_set_command_started_cb (mongoc_apm_callbacks_t *callbacks,
                                   mongoc_apm_command_started_cb_t cb);
extern void
mongoc_apm_set_command_succeeded_cb (mongoc_apm_callbacks_t *callbacks,
                                     mongoc_apm_command_succeeded_cb_t cb);
extern void
mongoc_apm_set_command_failed_cb (mongoc_apm_callbacks_t *callbacks,
                                  mongoc_apm_command_failed_cb_t cb);
extern void
mongoc_apm_set_server_changed_cb (mongoc_apm_callbacks_t *callbacks,
                                  mongoc_apm_server_changed_cb_t cb);
extern void
mongoc_apm_set_server_opening_cb (mongoc_apm_callbacks_t *callbacks,
                                  mongoc_apm_server_opening_cb_t cb);
extern void
mongoc_apm_set_server_closed_cb (mongoc_apm_callbacks_t *callbacks,
                                 mongoc_apm_server_closed_cb_t cb);
extern void
mongoc_apm_set_topology_changed_cb (mongoc_apm_callbacks_t *callbacks,
                                    mongoc_apm_topology_changed_cb_t cb);
extern void
mongoc_apm_set_topology_opening_cb (mongoc_apm_callbacks_t *callbacks,
                                    mongoc_apm_topology_opening_cb_t cb);
extern void
mongoc_apm_set_topology_closed_cb (mongoc_apm_callbacks_t *callbacks,
                                   mongoc_apm_topology_closed_cb_t cb);
extern void
mongoc_apm_set_server_heartbeat_started_cb (
   mongoc_apm_callbacks_t *callbacks,
   mongoc_apm_server_heartbeat_started_cb_t cb);
extern void
mongoc_apm_set_server_heartbeat_succeeded_cb (
   mongoc_apm_callbacks_t *callbacks,
   mongoc_apm_server_heartbeat_succeeded_cb_t cb);
extern void
mongoc_apm_set_server_heartbeat_failed_cb (
   mongoc_apm_callbacks_t *callbacks,
   mongoc_apm_server_heartbeat_failed_cb_t cb);


#endif /* MONGOC_APM_H */
