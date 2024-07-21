#import "@preview/suiji:0.3.0"

#let rng = suiji.gen-rng(35835935)
#let integers = suiji.integers(rng, low: 2, high: 99, size: 400).at(1)

= Math Worksheet

// #set align(left)
#set text(font: "New Computer Modern Mono")


#let problem(x, y, sign) = {
  rect(width: 80%,
  height: 80%,
    [#align(right)[
      #x \
      #math.underline(sign + str("  ") + str(y)) \
      #str(" ")
  ]]
  )
}

#let mult(x, y) = {
  problem(x, y, "x")
}

#let rand_mult(index) = {
  mult(integers.at(index), integers.at(index + 1))
}

#let col_generator(problem_generator, index_function, size) = {
  let n = 0
  while n < size {
    problem_generator(index_function(n))
    n += 1
  }
}

// I attempted to use this to avoid having multiple col_generators below, but it wasn't actually producing multiple results.
// #let worksheet_generator(problem_generator, index_function, size) = {
//   let n = 0
//   while n < size {
//     let current_index = index_function(n)
//     col_generator(problem_generator, x => current_index + x, size)
//     n += 1
//   }
// }

#let size = 10
#let max = 100

#grid(
  columns: range(1, size).map(x =>  10%),
  rows: range(1, size).map(x =>  8%),
  col_generator(x => rand_mult(x), x => x, size),
  col_generator(x => rand_mult(x), x => size + x, size),
  col_generator(x => rand_mult(x), x => size * 2 + x, size),
  col_generator(x => rand_mult(x), x => size * 3 + x, size),
  col_generator(x => rand_mult(x), x => size * 4 + x, size),
  col_generator(x => rand_mult(x), x => size * 5 + x, size),
  col_generator(x => rand_mult(x), x => size * 6 + x, size),
  col_generator(x => rand_mult(x), x => size * 7 + x, size),
  col_generator(x => rand_mult(x), x => size * 8 + x, size),
)
