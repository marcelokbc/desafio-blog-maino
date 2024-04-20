module ApplicationHelper
  include Pagy::Frontend

  def bootstrap_classes_for(flash_type)
    {
      success: 'bg-success text-white border border-success',
      error: 'bg-danger text-white border border-danger',
      alert: 'bg-warning text-white border border-warning',
      notice: 'bg-info text-white border border-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
