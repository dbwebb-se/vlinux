import { readFile } from 'fs'
// 1. find 5 digits ([0-9]+) [45198]
// 2. starts with 3 vowels then $ ([aoueiy]{3}\$\w+) [yay$secret]
// 3. 
function filter (data) {
  let re = /\w/gu
  let result = data.match(re)
  return result
}

function group(data) {
  let re = /([A-Z]am\w+)/
  let result = data.match(re)
  return result
}

readFile('./wall.txt', 'utf8', (err, data) => {
  if (err) {
    console.error(err)
    return
  }

  let filterResult = filter(data)
  let matchResult = group(data)
  console.log(filterResult)
})