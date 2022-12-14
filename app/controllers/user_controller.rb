# frozen_string_literal: true

class UserController < ApplicationController
  def index
    @users = User.all.includes(:profile).order('profiles.approved', :created_at)
  end
end
