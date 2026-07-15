import sys
try:
    from PIL import Image
except ImportError:
    import os
    os.system('pip install Pillow')
    from PIL import Image

img = Image.open(r'c:\Users\M.Shahzaib\Desktop\FLUTTER_ROADMAP\assets\progress_asset.png').convert('RGBA')
w, h = img.size

pixels = img.load()

row_opaque = [0]*h
col_opaque = [0]*w

for y in range(h):
    for x in range(w):
        if pixels[x,y][3] > 128:
            row_opaque[y] += 1
            col_opaque[x] += 1

print("Rows with sudden changes:")
for y in range(0, h, 10):
    print(f"y={y}: {row_opaque[y]}")

print("Cols with sudden changes:")
for x in range(0, w, 20):
    print(f"x={x}: {col_opaque[x]}")

