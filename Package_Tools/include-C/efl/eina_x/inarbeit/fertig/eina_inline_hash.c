

#ifndef EINA_INLINE_HASH_X_
#define EINA_INLINE_HASH_X_

#include "eina_crc.h"

 extern unsigned int eina_seed;

/*
  djb2 hash algorithm was first reported by dan bernstein, and was the old
  default hash function for evas.
 */
static inline int
eina_hash_djb2(const char *key, int len)
{
   unsigned int hash_num = 5381 ^ eina_seed;
   const unsigned char *ptr;

   if (key)
     {
        for (ptr = (unsigned char *)key; len; ptr++, len--)
          hash_num = ((hash_num << 5) + hash_num) ^ *ptr; /* hash * 33 ^ c */
        return (int)hash_num;
     }
   return 0;
}

static inline int
eina_hash_djb2_len(const char *key, int *plen)
{
   unsigned int hash_num = 5381 ^ eina_seed;
   int len = 0;
   const unsigned char *ptr;

   if (key)
     {
        for (ptr = (unsigned char *)key; *ptr; ptr++, len++)
          hash_num = ((hash_num << 5) + hash_num) ^ *ptr; /* hash * 33 ^ c */
        *plen = len + 1;
        return (int)hash_num;
     }
   return 0;
}

static inline int
eina_hash_int32(const unsigned int *pkey, int len)
{
   unsigned int key = *pkey;

   (void) len;

   key  = ~key + (key << 15);
   key ^= key >> 12;
   key += key << 2;
   key ^= key >> 4;
   key *= 2057 ^ eina_seed;
   key ^= key >> 16;
   return key;
}

static inline int
eina_hash_int64(const unsigned long long int *pkey, int len)
{
   unsigned long long int key = *pkey;

   (void) len;

   key  = ~key + (key << 18);
   key ^= key >> 31;
   key *= 21 ^ eina_seed;
   key ^= key >> 11;
   key += key << 6;
   key ^= key >> 22;
   return (int) key;
}

static inline unsigned int _rotl32(unsigned int x, char r)
{
   return (x << r) | (x >> (32 - r));
}

static inline unsigned int _fmix32(unsigned int h)
{
   h ^= h >> 16;
   h *= 0x85ebca6b;
   h ^= h >> 13;
   h *= 0xc2b2ae35;
   h ^= h >> 16;

   return h;
}

static inline int
eina_hash_murmur3(const char *key, int len)
{
   const unsigned char * data = (const unsigned char*)key;
   const int nblocks = len / 4;
   unsigned int h1 = 0, k1;
   unsigned int c1 = 0xcc9e2d51 ^ eina_seed;
   unsigned int c2 = 0x1b873593 ^ eina_seed;
   const unsigned int * blocks = (const unsigned int *)(void*)(data + nblocks*4);
   int i;
   const unsigned char *tail;

   for(i = -nblocks; i; i++)
     {
        k1 = blocks[i];

        k1 *= c1;
        k1 = _rotl32(k1, 15);
        k1 *= c2;

        h1 ^= k1;
        h1 = _rotl32(h1, 13);
        h1 = h1*5+0xe6546b64;
     }

   tail = (const unsigned char*)(data + nblocks*4);

   k1 = 0;

   switch(len & 3)
     {
      case 3:
         k1 ^= tail[2] << 16;
         EINA_FALLTHROUGH;
      case 2:
         k1 ^= tail[1] << 8;
         EINA_FALLTHROUGH;
      case 1:
         k1 ^= tail[0];
         k1 *= c1;
         k1 = _rotl32(k1, 16);
         k1 *= c2;
         h1 ^= k1;
         EINA_FALLTHROUGH;
      default:
         break;
     }

   h1 ^= len;

   return _fmix32(h1);
}

static inline int
eina_hash_crc(const char *key, int len)
{
   unsigned int crc;
   unsigned int seed = 0xFFFFFFFF;

   crc = eina_crc(key, len, seed, EINA_TRUE);
   return (int)crc;
}
#endif
