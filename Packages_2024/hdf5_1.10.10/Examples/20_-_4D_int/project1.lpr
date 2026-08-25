program project1;

uses
  fp_hdf5_serial,
  fp_hdf5_serial_hl,
  fp_hdf5_openmpi;

const
  DATEINAME = '/tmp/test.h5';
  DATASET_NAME = 'mein_array';

  procedure schreibe_hdf5_datei;
  const
    dims: array [0..3] of Thsize_t = (2, 2, 3, 5);
    data: array[0..59] of uint32 = (
      1111, 1112, 1113, 1114, 1115,
      1121, 1122, 1123, 1124, 1125,
      1131, 1132, 1133, 1134, 1135,

      1211, 1212, 1213, 1214, 1215,
      1221, 1222, 1223, 1224, 1225,
      1231, 1232, 1233, 1234, 1235,


      2111, 2112, 2113, 2114, 2115,
      2121, 2122, 2123, 2124, 2125,
      2131, 2132, 2133, 2134, 2135,

      2211, 2212, 2213, 2214, 2215,
      2221, 2222, 2223, 2224, 2225,
      2231, 2232, 2233, 2234, 2235);

  var
    file_id, dataspace_id, dataset_id: Thid_t;
  begin
    file_id := H5Fcreate(DATEINAME, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
    if file_id < 0 then begin
      WriteLn('[Schreiben] Fehler beim Erstellen der Datei!');
      Exit;;
    end;

    dataspace_id := H5Screate_simple(Length(dims), dims, nil);
    dataset_id := H5Dcreate2(file_id, DATASET_NAME, H5T_NATIVE_UINT32_g, dataspace_id, H5P_DEFAULT, H5P_DEFAULT, H5P_DEFAULT);

    if dataset_id >= 0 then begin
      H5Dwrite(dataset_id, H5T_NATIVE_UINT32_g, H5S_ALL, H5S_ALL, H5P_DEFAULT, @data);
      H5Dclose(dataset_id);
      WriteLn('[Schreiben] HDF5-Datei erfolgreich mit 2x5x2 Matrix erstellt!');
    end;

    H5Sclose(dataspace_id);
    H5Fclose(file_id);
  end;

  procedure lese_hdf5_datei;
  var
    dims: array [0..3] of Thsize_t;
    file_id, dataset_id, type_id, dataspace_id: Thid_t;
    rank: longint;
    raw_data: Puint32_t;
    z, y, x, w: integer;

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
    if H5Tequal(type_id, H5T_NATIVE_UINT32_g) = 0 then begin
      WriteLn('[Fehler] Daten sind keine Double-Werte!');
      H5Tclose(type_id);
      H5Dclose(dataset_id);
      H5Fclose(file_id);
      Exit;
    end;

    dataspace_id := H5Dget_space(dataset_id);
    rank := H5Sget_simple_extent_ndims(dataspace_id);
    WriteLn(#10'Matrix:      ', rank, 'D');

    if rank <> 4 then begin
      WriteLn('[Fehler] Erwartet wurde eine 3D-Matrix, Datei hat aber Dimensionen! ', rank);
      H5Sclose(dataspace_id);
      H5Dclose(dataset_id);
      H5Fclose(file_id);
      Exit;
    end;

    H5Sget_simple_extent_dims(dataspace_id, dims, nil);
    WriteLn('Dimensionen: ', dims[0], 'x', dims[1], 'x', dims[2], 'x', dims[3]);

    raw_data := GetMem(dims[0] * dims[1] * dims[2] * dims[2] * sizeof(double));

    if raw_data <> nil then begin
      H5Dread(dataset_id, H5T_NATIVE_UINT32_g, H5S_ALL, H5S_ALL, H5P_DEFAULT, raw_data);
      for w := 0 to dims[0] - 1 do begin
        for z := 0 to dims[1] - 1 do begin
          for y := 0 to dims[2] - 1 do begin
            for x := 0 to dims[3] - 1 do begin
              Write(raw_data[w * (dims[1] * dims[2] * dims[3]) + z * (dims[2] * dims[3]) + y * dims[3] + x]: 5, ' ');
            end;
            Write('    ');
          end;
          WriteLn();
        end;
        WriteLn('------------');
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
