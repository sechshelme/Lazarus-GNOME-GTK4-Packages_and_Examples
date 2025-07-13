/*
 * $Id$
 *
 * Copyright (c) 1999 Andrew G. Morgan <morgan@linux.kernel.org>
 *
 * This header file provides the prototypes for the PAM client API
 */

#ifndef PAM_CLIENT_H
#define PAM_CLIENT_H

#ifdef __cplusplus
extern "C" {
#endif /* def __cplusplus */

#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <stdint.h>
#include <sys/types.h>

/* opaque agent handling structure */

typedef struct pamc_handle_s *pamc_handle_t;

/* binary prompt structure pointer */
typedef struct { uint32_t length; uint8_t control; }
	 *pamc_bp_t;

/*
 * functions provided by libpamc
 */

/*
 * Initialize the agent abstraction library
 */

pamc_handle_t pamc_start(void);

/*
 * Terminate the authentication process
 */

int pamc_end(pamc_handle_t *pch);

/*
 * force the loading of a specified agent
 */

int pamc_load(pamc_handle_t pch, const char *agent_id);

/*
 * Single conversation interface for binary prompts
 */

int pamc_converse(pamc_handle_t pch, pamc_bp_t *prompt_p);

/*
 * disable an agent
 */

int pamc_disable(pamc_handle_t pch, const char *agent_id);

/*
 * obtain a list of available agents
 */

char **pamc_list_agents(pamc_handle_t pch);

/*
 * PAM_BP_ MACROS for creating, destroying and manipulating binary prompts
 */

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>



/* Control types */

#define PAM_BPC_FALSE   0
#define PAM_BPC_TRUE    1

#define PAM_BPC_OK      0x01   /* continuation packet   */
#define PAM_BPC_SELECT  0x02   /* initialization packet */
#define PAM_BPC_DONE    0x03   /* termination packet    */
#define PAM_BPC_FAIL    0x04   /* unable to execute     */

/* The following control characters are only legal for echanges
   between an agent and a client (it is the responsibility of the
   client to enforce this rule in the face of a rogue server): */

#define PAM_BPC_GETENV  0x41   /* obtain client env.var */
#define PAM_BPC_PUTENV  0x42   /* set client env.var    */
#define PAM_BPC_TEXT    0x43   /* display message       */
#define PAM_BPC_ERROR   0x44   /* display error message */
#define PAM_BPC_PROMPT  0x45   /* echo'd text prompt    */
#define PAM_BPC_PASS    0x46   /* non-echo'd text prompt*/

/* quick check for prompts that are legal for the client (by
   implication the server too) to send to libpamc */

#endif /* def __cplusplus */

#endif /* PAM_CLIENT_H */
