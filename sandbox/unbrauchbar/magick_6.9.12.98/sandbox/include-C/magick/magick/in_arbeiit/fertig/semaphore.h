/*
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore methods to lock and unlock semaphores.
*/
typedef struct SemaphoreInfo
  SemaphoreInfo;

extern  void
  SemaphoreComponentTerminus(void);

extern  MagickBooleanType
  SemaphoreComponentGenesis(void);

extern  SemaphoreInfo
  *AllocateSemaphoreInfo(void);

extern  void
  ActivateSemaphoreInfo(SemaphoreInfo **);
extern  void
  DestroySemaphoreInfo(SemaphoreInfo **);
extern  void
  LockSemaphoreInfo(SemaphoreInfo *);
extern  void
  SemaphoreComponentTerminus(void);
extern  void
  UnlockSemaphoreInfo(SemaphoreInfo *);


