{$IFDEF read_interface}


{
 * Copyright © 2020, VideoLAN and librist authors
 * Copyright © 2019-2020 SipRadius LLC
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef LIBRIST_URL_PARAM_H}
{$define LIBRIST_URL_PARAM_H}
{ Rist URL parameter names for peer config  }

const
  RIST_URL_PARAM_BUFFER_SIZE = 'buffer';  
  RIST_URL_PARAM_SECRET = 'secret';  
  RIST_URL_PARAM_AES_TYPE = 'aes-type';  
  RIST_URL_PARAM_BANDWIDTH = 'bandwidth';  
  RIST_URL_PARAM_RET_BANDWIDTH = 'return-bandwidth';  
  RIST_URL_PARAM_REORDER_BUFFER = 'reorder-buffer';  
  RIST_URL_PARAM_RTT = 'rtt';  
  RIST_URL_PARAM_COMPRESSION = 'compression';  
  RIST_URL_PARAM_CNAME = 'cname';  
  RIST_URL_PARAM_VIRT_DST_PORT = 'virt-dst-port';  
  RIST_URL_PARAM_WEIGHT = 'weight';  
  RIST_URL_PARAM_MIFACE = 'miface';  
  RIST_URL_PARAM_SESSION_TIMEOUT = 'session-timeout';  
  RIST_URL_PARAM_KEEPALIVE_INT = 'keepalive-interval';  
  RIST_URL_PARAM_SRP_USERNAME = 'username';  
  RIST_URL_PARAM_SRP_PASSWORD = 'password';  
{ Less common URL parameters  }
  RIST_URL_PARAM_BUFFER_SIZE_MIN = 'buffer-min';  
  RIST_URL_PARAM_BUFFER_SIZE_MAX = 'buffer-max';  
  RIST_URL_PARAM_RTT_MIN = 'rtt-min';  
  RIST_URL_PARAM_RTT_MAX = 'rtt-max';  
  RIST_URL_PARAM_AES_KEY_ROTATION = 'key-rotation';  
  RIST_URL_PARAM_CONGESTION_CONTROL = 'congestion-control';  
  RIST_URL_PARAM_MIN_RETRIES = 'min-retries';  
  RIST_URL_PARAM_MAX_RETRIES = 'max-retries';  
  RIST_URL_PARAM_TIMING_MODE = 'timing-mode';  
{ udp specific parameters  }
  RIST_URL_PARAM_STREAM_ID = 'stream-id';  
  RIST_URL_PARAM_RTP_TIMESTAMP = 'rtp-timestamp';  
  RIST_URL_PARAM_RTP_SEQUENCE = 'rtp-sequence';  
  RIST_URL_PARAM_RTP_OUTPUT_PTYPE = 'rtp-ptype';  
  RIST_URL_PARAM_MULTIPLEX_MODE = 'multiplex-mode';  
  RIST_URL_PARAM_MULTIPLEX_FILTER = 'multiplex-filter';  
{ Rist additional parameter names  }
  RIST_URL_PARAM_VIRT_SRC_PORT = 'virt-src-port';  
  RIST_URL_PARAM_PROFILE = 'profile';  
  RIST_URL_PARAM_VERBOSE_LEVEL = 'verbose-level';  
{$endif}
{ LIBRIST_URL_PARAM_H  }

// === Konventiert am: 15-8-26 19:16:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
