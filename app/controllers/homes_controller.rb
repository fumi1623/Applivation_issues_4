class HomesController < ApplicationController
before_action :authenticate_user!,except: [:top, :show]

  def top
  end

  def show
  end
end
