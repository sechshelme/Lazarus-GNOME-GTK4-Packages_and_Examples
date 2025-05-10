#ifndef _ECORE_X_ATOMS_H
#define _ECORE_X_ATOMS_H

/**
 * @file
 * @brief Ecore X atoms
 */

/* generic atoms */
extern extern Ecore_X_Atom ECORE_X_ATOM_ATOM;
extern extern Ecore_X_Atom ECORE_X_ATOM_CARDINAL;
extern extern Ecore_X_Atom ECORE_X_ATOM_INTEGER; /**< @since 1.24 */
extern extern Ecore_X_Atom ECORE_X_ATOM_FLOAT; /**< @since 1.24 */
extern extern Ecore_X_Atom ECORE_X_ATOM_COMPOUND_TEXT;
extern extern Ecore_X_Atom ECORE_X_ATOM_FILE_NAME;
extern extern Ecore_X_Atom ECORE_X_ATOM_STRING;
extern extern Ecore_X_Atom ECORE_X_ATOM_TEXT;
extern extern Ecore_X_Atom ECORE_X_ATOM_UTF8_STRING;
extern extern Ecore_X_Atom ECORE_X_ATOM_X_MOZ_URL;
extern extern Ecore_X_Atom ECORE_X_ATOM_WINDOW;
extern extern Ecore_X_Atom ECORE_X_ATOM_PIXMAP;
extern extern Ecore_X_Atom ECORE_X_ATOM_VISUALID;

/* dnd atoms */
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_XDND;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_PROP_XDND;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_AWARE;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ENTER;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_TYPE_LIST;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_POSITION;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ACTION_COPY;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ACTION_MOVE;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ACTION_PRIVATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ACTION_ASK;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ACTION_LIST;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ACTION_LINK;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_ACTION_DESCRIPTION;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_PROXY;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_STATUS;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_LEAVE;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_DROP;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_FINISHED;
extern extern Ecore_X_Atom ECORE_X_ATOM_XDND_DIRECTSAVE0; /**< @since 1.8 */

/* dnd atoms that need to be exposed to the application interface */
extern extern Ecore_X_Atom ECORE_X_DND_ACTION_COPY;
extern extern Ecore_X_Atom ECORE_X_DND_ACTION_MOVE;
extern extern Ecore_X_Atom ECORE_X_DND_ACTION_LINK;
extern extern Ecore_X_Atom ECORE_X_DND_ACTION_ASK;
extern extern Ecore_X_Atom ECORE_X_DND_ACTION_PRIVATE;

/* old E atom */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_FRAME_SIZE;

/* old Gnome atom */
extern extern Ecore_X_Atom ECORE_X_ATOM_WIN_LAYER;

/* ICCCM: client properties */
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_NAME;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_ICON_NAME;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_NORMAL_HINTS;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_SIZE_HINTS;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_HINTS;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_CLASS;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_TRANSIENT_FOR;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_PROTOCOLS;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_COLORMAP_WINDOWS;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_COMMAND;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_CLIENT_MACHINE;

/* ICCCM: window manager properties */
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_ICON_SIZE;

/* ICCCM: WM_STATEproperty */
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_CHANGE_STATE;

/* ICCCM: WM_PROTOCOLS properties */
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_TAKE_FOCUS;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_SAVE_YOURSELF;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_DELETE_WINDOW;

/* ICCCM: WM_COLORMAP properties */
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_COLORMAP_NOTIFY;

/* ICCCM: session management properties */
extern extern Ecore_X_Atom ECORE_X_ATOM_SM_CLIENT_ID;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_CLIENT_LEADER;
extern extern Ecore_X_Atom ECORE_X_ATOM_WM_WINDOW_ROLE;

/* Motif WM atom */
extern extern Ecore_X_Atom ECORE_X_ATOM_MOTIF_WM_HINTS;

