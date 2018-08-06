require 'fluent/plugin/filter'
module Fluent::Plugin
  class RecordTransformerFilter < Fluent::Plugin::Filter
    Fluent::Plugin.register_filter('record_transformer', self)

    desc 'Enable record sorting'
    config_param :enable, :bool, default: true

    def configure(conf)
      super
    end

    def filter(tag, time, record)
      if @enable
        return record.sort.to_h
      end
    end

  end
end
