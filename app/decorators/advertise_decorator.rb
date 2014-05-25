class AdvertiseDecorator < Draper::Decorator
  decorates :advertise
  delegate_all

  def friendly_date
    created_at.strftime("%d/%m/%Y : %H:%M")
  end

  def category_name
    if category.present?
      category.name
      else
        nil
      end
  end

end
