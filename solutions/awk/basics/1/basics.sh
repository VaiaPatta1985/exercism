#!/bin/sh

## task 1
awk 'BEGIN { FS = ":" }
{ print $1 }
' ./passwd

## task 2
awk 'BEGIN { FS = ":" }
{ print NR }' ./passwd

## task 3
awk '
    function startsWith(text, prefix) {
        return text ~ "^"prefix
    }
BEGIN { FS = ":" }
! (startsWith($6, "/home") || startsWith($6, "/root"))' ./passwd

## task 4
awk '
    function startsWith(text, prefix) {
        return text ~ "^"prefix
    }
BEGIN { FS = ":" }
(startsWith($6, "/home") || startsWith($6, "/root")) && $7 == "/bin/bash"' ./passwd
