

static inline void
xcb_ewmh_connection_wipe(xcb_ewmh_connection_t *ewmh)
{
  free(ewmh->screens);
  free(ewmh->_NET_WM_CM_Sn);
}

static inline uint8_t
xcb_ewmh_get_supported_from_reply(xcb_ewmh_get_atoms_reply_t *supported,
                                  xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_atoms_from_reply(supported, r);
}

static inline uint8_t
xcb_ewmh_get_supported_reply(xcb_ewmh_connection_t *ewmh,
                             xcb_get_property_cookie_t cookie,
                             xcb_ewmh_get_atoms_reply_t *supported,
                             xcb_generic_error_t **e)
{
  return xcb_ewmh_get_atoms_reply(ewmh, cookie, supported, e);
}

static inline uint8_t
xcb_ewmh_get_client_list_from_reply(xcb_ewmh_get_windows_reply_t *clients,
                                    xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_windows_from_reply(clients, r);
}

static inline uint8_t
xcb_ewmh_get_client_list_reply(xcb_ewmh_connection_t *ewmh,
                               xcb_get_property_cookie_t cookie,
                               xcb_ewmh_get_windows_reply_t *clients,
                               xcb_generic_error_t **e)
{
  return xcb_ewmh_get_windows_reply(ewmh, cookie, clients, e);
}

static inline uint8_t
xcb_ewmh_get_client_list_stacking_from_reply(xcb_ewmh_get_windows_reply_t *clients,
                                             xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_windows_from_reply(clients, r);
}
static inline uint8_t
xcb_ewmh_get_client_list_stacking_reply(xcb_ewmh_connection_t *ewmh,
                                        xcb_get_property_cookie_t cookie,
                                        xcb_ewmh_get_windows_reply_t *clients,
                                        xcb_generic_error_t **e)
{
  return xcb_ewmh_get_windows_reply(ewmh, cookie, clients, e);
}

static inline uint8_t
xcb_ewmh_get_number_of_desktops_from_reply(uint32_t *number_of_desktops,
                                           xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(number_of_desktops, r);
}

static inline uint8_t
xcb_ewmh_get_number_of_desktops_reply(xcb_ewmh_connection_t *ewmh,
                                      xcb_get_property_cookie_t cookie,
                                      uint32_t *number_of_desktops,
                                      xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, number_of_desktops, e);
}

static inline xcb_void_cookie_t
xcb_ewmh_request_change_number_of_desktops(xcb_ewmh_connection_t *ewmh,
                                           int screen_nbr,
                                           uint32_t new_number_of_desktops)
{
  return xcb_ewmh_send_client_message(ewmh->connection, XCB_NONE,
                                      ewmh->screens[screen_nbr]->root,
                                      ewmh->_NET_NUMBER_OF_DESKTOPS,
                                      sizeof(new_number_of_desktops),
                                      &new_number_of_desktops);
}

static inline uint8_t
xcb_ewmh_get_current_desktop_from_reply(uint32_t *current_desktop,
                                        xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(current_desktop, r);
}

static inline uint8_t
xcb_ewmh_get_current_desktop_reply(xcb_ewmh_connection_t *ewmh,
                                   xcb_get_property_cookie_t cookie,
                                   uint32_t *current_desktop,
                                   xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, current_desktop, e);
}

static inline uint8_t
xcb_ewmh_get_desktop_names_from_reply(xcb_ewmh_connection_t *ewmh,
                                      xcb_ewmh_get_utf8_strings_reply_t *names,
                                      xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, names, r);
}

static inline uint8_t
xcb_ewmh_get_desktop_names_reply(xcb_ewmh_connection_t *ewmh,
                                 xcb_get_property_cookie_t cookie,
                                 xcb_ewmh_get_utf8_strings_reply_t *names,
                                 xcb_generic_error_t **e)
{
  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, names, e);
}

static inline uint8_t
xcb_ewmh_get_active_window_from_reply(xcb_window_t *active_window,
                                      xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_window_from_reply(active_window, r);
}

