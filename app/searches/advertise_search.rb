class AdvertiseSearch < Searchlight::Search

  search_on Advertise.all

  searches :title, :by_phrase, :recent

  def search_title
    search.by_title(title)
  end

  def search_recent
    search.recent
  end

  def search_by_phrase
    search.by_phrase(title)
  end
end
