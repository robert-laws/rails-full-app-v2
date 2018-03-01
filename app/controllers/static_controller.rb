class StaticController < ApplicationController
  def home
    @greeting = "Welcome to the Website!"
  end
end