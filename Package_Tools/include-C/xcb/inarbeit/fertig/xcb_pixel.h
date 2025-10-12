
_X_INLINE static void
xcb_image_put_pixel_XY32M (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y,
			  int pixel)
{
  uint32_t   unit = (x >> 3) & ~xcb_mask(2);
  uint32_t   byte = xcb_mask(2) - ((x >> 3) & xcb_mask(2));
  uint32_t   bit = xcb_mask(3) - (x & xcb_mask(3));
  uint8_t    m = 1 << bit;
  uint8_t    p = pixel << bit;
  uint8_t *  bp = image->data + (y * image->stride) + (unit | byte);
  *bp = (*bp & ~m) | p;
}

_X_INLINE static void
xcb_image_put_pixel_XY32L (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y,
			  int pixel)
{
  uint32_t   bit = x & xcb_mask(3);
  uint8_t    m = 1 << bit;
  uint8_t    p = pixel << bit;
  uint8_t *  bp = image->data + (y * image->stride) + (x >> 3);
  *bp = (*bp & ~m) | p;
}

_X_INLINE static int
xcb_image_get_pixel_XY32M (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y)
{
  uint32_t   unit = (x >> 3) & ~xcb_mask(2);
  uint32_t   byte = xcb_mask(2) - ((x >> 3) & xcb_mask(2));
  uint32_t   bit = xcb_mask(3) - (x & xcb_mask(3));
  uint8_t *  bp = image->data + (y * image->stride) + (unit | byte);
  return (*bp >> bit) & 1;
}

_X_INLINE static int
xcb_image_get_pixel_XY32L (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y)
{
  uint32_t   bit = x & xcb_mask(3);
  uint8_t *  bp = image->data + (y * image->stride) + (x >> 3);
  return (*bp >> bit) & 1;
}

_X_INLINE static void
xcb_image_put_pixel_Z8 (xcb_image_t *image,
			uint32_t x,
			uint32_t y,
			uint8_t pixel)
{
  image->data[x + y * image->stride] = pixel;
}

_X_INLINE static uint8_t
xcb_image_get_pixel_Z8 (xcb_image_t *image,
			uint32_t x,
			uint32_t y)
{
  return image->data[x + y * image->stride];
}

_X_INLINE static void
xcb_image_put_pixel_Z32M (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y,
			  uint32_t pixel)
{
  uint8_t *  row = image->data + (y * image->stride);
  row[x << 2] = pixel >> 24;
  row[(x << 2) + 1] = pixel >> 16;
  row[(x << 2) + 2] = pixel >> 8;
  row[(x << 2) + 3] = pixel;
}

_X_INLINE static void
xcb_image_put_pixel_Z32L (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y,
			  uint32_t pixel)
{
  uint8_t *  row = image->data + (y * image->stride);
  row[x << 2] = pixel;
  row[(x << 2) + 1] = pixel >> 8;
  row[(x << 2) + 2] = pixel >> 16;
  row[(x << 2) + 3] = pixel >> 24;
}

_X_INLINE static uint32_t
xcb_image_get_pixel_Z32M (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y)
{
  uint8_t *  row = image->data + (y * image->stride);
  uint32_t    pixel = row[x << 2] << 24;
  pixel |= row[(x << 2) + 1] << 16;
  pixel |= row[(x << 2) + 2] << 8;
  return pixel | row[(x << 2) + 3];
}

_X_INLINE static uint32_t
xcb_image_get_pixel_Z32L (xcb_image_t *image,
			  uint32_t x,
			  uint32_t y)
{
  uint8_t *  row = image->data + (y * image->stride);
  uint32_t    pixel = row[x << 2];
  pixel |= row[(x << 2) + 1] << 8;
  pixel |= row[(x << 2) + 2] << 16;
  return pixel | row[(x << 2) + 3] << 24;
}

