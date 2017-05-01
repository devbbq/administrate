require_relative "base"

module Administrate
  module Field
    class DateTime < Base
      def date
        I18n.localize(data.to_date, format: format)
      end

      def datetime
        I18n.localize(data, format: format, default: data)
      end

      def render_page
        case page
        when :index then render_index
        when :show then render_show
        end
      end

      private

      def format
        options.fetch(:format, :default)
      end

      def render_index
        date if data
      end

      def render_show
        datetime if data
      end
    end
  end
end
