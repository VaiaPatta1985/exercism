<?php

class PizzaPi
{
    public function calculateDoughRequirement($pizzas, $people_per_pizza)
    {
        return $pizzas * (($people_per_pizza * 20) + 200);
    }

    public function calculateSauceRequirement($pizzas, $sauce_in_can)
    {
        return $pizzas * 125.0 / $sauce_in_can;
    }

    public function calculateCheeseCubeCoverage($cheese_cube_side, $cheese_layer_thickness, $pizza_diameter)
    {
        return intval(($cheese_cube_side ** 3) / ($cheese_layer_thickness * $pizza_diameter * 3.14159));
    }

    public function calculateLeftOverSlices($pizzas, $people)
    {
        return (8 * $pizzas) % $people;
    }
}
