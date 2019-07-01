class Product < ApplicationRecord
    self.inheritance_column = :type

    def self.type
        %w(Game Console)
    end

    scope :games, -> { where(type: 'Game') } 
    scope :consoles, -> { where(type: 'Console') }
end

class Game < Product; end
class Console < Product; end
