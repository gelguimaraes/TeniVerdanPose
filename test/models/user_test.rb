require 'test_helper'

class UserTest < ActiveSupport::TestCase
    test "validando cadastro sem senha" do
      assert_not User.new(nome: 'Usuario teste', email: 'teste@test.com').save
    end

    test "validando cadastro" do
      assert User.new(nome: 'Usuario teste', email: 'teste@test.com', password: '123', password_confirmation: '123').save
    end
end
