class ChangeTableUserStatusAndRelation < ActiveRecord::Migration
  def up
    change_table  :users do |t|
      t.change  :status,    :integer,    null: false,  default: 0
      t.change  :relation,  :integer,    null: false,  default: 0
    end
  end

  def down
    change_table  :users do |t|
      t.change  :status,    :string,    null: false,  default: 0
      t.change  :status,    :string,    null: false,  default: 0
    end
  end
end
