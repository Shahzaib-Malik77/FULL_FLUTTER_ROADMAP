import sys
try:
    from PIL import Image
except ImportError:
    import os
    os.system('pip install Pillow')
    from PIL import Image
import math

img = Image.open(r'c:\Users\M.Shahzaib\Desktop\FLUTTER_ROADMAP\assets\progress_asset.png').convert('RGB')
w, h = img.size
pixels = img.load()

print("Row Profiles (y=400 to 900):")
for y in range(400, 900, 5):
    r_sum, g_sum, b_sum = 0, 0, 0
    for x in range(w):
        r, g, b = pixels[x,y]
        r_sum += r; g_sum += g; b_sum += b
    r_avg = r_sum / w
    g_avg = g_sum / w
    b_avg = b_sum / w
    print(f"y={y:03d} | R:{r_avg:5.1f} G:{g_avg:5.1f} B:{b_avg:5.1f}")
