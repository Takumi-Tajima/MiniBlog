class RemoveNeedlessIndexFromRelationships < ActiveRecord::Migration[7.0]
  def change
    remove_index :relationships, :follower_id
  end
end
