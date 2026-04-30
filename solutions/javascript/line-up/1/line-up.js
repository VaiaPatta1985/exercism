//
// This is only a SKELETON file for the 'Line Up' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const format = (customerName, customerNumber) => {
  let suffix='th';
  if(!([11,12,13].includes(customerNumber%100))){
    switch(customerNumber%10){
      case 1:
        suffix = 'st';
        break;
      case 2:
        suffix = 'nd';
        break;
      case 3:
        suffix = 'rd';
    }
  }
  return `${customerName}, you are the ${customerNumber}${suffix} customer we serve today. Thank you!`;
};
