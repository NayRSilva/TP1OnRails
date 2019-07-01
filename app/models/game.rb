class Game < Product
    belongs_to :console, class_name: "Product", foreign_key: "console_id"
end
