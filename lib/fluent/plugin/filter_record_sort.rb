require 'fluent/plugin/filter'
require 'fluent/config/error'

module Fluent
  module Plugin
    class RecordSortFilter < Fluent::Plugin::Filter
      Fluent::Plugin.register_filter('record_sort', self)
      def configure(conf)
        super
      end

      def filter(_tag, _time, record)
        # Remove empty fields
        begin
          record.reject! do |_k, v|
            v.nil? || (v.respond_to?(:empty?) && v.empty?)
          end
        rescue NoMethodError
          log.warn('record_sort plugin has rescued NoMethodError, meaning it'\
                    ' let an object pass through without empty field filtering')
        end

        record.sort.to_h
      end
    end
  end
end
