import sys
try:
    from PIL import Image
except ImportError:
    import os
    os.system('pip install Pillow')
    from PIL import Image

img = Image.open(r'c:\Users\M.Shahzaib\Desktop\FLUTTER_ROADMAP\assets\progress_asset.png').convert('RGBA')
w, h = img.size

# Resize to something manageable for console
out_w = 120
out_h = int((out_w / w) * h)
img_small = img.resize((out_w, out_h), Image.Resampling.NEAREST)

pixels = img_small.load()

for y in range(out_h):
    line = ""
    for x in range(out_w):
        a = pixels[x,y][3]
        if a < 128:
            line += " "
        else:
            line += "#"
    print(f"{y:02d}: {line}")
