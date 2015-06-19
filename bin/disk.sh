DISK=`df -H -l | grep G | awk '{print "X"int($5/2)"X"}' | sed 's/\%//'`

echo $DISK | sed "s/X0X/a/;s/X1X/b/;s/X2X/c/;s/X3X/d/;s/X4X/e/;s/X5X/f/;s/X6X/g/;s/X7X/h/;s/X8X/i/;s/X9X/j/;s/X10X/k/;s/X11X/l/;s/X12X/m/;s/X13X/n/;s/X14X/o/;s/X15X/p/;s/X16X/q/;s/X17X/r/;s/X18X/s/;s/X19X/t/;s/X20X/u/;s/X21X/v/;s/X22X/w/;s/X23X/x/;s/X24X/y/;s/X25X/z/;s/X26X/A/;s/X27X/B/;s/X28X/C/;s/X29X/D/;s/X30X/E/;s/X31X/F/;s/X32X/G/;s/X33X/H/;s/X34X/I/;s/X35X/J/;s/X36X/K/;s/X37X/L/;s/X38X/M/;s/X39X/N/;s/X40X/O/;s/X41X/P/;s/X42X/Q/;s/X43X/R/;s/X44X/S/;s/X45X/T/;s/X46X/U/;s/X47X/V/;s/X48X/W/;s/X49X/X/;s/X50X/Y/"
