class AddBelongsToQuotation < ActiveRecord::Migration
  def change
    add_reference :quotations, :offer, index: true, foreign_key: true
    remove_column :quotations, :counteroffer
  end
end
