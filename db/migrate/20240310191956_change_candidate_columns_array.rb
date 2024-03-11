class ChangeCandidateColumnsArray < ActiveRecord::Migration[7.1]
  def change
    change_column :candidates, :tech_interest, :text, array: true, default: [], using: "tech_interest::text[]"
    change_column :candidates, :tech_languages, :text, array: true, default: [], using: "tech_languages::text[]"
  end
end
