class GithubApiService
    include HTTParty
    base_uri 'https://api.github.com/users'
    #https://api.github.com/users?per_page=10 //Users
  
    def initialize()
      #query: {site: service, page: page}
      @options = {}
    end
   
    # Get a list of users
    def getUsers(per_page = 10) 
      self.class.get("?per_page=#{per_page}", @options)
    end
  
    # Get a specific user
    # We have to refine this search 
    # and handle erros latter.
    def getUser(user)
      self.class.get("/#{user}", @options)
    end 
  
end