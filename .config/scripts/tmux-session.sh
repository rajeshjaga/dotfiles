#!/bin/bash
#

list="Exit i3
close"

$list | fzf

read readThis

echo $readThis
