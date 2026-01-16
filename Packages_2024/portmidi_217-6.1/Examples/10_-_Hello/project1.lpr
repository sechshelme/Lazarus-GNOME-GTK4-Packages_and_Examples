program project1;

// sudo modprobe snd_virmidi

uses
  fp_portmidi;

  procedure ListDevice;
  var
    numDevices: longint;
    info: PPmDeviceInfo;
    i: integer;
  begin
    Pm_Initialize;

    numDevices := Pm_CountDevices();
    WriteLn('MIDI-Geräte gefunden: ', numDevices);

    for i := 0 to numDevices - 1 do begin
      info := Pm_GetDeviceInfo(i);
      if info <> nil then begin
        WriteLn('Gerät ', i: 3, '  Name: ', info^.name: 30, '  Input: ', boolean(info^.input): 5, '  Output: ', boolean(info^.output): 5);
      end;
    end;

    Pm_Terminate;
    WriteLn(#10);
  end;

  procedure SendCommand;
  var
    result: TPmError;
    deviceId: TPmDeviceID;
    midiStream: PPortMidiStream;
  begin

    result := Pm_Initialize();
    if result <> pmNoError then begin
      WriteLn('PortMidi konnte nicht initialisiert werden: ', Pm_GetErrorText(result));
      Exit;
    end;

    deviceId := Pm_GetDefaultOutputDeviceID;
    if deviceId = -1 then begin
      WriteLn('Kein MIDI-Ausgabegerät gefunden.');
      Pm_Terminate;
      Exit;
    end;

    result := Pm_OpenOutput(@midiStream, deviceId, nil, 128, nil, nil, 0);
    if result <> pmNoError then begin
      WriteLn('Konnte MIDI-Ausgabegerät nicht öffnen: ', Pm_GetErrorText(result));
      Pm_Terminate;
      Exit;
    end;

    Pm_WriteShort(midiStream, 0, Pm_Message($90, 60, 64));
    WriteLn('Note On gesendet.');

    Pm_WriteShort(midiStream, 0, Pm_Message($80, 60, 0));
    WriteLn('Note Off gesendet.');

    Pm_Close(midiStream);
    Pm_Terminate;
  end;

  procedure main;
  begin
    ListDevice;
    SendCommand;
  end;

begin
  main;
end.
