include Turbo::FramesHelper
module Modal
  class ModalComponent < ViewComponent::Base
    def initialize(title:)
      @title = title
    end
  end
end