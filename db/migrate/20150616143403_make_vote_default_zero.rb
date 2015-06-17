class MakeVoteDefaultZero < ActiveRecord::Migration
  def up
    change_column :votes, :vote, :integer, default: 0
  end
  def down
    change_column :votes, :vote, :integer, default: nil
  end
end
