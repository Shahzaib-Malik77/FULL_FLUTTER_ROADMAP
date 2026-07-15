import sys
try:
    from PIL import Image
except ImportError:
    import os
    os.system('pip install Pillow')
    from PIL import Image

img = Image.open(r'c:\Users\M.Shahzaib\Desktop\FLUTTER_ROADMAP\assets\progress_asset.png').convert('RGB')
w, h = img.size
pixels = img.load()

# Analyze the box at x=486, y=691, w=240, h=44
ref_x, ref_y, ref_w, ref_h = 486, 691, 240, 44

r_sum, g_sum, b_sum = 0, 0, 0
for y in range(ref_y, ref_y + ref_h):
    for x in range(ref_x, ref_x + ref_w):
        r, g, b = pixels[x,y]
        r_sum += r; g_sum += g; b_sum += b

area = ref_w * ref_h
ref_r = r_sum / area
ref_g = g_sum / area
ref_b = b_sum / area

print(f"Reference Box Avg Color: R={ref_r:.1f}, G={ref_g:.1f}, B={ref_b:.1f}")

# Now scan the image in chunks to find similar regions
print("Finding similar regions...")
found = []
for cy in range(650, 750, 5):
    for cx in range(0, w - ref_w, 10):
        r_sum, g_sum, b_sum = 0, 0, 0
        # Check a smaller sample to be fast
        sample_w, sample_h = ref_w // 4, ref_h // 2
        for y in range(cy, cy + sample_h):
            for x in range(cx, cx + sample_w):
                r, g, b = pixels[x,y]
                r_sum += r; g_sum += g; b_sum += b
        s_area = sample_w * sample_h
        avg_r = r_sum / s_area
        avg_g = g_sum / s_area
        avg_b = b_sum / s_area
        
        diff = abs(avg_r - ref_r) + abs(avg_g - ref_g) + abs(avg_b - ref_b)
        if diff < 15:
            found.append((cx, cy, diff))

# Group nearby found boxes
grouped = []
for cx, cy, diff in found:
    merged = False
    for i, (gx, gy, gcount) in enumerate(grouped):
        if abs(cx - gx) < 100 and abs(cy - gy) < 20:
            # simple average
            grouped[i] = ((gx*gcount + cx)/(gcount+1), (gy*gcount + cy)/(gcount+1), gcount+1)
            merged = True
            break
    if not merged:
        grouped.append((cx, cy, 1))

grouped.sort(key=lambda g: g[0])
for gx, gy, gcount in grouped:
    center_x = gx + ref_w/2
    center_y = gy + ref_h/2
    print(f"Found match near x={gx:.1f}, y={gy:.1f} (center rel: {center_x/w:.4f}, {center_y/h:.4f})")

