module FlashHelper
  def classes_for_flash(flash_type)
    case flash_type.to_sym
    when :alert
      "bg-red-100 text-red-700"
    else
      "bg-green-100 text-green-700"
    end
  end
end