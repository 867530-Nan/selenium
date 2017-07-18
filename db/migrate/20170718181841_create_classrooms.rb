class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.string :code
      t.string :teacher
      t.integer :student_count
      t.boolean :active
      t.string :category

      t.timestamps
    end
  end
end
