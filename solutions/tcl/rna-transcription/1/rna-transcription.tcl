proc to-rna {dna} {
#G -> C
#C -> G
#T -> A
#A -> U
#[string index $string 1]
    set idx 0
    set total [string length $dna]
    set k ""
    while {$idx < $total} {
        set c [string index $dna $idx]
        switch $c G {append k C} C {append k G} T {append k A} A {append k U}
        set idx [expr {$idx + 1}]
    }
    return $k
}
