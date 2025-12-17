{$IFDEF read_interface}


type
  TAVSubsampleEncryptionInfo = record
    bytes_of_clear_data: dword;
    bytes_of_protected_data: dword;
  end;
  PAVSubsampleEncryptionInfo = ^TAVSubsampleEncryptionInfo;

  TAVEncryptionInfo = record
    scheme: Tuint32_t;
    crypt_byte_block: Tuint32_t;
    skip_byte_block: Tuint32_t;
    key_id: Puint8_t;
    key_id_size: Tuint32_t;
    iv: Puint8_t;
    iv_size: Tuint32_t;
    subsamples: PAVSubsampleEncryptionInfo;
    subsample_count: Tuint32_t;
  end;
  PAVEncryptionInfo = ^TAVEncryptionInfo;

  PAVEncryptionInitInfo = ^TAVEncryptionInitInfo;
  TAVEncryptionInitInfo = record
    system_id: Puint8_t;
    system_id_size: Tuint32_t;
    key_ids: ^Puint8_t;
    num_key_ids: Tuint32_t;
    key_id_size: Tuint32_t;
    data: Puint8_t;
    data_size: Tuint32_t;
    next: PAVEncryptionInitInfo;
  end;

function av_encryption_info_alloc(subsample_count: Tuint32_t; key_id_size: Tuint32_t; iv_size: Tuint32_t): PAVEncryptionInfo; cdecl; external libavutil;
function av_encryption_info_clone(info: PAVEncryptionInfo): PAVEncryptionInfo; cdecl; external libavutil;
procedure av_encryption_info_free(info: PAVEncryptionInfo); cdecl; external libavutil;
function av_encryption_info_get_side_data(side_data: Puint8_t; side_data_size: Tsize_t): PAVEncryptionInfo; cdecl; external libavutil;
function av_encryption_info_add_side_data(info: PAVEncryptionInfo; side_data_size: Psize_t): Puint8_t; cdecl; external libavutil;
function av_encryption_init_info_alloc(system_id_size: Tuint32_t; num_key_ids: Tuint32_t; key_id_size: Tuint32_t; data_size: Tuint32_t): PAVEncryptionInitInfo; cdecl; external libavutil;
procedure av_encryption_init_info_free(info: PAVEncryptionInitInfo); cdecl; external libavutil;
function av_encryption_init_info_get_side_data(side_data: Puint8_t; side_data_size: Tsize_t): PAVEncryptionInitInfo; cdecl; external libavutil;
function av_encryption_init_info_add_side_data(info: PAVEncryptionInitInfo; side_data_size: Psize_t): Puint8_t; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
