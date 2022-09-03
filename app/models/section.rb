class Section < ApplicationRecord

    has_many :books, dependent: :delete_all
    scope :higher_categories, -> { where(parent_id: 0) }

    before_save :parent_id_not_nil

    def subsections
        self.class.where(parent_id: self.id)
    end

    def parent
        self.class.find(self.parent_id)
    end

    def parent_id_not_nil
        self.parent_id = parent_id.nil? ? 0 : parent_id
    end

end
