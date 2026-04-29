// @ts-check
//
// The line above enables type checking for this file. Various IDEs interpret
// the @ts-check directive. It will give you helpful autocompletion when
// implementing this exercise.

/**
 * Determines how long it takes to prepare a certain juice.
 *
 * @param {string} name
 * @returns {number} time in minutes
 */
export function timeToMixJuice(name) {
  switch(name){
    case 'Pure Strawberry Joy':
      return 0.5;
    case 'Energizer':
    case 'Green Garden':
      return 1.5;
    case 'Tropical Island':
      return 3;
    case 'All or Nothing':
      return 5;
    default:
      return 2.5;
  }
}

/**
 * Calculates the number of limes that need to be cut
 * to reach a certain supply.
 *
 * @param {number} wedgesNeeded
 * @param {string[]} limes
 * @returns {number} number of limes cut
 */
export function limesToCut(wedgesNeeded, limes) {
  let wedgesAvailable = 0;
  let fruitIndex = 0;
  let wedgesFromCurrentFruit = 0;
  let fruitAvailable = limes.length;
  while (wedgesAvailable < wedgesNeeded && fruitIndex < fruitAvailable){
    wedgesFromCurrentFruit = 0;
    switch(limes[fruitIndex]){
      case 'large':
        wedgesFromCurrentFruit+=2;
      case 'medium':
        wedgesFromCurrentFruit+=2;
      case 'small':
        wedgesFromCurrentFruit+=6;
    }
    wedgesAvailable+=wedgesFromCurrentFruit;
    fruitIndex+=1;
  }
  return fruitIndex;
}

/**
 * Determines which juices still need to be prepared after the end of the shift.
 *
 * @param {number} timeLeft
 * @param {string[]} orders
 * @returns {string[]} remaining orders after the time is up
 */
export function remainingOrders(timeLeft, orders) {
  let timeToMixJuices = 0;
  do{timeToMixJuices+=timeToMixJuice(orders.shift());}while(timeToMixJuices<timeLeft);
  return orders;
}
