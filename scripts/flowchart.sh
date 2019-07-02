#!/bin/sh

echo "$2" > flowchart.txt
node_modules/diagrams/bin/diagrams.js flowchart flowchart.txt $1
rm flowchart.txt
