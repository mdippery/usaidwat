require 'usaidwat'
require 'webmock/rspec'


class String
  def delete_ansi_color_codes
    delete("\u{1b}").gsub(/\[[0-9]+m/, '')
  end
end
