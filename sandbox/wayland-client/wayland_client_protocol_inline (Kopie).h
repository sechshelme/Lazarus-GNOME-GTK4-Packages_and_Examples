

static inline int
wl_display_add_listener(struct wl_display *wl_display,
			const struct wl_display_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_display,
				     (void (**)(void)) listener, data);
}

static inline void
wl_display_set_user_data(struct wl_display *wl_display, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_display, user_data);
}

static inline void *
wl_display_get_user_data(struct wl_display *wl_display)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_display);
}

static inline uint32_t
wl_display_get_version(struct wl_display *wl_display)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_display);
}

static inline struct wl_callback *
wl_display_sync(struct wl_display *wl_display)
{
	struct wl_proxy *callback;

	callback = wl_proxy_marshal_flags((struct wl_proxy *) wl_display,
			 WL_DISPLAY_SYNC, &wl_callback_interface, wl_proxy_get_version((struct wl_proxy *) wl_display), 0, NULL);

	return (struct wl_callback *) callback;
}

static inline struct wl_registry *
wl_display_get_registry(struct wl_display *wl_display)
{
	struct wl_proxy *registry;

	registry = wl_proxy_marshal_flags((struct wl_proxy *) wl_display,
			 WL_DISPLAY_GET_REGISTRY, &wl_registry_interface, wl_proxy_get_version((struct wl_proxy *) wl_display), 0, NULL);

	return (struct wl_registry *) registry;
}

static inline int
wl_registry_add_listener(struct wl_registry *wl_registry,
			 const struct wl_registry_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_registry,
				     (void (**)(void)) listener, data);
}

static inline void
wl_registry_set_user_data(struct wl_registry *wl_registry, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_registry, user_data);
}

static inline void *
wl_registry_get_user_data(struct wl_registry *wl_registry)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_registry);
}

static inline uint32_t
wl_registry_get_version(struct wl_registry *wl_registry)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_registry);
}

static inline void
wl_registry_destroy(struct wl_registry *wl_registry)
{
	wl_proxy_destroy((struct wl_proxy *) wl_registry);
}

static inline void *
wl_registry_bind(struct wl_registry *wl_registry, uint32_t name, const struct wl_interface *interface, uint32_t version)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_registry,
			 WL_REGISTRY_BIND, interface, version, 0, name, interface->name, version, NULL);

	return (void *) id;
}

static inline int
wl_callback_add_listener(struct wl_callback *wl_callback,
			 const struct wl_callback_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_callback,
				     (void (**)(void)) listener, data);
}

static inline void
wl_callback_set_user_data(struct wl_callback *wl_callback, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_callback, user_data);
}

static inline void *
wl_callback_get_user_data(struct wl_callback *wl_callback)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_callback);
}

static inline uint32_t
wl_callback_get_version(struct wl_callback *wl_callback)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_callback);
}

/** @ingroup iface_wl_callback */
static inline void
wl_callback_destroy(struct wl_callback *wl_callback)
{
	wl_proxy_destroy((struct wl_proxy *) wl_callback);
}

static inline void
wl_compositor_set_user_data(struct wl_compositor *wl_compositor, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_compositor, user_data);
}

static inline void *
wl_compositor_get_user_data(struct wl_compositor *wl_compositor)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_compositor);
}

static inline uint32_t
wl_compositor_get_version(struct wl_compositor *wl_compositor)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_compositor);
}

static inline void
wl_compositor_destroy(struct wl_compositor *wl_compositor)
{
	wl_proxy_destroy((struct wl_proxy *) wl_compositor);
}

static inline struct wl_surface *
wl_compositor_create_surface(struct wl_compositor *wl_compositor)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_compositor,
			 WL_COMPOSITOR_CREATE_SURFACE, &wl_surface_interface, wl_proxy_get_version((struct wl_proxy *) wl_compositor), 0, NULL);

	return (struct wl_surface *) id;
}

static inline struct wl_region *
wl_compositor_create_region(struct wl_compositor *wl_compositor)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_compositor,
			 WL_COMPOSITOR_CREATE_REGION, &wl_region_interface, wl_proxy_get_version((struct wl_proxy *) wl_compositor), 0, NULL);

	return (struct wl_region *) id;
}

