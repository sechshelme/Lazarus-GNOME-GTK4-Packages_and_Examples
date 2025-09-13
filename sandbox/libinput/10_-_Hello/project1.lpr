program project1;

uses
  fp_libinput,
  fp_libudev;

  procedure main;
  begin


    // gcc -o main main.c `pkg-config --cflags --libs libinput libudev`

    // sudo usermod -aG input dein-benutzername


    #include <libinput.h>
    #include <libudev.h>
    #include <stdio.h>
    #include <unistd.h>
    #include <fcntl.h>
    #include <poll.h>

    // Minimal erforderliches libinput_interface für libinput_udev_create_context
    static int open_restricted(const char *path, int flags, void *user_data) {
        int fd = open(path, flags);
        if (fd < 0)
            perror("open_restricted");
        return fd;
    }

    static void close_restricted(int fd, void *user_data) {
        close(fd);
    }

    const struct libinput_interface libinput_interface = {
        .open_restricted = open_restricted,
        .close_restricted = close_restricted,
    };

    int main() {
        struct libinput *li;
        struct libinput_event *event;
        struct udev *udev;
        struct pollfd pfd;
        int ret;

        // libudev Context erzeugen (für Gerätverwaltung)
        udev = udev_new();
        if (!udev) {
            fprintf(stderr, "Failed to create udev\n");
            return 1;
        }

        // libinput Context mit udev
        li = libinput_udev_create_context(&libinput_interface, NULL, udev);
        if (!li) {
            fprintf(stderr, "Failed to create libinput context\n");
            udev_unref(udev);
            return 1;
        }

        // Sitz zuordnen (seat0 ist normaler Sitz für Eingabegeräte)
        if (libinput_udev_assign_seat(li, "seat0") != 0) {
            fprintf(stderr, "Failed to assign seat\n");
            libinput_unref(li);
            udev_unref(udev);
            return 1;
        }

        // Datei Descriptor zum Polling holen
        pfd.fd = libinput_get_fd(li);
        pfd.events = POLLIN;

        printf("Warte auf Eingabegeräte Ereignisse...\n");

        while (1) {
            ret = poll(&pfd, 1, -1);
            if (ret > 0) {
                libinput_dispatch(li);

                while ((event = libinput_get_event(li)) != NULL) {
                    enum libinput_event_type type = libinput_event_get_type(event);

                    switch (type) {
                        case LIBINPUT_EVENT_POINTER_MOTION: {
                            struct libinput_event_pointer *pointer_event = libinput_event_get_pointer_event(event);
                            double dx = libinput_event_pointer_get_dx(pointer_event);
                            double dy = libinput_event_pointer_get_dy(pointer_event);
                            printf("Maus bewegt (Delta): %.2f, %.2f\n", dx, dy);
                            break;
                        }
                        case LIBINPUT_EVENT_KEYBOARD_KEY: {
                            struct libinput_event_keyboard *kbd_event =
                                libinput_event_get_keyboard_event(event);
                            uint32_t key = libinput_event_keyboard_get_key(kbd_event);
                            uint32_t state = libinput_event_keyboard_get_key_state(kbd_event);
                            printf("Tastendruck: key=%u, state=%s\n",
                                   key,
                                   state == LIBINPUT_KEY_STATE_PRESSED ? "pressed" : "released");
                            break;
                        }
                        default:
                            printf("Ereignis: %d\n", type);
                    }
                    libinput_event_destroy(event);
                }
            }
        }

        libinput_unref(li);
        udev_unref(udev);
        return 0;
    }
  end;

begin
  main;
end.
