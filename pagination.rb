class Pagination
    attr_reader :issues, :page_no, :per_page

    def initialize(issues, page_no: 1, per_page: 5)
      @issues = issues
      @per_page = per_page
      @page_no = page_no
    end
  
    def page()
      start_index = (page_no - 1) * per_page
      end_index = start_index + per_page - 1
      issues[start_index..end_index] || []
    end
  
    def total_pages
      (issues.size.to_f / per_page).ceil
    end

end