static inline void
wl_shm_pool_set_user_data(struct wl_shm_pool *wl_shm_pool, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_shm_pool, user_data);
}

static inline void *
wl_shm_pool_get_user_data(struct wl_shm_pool *wl_shm_pool)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_shm_pool);
}

static inline uint32_t
wl_shm_pool_get_version(struct wl_shm_pool *wl_shm_pool)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_shm_pool);
}

static inline struct wl_buffer *
wl_shm_pool_create_buffer(struct wl_shm_pool *wl_shm_pool, int32_t offset, int32_t width, int32_t height, int32_t stride, uint32_t format)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_shm_pool,
			 WL_SHM_POOL_CREATE_BUFFER, &wl_buffer_interface, wl_proxy_get_version((struct wl_proxy *) wl_shm_pool), 0, NULL, offset, width, height, stride, format);

	return (struct wl_buffer *) id;
}

static inline void
wl_shm_pool_destroy(struct wl_shm_pool *wl_shm_pool)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shm_pool,
			 WL_SHM_POOL_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shm_pool), WL_MARSHAL_FLAG_DESTROY);
}
static inline void
wl_shm_pool_resize(struct wl_shm_pool *wl_shm_pool, int32_t size)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shm_pool,
			 WL_SHM_POOL_RESIZE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shm_pool), 0, size);
}

static inline int
wl_shm_add_listener(struct wl_shm *wl_shm,
		    const struct wl_shm_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_shm,
				     (void (**)(void)) listener, data);
}

static inline void
wl_shm_set_user_data(struct wl_shm *wl_shm, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_shm, user_data);
}

static inline void *
wl_shm_get_user_data(struct wl_shm *wl_shm)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_shm);
}

static inline uint32_t
wl_shm_get_version(struct wl_shm *wl_shm)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_shm);
}

static inline void
wl_shm_destroy(struct wl_shm *wl_shm)
{
	wl_proxy_destroy((struct wl_proxy *) wl_shm);
}

static inline struct wl_shm_pool *
wl_shm_create_pool(struct wl_shm *wl_shm, int32_t fd, int32_t size)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_shm,
			 WL_SHM_CREATE_POOL, &wl_shm_pool_interface, wl_proxy_get_version((struct wl_proxy *) wl_shm), 0, NULL, fd, size);

	return (struct wl_shm_pool *) id;
}

static inline int
wl_buffer_add_listener(struct wl_buffer *wl_buffer,
		       const struct wl_buffer_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_buffer,
				     (void (**)(void)) listener, data);
}

static inline void
wl_buffer_set_user_data(struct wl_buffer *wl_buffer, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_buffer, user_data);
}

static inline void *
wl_buffer_get_user_data(struct wl_buffer *wl_buffer)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_buffer);
}

static inline uint32_t
wl_buffer_get_version(struct wl_buffer *wl_buffer)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_buffer);
}

static inline void
wl_buffer_destroy(struct wl_buffer *wl_buffer)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_buffer,
			 WL_BUFFER_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_buffer), WL_MARSHAL_FLAG_DESTROY);
}

static inline int
wl_data_offer_add_listener(struct wl_data_offer *wl_data_offer,
			   const struct wl_data_offer_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_data_offer,
				     (void (**)(void)) listener, data);
}

static inline void
wl_data_offer_set_user_data(struct wl_data_offer *wl_data_offer, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_data_offer, user_data);
}

static inline void *
wl_data_offer_get_user_data(struct wl_data_offer *wl_data_offer)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_data_offer);
}

static inline uint32_t
wl_data_offer_get_version(struct wl_data_offer *wl_data_offer)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_data_offer);
}

static inline void
wl_data_offer_accept(struct wl_data_offer *wl_data_offer, uint32_t serial, const char *mime_type)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_offer,
			 WL_DATA_OFFER_ACCEPT, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_offer), 0, serial, mime_type);
}
static inline void
wl_data_offer_receive(struct wl_data_offer *wl_data_offer, const char *mime_type, int32_t fd)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_offer,
			 WL_DATA_OFFER_RECEIVE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_offer), 0, mime_type, fd);
}

static inline void
wl_data_offer_destroy(struct wl_data_offer *wl_data_offer)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_offer,
			 WL_DATA_OFFER_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_offer), WL_MARSHAL_FLAG_DESTROY);
}

