class SearchController < ApplicationController
  def index
    response = Faraday.get("http://api.eventful.com/json/events/search?app_key=WJ9fGQD8DR73xBzS&location=80202&date=March&sort_order=popularity&page_size=16")
    @events  = JSON.parse(response.body, symbolize_names: true)[:events][:event].map do |raw_event|
      Event.new(raw_event)
    end
  end
end

class Event
  attr_reader :title, :description, :venue_address, :venue_name, :date_time, :url
  def initialize(attrs = {})
    @title         = attrs[:title]
    @description   = attrs[:description] || ""
    @venue_address = attrs[:venue_address]
    @venue_name    = attrs[:venue_name]
    @date_time     = attrs[:start_time]
    @url           = attrs[:venue_url]
  end
end
