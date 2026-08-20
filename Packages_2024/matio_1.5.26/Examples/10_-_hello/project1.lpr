program project1;

// matdump -f whos test.mat
// matdump test.mat -d

// sudo apt install octave

// octave --gui

// flatpak install flathub org.octave.Octave
// flatpak run org.octave.Octave --gui

uses
  fp_matio;

  procedure schreibe_mat_datei(dateiname: pchar);
  const
    dims: array[0..2] of Tsize_t = (2, 5, 2);

    data: array [0..19] of double = (
      1.1, 2.2, 3.3, 4.4, 5.5, 1.2, 2.3, 3.4, 4.4, 5.6,
      1.1, 2.2, 3.3, 4.4, 5.5, 1.2, 2.3, 3.4, 4.4, 5.6);
  var
    matfp: Pmat_t;
    matvar: Pmatvar_t;

  begin
    matfp := Mat_CreateVer(dateiname, nil, MAT_FT_MAT5);
    if matfp = nil then begin
      WriteLn('[Schreiben] Fehler beim Erstellen der Datei!');
      Exit;
    end;

    matvar := Mat_VarCreate('mein_array', MAT_C_DOUBLE, MAT_T_DOUBLE, 3, dims, @data, 0);
    if matvar <> nil then begin
      Mat_VarWrite(matfp, matvar, MAT_COMPRESSION_NONE);
      Mat_VarFree(matvar);
      WriteLn('[Schreiben] Datei ', dateiname, ' erfolgreich mit einer 2x5x2 Matrix erstellt!');
    end;

    Mat_Close(matfp);
  end;

  procedure lese_mat_datei(dateiname: pchar);
  var
    matfp: Pmat_t;
    matvar: Pmatvar_t;
    raw_data: PDouble;
    zeilen, spalten, ebenen, index: Tsize_t;
    z, r, c: integer;
  begin
    matfp := Mat_Open(dateiname, MAT_ACC_RDONLY);
    if matfp = nil then begin
      WriteLn('[Lesen] Fehler beim Öffnen der Datei!');
      Exit;;
    end;

    matvar := Mat_VarRead(matfp, 'mein_array');
    if matvar <> nil then begin
      if matvar^.class_type = MAT_C_DOUBLE then begin
        WriteLn();
        WriteLn('[Lesen] Dimensioen ', matvar^.rank);
        WriteLn('[Lesen] Variable "', matvar^.name, '" erfolgreich geladen.');
        WriteLn('[Lesen] Dimensionen: ', matvar^.dims[0], 'x', matvar^.dims[1], 'x', matvar^.dims[2]);

        raw_data := PDouble(matvar^.data);

        zeilen := matvar^.dims[0];
        spalten := matvar^.dims[1];
        ebenen := matvar^.dims[2];

        for z := 0 to ebenen - 1 do begin
          WriteLn();
          WriteLn('Ebene: ', z);

          for r := 0 to zeilen - 1 do begin
            for c := 0 to spalten - 1 do begin
              index := (z * zeilen * spalten) + (c * zeilen) + r;
              Write(raw_data[index]:2:1, '  ');
            end;
            WriteLn();
          end;
        end;
      end;
      Mat_VarFree(matvar);
    end else begin
      WriteLn('[Lesen] Variable nicht gefunden!');
    end;
    Mat_Close(matfp);
  end;

  procedure main;
  const
    dateiname = 'test.mat';
  begin
    schreibe_mat_datei(dateiname);
    lese_mat_datei(dateiname);
  end;

begin
  main;
end.
