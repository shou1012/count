class AddTitleToCounts < ActiveRecord::Migration[4.2]
  def change
    add_column(:counts, :title, :text)
  end
end
