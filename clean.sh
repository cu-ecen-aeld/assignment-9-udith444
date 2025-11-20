#!/bin/bash

# Clean script for Buildroot assignment
# This performs a distclean on the buildroot submodule

echo "Starting complete clean of Buildroot environment..."
cd buildroot
make distclean
echo "Clean completed successfully!"
