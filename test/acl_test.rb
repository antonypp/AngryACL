require 'test_helper'

class AclTest < MiniTest::Unit::TestCase
  def test_allow
    acl = AngryACL::Acl.new
    acl.add_role(:admin)
    resource = AngryACL::Resource.new('Name')
    resource.add_privilege :show, [:admin]
    acl.add_resource resource
    assert acl.allow?("Name", :show, :admin)
  end
end
