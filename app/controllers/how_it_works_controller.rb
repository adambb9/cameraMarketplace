class HowItWorksController < ApplicationController
  # require_relative '../models/how_it_works.rb'
  skip_before_action :authenticate_user!, only: :index

  def index
    @how_it_works = policy_scope(HowItWorks)
  end
end
