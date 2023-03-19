class HowItWorksController < ApplicationController
  # require_relative '../models/how_it_works.rb'

  def index
    @how_it_works = policy_scope(HowItWorks)
  end
end
