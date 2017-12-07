##### Project Assignment #####

class Project
    attr_reader :name, :description
  
    def initialize(name, description)
      @name = name
      @description = description
    end
  
    def elevator_pitch
      "#{@name}, #{@description}"
    end

    def print_tasks
      @tasks.each { |elem| puts elem }
    end

    def add_tasks task
      @tasks << task
    end
end

  
  project1 = Project.new("Project 1", "Description 1")
  puts project1.name
  puts project1.elevator_pitch
