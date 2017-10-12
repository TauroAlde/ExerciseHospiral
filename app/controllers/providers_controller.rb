class ProvidersController < ApplicationController
  def index
    @Providers = Provider.all
  end
end
