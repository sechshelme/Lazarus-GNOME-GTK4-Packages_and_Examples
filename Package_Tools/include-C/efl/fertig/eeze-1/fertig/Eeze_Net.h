#ifndef EEZE_NET_H
#define EEZE_NET_H

#include <Eina.h>
#include <Ecore.h>

#ifdef extern
# undef extern
#endif

/**
 * @file Eeze_Net.h
 * @brief Network manipulation
 *
 * Eeze net functions allow you to gather information about network objects
 *
 * @defgroup Eeze_Net Net
 * Gather information about network devices.
 *
 * @ingroup Eeze
 * @{
 */

typedef struct Eeze_Net Eeze_Net;

typedef enum
{
   EEZE_NET_ADDR_TYPE_IP,
   EEZE_NET_ADDR_TYPE_IP6,
   EEZE_NET_ADDR_TYPE_BROADCAST,
   EEZE_NET_ADDR_TYPE_BROADCAST6,
   EEZE_NET_ADDR_TYPE_NETMASK,
   EEZE_NET_ADDR_TYPE_NETMASK6,
} Eeze_Net_Addr_Type;

#ifdef __cplusplus
extern "C" {
#endif

extern Eeze_Net   *eeze_net_new(const char *name);
extern void        eeze_net_free(Eeze_Net *net);
extern const char *eeze_net_mac_get(Eeze_Net *net);
extern int         eeze_net_idx_get(Eeze_Net *net);
extern Eina_Bool   eeze_net_scan(Eeze_Net *net);
extern const char *eeze_net_addr_get(Eeze_Net *net, Eeze_Net_Addr_Type type);
extern const char *eeze_net_attribute_get(Eeze_Net *net, const char *attr);
extern const char *eeze_net_syspath_get(Eeze_Net *net);
extern Eina_List  *eeze_net_list(void);


#endif
