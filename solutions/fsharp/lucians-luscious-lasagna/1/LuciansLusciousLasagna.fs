module LuciansLusciousLasagna

let expectedMinutesInOven = 40

let remainingMinutesInOven x = expectedMinutesInOven - x

let preparationTimeInMinutes x = 2 * x

let elapsedTimeInMinutes layer minsInOven = preparationTimeInMinutes layer + minsInOven
