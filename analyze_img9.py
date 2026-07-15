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

print("Transparent segments in columns (y between 400 and 800):")
for x in range(100, 1400, 10):
    in_transparent = False
    start_y = -1
    for y in range(400, 800):
        if pixels[x,y][3] < 128:
            if not in_transparent:
                in_transparent = True
                start_y = y
        else:
            if in_transparent:
                in_transparent = False
                print(f"Col {x}: Trans from y={start_y} to y={y-1} (h={y-start_y})")
    
    if in_transparent:
        print(f"Col {x}: Trans from y={start_y} to y={799} (h={800-start_y})")

