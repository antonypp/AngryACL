module AngryACL
  class Builder
    def self.build(&block)
      instance_eval(&block)
    end
    def roles(&block)
      @roles = Builder::Roles.build(&block)
    end
  end
end
