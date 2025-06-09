
unit efl_net_socket_simple_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_net_socket_simple_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_net_socket_simple_eo.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PEfl_Class  = ^Efl_Class;
PEfl_Net_Socket_Simple  = ^Efl_Net_Socket_Simple;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_NET_SOCKET_SIMPLE_EO_H_}
{$define _EFL_NET_SOCKET_SIMPLE_EO_H_}
{$ifndef _EFL_NET_SOCKET_SIMPLE_EO_CLASS_TYPE}
{$define _EFL_NET_SOCKET_SIMPLE_EO_CLASS_TYPE}
type
  PEfl_Net_Socket_Simple = ^TEfl_Net_Socket_Simple;
  TEfl_Net_Socket_Simple = TEo;
{$endif}
{$ifndef _EFL_NET_SOCKET_SIMPLE_EO_TYPES}
{$define _EFL_NET_SOCKET_SIMPLE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A wrapper socket offering an easy to use, buffered I/O.
 *
 * The simple socket encapsulates an actual @ref Efl_Net_Socket and uses it
 * with an @ref Efl_Io_Buffered_Stream, which creates an input
 * @ref Efl_Io_Queue and an output @ref Efl_Io_Queue. These are linked using a
 * receiver and a sender @ref Efl_Io_Copier.
 *
 * The idea is that unlike the traditional @ref Efl_Net_Socket which attempts
 * to write directly to socket and thus may take less data than requested, this
 * one will keep the pending data in its own buffer, feeding to the actual
 * socket when @ref efl_io_writer_can_write_get. This makes its operation much
 * simpler as @ref efl_io_writer_write will always take the full data -- allows
 * "write and forget", if unlimited (see
 * @ref efl_io_buffered_stream_max_queue_size_output_get).
 *
 * Reading is also much simpler since received data is kept in an
 * @ref Efl_Io_Queue, thus its size can be queried with
 * @ref efl_io_buffered_stream_pending_read_get and read with
 * @ref efl_io_reader_read or peeked with
 * @ref efl_io_buffered_stream_slice_get, then discarded with
 * @ref efl_io_buffered_stream_discard or @ref efl_io_buffered_stream_clear.
 *
 * When waiting for a complete message, you can just peek at its contents: if
 * incomplete do nothing, if complete then use either @ref efl_io_reader_read
 * to get a copy or manipulate a read-only reference from
 * @ref efl_io_buffered_stream_slice_get and then
 * @ref efl_io_buffered_stream_discard
 *
 * The actual socket is set with the constructor method
 * @ref efl_io_buffered_stream_inner_io_set and can be retrieved with
 * @ref efl_io_buffered_stream_inner_io_get, which should be used with care.
 *
 * @ingroup Efl_Net_Socket_Simple
  }

{ was #define dname def_expr }
function EFL_NET_SOCKET_SIMPLE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_net_socket_simple_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_NET_SOCKET_SIMPLE_CLASS : longint; { return type might be wrong }
  begin
    EFL_NET_SOCKET_SIMPLE_CLASS:=efl_net_socket_simple_class_get;
  end;


end.
