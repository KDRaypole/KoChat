module ApplicationHelper
  def javascript_controller
    controller_path.gsub('/', '_').camelize
  end

  def javascript_action
    controller.action_name.camelize(:lower) + 'Action'
  end
end
