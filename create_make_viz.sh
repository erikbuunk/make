#!/bin/bash
make -Bnd | /Users/erik/bin/make2graph | dot -Tpng -o make_file_viz.png