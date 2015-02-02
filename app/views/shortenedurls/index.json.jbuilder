json.array!(@shortenedurls) do |shortenedurl|
  json.extract! shortenedurl, :id, :original, :shortened
  json.url shortenedurl_url(shortenedurl, format: :json)
end