static inline void
wl_data_offer_finish(struct wl_data_offer *wl_data_offer)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_offer,
			 WL_DATA_OFFER_FINISH, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_offer), 0);
}

static inline void
wl_data_offer_set_actions(struct wl_data_offer *wl_data_offer, uint32_t dnd_actions, uint32_t preferred_action)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_offer,
			 WL_DATA_OFFER_SET_ACTIONS, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_offer), 0, dnd_actions, preferred_action);
}

static inline int
wl_data_source_add_listener(struct wl_data_source *wl_data_source,
			    const struct wl_data_source_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_data_source,
				     (void (**)(void)) listener, data);
}

static inline void
wl_data_source_set_user_data(struct wl_data_source *wl_data_source, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_data_source, user_data);
}

static inline void *
wl_data_source_get_user_data(struct wl_data_source *wl_data_source)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_data_source);
}

static inline uint32_t
wl_data_source_get_version(struct wl_data_source *wl_data_source)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_data_source);
}

static inline void
wl_data_source_offer(struct wl_data_source *wl_data_source, const char *mime_type)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_source,
			 WL_DATA_SOURCE_OFFER, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_source), 0, mime_type);
}

static inline void
wl_data_source_destroy(struct wl_data_source *wl_data_source)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_source,
			 WL_DATA_SOURCE_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_source), WL_MARSHAL_FLAG_DESTROY);
}

static inline void
wl_data_source_set_actions(struct wl_data_source *wl_data_source, uint32_t dnd_actions)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_source,
			 WL_DATA_SOURCE_SET_ACTIONS, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_source), 0, dnd_actions);
}

static inline int
wl_data_device_add_listener(struct wl_data_device *wl_data_device,
			    const struct wl_data_device_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_data_device,
				     (void (**)(void)) listener, data);
}

static inline void
wl_data_device_set_user_data(struct wl_data_device *wl_data_device, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_data_device, user_data);
}

static inline void *
wl_data_device_get_user_data(struct wl_data_device *wl_data_device)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_data_device);
}

static inline uint32_t
wl_data_device_get_version(struct wl_data_device *wl_data_device)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_data_device);
}

static inline void
wl_data_device_destroy(struct wl_data_device *wl_data_device)
{
	wl_proxy_destroy((struct wl_proxy *) wl_data_device);
}

static inline void
wl_data_device_start_drag(struct wl_data_device *wl_data_device, struct wl_data_source *source, struct wl_surface *origin, struct wl_surface *icon, uint32_t serial)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_device,
			 WL_DATA_DEVICE_START_DRAG, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_device), 0, source, origin, icon, serial);
}

static inline void
wl_data_device_set_selection(struct wl_data_device *wl_data_device, struct wl_data_source *source, uint32_t serial)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_device,
			 WL_DATA_DEVICE_SET_SELECTION, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_device), 0, source, serial);
}

static inline void
wl_data_device_release(struct wl_data_device *wl_data_device)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_data_device,
			 WL_DATA_DEVICE_RELEASE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_data_device), WL_MARSHAL_FLAG_DESTROY);
}

static inline void
wl_data_device_manager_set_user_data(struct wl_data_device_manager *wl_data_device_manager, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_data_device_manager, user_data);
}

static inline void *
wl_data_device_manager_get_user_data(struct wl_data_device_manager *wl_data_device_manager)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_data_device_manager);
}

static inline uint32_t
wl_data_device_manager_get_version(struct wl_data_device_manager *wl_data_device_manager)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_data_device_manager);
}

static inline void
wl_data_device_manager_destroy(struct wl_data_device_manager *wl_data_device_manager)
{
	wl_proxy_destroy((struct wl_proxy *) wl_data_device_manager);
}

static inline struct wl_data_source *
wl_data_device_manager_create_data_source(struct wl_data_device_manager *wl_data_device_manager)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_data_device_manager,
			 WL_DATA_DEVICE_MANAGER_CREATE_DATA_SOURCE, &wl_data_source_interface, wl_proxy_get_version((struct wl_proxy *) wl_data_device_manager), 0, NULL);

	return (struct wl_data_source *) id;
}

