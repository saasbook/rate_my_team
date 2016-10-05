class Rater

  require 'canvas-api'
  
  attr_reader :canvas, :course_id, :course_name, :student_id
  
  def initialize(params={})
    @canvas = Canvas::API.new(:host => Figaro.canvas_host, :token => Figaro.canvas_api_key)
    @student_id = params['custom_canvas_user_id']
    @course_id = params['custom_canvas_course_id']
    @course_name = params['context_title']
  end

  def get_student_info(canvas_uid)
    student = canvas.get "/api/v1/users/#{canvas_uid}"
  end

  def groups_in_course
    canvas.get("/api/v1/courses/#{course_id}/groups").map { |g| g['id'] }
  end

  def find_group_for_student
    members = nil
    groups_in_course.each do |grp|
      members = canvas.get("/api/v1/groups/#{grp}/users")
      break if members.any? { |member| member['id'] == student_id }
    end
    members
  end

end
