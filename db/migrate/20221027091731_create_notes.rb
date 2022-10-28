class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :subject
      t.string :content
      t.references :appointment
      t.references :user
      t.timestamps
    end
  end
end
