#!/bin/sh -vx

sh -c "/root/.nife/bin/nifectl $*"

SET PATH=$PATH:/root/.nife/bin

sh -c "nifectl $*"
