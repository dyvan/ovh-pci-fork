import sys

if len(sys.argv) > 1:
    text_to_print = ' '.join(sys.argv[1:])
    print(text_to_print)
else:
    print("No text input provided.")
