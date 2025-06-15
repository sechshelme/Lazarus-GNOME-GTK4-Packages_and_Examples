import os
import re

def find_pas_files(directory):
    pas_files = []
    for root, _, files in os.walk(directory):
        for file in files:
            if file.endswith('.pas'):
                pas_files.append(os.path.join(root, file))
    return pas_files

def extract_uses(filename):
    uses = []
    with open(filename, 'r', encoding='utf-8', errors='ignore') as f:
        content = f.read()
        # Suche nach "uses" bis zum nächsten ";"
        match = re.search(r'uses\s+([^;]+);', content, re.IGNORECASE | re.DOTALL)
        if match:
            units = match.group(1)
            # Entferne Kommentare und Zeilenumbrüche
            units = re.sub(r'\{.*?\}|\(\*.*?\*\)', '', units, flags=re.DOTALL)
            units = units.replace('\n', ' ').replace('\r', ' ')
            # Splitte an Kommas und entferne Leerzeichen
            uses = [u.strip() for u in units.split(',') if u.strip()]
    return uses

def main(package_dir):
    pas_files = find_pas_files(package_dir)
    unit_deps = {}
    for pas_file in pas_files:
        unit_name = os.path.splitext(os.path.basename(pas_file))[0].lower()
        deps = extract_uses(pas_file)
        unit_deps[unit_name] = deps

    print('Unit-Abhängigkeiten:')
    for unit, deps in unit_deps.items():
        print(f'{unit}: {", ".join(deps)}')

if __name__ == '__main__':
    # Pfad zum Package-Verzeichnis anpassen!
    main('.')

