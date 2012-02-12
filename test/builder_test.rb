require 'test_helper'

class BuilderTest < MiniTest::Unit::TestCase
  def test_role
    acl = AngryACL::Builder.build do
      roles do
        role :admin
      end
    end
    assert_not_nil acl.role(:admin)
  end
end                