static inline struct wl_data_device *
wl_data_device_manager_get_data_device(struct wl_data_device_manager *wl_data_device_manager, struct wl_seat *seat)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_data_device_manager,
			 WL_DATA_DEVICE_MANAGER_GET_DATA_DEVICE, &wl_data_device_interface, wl_proxy_get_version((struct wl_proxy *) wl_data_device_manager), 0, NULL, seat);

	return (struct wl_data_device *) id;
}

static inline void
wl_shell_set_user_data(struct wl_shell *wl_shell, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_shell, user_data);
}

static inline void *
wl_shell_get_user_data(struct wl_shell *wl_shell)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_shell);
}

static inline uint32_t
wl_shell_get_version(struct wl_shell *wl_shell)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_shell);
}

static inline void
wl_shell_destroy(struct wl_shell *wl_shell)
{
	wl_proxy_destroy((struct wl_proxy *) wl_shell);
}

static inline struct wl_shell_surface *
wl_shell_get_shell_surface(struct wl_shell *wl_shell, struct wl_surface *surface)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_shell,
			 WL_SHELL_GET_SHELL_SURFACE, &wl_shell_surface_interface, wl_proxy_get_version((struct wl_proxy *) wl_shell), 0, NULL, surface);

	return (struct wl_shell_surface *) id;
}

static inline int
wl_shell_surface_add_listener(struct wl_shell_surface *wl_shell_surface,
			      const struct wl_shell_surface_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_shell_surface,
				     (void (**)(void)) listener, data);
}

static inline void
wl_shell_surface_set_user_data(struct wl_shell_surface *wl_shell_surface, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_shell_surface, user_data);
}

static inline void *
wl_shell_surface_get_user_data(struct wl_shell_surface *wl_shell_surface)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_shell_surface);
}

static inline uint32_t
wl_shell_surface_get_version(struct wl_shell_surface *wl_shell_surface)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_shell_surface);
}

static inline void
wl_shell_surface_destroy(struct wl_shell_surface *wl_shell_surface)
{
	wl_proxy_destroy((struct wl_proxy *) wl_shell_surface);
}

static inline void
wl_shell_surface_pong(struct wl_shell_surface *wl_shell_surface, uint32_t serial)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_PONG, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, serial);
}

static inline void
wl_shell_surface_move(struct wl_shell_surface *wl_shell_surface, struct wl_seat *seat, uint32_t serial)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_MOVE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, seat, serial);
}

static inline void
wl_shell_surface_resize(struct wl_shell_surface *wl_shell_surface, struct wl_seat *seat, uint32_t serial, uint32_t edges)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_RESIZE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, seat, serial, edges);
}

static inline void
wl_shell_surface_set_toplevel(struct wl_shell_surface *wl_shell_surface)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_SET_TOPLEVEL, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0);
}

static inline void
wl_shell_surface_set_transient(struct wl_shell_surface *wl_shell_surface, struct wl_surface *parent, int32_t x, int32_t y, uint32_t flags)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_SET_TRANSIENT, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, parent, x, y, flags);
}

static inline void
wl_shell_surface_set_fullscreen(struct wl_shell_surface *wl_shell_surface, uint32_t method, uint32_t framerate, struct wl_output *output)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_SET_FULLSCREEN, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, method, framerate, output);
}

static inline void
wl_shell_surface_set_popup(struct wl_shell_surface *wl_shell_surface, struct wl_seat *seat, uint32_t serial, struct wl_surface *parent, int32_t x, int32_t y, uint32_t flags)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_SET_POPUP, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, seat, serial, parent, x, y, flags);
}

static inline void
wl_shell_surface_set_maximized(struct wl_shell_surface *wl_shell_surface, struct wl_output *output)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_SET_MAXIMIZED, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, output);
}

static inline void
wl_shell_surface_set_title(struct wl_shell_surface *wl_shell_surface, const char *title)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_SET_TITLE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, title);
}

static inline void
wl_shell_surface_set_class(struct wl_shell_surface *wl_shell_surface, const char *class_)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_shell_surface,
			 WL_SHELL_SURFACE_SET_CLASS, NULL, wl_proxy_get_version((struct wl_proxy *) wl_shell_surface), 0, class_);
}

static inline int
wl_surface_add_listener(struct wl_surface *wl_surface,
			const struct wl_surface_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_surface,
				     (void (**)(void)) listener, data);
}

