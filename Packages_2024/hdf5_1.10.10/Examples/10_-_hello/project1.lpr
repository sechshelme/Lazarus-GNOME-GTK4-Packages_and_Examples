program project1;

uses
  fp_hdf5_serial,
  fp_hdf5_serial_hl,
  fp_hdf5_openmpi;

const
  DATEINAME = 'test.h5';
  DATASET_NAME = 'mein_array';

  procedure schreibe_hdf5_datei;
  const
    dims: array [0..2] of Thsize_t = (2, 3, 5);
    data: array[0..29] of double = (
      1.1, 2.2, 3.3, 4.4, 5.5,
      1.2, 2.3, 3.4, 4.4, 5.6,
      1.0, 2.0, 3.0, 4.0, 5.0,

      1.1, 2.2, 3.3, 4.4, 5.5,
      1.2, 2.3, 3.4, 4.4, 5.6,
      1.8, 2.8, 3.8, 4.8, 5.8);

  var
    file_id, dataspace_id, dataset_id: Thid_t;
  begin
    file_id := H5Fcreate(DATEINAME, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
    if file_id < 0 then begin
      WriteLn('[Schreiben] Fehler beim Erstellen der Datei!');
      Exit;;
    end;

    dataspace_id := H5Screate_simple(Length(dims), dims, nil);
    dataset_id := H5Dcreate2(file_id, DATASET_NAME, H5T_NATIVE_DOUBLE_g, dataspace_id, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);

    if dataset_id >= 0 then begin
      H5Dwrite(dataset_id, H5T_NATIVE_DOUBLE_g, H5S_ALL, H5S_ALL, H5P_DEFAULT, @data);
      H5Dclose(dataset_id);
      WriteLn('[Schreiben] HDF5-Datei erfolgreich mit 2x5x2 Matrix erstellt!');
    end;

    H5Sclose(dataspace_id);
    H5Fclose(file_id);
  end;

  procedure lese_hdf5_datei;
  var
    dims: array [0..2] of Thsize_t;
    file_id, dataset_id, type_id, dataspace_id: Thid_t;
    rank: longint;
    raw_data: PDouble;
    z, y, x: integer;

  begin
    file_id := H5Fopen(DATEINAME, H5F_ACC_RDONLY, H5P_DEFAULT);
    if file_id < 0 then begin
      WriteLn('[Lesen] Fehler beim Öffnen der Datei!');
      Exit;
    end;

    dataset_id := H5Dopen2(file_id, DATASET_NAME, H5P_DEFAULT);
    if dataset_id < 0 then begin
      WriteLn('[Lesen] Variable nicht gefunden!   ', DATASET_NAME);
      H5Fclose(file_id);
      Exit;
    end;

    type_id := H5Dget_type(dataset_id);
    if H5Tequal(type_id, H5T_NATIVE_DOUBLE_g) = 0 then begin
      WriteLn('[Fehler] Daten sind keine Double-Werte!');
      H5Tclose(type_id);
      H5Dclose(dataset_id);
      H5Fclose(file_id);
      Exit;
    end;

    dataspace_id := H5Dget_space(dataset_id);
    rank := H5Sget_simple_extent_ndims(dataspace_id);
    WriteLn(#10'Matrix:      ', rank, 'D');

    if rank <> 3 then begin
      WriteLn('[Fehler] Erwartet wurde eine 3D-Matrix, Datei hat aber Dimensionen! ', rank);
      H5Sclose(dataspace_id);
      H5Dclose(dataset_id);
      H5Fclose(file_id);
      Exit;
    end;

    H5Sget_simple_extent_dims(dataspace_id, dims, nil);
    WriteLn('Dimensionen: ', dims[0], 'x', dims[1], 'x', dims[2]);

    raw_data := GetMem(dims[0] * dims[1] * dims[2] * sizeof(double));

    if raw_data <> nil then begin
      H5Dread(dataset_id, H5T_NATIVE_DOUBLE_g, H5S_ALL, H5S_ALL, H5P_DEFAULT, raw_data);
      for z := 0 to dims[0] - 1 do begin
        for y := 0 to dims[1] - 1 do begin
          for x := 0 to dims[2] - 1 do begin
            Write(raw_data[z * (dims[1] * dims[2]) + y * dims[2] + x]: 2: 1, ' ');
          end;
          Write('    ');
        end;
        WriteLn();
      end;

      Freemem(raw_data);
    end;

    H5Sclose(dataspace_id);
    H5Dclose(dataset_id);
    H5Fclose(file_id);
  end;

  procedure main;
  begin
    schreibe_hdf5_datei;
    lese_hdf5_datei;
  end;

begin
  main;
end.
