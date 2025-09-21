{$include gmime3/gmime.inc}
{$include gmime3/gmime_version.inc}
{$include gmime3/gmime_error.inc}
{$include gmime3/gmime_filter.inc}
{$include gmime3/gmime_filter_openpgp.inc}
{$include gmime3/gmime_format_options.inc}          // gmime_filter
{$include gmime3/gmime_parser_options.inc}
{$include gmime3/internet_address.inc}              // gmime_format_options,
{$include gmime3/gmime_autocrypt.inc}               // internet_address
{$include gmime3/gmime_stream.inc}
{$include gmime3/gmime_charset.inc}
{$include gmime3/gmime_iconv.inc}                   // MAKRO !!!
{$include gmime3/gmime_iconv_utils.inc}
{$include gmime3/gmime_param.inc}                   // gmime_format_options, gmime_parser_options
{$include gmime3/gmime_content_type.inc}            // gmime_param, gmime_parser_options, gmime_format_options
{$include gmime3/gmime_disposition.inc}             // gmime_param, gmime_parser_options, gmime_format_options
{$include gmime3/gmime_encodings.inc}
{$include gmime3/gmime_data_wrapper.inc}            // gmime_encodings
{$include gmime3/gmime_header.inc}                  // gmime_parser_options, gmime_stream
{$include gmime3/gmime_object.inc}                  // gmime_disposition, gmime_content_type, gmime_header, gmime_stream, gmime_encodings, gmime_parser_options, internet_address, gmime_autocrypt
{$include gmime3/gmime_certificate.inc}
{$include gmime3/gmime_signature.inc}               // gmime_certificate
{$include gmime3/gmime_crypto_context.inc}          // gmime_stream, gmime_certificate, gmime_signature
{$include gmime3/gmime_part.inc}                    // gmime_object, gmime_encodings, gmime_filter_openpgp, gmime_data_wrapper, gmime_crypto_context, gmime_signature
{$include gmime3/gmime_text_part.inc}               // gmime_part
{$include gmime3/gmime_part_iter.inc}
{$include gmime3/gmime_application_pkcs7_mime.inc}  // gmime_part, gmime_object, gmime_crypto_context, gmime_signature
{$include gmime3/gmime_multipart.inc}               // gmime_object, gmime_crypto_context
{$include gmime3/gmime_multipart_encrypted.inc}     // gmime_crypto_context, gmime_object
{$include gmime3/gmime_multipart_signed.inc}        // gmime_multipart, gmime_object, gmime_signature
{$include gmime3/gmime_message.inc}                 // gmime_object, internet_address, gmime_autocrypt, gmime_crypto_context
{$include gmime3/gmime_message_part.inc}            // gmime_object
{$include gmime3/gmime_message_partial.inc}         // gmime_part
{$include gmime3/gmime_parser.inc}                  // gmime_stream, gmime_parser_options, gmime_object, gmime_message
{$include gmime3/gmime_utils.inc}                   // gmime_parser_options, gmime_format_options, gmime_encodings
{$include gmime3/gmime_references.inc}              // gmime_parser_options
{$include gmime3/gmime_stream_buffer.inc}
{$include gmime3/gmime_stream_cat.inc}
{$include gmime3/gmime_stream_file.inc}
{$include gmime3/gmime_stream_filter.inc}
{$include gmime3/gmime_stream_fs.inc}
{$include gmime3/gmime_stream_gio.inc}
{$include gmime3/gmime_stream_mem.inc}
{$include gmime3/gmime_stream_mmap.inc}
{$include gmime3/gmime_stream_null.inc}
{$include gmime3/gmime_stream_pipe.inc}              // gmime_stream
{$include gmime3/gmime_filter_basic.inc}             // gmime_encodings
{$include gmime3/gmime_filter_best.inc}              // gmime_charset, gmime_encodings
{$include gmime3/gmime_filter_charset.inc}
{$include gmime3/gmime_filter_checksum.inc}
{$include gmime3/gmime_filter_dos2unix.inc}
{$include gmime3/gmime_filter_enriched.inc}
{$include gmime3/gmime_filter_from.inc}
{$include gmime3/gmime_filter_gzip.inc}
{$include gmime3/gmime_filter_html.inc}
{$include gmime3/gmime_filter_smtp_data.inc}
{$include gmime3/gmime_filter_strip.inc}
{$include gmime3/gmime_filter_unix2dos.inc}         // gmime_filter
{$include gmime3/gmime_filter_windows.inc}          // gmime_filter
{$include gmime3/gmime_filter_yenc.inc}             // gmime_filter
{$include gmime3/gmime_pkcs7_context.inc}           // gmime_crypto_context
{$include gmime3/gmime_gpg_context.inc}             // gmime_crypto_context



