class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = " Iv1.d3c9c182a048dfd6"
      req.params['client_secret'] = "4f68a1507b2635aec7df4f09db56c18cdf9d7096"
      req.params['q'] = params['query']
      end
      body_info = JSON.parse(@req.body)
      if @req.success?
          @repos = body_info["items"]

      else
          @erros = @req.status
      end
          render 'search'
  end
end