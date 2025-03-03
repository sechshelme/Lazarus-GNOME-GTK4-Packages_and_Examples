/*
 * Summary: minimal FTP implementation
 * Description: minimal FTP implementation allowing to fetch resources
 *              like external subset.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
 */

#ifndef __NANO_FTP_H__
#define __NANO_FTP_H__

#include <libxml/xmlversion.h>

#ifdef LIBXML_FTP_ENABLED

/* Needed for portability to Windows 64 bits */
#if defined(_WIN32) && !defined(__CYGWIN__)
#include <winsock2.h>
#else
/**
 * SOCKET:
 *
 * macro used to provide portability of code to windows sockets
 */
#define SOCKET int
/**
 * INVALID_SOCKET:
 *
 * macro used to provide portability of code to windows sockets
 * the value to be used when the socket is not valid
 */
#undef  INVALID_SOCKET
#define INVALID_SOCKET (-1)
#endif

#ifdef __cplusplus
extern "C" {
#endif

/**
 * ftpListCallback:
 * @userData:  user provided data for the callback
 * @filename:  the file name (including "->" when links are shown)
 * @attrib:  the attribute string
 * @owner:  the owner string
 * @group:  the group string
 * @size:  the file size
 * @links:  the link count
 * @year:  the year
 * @month:  the month
 * @day:  the day
 * @hour:  the hour
 * @minute:  the minute
 *
 * A callback for the xmlNanoFTPList command.
 * Note that only one of year and day:minute are specified.
 */
typedef void (*ftpListCallback) (void *userData,
	                         const char *filename, const char *attrib,
	                         const char *owner, const char *group,
				 unsigned long size, int links, int year,
				 const char *month, int day, int hour,
				 int minute);
/**
 * ftpDataCallback:
 * @userData: the user provided context
 * @data: the data received
 * @len: its size in bytes
 *
 * A callback for the xmlNanoFTPGet command.
 */
typedef void (*ftpDataCallback) (void *userData,
				 const char *data,
				 int len);

/*
 * Init
 */
extern void 
	xmlNanoFTPInit		(void);
extern void 
	xmlNanoFTPCleanup	(void);

/*
 * Creating/freeing contexts.
 */
extern void * 
	xmlNanoFTPNewCtxt	(const char *URL);
extern void 
	xmlNanoFTPFreeCtxt	(void * ctx);
extern void * 
	xmlNanoFTPConnectTo	(const char *server,
				 int port);
/*
 * Opening/closing session connections.
 */
extern void * 
	xmlNanoFTPOpen		(const char *URL);
extern int 
	xmlNanoFTPConnect	(void *ctx);
extern int 
	xmlNanoFTPClose		(void *ctx);
extern int 
	xmlNanoFTPQuit		(void *ctx);
extern void 
	xmlNanoFTPScanProxy	(const char *URL);
extern void 
	xmlNanoFTPProxy		(const char *host,
				 int port,
				 const char *user,
				 const char *passwd,
				 int type);
extern int 
	xmlNanoFTPUpdateURL	(void *ctx,
				 const char *URL);

/*
 * Rather internal commands.
 */
extern int 
	xmlNanoFTPGetResponse	(void *ctx);
extern int 
	xmlNanoFTPCheckResponse	(void *ctx);

/*
 * CD/DIR/GET handlers.
 */
extern int 
	xmlNanoFTPCwd		(void *ctx,
				 const char *directory);
extern int 
	xmlNanoFTPDele		(void *ctx,
				 const char *file);

extern SOCKET 
	xmlNanoFTPGetConnection	(void *ctx);
extern int 
	xmlNanoFTPCloseConnection(void *ctx);
extern int 
	xmlNanoFTPList		(void *ctx,
				 ftpListCallback callback,
				 void *userData,
				 const char *filename);
extern SOCKET 
	xmlNanoFTPGetSocket	(void *ctx,
				 const char *filename);
extern int 
	xmlNanoFTPGet		(void *ctx,
				 ftpDataCallback callback,
				 void *userData,
				 const char *filename);
extern int 
	xmlNanoFTPRead		(void *ctx,
				 void *dest,
				 int len);

#ifdef __cplusplus
}
#endif
#endif /* LIBXML_FTP_ENABLED */
#endif /* __NANO_FTP_H__ */
