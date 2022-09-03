class SectionsController < ApplicationController

    before_action :section_select, only: [:show, :edit, :update, :new]
    before_action :sections_collection, only: [:index, :show]
    before_action :book_collection, only: :show

    def update
        @section.update(params_section_edit)
    end

    def destroy
        section = Section.find(params_section_id).destroy
        redirect_to section_path section.parent_id
    end

    def new
        @section = Section.new(parent_id: @section&.id || 0)
    end

    def create
        section = Section.create!(params_section_create)
        redirect_to section_path section
    end

    private

    def params_section_edit
        params.permit(:name)
    end

    def params_section_create
        params.require(:section).permit(:name, :parent_id)
    end

    def params_section_id
        params.require(:id)
    end

    def section_select
        @section = Section.find_by(id: params_section_id)
    end

    def sections_collection
        @sections = @section.subsections
    rescue
        @sections = Section.higher_categories
    end

    def book_collection
        @books = Section.find_by(id: params_section_id)&.books || []
    end
end
