class DashboardsController < ApplicationController

    def index
        @section = Section.find_by(id: params_section[:section_id])
        @sections = sections_collection
        @books = book_collection
    end

    private

    def params_section
        params.permit(:section_id) || 0
    end

    def sections_collection
        Section.find_by(id: params_section[:section_id]).subsections
    rescue
        Section.higher_categories
    end

    def book_collection
        Section.find_by(id: params_section[:section_id])&.books || []
    end
end
