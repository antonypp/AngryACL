require 'test_helper'

class BuilderTest < MiniTest::Unit::TestCase
  def test_build
    acl = AngryACL.build do
      roles do
        role :admin
        role :user
        role :viewer
      end

      resource "UserReisourse", [:admin] do
        privilege :edit, [:user]
        privilege :show, [:user, :viewer]
      end
    end
    assert acl.allow?("UserResource", :edit, :admin)
    assert acl.allow?("UserResource", :edit, :user)
    assert_equal false, acl.allow?("UserResource", :edit, :viewer)
    assert acl.allow?("UserResource", :show, :viewer)
  end
end                
