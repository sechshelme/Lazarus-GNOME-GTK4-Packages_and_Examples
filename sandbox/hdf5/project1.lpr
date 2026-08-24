program project1;

uses
  H5public,
  H5Cpublic,
  H5ACpublic,
  H5Ipublic,
  H5Spublic,
  H5Opublic,
  H5Tpublic,
  H5Apublic,
  H5DOpublic,
  H5Dpublic,
  H5Epubgen,
  H5Epublic,
  H5FDcore,
  H5FDfamily,
  H5FDlog,
  H5Fpublic,
  H5FDpublic,
  H5pubconf,
  H5FDmulti,
  H5FDsec2,
  H5FDstdio,
  H5Lpublic,
  H5Gpublic,
  H5Include,
  H5LDpublic,
  H5MMpublic,
  H5PLpublic,
  H5Zpublic,
  H5Ppublic,
  H5Rpublic,

  H5FDros3,
  H5FDhdfs,
  H5FDsplitter,

  //  H5FDdirect,       // libhdf5_serial.so
  //  H5FDmirror,       // libhdf5_serial.so

  H5TBpublic,        // libhdf5_serial_hl.so
  H5LTpublic,        // libhdf5_serial_hl.so
  H5IMpublic,        // libhdf5_serial_hl.so
  H5PTpublic,        // libhdf5_serial_hl.so
  H5DSpublic,        // libhdf5_serial_hl.so


  H5f90i,            // libhdf5_serial_fortan.so
  H5f90i_gen,        // libhdf5_serial_fortan.so

  H5FDmpi,           // libhdf5_openmpi.so
  H5FDmpio,          // libhdf5_openmpi.so

  H5FDwindows,       // windows


  fp_hdf5;



const
  DATEINAME = 'test.h5';
  DATASET_NAME = 'mein_array';

  procedure schreibe_hdf5_datei;
  const
    dims: array [0..2] of Thsize_t = (2, 5, 2);
    data: array[0..19] of double = (
      1.1, 2.2, 3.3, 4.4, 5.5, 1.2, 2.3, 3.4, 4.4, 5.6,
      1.1, 2.2, 3.3, 4.4, 5.5, 1.2, 2.3, 3.4, 4.4, 5.6);
  var
    file_id, dataspace_id, dataset_id: Thid_t;
  begin
    file_id := H5Fcreate(DATEINAME, H5F_ACC_TRUNC, H5P_DEFAULT, H5P_DEFAULT);
    if file_id < 0 then begin
      WriteLn('[Schreiben] Fehler beim Erstellen der Datei!');
      Exit;;
    end;

    dataspace_id := H5Screate_simple(3, dims, nil);
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
    WriteLn(#10'[Lesen] Dimensionen-Anzahl (Rank): ', rank);

    if rank <> 3 then begin
      WriteLn('[Fehler] Erwartet wurde eine 3D-Matrix, Datei hat aber Dimensionen! ', rank);
      H5Sclose(dataspace_id);
      H5Dclose(dataset_id);
      H5Fclose(file_id);
      Exit;
    end;

    H5Sget_simple_extent_dims(dataspace_id, dims, nil);
    WriteLn('[Lesen] Dimensionen: ', dims[0], 'x', dims[1], 'x', dims[2]);

    raw_data := GetMem(dims[0] * dims[1] * dims[2] * sizeof(double));

    if raw_data <> nil then begin
      H5Dread(dataset_id, H5T_NATIVE_DOUBLE_g, H5S_ALL, H5S_ALL, H5P_DEFAULT, raw_data);
      WriteLn('[Lesen] Erstes Element der Matrix: ', raw_data[0]: 2: 1);
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
