require_relative './client.rb'
require_relative './pagination.rb'
require 'json'

module Github
  class Processor
    # This class is responsible for processing the response from the Github API.
    # It accepts a client object and stores it as an instance variable.
    # It has a method called `issues` that returns a list of issues from the Github API.
    def initialize(client)
      @client = client
    end

    def issues(open: true)
      # This method returns a list of issues from the Github API.
      # It accepts an optional argument called `open` that defaults to true.
      # If `open` is true, it returns only open issues.
      # If `open` is false, it returns only closed issues.
      # It makes a GET request to the Github API using the client object.
      # It returns the response from the Github API.

      state = open ? 'open' : 'closed'
      # Return a list of issues from the response, with each line showing the issue's title, whether it is open or closed,
      # and the date the issue was closed if it is closed, or the date the issue was created if it is open.
      # the issues are sorted by the date they were closed or created, from newest to oldest.
      
      # Testing with default pages - WORKS
      # @TODO write test cases
      page_no = 2
      per_page = 4

      response = @client.get("/issues?state=#{state}&page=#{page_no}&per_page#{per_page}")
      issues = JSON.parse(response.body)

      # Getting the number of total issues
      puts "Total issues #{issues.count}\n\n"
      # puts "Is Array? #{issues.kind_of?(Array)}\n\n"

      # Lets try to add pagination here, so that below code can loop and parse.
      pagination = Pagination.new(issues, page_no: page_no, per_page: per_page)

      # GET the variable reassigned, 
      paginated_issues = pagination.page()

      sorted_paginated_issues = paginated_issues.sort_by do |paginated_issue|
        if state == 'closed'
          paginated_issue['closed_at']
        else
          paginated_issue['created_at']
        end
      end.reverse
      
      sorted_paginated_issues.each do |paginated_issue|
        if paginated_issue['state'] == 'closed'
          puts "#{paginated_issue['title']} - #{paginated_issue['state']} - Closed at: #{paginated_issue['closed_at']}"
        else
          puts "#{paginated_issue['title']} - #{paginated_issue['state']} - Created at: #{paginated_issue['created_at']}"
        end
      end
    end
  end
end
# The URL to make API requests for the IBM organization and the jobs repository
# would be 'https://api.github.com/repos/ibm/jobs'.
Github::Processor.new(Github::Client.new(ENV['TOKEN'], ARGV[0])).issues(open: false)
