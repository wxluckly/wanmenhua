class Card < ActiveRecord::Base
  CATEGORY_GOOD = 'good'
  CATEGORY_NORMAL = 'normal'
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  # validations ...............................................................
  validates :sn, uniqueness: true, length: { is: 5 }, format: { with: /\A[0156789]+\z/ }

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  # class methods .............................................................
  def self.generate_good
    0.upto(9) do |i|
      0.upto(9) do |j|
        0.upto(9) do |k|
          c = self.new
          c.category = CATEGORY_GOOD
          c.sn = "#{j}#{i}#{k.to_s * 3}"
          c.save
        end
      end
    end
  end

  def self.generate_normal
    while self.count < 1443
      c = self.new
      c.category = CATEGORY_NORMAL
      c.sn = "#{rand(99999)}"
      c.save
    end
  end

  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................
end