static inline void
wl_surface_set_user_data(struct wl_surface *wl_surface, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_surface, user_data);
}

static inline void *
wl_surface_get_user_data(struct wl_surface *wl_surface)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_surface);
}

static inline uint32_t
wl_surface_get_version(struct wl_surface *wl_surface)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_surface);
}

static inline void
wl_surface_destroy(struct wl_surface *wl_surface)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), WL_MARSHAL_FLAG_DESTROY);
}

static inline void
wl_surface_attach(struct wl_surface *wl_surface, struct wl_buffer *buffer, int32_t x, int32_t y)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_ATTACH, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, buffer, x, y);
}

static inline void
wl_surface_damage(struct wl_surface *wl_surface, int32_t x, int32_t y, int32_t width, int32_t height)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_DAMAGE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, x, y, width, height);
}

static inline struct wl_callback *
wl_surface_frame(struct wl_surface *wl_surface)
{
	struct wl_proxy *callback;

	callback = wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_FRAME, &wl_callback_interface, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, NULL);

	return (struct wl_callback *) callback;
}

static inline void
wl_surface_set_opaque_region(struct wl_surface *wl_surface, struct wl_region *region)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_SET_OPAQUE_REGION, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, region);
}

static inline void
wl_surface_set_input_region(struct wl_surface *wl_surface, struct wl_region *region)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_SET_INPUT_REGION, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, region);
}

static inline void
wl_surface_commit(struct wl_surface *wl_surface)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_COMMIT, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0);
}

static inline void
wl_surface_set_buffer_transform(struct wl_surface *wl_surface, int32_t transform)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_SET_BUFFER_TRANSFORM, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, transform);
}

static inline void
wl_surface_set_buffer_scale(struct wl_surface *wl_surface, int32_t scale)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_SET_BUFFER_SCALE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, scale);
}

static inline void
wl_surface_damage_buffer(struct wl_surface *wl_surface, int32_t x, int32_t y, int32_t width, int32_t height)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_DAMAGE_BUFFER, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, x, y, width, height);
}

static inline void
wl_surface_offset(struct wl_surface *wl_surface, int32_t x, int32_t y)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_surface,
			 WL_SURFACE_OFFSET, NULL, wl_proxy_get_version((struct wl_proxy *) wl_surface), 0, x, y);
}

static inline int
wl_seat_add_listener(struct wl_seat *wl_seat,
		     const struct wl_seat_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_seat,
				     (void (**)(void)) listener, data);
}

static inline void
wl_seat_set_user_data(struct wl_seat *wl_seat, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_seat, user_data);
}

static inline void *
wl_seat_get_user_data(struct wl_seat *wl_seat)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_seat);
}

static inline uint32_t
wl_seat_get_version(struct wl_seat *wl_seat)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_seat);
}

static inline void
wl_seat_destroy(struct wl_seat *wl_seat)
{
	wl_proxy_destroy((struct wl_proxy *) wl_seat);
}

static inline struct wl_pointer *
wl_seat_get_pointer(struct wl_seat *wl_seat)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_seat,
			 WL_SEAT_GET_POINTER, &wl_pointer_interface, wl_proxy_get_version((struct wl_proxy *) wl_seat), 0, NULL);

	return (struct wl_pointer *) id;
}

static inline struct wl_keyboard *
wl_seat_get_keyboard(struct wl_seat *wl_seat)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_seat,
			 WL_SEAT_GET_KEYBOARD, &wl_keyboard_interface, wl_proxy_get_version((struct wl_proxy *) wl_seat), 0, NULL);

	return (struct wl_keyboard *) id;
}

static inline struct wl_touch *
wl_seat_get_touch(struct wl_seat *wl_seat)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_seat,
			 WL_SEAT_GET_TOUCH, &wl_touch_interface, wl_proxy_get_version((struct wl_proxy *) wl_seat), 0, NULL);

	return (struct wl_touch *) id;
}

static inline void
wl_seat_release(struct wl_seat *wl_seat)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_seat,
			 WL_SEAT_RELEASE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_seat), WL_MARSHAL_FLAG_DESTROY);
}


static inline int
wl_pointer_add_listener(struct wl_pointer *wl_pointer,
			const struct wl_pointer_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_pointer,
				     (void (**)(void)) listener, data);
}

