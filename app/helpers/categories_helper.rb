module CategoriesHelper
    def categories_list
        Category.all.map { |c| [c.name] }
    end

end
