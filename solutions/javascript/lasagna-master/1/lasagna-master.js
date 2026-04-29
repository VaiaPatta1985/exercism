/// <reference path="./global.d.ts" />
// @ts-check

/**
 * Implement the functions needed to solve the exercise here.
 * Do not forget to export them so they are available for the
 * tests. Here an example of the syntax as reminder:
 *
 * export function yourFunction(...) {
 *   ...
 * }
 */

export function cookingStatus(remainingMinutes){
  if(remainingMinutes===undefined){return 'You forgot to set the timer.';}
  if(remainingMinutes===0){return 'Lasagna is done.';}
  return 'Not done, please wait.';
}

export function preparationTime(layers, preparationMinutesPerLayer=2){
  return layers.length * preparationMinutesPerLayer;
}

export function quantities(layers){
  let noodles = 0;
  let sauce = 0;
  for(let idx=0;idx<layers.length;idx++){
    if (layers[idx]==='noodles'){noodles+=50;}
    if (layers[idx]==='sauce'){sauce+=0.2;}
  }
  return {noodles: noodles, sauce: sauce};
}

export function addSecretIngredient(friendsList, myList){
  myList.push(friendsList[friendsList.length-1]);
}

export function scaleRecipe(amountsForTwo, portions){
  let newAmounts = {};
  for(let ingredient in amountsForTwo){
    newAmounts[ingredient]=amountsForTwo[ingredient]*portions/2;
  }
  return newAmounts;
}
