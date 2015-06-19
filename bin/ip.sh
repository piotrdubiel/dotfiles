#!/bin/bash

echo IP: `ifconfig  en0 |  awk '/inet / { if ($2 != "127.0.0.1")  print $2; }'`
