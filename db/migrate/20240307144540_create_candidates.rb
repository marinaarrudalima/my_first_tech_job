class CreateCandidates < ActiveRecord::Migration[7.1]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :nationality
      t.string :gender
      t.string :photo
      t.string :summary
      t.string :tech_interest
      t.string :tech_languages
      t.string :preferred_companies
      t.string :cv_upload
      t.string :terms_condition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
