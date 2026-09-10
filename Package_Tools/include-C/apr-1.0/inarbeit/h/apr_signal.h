/* Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef APR_SIGNAL_H
#define APR_SIGNAL_H

/**
 * @file apr_signal.h
 * @brief APR Signal Handling
 */



/**xxxxxxxxxxxx*/
typedef void (*apr_sigfunc_t)(int);

/**
 * Set the signal handler function for a given signal
 * @param signo The signal (eg... SIGWINCH)
 * @param func the function to get called
 */
apr_sigfunc_t * apr_signal(int signo, apr_sigfunc_t * func);


/**
 * Get the description for a specific signal number
 * @param signum The signal number
 * @return The description of the signal
 */
const char * apr_signal_description_get(int signum);

/**
 * APR-private function for initializing the signal package
 * @internal
 * @param pglobal The internal, global pool
 */
void apr_signal_init(apr_pool_t *pglobal);

/**
 * Block the delivery of a particular signal
 * @param signum The signal number
 * @return status
 */
apr_status_t apr_signal_block(int signum);

/**
 * Enable the delivery of a particular signal
 * @param signum The signal number
 * @return status
 */
apr_status_t apr_signal_unblock(int signum);

/** @} */

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* APR_SIGNAL_H */
