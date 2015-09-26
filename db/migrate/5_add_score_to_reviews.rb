class AddScoreToReviews < ActiveRecord::Migration
  
  def change
    add_column :reviews, :score, :string
  end
end