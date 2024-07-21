#import "@preview/suiji:0.3.0"

#let rng = suiji.gen-rng(35835935)
#let col_size = 11
#let max = 30
#let integers = suiji.integers(rng, low: 2, high: max, size: 400).at(1)


= Math Worksheet

// #set align(left)
#set text(font: "New Computer Modern Mono")


#let problem(x, y, sign) = {
  // These could be sorted and it is probably more standard to do so. But learning to think both ways, 23x9 and 9x23 can be useful.
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

#let col_generator(problem_generator, index_function, col_size) = {
  let n = 0
  while n < col_size {
    problem_generator(index_function(n))
    n += 1
  }
}

// I attempted to use this to avoid having multiple col_generators below, but it wasn't actually producing multiple results.
// #let worksheet_generator(problem_generator, index_function, col_size) = {
//   let n = 0
//   while n < col_size {
//     let current_index = index_function(n)
//     col_generator(problem_generator, x => current_index + x, col_size)
//     n += 1
//   }
// }



#grid(
  columns: range(1, col_size).map(x =>  10%),
  rows: range(1, col_size).map(x =>  8%),
  col_generator(x => rand_mult(x), x => x, col_size),
  col_generator(x => rand_mult(x), x => col_size + x, col_size),
  col_generator(x => rand_mult(x), x => col_size * 2 + x, col_size),
  col_generator(x => rand_mult(x), x => col_size * 3 + x, col_size),
  col_generator(x => rand_mult(x), x => col_size * 4 + x, col_size),
  col_generator(x => rand_mult(x), x => col_size * 5 + x, col_size),
  col_generator(x => rand_mult(x), x => col_size * 6 + x, col_size),
  col_generator(x => rand_mult(x), x => col_size * 7 + x, col_size),
  col_generator(x => rand_mult(x), x => col_size * 8 + x, col_size),
)
