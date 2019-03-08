#!/bin/sh

# Cambia los --- por --- {-}
perl -p0e 's/---\n\n/--- {-}\n\n/g' | perl -p0e 's/[^\n]\n--- \{-\}/\n---/'
