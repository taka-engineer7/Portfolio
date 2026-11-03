class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.hex(10)
      user.name = "ゲストユーザー"
    end

    sign_in user
    redirect_to root_path, notice: "ゲストとしてログインしました"
  end
end
