class Info < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # security (i.e. attr_accessible) ...........................................
  # relationships .............................................................
  # validations ...............................................................
  validates :title, uniqueness: true

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config .........................................................
  mount_uploader :image, InfoImageUploader
  
  # class methods .............................................................
  # public instance methods ...................................................
  # protected instance methods ................................................
  # private instance methods ..................................................
end
