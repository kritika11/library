class CreateIssueDetails < ActiveRecord::Migration
  def change
    create_table :issue_details do |t|
      t.date :issueDate
      t.date :returnDate
      t.date :returningDate
      t.timestamps null: false
    end
    add_reference :issue_details, :book, index: true, foreign_key: true
    add_reference :issue_details, :user, index: true, foreign_key: true
  end
end
