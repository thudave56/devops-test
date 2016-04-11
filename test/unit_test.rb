require 'minitest/autorun'

class TestPackage < MiniTest::Unit::TestCase

  def test
    assert_equal 10, Array.new(10).size
  end
end


directory "roles/common/tasks"

file "roles/common/tasks/main.yml" => "main.yml" do
  sh "echo 'Missing' > 'roles/common/tasks/main.yml"
end