static inline uint8_t
xcb_ewmh_get_active_window_reply(xcb_ewmh_connection_t *ewmh,
                                 xcb_get_property_cookie_t cookie,
                                 xcb_window_t *active_window,
                                 xcb_generic_error_t **e)
{
  return xcb_ewmh_get_window_reply(ewmh, cookie, active_window, e);
}

static inline uint8_t
xcb_ewmh_get_supporting_wm_check_from_reply(xcb_window_t *window,
                                            xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_window_from_reply(window, r);
}

static inline uint8_t
xcb_ewmh_get_supporting_wm_check_reply(xcb_ewmh_connection_t *ewmh,
                                       xcb_get_property_cookie_t cookie,
                                       xcb_window_t *window,
                                       xcb_generic_error_t **e)
{
  return xcb_ewmh_get_window_reply(ewmh, cookie, window, e);
}

static inline uint8_t
xcb_ewmh_get_virtual_roots_from_reply(xcb_ewmh_get_windows_reply_t *virtual_roots,
                                      xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_windows_from_reply(virtual_roots, r);
}

static inline uint8_t
xcb_ewmh_get_virtual_roots_reply(xcb_ewmh_connection_t *ewmh,
                                 xcb_get_property_cookie_t cookie,
                                 xcb_ewmh_get_windows_reply_t *virtual_roots,
                                 xcb_generic_error_t **e)
{
  return xcb_ewmh_get_windows_reply(ewmh, cookie, virtual_roots, e);
}

static inline uint8_t
xcb_ewmh_get_showing_desktop_from_reply(uint32_t *desktop,
                                        xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(desktop, r);
}

static inline uint8_t
xcb_ewmh_get_showing_desktop_reply(xcb_ewmh_connection_t *ewmh,
                                   xcb_get_property_cookie_t cookie,
                                   uint32_t *desktop,
                                   xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, desktop, e);
}

static inline xcb_void_cookie_t
xcb_ewmh_request_change_showing_desktop(xcb_ewmh_connection_t *ewmh,
                                        int screen_nbr,
                                        uint32_t enter)
{
  return xcb_ewmh_send_client_message(ewmh->connection, XCB_NONE,
                                      ewmh->screens[screen_nbr]->root,
                                      ewmh->_NET_SHOWING_DESKTOP,
                                      sizeof(enter), &enter);
}

static inline xcb_void_cookie_t
xcb_ewmh_request_frame_extents(xcb_ewmh_connection_t *ewmh,
                               int screen_nbr,
                               xcb_window_t client_window)
{
  return xcb_ewmh_send_client_message(ewmh->connection, client_window,
                                      ewmh->screens[screen_nbr]->root,
                                      ewmh->_NET_REQUEST_FRAME_EXTENTS, 0, NULL);
}


static inline uint8_t
xcb_ewmh_get_wm_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                xcb_ewmh_get_utf8_strings_reply_t *data,
                                xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);
}

static inline uint8_t
xcb_ewmh_get_wm_name_reply(xcb_ewmh_connection_t *ewmh,
                           xcb_get_property_cookie_t cookie,
                           xcb_ewmh_get_utf8_strings_reply_t *data,
                           xcb_generic_error_t **e)
{
  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);
}


static inline uint8_t
xcb_ewmh_get_wm_visible_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                        xcb_ewmh_get_utf8_strings_reply_t *data,
                                        xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);
}

static inline uint8_t
xcb_ewmh_get_wm_visible_name_reply(xcb_ewmh_connection_t *ewmh,
                                   xcb_get_property_cookie_t cookie,
                                   xcb_ewmh_get_utf8_strings_reply_t *data,
                                   xcb_generic_error_t **e)
{
  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);
}


static inline uint8_t
xcb_ewmh_get_wm_icon_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                     xcb_ewmh_get_utf8_strings_reply_t *data,
                                     xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);
}

