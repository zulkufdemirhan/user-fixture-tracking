module FlashHelper
  def classes_for_flash(flash_type)
    case flash_type.to_sym
    when :alert
      "red"
    else
      "green"
    end
  end
end