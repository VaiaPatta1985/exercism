BEGIN {
}
{
strtomatch = $0
out = ""
firstletterpos = match(strtomatch, /([ ]|-|^)[^a-zA-Z]*[a-zA-Z]/)
while (RLENGTH > -1) {
    matchlastletter = RLENGTH - 1
    firstletterpos += matchlastletter
    out = out substr(strtomatch, firstletterpos, 1)
    strtomatch = substr(strtomatch, firstletterpos + 1)
    firstletterpos = match(strtomatch, /([ ]|-)[^a-zA-Z]*[a-zA-Z]/)
    }
print toupper(out)
}
