#ifndef _ECORE_IPC_H
#define _ECORE_IPC_H

#include <Eina.h>

#ifdef extern
# undef extern
#endif



/**
 * @defgroup Ecore_IPC_Group Ecore_IPC - Ecore inter-process communication functions.
 * @ingroup Ecore
 *
 * Functions that set up and shut down the Ecore IPC Library.
 *
 * @{
 */

#ifdef __cplusplus
extern "C" {
#endif

typedef struct _Ecore_Ipc_Server Ecore_Ipc_Server; /**< An IPC connection handle */
typedef struct _Ecore_Ipc_Client Ecore_Ipc_Client; /**< An IPC connection handle */

extern unsigned short     _ecore_ipc_swap_16(unsigned short v);// EINA_DEPRECATED;
extern unsigned int       _ecore_ipc_swap_32(unsigned int v);// EINA_DEPRECATED;
extern unsigned long long _ecore_ipc_swap_64(unsigned long long v);// EINA_DEPRECATED;

#ifdef WORDS_BIGENDIAN
#define ECORE_IPC_SWAP2NET64(x) eina_swap64(x)
#define ECORE_IPC_SWAP2CPU64(x) eina_swap64(x)
#define ECORE_IPC_SWAP2NET32(x) eina_swap32(x)
#define ECORE_IPC_SWAP2CPU32(x) eina_swap32(x)
#define ECORE_IPC_SWAP2NET16(x) eina_swap16(x)
#define ECORE_IPC_SWAP2CPU16(x) eina_swap16(x)
#define ECORE_IPC_SWAP2NET8(x) (x)
#define ECORE_IPC_SWAP2CPU8(x) (x)
#else
#define ECORE_IPC_SWAP2NET64(x) (x)
#define ECORE_IPC_SWAP2CPU64(x) (x)
#define ECORE_IPC_SWAP2NET32(x) (x)
#define ECORE_IPC_SWAP2CPU32(x) (x)
#define ECORE_IPC_SWAP2NET16(x) (x)
#define ECORE_IPC_SWAP2CPU16(x) (x)
#define ECORE_IPC_SWAP2NET8(x) (x)
#define ECORE_IPC_SWAP2CPU8(x) (x)
#endif

/* 1, 2, 4 and 8 byte datatypes */
/* unpacking */
/* padding data */

/* strings */

/* handy to calculate what sized block we need to alloc */


/**
 * @typedef Ecore_Ipc_Type
 *
 * Enum containing IPC types.
 */
typedef enum _Ecore_Ipc_Type
{
   ECORE_IPC_LOCAL_USER,
   ECORE_IPC_LOCAL_SYSTEM,
   ECORE_IPC_REMOTE_SYSTEM,
   ECORE_IPC_USE_SSL = (1 << 4),
   ECORE_IPC_NO_PROXY = (1 << 5)
} Ecore_Ipc_Type;

typedef struct _Ecore_Ipc_Event_Client_Add  Ecore_Ipc_Event_Client_Add;
typedef struct _Ecore_Ipc_Event_Client_Del  Ecore_Ipc_Event_Client_Del;
typedef struct _Ecore_Ipc_Event_Server_Add  Ecore_Ipc_Event_Server_Add;
typedef struct _Ecore_Ipc_Event_Server_Del  Ecore_Ipc_Event_Server_Del;
typedef struct _Ecore_Ipc_Event_Client_Data Ecore_Ipc_Event_Client_Data;
typedef struct _Ecore_Ipc_Event_Server_Data Ecore_Ipc_Event_Server_Data;

/**
 * @struct _Ecore_Ipc_Event_Client_Add
 *
 * An IPC structure for client_add event.
 */
struct _Ecore_Ipc_Event_Client_Add
{
   Ecore_Ipc_Client *client; /**< An IPC connection handle */
};

/**
 * @struct _Ecore_Ipc_Event_Client_Del
 *
 * An IPC structure for client_del event.
 */
struct _Ecore_Ipc_Event_Client_Del
{
   Ecore_Ipc_Client *client; /**< An IPC connection handle */
};

/**
 * @struct _Ecore_Ipc_Event_Server_Add
 *
 * An IPC structure for server_add event.
 */
struct _Ecore_Ipc_Event_Server_Add
{
   Ecore_Ipc_Server *server; /**< An IPC connection handle */
};

/**
 * @struct _Ecore_Ipc_Event_Server_Del
 *
 * An IPC structure for server_del event.
 */
struct _Ecore_Ipc_Event_Server_Del
{
   Ecore_Ipc_Server *server; /**< An IPC connection handle */

};

/**
 * @struct _Ecore_Ipc_Event_Client_Data
 *
 * An IPC structure for client_data event.
 */
struct _Ecore_Ipc_Event_Client_Data
{
   Ecore_Ipc_Client *client; /**< An IPC connection handle */
   /* FIXME: this needs to become an ipc message */
   int               major; /**< The message major opcode number */
   int               minor; /**< The message minor opcode number */
   int               ref; /**< The message reference number */
   int               ref_to; /**< Reference number of the message it refers to */
   int               response; /**< Requires response */
   void             *data; /**< The message data */
   int               size; /**< The data length (in bytes) */
};

/**
 * @struct _Ecore_Ipc_Event_Server_Data
 *
 * An IPC structure for server_data event.
 */
struct _Ecore_Ipc_Event_Server_Data
{
   Ecore_Ipc_Server *server; /**< An IPC connection handle */
   /* FIXME: this needs to become an ipc message */
   int               major; /**< The message major opcode number */
   int               minor; /**< The message minor opcode number */
   int               ref; /**< The message reference number */
   int               ref_to; /**< Reference number of the message it refers to */
   int               response; /**< Requires response */
   void             *data; /**< The message data */
   int               size; /**< The data length (in bytes) */
};

 extern int ECORE_IPC_EVENT_CLIENT_ADD;
extern int ECORE_IPC_EVENT_CLIENT_DEL;
 extern int ECORE_IPC_EVENT_SERVER_ADD;
extern int ECORE_IPC_EVENT_SERVER_DEL;
 extern int ECORE_IPC_EVENT_CLIENT_DATA;
 extern int ECORE_IPC_EVENT_SERVER_DATA;

/**
 * @ingroup Ecore_IPC_Group
 * @brief Initializes the Ecore IPC library.
 * @return  Number of times the library has been initialised without
 *          being shut down.
 */
extern int               ecore_ipc_init(void);

/**
 * @ingroup Ecore_IPC_Group
 * @brief Shuts down the Ecore IPC library.
 * @return  Number of times the library has been initialised without being
 *          shut down.
 */
extern int               ecore_ipc_shutdown(void);

/**
 * @defgroup Ecore_IPC_Server_Group IPC Server Functions
 * @ingroup Ecore_IPC_Group
 *
 * Functions the deal with IPC server objects.
 */

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Creates an IPC server that listens for connections.
 *
 * For more details about the @p type, @p name and @p port
 * parameters, see the @ref ecore_con_server_add documentation.
 *
 * @param   type      The connection type.
 * @param   name       Name to associate with the socket used for connection.
 * @param   port       Number to identify with socket used for connection.
 * @param   data       Data to associate with the IPC server.
 * @return  New IPC server.  If there is an error, @c NULL is returned.
 * @todo    Need to add protocol type parameter to this function.
 */
extern Ecore_Ipc_Server *ecore_ipc_server_add(Ecore_Ipc_Type type, const char *name, int port, const void *data);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Creates an IPC server object to represent the IPC server listening
 * on the given port.
 *
 * For more details about the @p type, @p name and @p port
 * parameters, see the @ref ecore_con_server_connect documentation.
 *
 * @param   type       The IPC connection type.
 * @param   name       Name used to determine which socket to use for the
 *                     IPC connection.
 * @param   port       Number used to identify the socket to use for the
 *                     IPC connection.
 * @param   data       Data to associate with the server.
 * @return  A new IPC server.  @c NULL is returned on error.
 * @todo    Need to add protocol type parameter.
 */
extern Ecore_Ipc_Server *ecore_ipc_server_connect(Ecore_Ipc_Type type, char *name, int port, const void *data);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Closes the connection and frees the given IPC server.
 * @param   svr The given IPC server.
 * @return  The data associated with the server when it was created.
 */
extern void             *ecore_ipc_server_del(Ecore_Ipc_Server *svr);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves the data associated with the given IPC server.
 * @param   svr The given IPC server.
 * @return  The associated data.
 */
extern void             *ecore_ipc_server_data_get(Ecore_Ipc_Server *svr);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves whether the given IPC server is currently connected.
 * @param   svr The given IPC server.
 * @return @c EINA_TRUE if the server is connected, @c EINA_FALSE otherwise.
 */
extern Eina_Bool         ecore_ipc_server_connected_get(Ecore_Ipc_Server *svr);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Retrieves the list of clients for this server.
 * @param   svr The given IPC server.
 * @return  An Eina_List with the clients.
 */
extern Eina_List        *ecore_ipc_server_clients_get(Ecore_Ipc_Server *svr);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Sends a message to the given IPC server.
 *
 * The content of the parameters, excluding the @p svr parameter, is up to
 * the client.
 *
 * @param   svr      The given IPC server.
 * @param   major    Major opcode of the message.
 * @param   minor    Minor opcode of the message.
 * @param   ref      Message reference number.
 * @param   ref_to   Reference number of the message this message refers to.
 * @param   response Requires response.
 * @param   data     The data to send as part of the message.
 * @param   size     Length of the data, in bytes, to send.
 * @return  Number of bytes sent.  @c 0 is returned if there is an error.
 * @todo    This function needs to become an IPC message.
 * @todo Fix up the documentation: Make sure what ref_to and response are.
 */
extern int               ecore_ipc_server_send(Ecore_Ipc_Server *svr, int major, int minor, int ref, int ref_to, int response, const void *data, int size);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Sets a limit on the number of clients that can be handled concurrently
 * by the given server, and a policy on what to do if excess clients try to
 * connect.
 * Beware that if you set this once ecore is already running, you may
 * already have pending CLIENT_ADD events in your event queue.  Those
 * clients have already connected and will not be affected by this call.
 * Only clients subsequently trying to connect will be affected.
 * @param   svr           The given server.
 * @param   client_limit  The maximum number of clients to handle
 *                        concurrently.  -1 means unlimited (default).  0
 *                        effectively disables the server.
 * @param   reject_excess_clients  Set to 1 to automatically disconnect
 *                        excess clients as soon as they connect if you are
 *                        already handling client_limit clients.  Set to 0
 *                        (default) to just hold off on the "accept()"
 *                        system call until the number of active clients
 *                        drops. This causes the kernel to queue up to 4096
 *                        connections (or your kernel's limit, whichever is
 *                        lower).
 */
extern void              ecore_ipc_server_client_limit_set(Ecore_Ipc_Server *svr, int client_limit, char reject_excess_clients);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Sets the max data payload size for an Ipc message in bytes
 *
 * @param   svr           The given server.
 * @param   size          The maximum data payload size in bytes.
 */
extern void              ecore_ipc_server_data_size_max_set(Ecore_Ipc_Server *svr, int size);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Gets the max data payload size for an Ipc message in bytes
 *
 * @param   svr           The given server.
 * @return The maximum data payload in bytes.
 */
extern int               ecore_ipc_server_data_size_max_get(Ecore_Ipc_Server *svr);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Gets the IP address of a server that has been connected to.
 *
 * @param   svr           The given server.
 * @return  A pointer to an internal string that contains the IP address of
 *          the connected server in the form "XXX.YYY.ZZZ.AAA" IP notation.
 *          This string should not be modified or trusted to stay valid after
 *          deletion for the @p svr object. If no IP is known NULL is returned.
 */
extern const char       *ecore_ipc_server_ip_get(Ecore_Ipc_Server *svr);

/**
 * @ingroup Ecore_IPC_Server_Group
 * @brief Flushes all pending data to the given server. Will return when done.
 *
 * @param   svr           The given server.
 */
extern void              ecore_ipc_server_flush(Ecore_Ipc_Server *svr);

/**
 * @defgroup Ecore_IPC_Client_Group IPC Client Functions
 * @ingroup Ecore_IPC_Group
 *
 * Functions that deal with IPC client objects.
 */

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sends a message to the given IPC client.
 *
 * @param   cl       The given IPC client.
 * @param   major    Major opcode of the message.
 * @param   minor    Minor opcode of the message.
 * @param   ref      Reference number of the message.
 * @param   ref_to   Reference number of the message this message refers to.
 * @param   response Requires response.
 * @param   data     The data to send as part of the message.
 * @param   size     Length of the data, in bytes, to send.
 * @return  The number of bytes sent.  @c 0 will be returned if there is
 *          an error.
 * @todo    This function needs to become an IPC message.
 * @todo    Make sure ref_to and response parameters are described correctly.
 */
extern int               ecore_ipc_client_send(Ecore_Ipc_Client *cl, int major, int minor, int ref, int ref_to, int response, const void *data, int size);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Retrieves the IPC server that the given IPC client is connected to.
 *
 * @param   cl The given IPC client.
 * @return  The IPC server the IPC client is connected to.
 */
extern Ecore_Ipc_Server *ecore_ipc_client_server_get(Ecore_Ipc_Client *cl);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Closes the connection and frees memory allocated to the given IPC
 * client.
 *
 * @param   cl The given client.
 * @return  Data associated with the client.
 */
extern void             *ecore_ipc_client_del(Ecore_Ipc_Client *cl);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sets the IPC data associated with the given IPC client to @p data.
 *
 * @param   cl   The given IPC client.
 * @param   data The data to associate with the IPC client.
 */
extern void              ecore_ipc_client_data_set(Ecore_Ipc_Client *cl, const void *data);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Retrieves the data that has been associated with the given IPC client.
 *
 * @param   cl The given client.
 * @return  The data associated with the IPC client.
 */
extern void             *ecore_ipc_client_data_get(Ecore_Ipc_Client *cl);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Sets the max data payload size for an Ipc message in bytes
 *
 * @param   cl        The given client.
 * @param   size          The maximum data payload size in bytes.
 */
extern void              ecore_ipc_client_data_size_max_set(Ecore_Ipc_Client *cl, int size);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Gets the max data payload size for an Ipc message in bytes
 *
 * @param   cl            The given client.
 * @return The maximum data payload size in bytes on success, @c -1 on failure.
 */
extern int               ecore_ipc_client_data_size_max_get(Ecore_Ipc_Client *cl);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Gets the IP address of a client that has been connected to.
 *
 * @param   cl            The given client.
 * @return  A pointer to an internal string that contains the IP address of
 *          the connected server in the form "XXX.YYY.ZZZ.AAA" IP notation.
 *          This string should not be modified or trusted to stay valid after
 *          deletion for the @p cl object. If no IP is known @c NULL is
 *          returned.
 */
extern const char       *ecore_ipc_client_ip_get(Ecore_Ipc_Client *cl);

/**
 * @ingroup Ecore_IPC_Client_Group
 * @brief Flushes all pending data to the given client. Will return when done.
 *
 * @param   cl            The given client.
 */
extern void              ecore_ipc_client_flush(Ecore_Ipc_Client *cl);

/**
 * @ingroup Ecore_Con_Client_Group
 * @brief Returns if SSL support is available
 *
 * @return  1 if SSL is available, 0 if it is not.
 */
extern int               ecore_ipc_ssl_available_get(void);
/* FIXME: need to add a callback to "ok" large ipc messages greater than */
/*        a certain size (security/DOS attack safety) */

#ifdef __cplusplus
}
#endif

/**
 * @}
 */
#endif
