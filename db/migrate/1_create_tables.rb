class CreateTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password
      t.timestamps 
    end

    create_table :movies do |t|
      # Your code goes here
      t.string :title
      t.string :release_date
      t.string :movie_review
      t.string :rating
      t.timestamps 
    end

    create_table :reviews do |t|
      t.string :comment
      t.timestamps 
    end

  end

end