static inline void
wl_pointer_set_user_data(struct wl_pointer *wl_pointer, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_pointer, user_data);
}

static inline void *
wl_pointer_get_user_data(struct wl_pointer *wl_pointer)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_pointer);
}

static inline uint32_t
wl_pointer_get_version(struct wl_pointer *wl_pointer)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_pointer);
}

static inline void
wl_pointer_destroy(struct wl_pointer *wl_pointer)
{
	wl_proxy_destroy((struct wl_proxy *) wl_pointer);
}

static inline void
wl_pointer_set_cursor(struct wl_pointer *wl_pointer, uint32_t serial, struct wl_surface *surface, int32_t hotspot_x, int32_t hotspot_y)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_pointer,
			 WL_POINTER_SET_CURSOR, NULL, wl_proxy_get_version((struct wl_proxy *) wl_pointer), 0, serial, surface, hotspot_x, hotspot_y);
}

static inline void
wl_pointer_release(struct wl_pointer *wl_pointer)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_pointer,
			 WL_POINTER_RELEASE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_pointer), WL_MARSHAL_FLAG_DESTROY);
}

static inline int
wl_keyboard_add_listener(struct wl_keyboard *wl_keyboard,
			 const struct wl_keyboard_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_keyboard,
				     (void (**)(void)) listener, data);
}

static inline void
wl_keyboard_set_user_data(struct wl_keyboard *wl_keyboard, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_keyboard, user_data);
}

static inline void *
wl_keyboard_get_user_data(struct wl_keyboard *wl_keyboard)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_keyboard);
}

static inline uint32_t
wl_keyboard_get_version(struct wl_keyboard *wl_keyboard)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_keyboard);
}

static inline void
wl_keyboard_destroy(struct wl_keyboard *wl_keyboard)
{
	wl_proxy_destroy((struct wl_proxy *) wl_keyboard);
}

static inline void
wl_keyboard_release(struct wl_keyboard *wl_keyboard)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_keyboard,
			 WL_KEYBOARD_RELEASE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_keyboard), WL_MARSHAL_FLAG_DESTROY);
}

static inline int
wl_touch_add_listener(struct wl_touch *wl_touch,
		      const struct wl_touch_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_touch,
				     (void (**)(void)) listener, data);
}

static inline void
wl_touch_set_user_data(struct wl_touch *wl_touch, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_touch, user_data);
}

static inline void *
wl_touch_get_user_data(struct wl_touch *wl_touch)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_touch);
}

static inline uint32_t
wl_touch_get_version(struct wl_touch *wl_touch)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_touch);
}

static inline void
wl_touch_destroy(struct wl_touch *wl_touch)
{
	wl_proxy_destroy((struct wl_proxy *) wl_touch);
}

static inline void
wl_touch_release(struct wl_touch *wl_touch)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_touch,
			 WL_TOUCH_RELEASE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_touch), WL_MARSHAL_FLAG_DESTROY);
}

static inline int
wl_output_add_listener(struct wl_output *wl_output,
		       const struct wl_output_listener *listener, void *data)
{
	return wl_proxy_add_listener((struct wl_proxy *) wl_output,
				     (void (**)(void)) listener, data);
}

static inline void
wl_output_set_user_data(struct wl_output *wl_output, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_output, user_data);
}

static inline void *
wl_output_get_user_data(struct wl_output *wl_output)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_output);
}

static inline uint32_t
wl_output_get_version(struct wl_output *wl_output)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_output);
}

static inline void
wl_output_destroy(struct wl_output *wl_output)
{
	wl_proxy_destroy((struct wl_proxy *) wl_output);
}

static inline void
wl_output_release(struct wl_output *wl_output)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_output,
			 WL_OUTPUT_RELEASE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_output), WL_MARSHAL_FLAG_DESTROY);
}

static inline void
wl_region_set_user_data(struct wl_region *wl_region, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_region, user_data);
}

static inline void *
wl_region_get_user_data(struct wl_region *wl_region)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_region);
}

static inline uint32_t
wl_region_get_version(struct wl_region *wl_region)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_region);
}

static inline void
wl_region_destroy(struct wl_region *wl_region)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_region,
			 WL_REGION_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_region), WL_MARSHAL_FLAG_DESTROY);
}

