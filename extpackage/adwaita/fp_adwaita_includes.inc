

{$include adwaita/adw_enums.inc}                      // io.
{$include adwaita/adw_length_unit.inc}                // io.
{$include adwaita/adw_overlay_split_view.inc}         // io. -> adw_length_unit
{$include adwaita/adw_breakpoint.inc}                 // io. -> adw_length_unit
{$include adwaita/adw_clamp_scrollable.inc}           // io. -> adw_length_unit
{$include adwaita/adw_clamp.inc}                      // io. -> adw_length_unit
{$include adwaita/adw_clamp_layout.inc}               // io. -> adw_length_unit
{$include adwaita/adw_dialog.inc}                     // io. -> adw_breakpoint
{$include adwaita/adw_about_dialog.inc}               // io. -> adw_dialog
{$include adwaita/adw_alert_dialog.inc}               // io. -> adw_dialog
{$include adwaita/adw_message_dialog.inc}             // io. -> adw_alert_dialog
{$include adwaita/adw_application_window.inc}         // io. -> adw_breakpoint, adw_dialog
{$include adwaita/adw_toolbar_view.inc}               // io.
{$include adwaita/adw_header_bar.inc}                 // io.
{$include adwaita/adw_style_manager.inc}              // io.
{$include adwaita/adw_application.inc}                // io.  > adw_style_manager
{$include adwaita/adw_window.inc}                     // io. -> adw_breakpoint, adw_dialog
{$include adwaita/adw_about_window.inc}               // io. -> adw_window
{$include adwaita/adw_tab_view.inc}                   // io.
{$include adwaita/adw_tab_overview.inc}               // io. -> adw_tab_view
{$include adwaita/adw_tab_bar.inc}                    // io. -> adw_tab_view
{$include adwaita/adw_tab_button.inc}                 // io. -> adw_tab_view
{$include adwaita/adw_version.inc}                    // io.
{$include adwaita/adw_navigation_direction.inc}       // io.
{$include adwaita/adw_spring_params.inc}              // io.
{$include adwaita/adw_fold_threshold_policy.inc}      // io.
{$include adwaita/adw_leaflet.inc}                    // io. -> adw_fold_threshold_policy, adw_spring_params, adw_navigation_direction
{$include adwaita/adw_flap.inc}                       // io. -> adw_spring_params, adw_fold_threshold_policy
{$include adwaita/adw_navigation_view.inc}            // io.
{$include adwaita/adw_squeezer.inc}                   // io. -> adw_fold_threshold_policy
{$include adwaita/adw_view_stack.inc}                 // io.
{$include adwaita/adw_view_switcher_title.inc}        // io. -> adw_view_stack
{$include adwaita/adw_view_switcher.inc}              // io. -> adw_view_stack
{$include adwaita/adw_view_switcher_bar.inc}          // io. -> adw_view_stack
{$include adwaita/adw_preferences_row.inc}            // io.
{$include adwaita/adw_expander_row.inc}               // io. -> adw_preferences_row
{$include adwaita/adw_carousel.inc}                   // io. -> adw_spring_params
{$include adwaita/adw_carousel_indicator_lines.inc}   // io. -> adw_carousel
{$include adwaita/adw_carousel_indicator_dots.inc}    // io. -> adw_carousel
{$include adwaita/adw_navigation_split_view.inc}      // io. -> adw_navigation_view, adw_length_unit
{$include adwaita/adw_toast.inc}                      // io.
{$include adwaita/adw_toast_overlay.inc}              // io. -> adw_toast
{$include adwaita/adw_preferences_group.inc}          // io.
{$include adwaita/adw_preferences_page.inc}           // io. -> adw_preferences_group
{$include adwaita/adw_preferences_window.inc}         // io. -> adw_window, adw_preferences_page, adw_navigation_view, adw_toast
{$include adwaita/adw_action_row.inc}                 // io. -> adw_preferences_row
{$include adwaita/adw_combo_row.inc}                  // io. -> adw_action_row
{$include adwaita/adw_spin_row.inc}                   // io. -> adw_action_row
{$include adwaita/adw_switch_row.inc}                 // io. -> adw_action_row
{$include adwaita/adw_entry_row.inc}                  // io. -> adw_preferences_row
{$include adwaita/adw_password_entry_row.inc}         // io. -> adw_entry_row
{$include adwaita/adw_split_button.inc}               // io.
{$include adwaita/adw_animation_target.inc}           // io.
{$include adwaita/adw_animation.inc}                  // io. -> adw_animation_target
{$include adwaita/adw_spring_animation.inc}           // io. -> adw_spring_params, adw_animation_target, adw_animation
{$include adwaita/adw_swipeable.inc}                  // io. -> adw_navigation_direction
{$include adwaita/adw_swipe_tracker.inc}              // io. -> adw_swipeable
{$include adwaita/adw_preferences_dialog.inc}         // io. -> adw_dialog, adw_preferences_page, adw_navigation_view, adw_toast
{$include adwaita/adw_easing.inc}                     // io.
{$include adwaita/adw_timed_animation.inc}            // io. -> adw_animation_target, adw_animation, adw_easing
{$include adwaita/adw_avatar.inc}                     // io.
{$include adwaita/adw_status_page.inc}                // io.
{$include adwaita/adw_banner.inc}                     // io.
{$include adwaita/adw_breakpoint_bin.inc}             // io. -> adw_breakpoint
{$include adwaita/adw_button_content.inc}             // io.
{$include adwaita/adw_enum_list_model.inc}            // io.
{$include adwaita/adw_window_title.inc}               // io.
{$include adwaita/adw_bin.inc}                        // io.
{$include adwaita/adw_animation_util.inc}             // io.
{$include adwaita/adw_main.inc}                       // io.

