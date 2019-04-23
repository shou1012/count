class AddTitleToCounts < ActiveRecord::Migration[5.2]
  def change
    add_column(:counts, :title, :text)
  end
end