static inline void
wl_region_add(struct wl_region *wl_region, int32_t x, int32_t y, int32_t width, int32_t height)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_region,
			 WL_REGION_ADD, NULL, wl_proxy_get_version((struct wl_proxy *) wl_region), 0, x, y, width, height);
}

static inline void
wl_region_subtract(struct wl_region *wl_region, int32_t x, int32_t y, int32_t width, int32_t height)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_region,
			 WL_REGION_SUBTRACT, NULL, wl_proxy_get_version((struct wl_proxy *) wl_region), 0, x, y, width, height);
}

static inline void
wl_subcompositor_set_user_data(struct wl_subcompositor *wl_subcompositor, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_subcompositor, user_data);
}

static inline void *
wl_subcompositor_get_user_data(struct wl_subcompositor *wl_subcompositor)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_subcompositor);
}

static inline uint32_t
wl_subcompositor_get_version(struct wl_subcompositor *wl_subcompositor)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_subcompositor);
}

static inline void
wl_subcompositor_destroy(struct wl_subcompositor *wl_subcompositor)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_subcompositor,
			 WL_SUBCOMPOSITOR_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_subcompositor), WL_MARSHAL_FLAG_DESTROY);
}

static inline struct wl_subsurface *
wl_subcompositor_get_subsurface(struct wl_subcompositor *wl_subcompositor, struct wl_surface *surface, struct wl_surface *parent)
{
	struct wl_proxy *id;

	id = wl_proxy_marshal_flags((struct wl_proxy *) wl_subcompositor,
			 WL_SUBCOMPOSITOR_GET_SUBSURFACE, &wl_subsurface_interface, wl_proxy_get_version((struct wl_proxy *) wl_subcompositor), 0, NULL, surface, parent);

	return (struct wl_subsurface *) id;
}

static inline void
wl_subsurface_set_user_data(struct wl_subsurface *wl_subsurface, void *user_data)
{
	wl_proxy_set_user_data((struct wl_proxy *) wl_subsurface, user_data);
}

static inline void *
wl_subsurface_get_user_data(struct wl_subsurface *wl_subsurface)
{
	return wl_proxy_get_user_data((struct wl_proxy *) wl_subsurface);
}

static inline uint32_t
wl_subsurface_get_version(struct wl_subsurface *wl_subsurface)
{
	return wl_proxy_get_version((struct wl_proxy *) wl_subsurface);
}

static inline void
wl_subsurface_destroy(struct wl_subsurface *wl_subsurface)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_subsurface,
			 WL_SUBSURFACE_DESTROY, NULL, wl_proxy_get_version((struct wl_proxy *) wl_subsurface), WL_MARSHAL_FLAG_DESTROY);
}

static inline void
wl_subsurface_set_position(struct wl_subsurface *wl_subsurface, int32_t x, int32_t y)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_subsurface,
			 WL_SUBSURFACE_SET_POSITION, NULL, wl_proxy_get_version((struct wl_proxy *) wl_subsurface), 0, x, y);
}

static inline void
wl_subsurface_place_above(struct wl_subsurface *wl_subsurface, struct wl_surface *sibling)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_subsurface,
			 WL_SUBSURFACE_PLACE_ABOVE, NULL, wl_proxy_get_version((struct wl_proxy *) wl_subsurface), 0, sibling);
}

static inline void
wl_subsurface_place_below(struct wl_subsurface *wl_subsurface, struct wl_surface *sibling)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_subsurface,
			 WL_SUBSURFACE_PLACE_BELOW, NULL, wl_proxy_get_version((struct wl_proxy *) wl_subsurface), 0, sibling);
}

static inline void
wl_subsurface_set_sync(struct wl_subsurface *wl_subsurface)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_subsurface,
			 WL_SUBSURFACE_SET_SYNC, NULL, wl_proxy_get_version((struct wl_proxy *) wl_subsurface), 0);
}

static inline void
wl_subsurface_set_desync(struct wl_subsurface *wl_subsurface)
{
	wl_proxy_marshal_flags((struct wl_proxy *) wl_subsurface,
			 WL_SUBSURFACE_SET_DESYNC, NULL, wl_proxy_get_version((struct wl_proxy *) wl_subsurface), 0);
}


