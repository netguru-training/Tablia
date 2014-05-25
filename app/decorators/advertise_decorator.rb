class AdvertiseDecorator < Draper::Decorator
  delegate_all


  def friendly_date
    created_at.strftime("%d/%m/%Y : %H:%M")
  end

end
