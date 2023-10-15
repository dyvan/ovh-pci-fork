import argparse
import sys

# Define the valid target values
valid_targets = ['titi', 'toto', 'tata']

# Create an argument parser
parser = argparse.ArgumentParser(description="Script to print a target text")

# Add the target argument
parser.add_argument('-t', '--target', choices=valid_targets, required=True,
                    help="Choose from 'titi', 'toto', 'tata'")

# Parse the command-line arguments
args = parser.parse_args()

# Check if the provided target is valid and print the corresponding text
if args.target in valid_targets:
    print(args.target)
else:
    # Print an error message to stderr
    sys.stderr.write("error: argument -t/--target: invalid choice: '{}' (choose from {})\n".format(args.target, ', '.join(valid_targets)))
    sys.exit(1)