class AddAdministatorIdToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :administrator, index: true
  end
end
