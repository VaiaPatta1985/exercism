module CarsAssemble

let baseProduction: float = 221

let successRate (speed: int): float =
    (100.0 - float (if speed > 4 then (10 + (if speed > 8 then (10 + (if speed = 10 then 3 else 0)) else 0)) else 0)) / 100.0

let productionRatePerHour (speed: int): float =
    (float speed) * (successRate speed) * baseProduction

let workingItemsPerMinute (speed: int): int =
    int ((productionRatePerHour speed) / 60.0)
