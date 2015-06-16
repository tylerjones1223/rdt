class MakeVoteDefaultZero < ActiveRecord::Migration
  def up
    change_column :votes, :count, :integer, default: 0
  end
  def down
    change_column :votes, :count, :integer, default: nil
  end
end
