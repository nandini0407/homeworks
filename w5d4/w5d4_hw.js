window.setTimeout(function () {
  alert('HAMMERTIME');
}, 5000);

function hammertime(time) {
  window.setTimeout(function() {
    alert(`${time} is hammertime!`);
  });
}

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  let first, second;

  reader.question("Would you like some tea?", function(res1) {
    reader.question("Would you like some biscuits?", function (res2) {
      first = (res1 === 'yes') ? "do" : "don't";
      second = (res2 === 'yes') ? "do" : "don't";
      console.log(`You ${first} want tea and ${second} want biscuits.`);
      reader.close();
    });
  });
}

teaAndBiscuits();

function Cat () {
  this.name = 'Markov';
  this.age = 3;
}

function Dog () {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
};

const Markov = new Cat ();
const Noodles = new Dog ();

Noodles.chase(Markov);
Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);
