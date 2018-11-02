class Types::QueryType < Types::BaseObject

  field :task, Types::TaskType, null: true do
    argument :id, ID, required: true
  end

  def task(id:)
    Task.find(id)
  end

# -------------

  field :tasks, [Types::TaskType], null: true do
  end

  def tasks
    Task.all
  end

# あとで消す。
  field :test_hello, String, null: false,
    description: "これはテスト" do
    end

  def test_hello
    "Hello World！？"
  end

end