extern extern Ecore_X_Atom ECORE_X_ATOM_NET_SUPPORTED;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_CLIENT_LIST;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_CLIENT_LIST_STACKING;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_NUMBER_OF_DESKTOPS;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_DESKTOP_GEOMETRY;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_DESKTOP_VIEWPORT;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_CURRENT_DESKTOP;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_DESKTOP_NAMES;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_ACTIVE_WINDOW;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WORKAREA;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_SUPPORTING_WM_CHECK;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_VIRTUAL_ROOTS;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_DESKTOP_LAYOUT;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_SHOWING_DESKTOP;

/* pager */
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_CLOSE_WINDOW;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_MOVERESIZE_WINDOW;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_MOVERESIZE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_RESTACK_WINDOW;

extern extern Ecore_X_Atom ECORE_X_ATOM_NET_REQUEST_FRAME_EXTENTS;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_NAME;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_VISIBLE_NAME;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ICON_NAME;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_VISIBLE_ICON_NAME;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_DESKTOP;

/* window type */
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_DESKTOP;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_DOCK;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_TOOLBAR;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_MENU;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_UTILITY;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_SPLASH;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_DIALOG;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_NORMAL;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_DROPDOWN_MENU;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_POPUP_MENU;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_TOOLTIP;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_NOTIFICATION;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_COMBO;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_TYPE_DND;

/* state */
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_MODAL;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_STICKY;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_MAXIMIZED_VERT;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_MAXIMIZED_HORZ;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_SHADED;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_SKIP_TASKBAR;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_SKIP_PAGER;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_HIDDEN;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_FULLSCREEN;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_ABOVE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_BELOW;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STATE_DEMANDS_ATTENTION;

/* allowed actions */
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ALLOWED_ACTIONS;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_MOVE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_RESIZE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_MINIMIZE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_SHADE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_STICK;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_MAXIMIZE_HORZ;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_MAXIMIZE_VERT;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_FULLSCREEN;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_CHANGE_DESKTOP;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_CLOSE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_ABOVE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ACTION_BELOW;

extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STRUT;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_STRUT_PARTIAL;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ICON_GEOMETRY;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_ICON;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_PID;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_HANDLED_ICONS;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_USER_TIME;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_STARTUP_ID;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_FRAME_EXTENTS;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_PING;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_SYNC_REQUEST;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_SYNC_REQUEST_COUNTER;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_OPACITY;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_SHADOW;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_WM_WINDOW_SHADE;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_STARTUP_INFO_BEGIN;
extern extern Ecore_X_Atom ECORE_X_ATOM_NET_STARTUP_INFO;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_TARGETS;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_PRIMARY;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_SECONDARY;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_CLIPBOARD;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_PROP_PRIMARY;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_PROP_SECONDARY;
extern extern Ecore_X_Atom ECORE_X_ATOM_SELECTION_PROP_CLIPBOARD;

/* currently E specific virtual keyboard extension, aim to submit to netwm spec
 * later */

extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_ON;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_OFF;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_ALPHA;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_NUMERIC;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_PIN;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_PHONE_NUMBER;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_HEX;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_TERMINAL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_PASSWORD;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_IP;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_HOST;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_FILE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_URL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_KEYPAD;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIRTUAL_KEYBOARD_J2ME;

/* Illume specific atoms */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ZONE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ZONE_LIST;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_CONFORMANT;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_MODE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_MODE_SINGLE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_MODE_DUAL_TOP;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_MODE_DUAL_LEFT;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_FOCUS_BACK;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_FOCUS_FORWARD;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_FOCUS_HOME;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_HOME_NEW;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_HOME_DEL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_CLOSE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_DRAG;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_DRAG_LOCKED;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_DRAG_START;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_DRAG_END;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_GEOMETRY;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_SOFTKEY_GEOMETRY;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_KEYBOARD_GEOMETRY;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_STATE_TOGGLE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_ON;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_OFF;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_PRIORITY_MAJOR;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_PRIORITY_MINOR;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_ZONE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_QUICKPANEL_POSITION_UPDATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_ON;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_OFF;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_OPACITY_MODE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_OPAQUE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_TRANSLUCENT;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_TRANSPARENT;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_TYPE_MODE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_TYPE_1;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_TYPE_2;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_INDICATOR_TYPE_3;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ROTATE_WINDOW_AVAILABLE_ANGLE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ROTATE_WINDOW_ANGLE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ROTATE_ROOT_ANGLE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_CLIPBOARD_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_CLIPBOARD_ON;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_CLIPBOARD_OFF;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_CLIPBOARD_GEOMETRY;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_WINDOW_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_WINDOW_STATE_NORMAL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_WINDOW_STATE_FLOATING;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_CONTROL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_NEXT;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_PREV;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_ACTIVATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_OVER;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_READ;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_READ_NEXT;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_READ_PREV;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_UP;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_DOWN;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_BACK;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_SCROLL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_MOUSE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_ENABLE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ACTION_DISABLE;

