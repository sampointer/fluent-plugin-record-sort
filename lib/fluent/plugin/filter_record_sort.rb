require 'fluent/plugin/filter'
require 'fluent/config/error'

module Fluent::Plugin
  class RecordSortFilter < Fluent::Plugin::Filter
    Fluent::Plugin.register_filter('record_sort', self)
    def configure(conf)
      super
    end

    def filter(tag, time, record)
      # Remove empty fields
      begin
        record.reject! { |_k, v| v.nil? || (v.respond_to?(:empty?) && v.empty?) }
      rescue NoMethodError
        log.warn('record_sort plugin has rescued NoMethodError, meaning it let an object pass through without empty field filtering')
      end

      return record.sort.to_h
    end

  end
end