static inline uint8_t
xcb_ewmh_get_wm_icon_name_reply(xcb_ewmh_connection_t *ewmh,
                                xcb_get_property_cookie_t cookie,
                                xcb_ewmh_get_utf8_strings_reply_t *data,
                                xcb_generic_error_t **e)
{
  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);
}


static inline uint8_t
xcb_ewmh_get_wm_visible_icon_name_from_reply(xcb_ewmh_connection_t *ewmh,
                                             xcb_ewmh_get_utf8_strings_reply_t *data,
                                             xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_utf8_strings_from_reply(ewmh, data, r);
}

static inline uint8_t
xcb_ewmh_get_wm_visible_icon_name_reply(xcb_ewmh_connection_t *ewmh,
                                        xcb_get_property_cookie_t cookie,
                                        xcb_ewmh_get_utf8_strings_reply_t *data,
                                        xcb_generic_error_t **e)
{
  return xcb_ewmh_get_utf8_strings_reply(ewmh, cookie, data, e);
}


static inline uint8_t
xcb_ewmh_get_wm_desktop_from_reply(uint32_t *desktop,
                                   xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(desktop, r);
}

static inline uint8_t
xcb_ewmh_get_wm_desktop_reply(xcb_ewmh_connection_t *ewmh,
                              xcb_get_property_cookie_t cookie,
                              uint32_t *desktop,
                              xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, desktop, e);
}

static inline xcb_void_cookie_t
xcb_ewmh_set_wm_icon_checked(xcb_ewmh_connection_t *ewmh,
                             uint8_t mode,
                             xcb_window_t window,
                             uint32_t data_len, uint32_t *data)
{
  return xcb_change_property_checked(ewmh->connection, mode,
                                     window, ewmh->_NET_WM_ICON,
                                     XCB_ATOM_CARDINAL, 32, data_len, data);
}

/**
 * @see xcb_ewmh_set_wm_icon_checked
 */
static inline xcb_void_cookie_t
xcb_ewmh_set_wm_icon(xcb_ewmh_connection_t *ewmh,
                     uint8_t mode,
                     xcb_window_t window,
                     uint32_t data_len, uint32_t *data)
{
  return xcb_change_property(ewmh->connection, mode, window,
                             ewmh->_NET_WM_ICON, XCB_ATOM_CARDINAL, 32,
                             data_len, data);
}


static inline uint8_t
xcb_ewmh_get_wm_pid_from_reply(uint32_t *pid,
                               xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(pid, r);
}

static inline uint8_t
xcb_ewmh_get_wm_pid_reply(xcb_ewmh_connection_t *ewmh,
                          xcb_get_property_cookie_t cookie,
                          uint32_t *pid,
                          xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, pid, e);
}

static inline uint8_t
xcb_ewmh_get_wm_handled_icons_from_reply(uint32_t *handled_icons,
                                         xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(handled_icons, r);
}

static inline uint8_t
xcb_ewmh_get_wm_handled_icons_reply(xcb_ewmh_connection_t *ewmh,
                                    xcb_get_property_cookie_t cookie,
                                    uint32_t *handled_icons,
                                    xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, handled_icons, e);
}


static inline uint8_t
xcb_ewmh_get_wm_user_time_from_reply(uint32_t *xtime,
                                     xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(xtime, r);
}

static inline uint8_t
xcb_ewmh_get_wm_user_time_reply(xcb_ewmh_connection_t *ewmh,
                                xcb_get_property_cookie_t cookie,
                                uint32_t *xtime,
                                xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, xtime, e);
}


static inline uint8_t
xcb_ewmh_get_wm_user_time_window_from_reply(uint32_t *xtime,
                                            xcb_get_property_reply_t *r)
{
  return xcb_ewmh_get_cardinal_from_reply(xtime, r);
}

static inline uint8_t
xcb_ewmh_get_wm_user_time_window_reply(xcb_ewmh_connection_t *ewmh,
                                       xcb_get_property_cookie_t cookie,
                                       uint32_t *xtime,
                                       xcb_generic_error_t **e)
{
  return xcb_ewmh_get_cardinal_reply(ewmh, cookie, xtime, e);
}



