import sys
try:
    from PIL import Image
except ImportError:
    import os
    os.system('pip install Pillow')
    from PIL import Image
from collections import Counter

img = Image.open(r'c:\Users\M.Shahzaib\Desktop\FLUTTER_ROADMAP\assets\progress_asset.png').convert('RGB')
w, h = img.size
pixels = img.load()

colors = Counter()
for y in range(400, 800):
    for x in range(w):
        colors[pixels[x,y]] += 1

for color, count in colors.most_common(20):
    print(f"Color {color}: {count} pixels")
