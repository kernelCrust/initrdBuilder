#!/bin/sh
set -e

echo "[ CLEAN ]"

if [ -z "$1" ]; then
	echo "E: empty root-dir path"
	exit 1
fi

echo "--> $1"
mkdir -p	$1
rm -rf		$1/*
rm -rf		$1/.??*
mkdir -p	$1/proc
