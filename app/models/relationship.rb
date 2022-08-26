class Relationship < ApplicationRecord
    belongs_to :followers, class_name: 'User'
    belongs_to :followee, class_name: 'User'
end
