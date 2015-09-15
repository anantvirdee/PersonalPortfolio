class StaticPagesController < ApplicationController
  def home

  end

  def about
    render "demo"
    #render nothing:true
  end
end
