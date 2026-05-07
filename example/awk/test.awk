#!/usr/bin/env awk

function getYears(span) {
    split(span, years, "-")
    result = "Still POTUS"
    if (years[2]){
      result = "sat for " years[2]-years[1] " years"
    } 
    return result
  }

BEGIN {
  FS=","
  printf ("%s\n", "Start på rapport")
}
{
  printf "%s: %s %s\n", NR, $1, getYears($2)
}
END {
  printf("%s\n", "Slut på rapport")
}
