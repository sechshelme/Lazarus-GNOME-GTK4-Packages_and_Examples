
unit nm-ethtool-utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-ethtool-utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-ethtool-utils.h
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


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2018 Red Hat, Inc.
  }
{$ifndef __NM_ETHTOOL_UTILS_H__}
{$define __NM_ETHTOOL_UTILS_H__}
{*************************************************************************** }

const
  NM_ETHTOOL_OPTNAME_FEATURE_ESP_HW_OFFLOAD = 'feature-esp-hw-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_ESP_TX_CSUM_HW_OFFLOAD = 'feature-esp-tx-csum-hw-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_FCOE_MTU = 'feature-fcoe-mtu';  
  NM_ETHTOOL_OPTNAME_FEATURE_GRO = 'feature-gro';  
  NM_ETHTOOL_OPTNAME_FEATURE_GSO = 'feature-gso';  
  NM_ETHTOOL_OPTNAME_FEATURE_HIGHDMA = 'feature-highdma';  
  NM_ETHTOOL_OPTNAME_FEATURE_HW_TC_OFFLOAD = 'feature-hw-tc-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_L2_FWD_OFFLOAD = 'feature-l2-fwd-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_LOOPBACK = 'feature-loopback';  
  NM_ETHTOOL_OPTNAME_FEATURE_LRO = 'feature-lro';  
  NM_ETHTOOL_OPTNAME_FEATURE_MACSEC_HW_OFFLOAD = 'feature-macsec-hw-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_NTUPLE = 'feature-ntuple';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX = 'feature-rx';  
  NM_ETHTOOL_OPTNAME_FEATURE_RXHASH = 'feature-rxhash';  
  NM_ETHTOOL_OPTNAME_FEATURE_RXVLAN = 'feature-rxvlan';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_ALL = 'feature-rx-all';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_FCS = 'feature-rx-fcs';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_GRO_HW = 'feature-rx-gro-hw';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_GRO_LIST = 'feature-rx-gro-list';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_UDP_GRO_FORWARDING = 'feature-rx-udp-gro-forwarding';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_UDP_TUNNEL_PORT_OFFLOAD = 'feature-rx-udp_tunnel-port-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_VLAN_FILTER = 'feature-rx-vlan-filter';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_VLAN_STAG_FILTER = 'feature-rx-vlan-stag-filter';  
  NM_ETHTOOL_OPTNAME_FEATURE_RX_VLAN_STAG_HW_PARSE = 'feature-rx-vlan-stag-hw-parse';  
  NM_ETHTOOL_OPTNAME_FEATURE_SG = 'feature-sg';  
  NM_ETHTOOL_OPTNAME_FEATURE_TLS_HW_RECORD = 'feature-tls-hw-record';  
  NM_ETHTOOL_OPTNAME_FEATURE_TLS_HW_RX_OFFLOAD = 'feature-tls-hw-rx-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_TLS_HW_TX_OFFLOAD = 'feature-tls-hw-tx-offload';  
  NM_ETHTOOL_OPTNAME_FEATURE_TSO = 'feature-tso';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX = 'feature-tx';  
  NM_ETHTOOL_OPTNAME_FEATURE_TXVLAN = 'feature-txvlan';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_CHECKSUM_FCOE_CRC = 'feature-tx-checksum-fcoe-crc';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_CHECKSUM_IPV4 = 'feature-tx-checksum-ipv4';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_CHECKSUM_IPV6 = 'feature-tx-checksum-ipv6';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_CHECKSUM_IP_GENERIC = 'feature-tx-checksum-ip-generic';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_CHECKSUM_SCTP = 'feature-tx-checksum-sctp';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_ESP_SEGMENTATION = 'feature-tx-esp-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_FCOE_SEGMENTATION = 'feature-tx-fcoe-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_GRE_CSUM_SEGMENTATION = 'feature-tx-gre-csum-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_GRE_SEGMENTATION = 'feature-tx-gre-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_GSO_LIST = 'feature-tx-gso-list';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_GSO_PARTIAL = 'feature-tx-gso-partial';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_GSO_ROBUST = 'feature-tx-gso-robust';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_IPXIP4_SEGMENTATION = 'feature-tx-ipxip4-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_IPXIP6_SEGMENTATION = 'feature-tx-ipxip6-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_NOCACHE_COPY = 'feature-tx-nocache-copy';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_SCATTER_GATHER = 'feature-tx-scatter-gather';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_SCATTER_GATHER_FRAGLIST = 'feature-tx-scatter-gather-fraglist';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_SCTP_SEGMENTATION = 'feature-tx-sctp-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_TCP6_SEGMENTATION = 'feature-tx-tcp6-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_TCP_ECN_SEGMENTATION = 'feature-tx-tcp-ecn-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_TCP_MANGLEID_SEGMENTATION = 'feature-tx-tcp-mangleid-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_TCP_SEGMENTATION = 'feature-tx-tcp-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_TUNNEL_REMCSUM_SEGMENTATION = 'feature-tx-tunnel-remcsum-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_UDP_SEGMENTATION = 'feature-tx-udp-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_UDP_TNL_CSUM_SEGMENTATION = 'feature-tx-udp_tnl-csum-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_UDP_TNL_SEGMENTATION = 'feature-tx-udp_tnl-segmentation';  
  NM_ETHTOOL_OPTNAME_FEATURE_TX_VLAN_STAG_HW_INSERT = 'feature-tx-vlan-stag-hw-insert';  
  NM_ETHTOOL_OPTNAME_COALESCE_ADAPTIVE_RX = 'coalesce-adaptive-rx';  
  NM_ETHTOOL_OPTNAME_COALESCE_ADAPTIVE_TX = 'coalesce-adaptive-tx';  
  NM_ETHTOOL_OPTNAME_COALESCE_PKT_RATE_HIGH = 'coalesce-pkt-rate-high';  
  NM_ETHTOOL_OPTNAME_COALESCE_PKT_RATE_LOW = 'coalesce-pkt-rate-low';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_FRAMES = 'coalesce-rx-frames';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_FRAMES_HIGH = 'coalesce-rx-frames-high';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_FRAMES_IRQ = 'coalesce-rx-frames-irq';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_FRAMES_LOW = 'coalesce-rx-frames-low';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_USECS = 'coalesce-rx-usecs';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_USECS_HIGH = 'coalesce-rx-usecs-high';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_USECS_IRQ = 'coalesce-rx-usecs-irq';  
  NM_ETHTOOL_OPTNAME_COALESCE_RX_USECS_LOW = 'coalesce-rx-usecs-low';  
  NM_ETHTOOL_OPTNAME_COALESCE_SAMPLE_INTERVAL = 'coalesce-sample-interval';  
  NM_ETHTOOL_OPTNAME_COALESCE_STATS_BLOCK_USECS = 'coalesce-stats-block-usecs';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_FRAMES = 'coalesce-tx-frames';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_FRAMES_HIGH = 'coalesce-tx-frames-high';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_FRAMES_IRQ = 'coalesce-tx-frames-irq';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_FRAMES_LOW = 'coalesce-tx-frames-low';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_USECS = 'coalesce-tx-usecs';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_USECS_HIGH = 'coalesce-tx-usecs-high';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_USECS_IRQ = 'coalesce-tx-usecs-irq';  
  NM_ETHTOOL_OPTNAME_COALESCE_TX_USECS_LOW = 'coalesce-tx-usecs-low';  
  NM_ETHTOOL_OPTNAME_RING_RX = 'ring-rx';  
  NM_ETHTOOL_OPTNAME_RING_RX_JUMBO = 'ring-rx-jumbo';  
  NM_ETHTOOL_OPTNAME_RING_RX_MINI = 'ring-rx-mini';  
  NM_ETHTOOL_OPTNAME_RING_TX = 'ring-tx';  
  NM_ETHTOOL_OPTNAME_PAUSE_AUTONEG = 'pause-autoneg';  
  NM_ETHTOOL_OPTNAME_PAUSE_RX = 'pause-rx';  
  NM_ETHTOOL_OPTNAME_PAUSE_TX = 'pause-tx';  
  NM_ETHTOOL_OPTNAME_CHANNELS_RX = 'channels-rx';  
  NM_ETHTOOL_OPTNAME_CHANNELS_TX = 'channels-tx';  
  NM_ETHTOOL_OPTNAME_CHANNELS_OTHER = 'channels-other';  
  NM_ETHTOOL_OPTNAME_CHANNELS_COMBINED = 'channels-combined';  
  NM_ETHTOOL_OPTNAME_EEE_ENABLED = 'eee-enabled';  
{*************************************************************************** }
{$endif}
{ __NM_ETHTOOL_UTILS_H__  }

implementation


end.
