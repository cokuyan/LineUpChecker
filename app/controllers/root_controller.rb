class RootController < ApplicationController
  def index
    @schools = School.all
  end
end
