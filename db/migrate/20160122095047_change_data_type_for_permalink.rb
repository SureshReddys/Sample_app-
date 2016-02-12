class ChangeDataTypeForPermalink < ActiveRecord::Migration
  def change

  	change_column("pages","permalink", :string,:limit=> 100)

  end


  def down
  	change_column("pages","permalink",:integer)
  end
end
