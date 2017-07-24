class Search < ApplicationRecord
  def self.search(game)
    if game
      where('name LIKE ?', "%#{game}%")
    else
      all
    end
  end
end
