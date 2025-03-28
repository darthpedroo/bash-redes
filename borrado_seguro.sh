#!/bin/bash
mkdir ~/BASURA 2>/dev/null
gzip $1 
mv $1.gz ~/BASURA

