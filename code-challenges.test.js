// ASSESSMENT 6: JavaScript Coding Practical Questions with Jest

// Please read all questions thoroughly
// Pseudo coding is REQUIRED
// If you get stuck, please leave comments to help us understand your thought process

// Use test driven development to complete the following questions
// Add appropriate dependencies: $ yarn add jest

// Reminder: The test will call your function
// Run the file with the following command: $ yarn jest

// --------------------1) Create a function that takes in an array of objects and returns an array with a sentence about each person with their name capitalized.

// a) Create a test with an expect statement using the variable provided.

// describe("sentenceReturnerWithNameCapitalized", () => {
  const people = [
  { name: "ford prefect", occupation: "a hitchhiker" },
  { name: "zaphod beeblebrox", occupation: "president of the galaxy" },
  { name: "arthur dent", occupation: "a radio employee" }
]
// it("returns an array with a sentence about each person with their name capitalized", () => {
//   expect(sentenceReturnerWithNameCapitalized(people)).toEqual(["Ford Prefect is a hitchhiker.", "Zaphod Beeblebrox is president of the galaxy.", "Arthur Dent is a radio employee."])
 
// })
// })
// -> sentenceReturnerWithNameCapitalized is not defined.

// Expected output: ["Ford Prefect is a hitchhiker.", "Zaphod Beeblebrox is president of the galaxy.", "Arthur Dent is a radio employee."]

// b) Create the function that makes the test pass.

// pseudocode: the input is an array of objects, use the built in method .map to iterate over the array and create a new array of sentences where each of them works with the object in the given array. The variable name takes the name property from the person object, and then the capitalized variable uses a regex pattern \b matches any word boundary following a word character \w matches a non word character, beginning or end of a string. and then the g tag is global for all of the matches being replaced. so \b\w finds the first letter of the first word, and then g applies it globally so it would find the first letter of every word and make it capitalized(meaning if there was a third name used as a middle name it would also apply it to that if i created a variable for it in the function) then split the capitalized names into an array of words and using array destructuring assign the names to first name and last name. then return the string using string interpolation calling on those variables, and then the persons occupation.

// this was my initial approach and I wanted to try to clean it up a bit so I refactored it below.

//  const sentenceReturnerWithNameCapitalized = (array) => {
//     return array.map(person => {
//       const name = person.name
//       const capitalized = name.replace(/\b\w/g, match => match.toUpperCase())
//       const [firstName, lastName] = capitalized.split (' ')
//       return `${firstName} ${lastName} is ${person.occupation}.`
//     })
//  }

 const sentenceReturnerWithNameCapitalized = (array) => {
    return array.map(({ name, occupation }) => { // a cool thing I found and did not know was that you can pass the object in here as an argument so that you don't have to reference it with .notation later, you can jut call on the specific pieces of the object by their names.
    const [firstName, lastName] = name.replace(/\b\w/g, match => match.toUpperCase()).split(' ')
    return `${firstName} ${lastName} is ${occupation}.`
  })
 }

// --------------------2) Create a function that takes in a mixed data array and returns an array of only the REMAINDERS of the numbers when divided by 3.

// a) Create a test with an expect statement using the variables provided.

describe("remaindersOnly", () => {
const hodgepodge1 = [23, "Heyyyy!", 45, -10, 0, "Yo", false]
// // Expected output: [ 2, 0, -1, 0 ]
const hodgepodge2 = [5, "Hola", 43, -34, "greetings", true]
// Expected output: [ 2, 1, -1 ]
it("returns an array of only the REMAINDERS of the numbers when divided by 3", () => {
    expect(remaindersOnly(hodgepodge1)).toEqual([ 2, 0, -1, 0 ])
    expect(remaindersOnly(hodgepodge2)).toEqual([ 2, 1, -1 ])
  })
  })
// --> remaindersOnly is not defined
// b) Create the function that makes the test pass.


// pseudocode: with an array of various data as the input, create a function called remaindersOnly and a parameter of array, assign a variable called nums that uses the built in method .filter that selects the value using typeof, if that value is a number only. return the nums using the built in method .map to iterate through the selected numbers and return the remainders of the numbers when divided by 3 

const remaindersOnly = (array) => {
  const nums = array.filter(value => typeof value === 'number')
  return nums.map(num => num % 3)
}

// --------------------3) Create a function that takes in an array of numbers and returns the sum of all the numbers cubed.

// a) Create a test with an expect statement using the variables provided.

// describe("sumOfCubedNumbers", () => {
const cubeAndSum1 = [2, 3, 4]
// Expected output: 99
const cubeAndSum2 = [0, 5, 10]
// Expected output: 1125
// it("returns the sum of all the numbers cubed", () => {
//   expect(sumOfCubedNumbers(cubeAndSum1)).toEqual(99)
//   expect(sumOfCubedNumbers(cubeAndSum2)).toEqual(1125)
// })
// })
// b) Create the function that makes the test pass.

//Pseudocode: with the input being an array of numbers, create a function called sumOfCubedNumbers that takes in in array as a parameter, return that array using the reduce method which iterates through each element in the array and passes whats called an accumulator(acc for short) and current(curr for short) values to the function, were using these as parameters in our reduce method, then the following arrow function is taking the accumulating number and adding it to the built in method Math.pow which raises a number to a power, we give it the argument of current number and 3, so its adding and then taking it to the power of 3(or cubing it) I added 0 at the end because it gives the reduce method a starting point of 0. 

const sumOfCubedNumbers = (array) => {
return array.reduce((acc, curr) => acc + Math.pow(curr, 3), 0)
}