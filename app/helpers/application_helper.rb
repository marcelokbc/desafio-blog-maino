module ApplicationHelper
  include Pagy::Frontend

  def bootstrap_classes_for(flash_type)
    {
      success: 'success',
      error: 'danger',
      alert: 'warning',
      notice: 'info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
