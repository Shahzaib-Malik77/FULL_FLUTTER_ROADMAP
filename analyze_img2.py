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
visited = set()
boxes = []

for y in range(h):
    for x in range(w):
        if pixels[x,y][3] < 128 and (x,y) not in visited:
            q = [(x,y)]
            visited.add((x,y))
            min_x, max_x = x, x
            min_y, max_y = y, y
            touches_border = False
            
            while q:
                cx, cy = q.pop(0)
                if cx < min_x: min_x = cx
                if cx > max_x: max_x = cx
                if cy < min_y: min_y = cy
                if cy > max_y: max_y = cy
                if cx == 0 or cx == w-1 or cy == 0 or cy == h-1:
                    touches_border = True
                
                for dx, dy in [(-1,0), (1,0), (0,-1), (0,1)]:
                    nx, ny = cx+dx, cy+dy
                    if 0 <= nx < w and 0 <= ny < h and (nx,ny) not in visited:
                        if pixels[nx,ny][3] < 128:
                            visited.add((nx,ny))
                            q.append((nx,ny))
            
            bw = max_x - min_x + 1
            bh = max_y - min_y + 1
            if bw > 10 and bh > 10:
                boxes.append({
                    'x': min_x, 'y': min_y, 'w': bw, 'h': bh,
                    'touches_border': touches_border
                })

for i, b in enumerate(boxes):
    cx = b['x'] + b['w']/2
    cy = b['y'] + b['h']/2
    print('Box {} (Border: {}): x={}, y={}, w={}, h={} | center=({}, {})'.format(
        i, b['touches_border'], b['x'], b['y'], b['w'], b['h'], cx, cy))
