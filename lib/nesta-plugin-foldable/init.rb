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
      
      # Sigh...it's a shame I had to copy-paste this
      # from nesta's models.rb just to get rid of the
      # heading.
      body_text = case @format
        when :mdown
          markup.sub(/^#[^#].*$\r?\n(\r?\n)?/, '')
        when :haml
          markup.sub(/^\s*%h1\s+.*$\r?\n(\r?\n)?/, '')
        when :textile
          markup.sub(/^\s*h1\.\s+.*$\r?\n(\r?\n)?/, '')
        end

      if body_text.include? '~~fold~~'
        $stderr.puts body_text
        summary_text = body_text.sub(/^[^\n]*~~fold~~.*\Z/m, '');
        x = convert_to_html(@format, nil, summary_text)
        $stderr.puts "Summary: #{x}"
        x
      else
        $stderr.puts "#{heading}: no fold here"
        nil
      end
    end
  end
end
