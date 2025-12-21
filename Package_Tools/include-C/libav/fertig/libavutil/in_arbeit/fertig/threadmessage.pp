
unit threadmessage;
interface

{
  Automatically converted by H2Pas 1.0.0 from threadmessage.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    threadmessage.h
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
PAVThreadMessageFlags  = ^AVThreadMessageFlags;
PAVThreadMessageQueue  = ^AVThreadMessageQueue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * This file is part of FFmpeg.
 *
 * FFmpeg is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * FFmpeg is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FFmpeg; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
  }
{$ifndef AVUTIL_THREADMESSAGE_H}
{$define AVUTIL_THREADMESSAGE_H}
type
{*
     * Perform non-blocking operation.
     * If this flag is set, send and recv operations are non-blocking and
     * return AVERROR(EAGAIN) immediately if they can not proceed.
      }

  PAVThreadMessageFlags = ^TAVThreadMessageFlags;
  TAVThreadMessageFlags =  Longint;
  Const
    AV_THREAD_MESSAGE_NONBLOCK = 1;
;
{*
 * Allocate a new message queue.
 *
 * @param mq      pointer to the message queue
 * @param nelem   maximum number of elements in the queue
 * @param elsize  size of each element in the queue
 * @return  >=0 for success; <0 for error, in particular AVERROR(ENOSYS) if
 *          lavu was built without thread support
  }

function av_thread_message_queue_alloc(mq:PPAVThreadMessageQueue; nelem:dword; elsize:dword):longint;cdecl;external;
{*
 * Free a message queue.
 *
 * The message queue must no longer be in use by another thread.
  }
procedure av_thread_message_queue_free(mq:PPAVThreadMessageQueue);cdecl;external;
{*
 * Send a message on the queue.
  }
function av_thread_message_queue_send(mq:PAVThreadMessageQueue; msg:pointer; flags:dword):longint;cdecl;external;
{*
 * Receive a message from the queue.
  }
function av_thread_message_queue_recv(mq:PAVThreadMessageQueue; msg:pointer; flags:dword):longint;cdecl;external;
{*
 * Set the sending error code.
 *
 * If the error code is set to non-zero, av_thread_message_queue_send() will
 * return it immediately. Conventional values, such as AVERROR_EOF or
 * AVERROR(EAGAIN), can be used to cause the sending thread to stop or
 * suspend its operation.
  }
procedure av_thread_message_queue_set_err_send(mq:PAVThreadMessageQueue; err:longint);cdecl;external;
{*
 * Set the receiving error code.
 *
 * If the error code is set to non-zero, av_thread_message_queue_recv() will
 * return it immediately when there are no longer available messages.
 * Conventional values, such as AVERROR_EOF or AVERROR(EAGAIN), can be used
 * to cause the receiving thread to stop or suspend its operation.
  }
procedure av_thread_message_queue_set_err_recv(mq:PAVThreadMessageQueue; err:longint);cdecl;external;
{*
 * Set the optional free message callback function which will be called if an
 * operation is removing messages from the queue.
  }
procedure av_thread_message_queue_set_free_func(mq:PAVThreadMessageQueue; free_func:procedure (msg:pointer));cdecl;external;
{*
 * Return the current number of messages in the queue.
 *
 * @return the current number of messages or AVERROR(ENOSYS) if lavu was built
 *         without thread support
  }
function av_thread_message_queue_nb_elems(mq:PAVThreadMessageQueue):longint;cdecl;external;
{*
 * Flush the message queue
 *
 * This function is mostly equivalent to reading and free-ing every message
 * except that it will be done in a single operation (no lock/unlock between
 * reads).
  }
procedure av_thread_message_flush(mq:PAVThreadMessageQueue);cdecl;external;
{$endif}
{ AVUTIL_THREADMESSAGE_H  }

implementation


end.
