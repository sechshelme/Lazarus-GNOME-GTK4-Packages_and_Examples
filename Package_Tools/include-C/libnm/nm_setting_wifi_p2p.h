/* SPDX-License-Identifier: LGPL-2.1-or-later */
/*
 * Copyright (C) 2019 Red Hat, Inc.
 */

#ifndef __NM_SETTING_WIFI_P2P_H__
#define __NM_SETTING_WIFI_P2P_H__

#if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)
#error "Only <NetworkManager.h> can be included directly."
#endif

#include "nm-setting.h"
#include "nm-setting-wireless-security.h"



#define NM_TYPE_SETTING_WIFI_P2P (nm_setting_wifi_p2p_get_type())
#define NM_SETTING_WIFI_P2P(obj) \
    (G_TYPE_CHECK_INSTANCE_CAST((obj), NM_TYPE_SETTING_WIFI_P2P, NMSettingWifiP2P))
#define NM_SETTING_WIFI_P2P_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_CAST((klass), NM_TYPE_SETTING_WIFI_P2P, NMSettingWifiP2PClass))
#define NM_IS_SETTING_WIFI_P2P(obj) (G_TYPE_CHECK_INSTANCE_TYPE((obj), NM_TYPE_SETTING_WIFI_P2P))
#define NM_IS_SETTING_WIFI_P2P_CLASS(klass) \
    (G_TYPE_CHECK_CLASS_TYPE((klass), NM_TYPE_SETTING_WIFI_P2P))
#define NM_SETTING_WIFI_P2P_GET_CLASS(obj) \
    (G_TYPE_INSTANCE_GET_CLASS((obj), NM_TYPE_SETTING_WIFI_P2P, NMSettingWifiP2PClass))

#define NM_SETTING_WIFI_P2P_SETTING_NAME "wifi-p2p"

/**
 * NM_SETTING_WIFI_P2P_PEER:
 *
 * The mac address of the peer to connect to.
 */
#define NM_SETTING_WIFI_P2P_PEER       "peer"
#define NM_SETTING_WIFI_P2P_WPS_METHOD "wps-method"
#define NM_SETTING_WIFI_P2P_WFD_IES    "wfd-ies"

typedef struct _NMSettingWifiP2PClass NMSettingWifiP2PClass;

extern
GType nm_setting_wifi_p2p_get_type(void);

extern
NMSetting *nm_setting_wifi_p2p_new(void);

extern
const char *nm_setting_wifi_p2p_get_peer(NMSettingWifiP2P *setting);

extern
NMSettingWirelessSecurityWpsMethod nm_setting_wifi_p2p_get_wps_method(NMSettingWifiP2P *setting);

extern
GBytes *nm_setting_wifi_p2p_get_wfd_ies(NMSettingWifiP2P *setting);



#endif /* __NM_SETTING_WIFI_P2P_H__ */
