_X_INLINE static uint32_t
xcb_mask(uint32_t n)
{
    return n == 32 ? ~0 : (1 << n) - 1;
}


_X_INLINE static uint32_t
xcb_popcount(uint32_t x)
{
    uint32_t m1 = 0x55555555;
    uint32_t m2 = 0x33333333;
    uint32_t m4 = 0x0f0f0f0f;
    x -= (x >> 1) & m1;
    x = (x & m2) + ((x >> 2) & m2);
    x = (x + (x >> 4)) & m4;
    x += x >> 8;
    return (x + (x >> 16)) & 0x3f;
}


_X_INLINE static uint32_t
xcb_roundup_2 (uint32_t base, uint32_t pad)
{
    return (base + pad - 1) & -pad;
}

_X_INLINE static uint32_t
xcb_rounddown_2 (uint32_t base, uint32_t pad)
{
    return base & -pad;
}

_X_INLINE static uint32_t
xcb_roundup (uint32_t base, uint32_t pad)
{
    uint32_t b = base + pad - 1;
    /* faster if pad is a power of two */
    if (((pad - 1) & pad) == 0)
	return b & -pad;
    return b - b % pad;
}


_X_INLINE static uint32_t
xcb_rounddown (uint32_t base, uint32_t pad)
{
    /* faster if pad is a power of two */
    if (((pad - 1) & pad) == 0)
	return base & -pad;
    return base - base % pad;
}

_X_INLINE static uint32_t
xcb_bit_reverse(uint32_t x, uint8_t n) {
    uint32_t m1 = 0x00ff00ff;
    uint32_t m2 = 0x0f0f0f0f;
    uint32_t m3 = 0x33333333;
    uint32_t m4 = 0x55555555;
    x = ((x << 16) | (x >> 16));
    x = ((x & m1) << 8) | ((x >> 8) & m1);
    x = ((x & m2) << 4) | ((x >> 4) & m2);
    x = ((x & m3) << 2) | ((x >> 2) & m3);
    x = ((x & m4) << 1) | ((x >> 1) & m4);
    x >>= 32 - n;
    return x;
}

_X_INLINE static xcb_image_order_t
xcb_host_byte_order(void) {
  uint32_t           endian_test = 0x01020304;

  switch (*(char *)&endian_test) {
  case 0x01:
      return XCB_IMAGE_ORDER_MSB_FIRST;
  case 0x04:
      return XCB_IMAGE_ORDER_LSB_FIRST;
  }
  assert(0);
}

