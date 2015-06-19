#!/bin/bash

echo UPTIME: `uptime | sed 's/.*up \([^,]*\), .*/\1/'`
