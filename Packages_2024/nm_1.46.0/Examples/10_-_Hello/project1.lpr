program project1;

uses
  fp_glib2,
  fp_nm;

  procedure OnDeviceAdded(client: PNMClient; device: PNMDevice; user_data: Pointer); cdecl;
  begin
    g_printf('Neue Hardware erkannt: %s'#10, nm_device_get_iface(device));
  end;

  procedure OnDeviceRemoved(client: PNMClient; device: PNMDevice; user_data: Pointer); cdecl;
  begin
    g_printf('Hardware entfernt: %s'#10, nm_device_get_iface(device));
  end;


  procedure main;
  var
    client: PNMClient;
    err: PGError = nil;
    devices, aps, slaves: PGPtrArray;
    device, ap, slave: Tgpointer;
    state_str, id, conType, iface, type_desc, hw_addr, ssid, bssid: pchar;
    i, j: integer;
    devType: TNMDeviceType;
    state: TNMActiveConnectionState;
    ssid_bytes: PGBytes;
    strength: Tguint8;
    freq, max_bitrate, speed: Tguint32;
    loop: PGMainLoop;
  begin
    client := nm_client_new(nil, @err);
    if client = nil then begin
      g_printf('Fehler beim Verbinden: %s'#19, err^.message);
      g_error_free(err);
      Exit;
    end;

    g_signal_connect(client, 'device-added', G_CALLBACK(@OnDeviceAdded), nil);
    g_signal_connect(client, 'device-removed', G_CALLBACK(@OnDeviceRemoved), nil);


    devices := nm_client_get_connections(client);
    g_printf('Gespeicherten Verbindungsprofile  (%d):'#10#10, devices^.len);

    g_printf('%-30s | %-20s'#10, 'Verbindungsname', 'Typ');
    g_printf('-----------------------------------------------------------------'#10);

    devices := nm_client_get_connections(client);
    for i := 0 to devices^.len - 1 do begin
      device := devices^.pdata[i];
      id := nm_connection_get_id(device);
      conType := nm_connection_get_connection_type(device);

      g_printf('%-30s | %-20s'#10, id, conType);
    end;
    g_printf(#10#10#10);

    // ======

    devices := nm_client_get_active_connections(client);
    g_printf('momentan aktiven Verbindungen:  (%d)'#10#10, devices^.len);

    g_printf('%-30s | %-15s | %-10s'#10, 'Name', 'Typ', 'Status');
    g_printf('-----------------------------------------------------------------'#10);

    for  i := 0 to devices^.len - 1 do begin
      device := devices^.pdata[i];

      id := nm_active_connection_get_id(device);
      conType := nm_active_connection_get_connection_type(device);

      state := nm_active_connection_get_state(device);
      if state = NM_ACTIVE_CONNECTION_STATE_ACTIVATED then begin
        state_str := 'Verbunden';
      end else begin
        state_str := 'Aktiviert...';
      end;

      g_printf('%-30s | %-15s | %-10s'#10, id, conType, state_str);
    end;
    g_printf(#10#10#10);

    // ======

    devices := nm_client_get_devices(client);
    g_printf('Hardware-Schnittstellen:  (%d)'#10#10, devices^.len);

    for  i := 0 to devices^.len - 1 do begin
      device := devices^.pdata[i];

      devType := nm_device_get_device_type(device);
      iface := nm_device_get_iface(device);

      iface := nm_device_get_iface(device);
      type_desc := nm_device_get_type_description(device);
      hw_addr := nm_device_get_hw_address(device);

      g_printf('%-15s | %-20s | %-18s'#10, iface, type_desc, hw_addr);

      case devType of
        NM_DEVICE_TYPE_WIFI: begin
          aps := nm_device_wifi_get_access_points(NM_DEVICE_WIFI(device));
          for  j := 0 to aps^.len - 1 do begin
            ap := aps^.pdata[j];
            ssid_bytes := nm_access_point_get_ssid(ap);

            if ssid_bytes <> nil then begin
              ssid := nm_utils_ssid_to_utf8(g_bytes_get_data(ssid_bytes, nil), g_bytes_get_size(ssid_bytes));
              strength := nm_access_point_get_strength(ap);
              freq := nm_access_point_get_frequency(ap);

              bssid := nm_access_point_get_bssid(ap);

              max_bitrate := nm_access_point_get_max_bitrate(ap);

              g_printf('  %-25s | %-17s | %-3u%% | %-4u MHz | %3u Mbit/s'#10, ssid, bssid, strength, freq, (max_bitrate div 1000));
              g_free(ssid);
            end;
          end;
        end;
        NM_DEVICE_TYPE_ETHERNET: begin
          speed := nm_device_ethernet_get_speed(NM_DEVICE_ETHERNET(device));
          g_printf('  Geschwindigkeit: %u Mbit/s'#10, speed);
        end;
        NM_DEVICE_TYPE_MODEM: begin
          g_printf('LTE/5G Modem.');
        end;
        NM_DEVICE_TYPE_BT: begin
          g_printf('Bluetooth');
        end;
        NM_DEVICE_TYPE_BRIDGE: begin
          slaves := nm_device_get_ports(device);
          if slaves <> nil then begin
            g_printf('  Angeschlossene Ports: %d'#10, slaves^.len);
            for j := 0 to slaves^.len - 1 do begin
              slave := slaves^.pdata[j];
              g_printf('    -> %s'#10, nm_device_get_iface(slave));
            end;
          end else begin
            g_printf('  Bridge leer (keine Ports)'#10);
          end;
        end;
        else begin
          g_printf('Unbekanntes Geräte'#10);
        end;
      end;

      state := nm_device_get_state(device);
      case state of
        NM_DEVICE_STATE_ACTIVATED: begin
          g_printf('  Status: Verbunden und bereit (Internet aktiv)'#10);
        end;
        NM_DEVICE_STATE_IP_CONFIG: begin
          g_printf('  Status: Bezieht gerade eine IP-Adresse...'#10);
        end;
        NM_DEVICE_STATE_UNAVAILABLE: begin
          g_printf('  Status: Nicht verfügbar (vielleicht kein Kabel?)'#10);
        end;
        NM_DEVICE_STATE_DISCONNECTED: begin
          g_printf('  Status: Kabel steckt, aber nicht verbunden'#10);
        end;
      end;

      g_printf(#10#10);
    end;

    loop := g_main_loop_new(nil, False);
    g_main_loop_run(loop);

    g_object_unref(client);
  end;

begin
  main;
end.
