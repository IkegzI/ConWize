module DashboardsHelper

    def section_title(section)
        section.nil? ? 'Добро пожаловать!' : section.name 
    end
end
