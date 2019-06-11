class Student < ApplicationRecord
    validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }
    validates :surname, uniqueness: true, presence: true, format: { with: /\A[a-zA-Z]+\z/,
        message: "only allows letters" }
    validates :rok, inclusion: { in: [1,2,3,4,5], message: "has to be in range 1-5"}
    validates :can_edit, inclusion: { in: [true, false]}
end
