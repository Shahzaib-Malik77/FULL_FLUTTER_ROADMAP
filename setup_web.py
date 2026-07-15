import urllib.request
import os

web_dir = 'web'
if not os.path.exists(web_dir):
    os.makedirs(web_dir)

print("Downloading sqflite_sw.js...")
urllib.request.urlretrieve('https://raw.githubusercontent.com/tekartik/sqflite/master/packages_web/sqflite_common_ffi_web/lib/src/sw/sqflite_sw.js', 'web/sqflite_sw.js')

print("Downloading sqlite3.wasm...")
urllib.request.urlretrieve('https://github.com/simolus3/sqlite3.dart/releases/download/sqlite3-2.4.0/sqlite3.wasm', 'web/sqlite3.wasm')

print("Done!")
