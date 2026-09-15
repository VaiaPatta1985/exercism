module BookStore
  BASE_PRICE = 8
  DIFFERENT_BOOKS_DISCOUNT = [0, 0, 0.05, 0.1, 0.2, 0.25]

  def self.possible_partitions(amounts)
    groupings = []
    number_of_baskets = amounts.max
    book_combinations = []
    amounts.each {
      |amount| book_combinations << (0..number_of_baskets - 1).to_a.combination(amount).to_a
    }
    book_combinations[0].each { |book1|
      book_combinations[1].each { |book2|
        book_combinations[2].each { |book3|
          book_combinations[3].each { |book4|
            book_combinations[4].each { |book5|
              grouping = []
              (0...number_of_baskets).each { grouping << [] }
              book1.each { |position| grouping[position] << 1 }
              book2.each { |position| grouping[position] << 2 }
              book3.each { |position| grouping[position] << 3 }
              book4.each { |position| grouping[position] << 4 }
              book5.each { |position| grouping[position] << 5 }
              groupings << grouping
            }
          }
        }
      }
    }
    groupings.each.to_a.sort!
    groupings.uniq
  end

  def self.calculate_price(books)
    return 0 if books == []
    book_amounts = (1..5).to_a.map { |book| books.count(book) }
    number_of_books = books.size
    number_of_different_books = book_amounts.count { |amount| amount > 0 }
    return BASE_PRICE * number_of_books if number_of_different_books == 1
    groupings = self.possible_partitions(book_amounts)
    groupings.map { |grouping|
      grouping.map { |group|
        different_books = group.uniq.size
        repeats = group.size - different_books
        different_books = group.size
        number_of_different_books_in_group = group.uniq.size
        BASE_PRICE * (repeats + different_books * (1 - DIFFERENT_BOOKS_DISCOUNT[different_books]))
      }.sum
    }.min
  end
end