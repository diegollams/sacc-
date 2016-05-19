class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :kind
      t.string :answer_kind
      t.references :survey, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
