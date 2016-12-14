// jsIntro.js

function madLib(verb, adj, noun) {
  console.log(`We shall ${verb} the ${adj} ${noun}`);
}

madLib('make', 'best', 'guac');

function isSubstring(searchString, subString) {
  let l = subString.length;
  for (let i = 0; i < searchString.length; i++) {
    if (searchString.substring(i, l) === subString) {
      return true;
    }
  }
  return false;
}

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
  let newArr = [];
  for (let i = 0; i < array.length; i++) {
    if (array[i] % 3 === 0 && array[i] % 5 === 0) {
      continue;
    } else if (array[i] % 3 === 0 || array[i] % 5 === 0) {
      newArr.push(array[i]);
    }
  }
  return newArr;
}

console.log(fizzBuzz([1, 2, 3, 4, 5, 6, 7, 8, 15, 16, 18]));

function isPrime(n) {
  for (let i = 2; i < n; i ++) {
    if (i < 2 || n % i === 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log((isPrime(15485863)));
console.log(isPrime(3548563));

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0;
  let i = 2;
  while (count < n) {
    if (isPrime(i)) {
      count += 1;
      sum += i;
    }
    i ++;
  }
  return sum;
}

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));

function allOrNothing(n) {
  for (let i = 0; i < arguments.length; i++ ) {
    if (arguments[i] % n !== 0) {
      return false;
    }
  }
  return true;
}

console.log(allOrNothing(3, 9, 12, 6));
console.log(allOrNothing(5, 1, 2, 10));
