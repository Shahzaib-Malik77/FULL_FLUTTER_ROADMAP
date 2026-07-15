import re
import glob

def clean_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    # Remove all BoxShadow entirely
    content = re.sub(r'boxShadow:\s*\[.*?\]\s*,?', '', content, flags=re.DOTALL)
    
    # Remove BorderRadius.circular entirely, replace with BorderRadius.zero
    content = re.sub(r'BorderRadius\.circular\([^)]+\)', 'BorderRadius.zero', content)
    
    # Replace old playful colors with stark monochrome
    content = re.sub(r'AppColors\.accent[a-zA-Z]+', 'AppColors.text', content)
    
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(content)

for file in glob.glob('lib/screens/*.dart'):
    clean_file(file)

print("Files cleaned successfully.")
