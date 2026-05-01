namespace eval resistorColor {
    proc colorCode {args} {
        switch $args black "set c 0" brown "set c 1" red "set c 2" orange "set c 3" yellow "set c 4" green "set c 5" blue "set c 6" violet "set c 7" grey "set c 8" white "set c 9" default {set c "Invalid color: ";append c $args;throw {INVALID_ARGUMENT} $c}
        return $c
    }

    proc colors {args} {
        return "black brown red orange yellow green blue violet grey white"
    }
}
