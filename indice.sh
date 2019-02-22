#!/bin/sh

grep -Po "@auto source/\K.*?(?=<)" index.leo