/* Abi compat fix */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_ENABLE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_ACCESS_DISABLE;
/* End of Abi compat fix */

extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_SYNC_COUNTER;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_SYNC_DRAW_DONE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_SYNC_SUPPORTED;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_SYNC_BEGIN;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_SYNC_END;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_SYNC_CANCEL;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_FLUSH;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_DUMP;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_COMP_PIXMAP;

extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIDEO_PARENT;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_VIDEO_POSITION;

/* currently elementary and E specific extension */
/* @deprecated use ECORE_X_ATOM_E_WINDOW_PROFILE */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_PROFILE;
/* @deprecated use ECORE_X_ATOM_E_WINDOW_PROFILE_AVAILABLE_LIST */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_PROFILE_LIST;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_PROFILE_SUPPORTED;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_PROFILE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_PROFILE_CHANGE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_PROFILE_AVAILABLE_LIST;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_PROFILE_CHANGE_REQUEST;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_PROFILE_CHANGE_DONE;

/* for sliding window */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_SLIDING_WIN_STATE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_ILLUME_SLIDING_WIN_GEOMETRY;

/* for window stacks */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_STACK_TYPE; /**< @since 1.19 */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_STACK_POSITION; /**< @since 1.19 */

/* for SDB(Samsung Debug Bridge) */
extern extern Ecore_X_Atom ECORE_X_ATOM_SDB_SERVER_CONNECT;
extern extern Ecore_X_Atom ECORE_X_ATOM_SDB_SERVER_DISCONNECT;

/* for deiconify approve protcol */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_DEICONIFY_APPROVE;

/* E window rotation extension */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_SUPPORTED;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_APP_SUPPORTED;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_AVAILABLE_LIST;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_PREFERRED_ROTATION;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_CHANGE_PREPARE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_CHANGE_PREPARE_DONE;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_CHANGE_REQUEST;
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_ROTATION_CHANGE_DONE;

/* E window auxiliary hint */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_AUX_HINT_SUPPORTED_LIST; /**< @since 1.10 */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_AUX_HINT_SUPPORT; /**< @since 1.10 */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_AUX_HINT; /**< @since 1.10 */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_WINDOW_AUX_HINT_ALLOWED; /**< @since 1.10 */

/* E keyrouter protocol */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_KEYROUTER_SUPPORTED; /**< @since 1.15 */
extern extern Ecore_X_Atom ECORE_X_ATOM_E_KEYROUTER_WINDOW_KEYTABLE; /**< @since 1.15 */

/* Teamwork protocol */
extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_PROPERTY; /**< @since 1.18 */
extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_PRELOAD; /**< @since 1.18 */
extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_ACTIVATE; /**< @since 1.18 */
extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_DEACTIVATE; /**< @since 1.18 */
extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_OPEN; /**< @since 1.18 */

extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_COMPLETED; /**< @since 1.18 */
extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_PROGRESS; /**< @since 1.18 */
extern extern Ecore_X_Atom ECORE_X_ATOM_TEAMWORK_STARTED; /**< @since 1.18 */

/* Client-Side Decorations */
extern extern Ecore_X_Atom ECORE_X_ATOM_GTK_FRAME_EXTENTS; /**< @since 1.19 */
#endif /* _ECORE_X_ATOMS_H */
