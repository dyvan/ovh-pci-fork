import pyfiglet
import sys

def create_ascii_art(text):
    # Use the Figlet font 'slant' for ASCII art
    custom_fig = pyfiglet.Figlet(font='slant')
    
    # Generate ASCII art
    ascii_art = custom_fig.renderText(text)
    
    return ascii_art

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python c.py 'Your Text'")
    else:
        text = sys.argv[1]
        ascii_art = create_ascii_art(text)
        print(ascii_art)

