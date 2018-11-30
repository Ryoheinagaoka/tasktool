# frozen_string_literal: true

class Types::MutationType < Types::BaseObject
  # Types::TaskTypeはtask_type.rbを継承する為

  # create ver
  # field :create_task, Types::TaskType, null: true
  # do
  # argument :name, String, required: false, camelize: false
  # end

  # def create_task(name:)
  #  Task.create name: name
  # end

  # end

  field :create_task, TaskType, null: true do
    argument :task, Types::TaskInputType, required: true
  end

  def create_task(task:)
    Task.create task.to_h
    end

  # update
  field :update_task, Boolean, null: false do
    argument :task, Types::TaskInputType, required: true
  end

  def update_task(task:)
    existing = Task.where(id: task[:id]).first

    existing&.update task.to_h
    end

  # delete
  field :delete_task, Boolean, null: false do
    argument :id, ID, required: true
  end

  def delete_task(id:)
    Task.where(id: id).destroy_all
    true
    end
  end
