class AddPhoneColumnToSubscribers < ActiveRecord::Migration
  def change
  add_column :subscribers, :phone, :text
  end
end
