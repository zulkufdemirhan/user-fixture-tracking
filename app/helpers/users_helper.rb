module UsersHelper
  def user_status(status)
    case status
    when "On Site"
      "blue"
    when "On Leave"
      "yellow"
    when "Remote"
      "purple"
    end
  end
end