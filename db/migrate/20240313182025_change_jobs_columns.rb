class ChangeJobsColumns < ActiveRecord::Migration[7.1]
  def change
    change_column :jobs, :programming_languages, :text, array: true, default: [], using: "programming_languages::text[]"
    add_column :jobs, :tech_interests, :text, array: true, default: []
  end
end
