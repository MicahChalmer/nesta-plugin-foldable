module Nesta
  module Plugin
    module Foldable
      module Helpers
        # If your plugin needs any helper methods, add them here...
      end
    end
  end

  class App
    helpers Nesta::Plugin::Foldable::Helpers
  end

  class Page
    alias_method :pre_fold_summary, :summary
    def summary
      result = pre_fold_summary
      return result if result && !result.empty?

      body_markup_text = body_markup

      if body_markup_text.include? '~~fold~~'
        summary_text = body_markup_text.sub(/^[^\n]*~~fold~~.*\Z/m, '');
        convert_to_html(@format, nil, summary_text)
      else
        nil
      end
    end
  end
end
