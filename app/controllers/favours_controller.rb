class FavoursController < ApplicationController

  def index
    @favours = policy_scope(Favour)
  end
end
