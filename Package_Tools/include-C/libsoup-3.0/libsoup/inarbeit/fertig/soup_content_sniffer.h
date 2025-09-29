/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*- */
/*
 * Copyright (C) 2009 Gustavo Noronha Silva.
 */

#pragma once

#include "soup-types.h"
#include "soup-message-body.h"



#define SOUP_TYPE_CONTENT_SNIFFER (soup_content_sniffer_get_type ())
//G_DECLARE_FINAL_TYPE (SoupContentSniffer, soup_content_sniffer, SOUP, CONTENT_SNIFFER, GObject)

extern
SoupContentSniffer *soup_content_sniffer_new   (void);

extern
char               *soup_content_sniffer_sniff (SoupContentSniffer  *sniffer,
                                                SoupMessage         *msg,
                                                GBytes              *buffer,
                                                GHashTable         **params);



