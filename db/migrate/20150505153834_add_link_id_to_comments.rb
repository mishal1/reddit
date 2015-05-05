class AddLinkIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :link, index: true
  end
end
