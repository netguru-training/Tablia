class AdvertiseDecorator < Draper::Decorator
  decorates :advertise
  delegate_all
  def friendly_date
    created_at.strftime("%d/%m/%Y : %H:%M")
  end

end
