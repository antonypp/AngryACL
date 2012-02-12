require 'test_helper'

class AclTest < MiniTest::Unit::TestCase
  def setup
    @acl = AngryACL::Acl.new
    @acl.add_role(:admin)
    @acl.add_role(:user)
    resource = AngryACL::Resource.new('Name')
    resource.add_privilege :show, [:admin]
    @acl.add_resource resource
  end
  
  def test_raise_check
    assert_raises PermissionDenied do
      @acl.check!("Name", :show, :user)
    end
  end

  def test_allow
    assert @acl.allow?("Name", :show, :admin)
  end

  def test_undefined_role
    assert_raises UndefinedRole do
      @acl.allow?("Name", :show, :editor)
    end
  end
end
