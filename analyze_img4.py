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

row_alpha = [0]*h
for y in range(h):
    for x in range(w):
        if pixels[x,y][3] < 250 and pixels[x,y][3] > 0:
            row_alpha[y] += 1

print("Rows with semi-transparent pixels:")
for y in range(350, 750, 10):
    print(f"y={y}: {row_alpha[y]}")
