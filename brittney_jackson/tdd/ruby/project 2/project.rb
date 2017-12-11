##### Project Assignment #####

class Project
  attr_accessor :name, :description

  def name=(name)
    @name = name
    @description = description
  end

  def elevator_pitch
    "#{@name}, #{@description}"
  end

end
