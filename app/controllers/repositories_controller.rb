class RepositoriesController < ApplicationController

  def search

  end

  def github_search
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = 'Iv1.d3c9c182a048dfd6'
        req.params['client_secret'] = '4f68a1507b2635aec7df4f09db56c18cdf9d7096'
        req.params['query'] = params[:query]
      end

      body = JSON.parse(@resp.body)
      if @resp.success?
        @repos = body["items"]
      else
        @error = body["meta"]["errorDetail"]
      end
      render 'search'
  end
end
