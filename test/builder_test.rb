require 'test_helper'

class BuilderTest < MiniTest::Unit::TestCase
  def test_build
    acl = AngryACL.build do
      roles do
        role :admin
        role :user
        role :viewer
      end

      resource "UserResourse", [:admin] do
        privilege :edit, [:user]
        privilege :show, [:user, :viewer]
      end
    end
    assert acl.allow?("UserResourse", :edit, :admin)
    assert acl.allow?("UserResourse", :edit, :user)
    assert !acl.allow?("UserResourse", :edit, :viewer)
    assert acl.allow?("UserResourse", :show, :viewer)
  end
end                
