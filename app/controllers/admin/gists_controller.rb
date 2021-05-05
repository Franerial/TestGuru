class Admin::GistsController < ApplicationController
  before_action :find_gist, only: :destroy

  def index
    @gists = Gist.all
  end

  def destroy
    @gist.destroy
    redirect_to admin_gists_path
  end

  private

  def find_gist
    @gist = Gist.find(params[:id])
  end
end
