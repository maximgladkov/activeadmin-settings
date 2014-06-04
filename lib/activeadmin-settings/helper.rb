module ActiveadminSettings
  module Helpers
    def settings_value(name, locale = nil, territory = current_territory)
      Setting.value(name, locale, territory)
    end

    def settings_link_value(name, locale = nil, territory = current_territory, html_options = {})
      val = Setting.value(name, locale, territory)

      if not val.empty? # add regular expression check here
        title, url = val.split(')')
        title.gsub!('(', '').strip!
        url.strip!

        link_to(title, url, html_options)
      end
    end

    module_function :settings_value, :settings_link_value
  end
end
