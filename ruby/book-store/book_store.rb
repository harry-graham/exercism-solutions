module BookStore
  def self.calculate_price(basket)
    BasketPriceCalculator.new(basket).perform
  end

  module BookPrice
    PRICE_PER_BOOK = 8.0
  end

  class BasketPriceCalculator
    include BookPrice

    def initialize(basket)
      @basket = basket
      @book_counts = basket.inject(Hash.new(0)) { |h, i| h[i] += 1; h }
    end

    def perform
      subtotal - discount
    end

    private

    attr_reader :basket, :book_counts

    def total_number_of_books
      book_counts.values.sum
    end

    def subtotal
      total_number_of_books * PRICE_PER_BOOK
    end

    def discount
      DiscountCalculator.new(book_counts).perform
    end
  end

  class DiscountCalculator
    include BookPrice

    DISCOUNT_RATES = {1 => 0.0, 2 => 0.05, 3 => 0.1, 4 => 0.2, 5 => 0.25}

    def initialize(book_counts)
      @book_counts = book_counts.values
    end

    def perform
      amounts_to_discount.sum
    end

    private

    attr_reader :book_counts

    def amounts_to_discount
      discount_group_sizes.map do |num_books|
        amount_to_discount(num_books)
      end
    end

    def amount_to_discount(num_books)
      num_books * PRICE_PER_BOOK * DISCOUNT_RATES[num_books]
    end

    def discount_group_sizes
      DiscountGroupSizesCalculator.perform(book_counts)
    end
  end

  class DiscountGroupSizesCalculator
    class << self
      def perform(book_counts)
        group_sizes = GroupSizes.new

        while book_counts.sum > 0
          num_books = 0
          book_counts.each_with_index do |book_count, i|
            next if book_count == 0
            num_books += 1
            book_counts[i] -= 1
          end
          group_sizes.add(num_books)
        end

        group_sizes.replace_three_and_five_with_two_fours!
        group_sizes.to_array
      end
    end
  end

  class GroupSizes
    def initialize
      @group_sizes = []
    end

    def add(val)
      group_sizes << val
    end

    def replace_three_and_five_with_two_fours!
      replace!([3, 5], [4, 4])
    end

    def to_array
      group_sizes
    end

    private

    attr_accessor :group_sizes

    def replace!(to_remove, to_add)
      while contains?(to_remove)
        remove_values!(to_remove)
        add_values!(to_add)
      end
    end

    def contains?(vals)
      (vals & group_sizes).size == vals.size
    end
  
    def remove_values!(vals)
      vals.each do |val|
        remove!(val)
      end
    end
  
    def remove!(val)
      index_to_remove = group_sizes.index(val)
      group_sizes.delete_at(index_to_remove)
    end

    def add_values!(vals)
      @group_sizes += vals
    end
  end
end
