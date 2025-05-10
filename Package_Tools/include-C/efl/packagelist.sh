#!/bin/bash

echo "| Bibliothek | Include-Pfade |"
echo "|------------|---------------|"

libs=(efl elementary evas edje ecore emotion eio eldibus)

for lib in "${libs[@]}"; do
  # Alle Include-Pfade sammeln (ohne -I)
  inc_paths=$(pkg-config --cflags-only-I "$lib" 2>/dev/null | sed 's/-I//g')
  
  if [ -z "$inc_paths" ]; then
    inc_paths="(keine Include-Pfade gefunden)"
  else
    # Pfade untereinander, mit <br> für Markdown-Zeilenumbruch
    inc_paths=$(echo "$inc_paths" | tr ' ' '\n' | sed ':a;N;$!ba;s/\n/<br>/g')
  fi
  
  echo "| $lib | $inc_paths |"
done

