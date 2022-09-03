module SectionsHelper
    def section_title(section)
        section.nil? ? 'началу' : section.name 
    end

    def link_section(section)
        section.nil? ? sections_path : section_path(section.id )
    end

    def link_section_level_up(section)
        section.parent_id == 0 ? sections_path : section_path(section.parent_id )
    end 
end
