/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright 2021 Igalia S.L.
 */

#pragma once

#include "soup-types.h"



typedef struct _SoupMessageMetrics SoupMessageMetrics;

extern
GType soup_message_metrics_get_type (void);
#define SOUP_TYPE_MESSAGE_METRICS (soup_message_metrics_get_type())

extern
SoupMessageMetrics *soup_message_metrics_copy               (SoupMessageMetrics *metrics);

extern
void                soup_message_metrics_free               (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_fetch_start    (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_dns_start      (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_dns_end        (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_connect_start  (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_connect_end    (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_tls_start      (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_request_start  (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_response_start (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_response_end   (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_request_header_bytes_sent      (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_request_body_size              (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_request_body_bytes_sent        (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_response_header_bytes_received (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_response_body_size             (SoupMessageMetrics *metrics);

extern
guint64             soup_message_metrics_get_response_body_bytes_received   (SoupMessageMetrics *metrics);



