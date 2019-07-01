class Console < Product
    has_many :games, class_name: "Product", foreign_key: "game_id"
end
