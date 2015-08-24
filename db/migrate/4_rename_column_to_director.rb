class RenameColumnToDirector < ActiveRecord::Migration
  def change
    rename_column :movies, :movie_review, :director
  end
end
