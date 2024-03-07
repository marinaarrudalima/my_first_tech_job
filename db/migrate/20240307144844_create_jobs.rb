class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :job_description
      t.string :soft_skills
      t.string :programming_languages
      t.string :work_visa
      t.float :salary
      t.string :benefits
      t.date :application_deadline
      t.date :date_posted
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
