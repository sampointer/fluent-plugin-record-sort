require 'fluent/plugin/filter'
require 'fluent/config/error'

module Fluent::Plugin
  class RecordSortFilter < Fluent::Plugin::Filter
    Fluent::Plugin.register_filter('record_sort', self)
    def configure(conf)
      super
    end

    def filter(tag, time, record)
      record.reject! { |_k, v| v.nil? || v.empty? }
      return record.sort.to_h
    end

  end
end
