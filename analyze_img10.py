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

visited = set()
boxes = []

for y in range(h):
    for x in range(w):
        r, g, b = pixels[x,y]
        if r < 40 and g < 40 and b < 40 and (x,y) not in visited:
            q = [(x,y)]
            visited.add((x,y))
            min_x, max_x = x, x
            min_y, max_y = y, y
            
            while q:
                cx, cy = q.pop(0)
                if cx < min_x: min_x = cx
                if cx > max_x: max_x = cx
                if cy < min_y: min_y = cy
                if cy > max_y: max_y = cy
                
                for dx, dy in [(-1,0), (1,0), (0,-1), (0,1)]:
                    nx, ny = cx+dx, cy+dy
                    if 0 <= nx < w and 0 <= ny < h and (nx,ny) not in visited:
                        nr, ng, nb = pixels[nx,ny]
                        if nr < 40 and ng < 40 and nb < 40:
                            visited.add((nx,ny))
                            q.append((nx,ny))
            
            bw = max_x - min_x + 1
            bh = max_y - min_y + 1
            if bw > 100 and bh > 20:
                boxes.append({
                    'x': min_x, 'y': min_y, 'w': bw, 'h': bh
                })

for i, b in enumerate(boxes):
    cx = b['x'] + b['w']/2
    cy = b['y'] + b['h']/2
    print('Dark Box {}: x={}, y={}, w={}, h={} | center=({}, {}) | c_x_rel={:.4f}, c_y_rel={:.4f}'.format(
        i, b['x'], b['y'], b['w'], b['h'], cx, cy, cx/w, cy/h))
