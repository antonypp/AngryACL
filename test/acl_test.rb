require 'test_helper'

class AclTest < MiniTest::Unit::TestCase
  def test_add_role
    acl = AngryACL::Acl.new
    acl.add_role(:admin)
    acl.add_resource do
      privilege :action
    end
  end
end
