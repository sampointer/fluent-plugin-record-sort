# Fluentd Sort Plugin [![CircleCI](https://circleci.com/gh/sampointer/fluent-plugin-record-sort.svg?style=shield)](https://circleci.com/gh/sampointer/fluent-plugin-record-sort)[![Gem Version](https://badge.fury.io/rb/fluent-plugin-record-sort.svg)](https://badge.fury.io/rb/fluent-plugin-record-sort)

## Introduction
This plugin does two things:

* Sorts the field in each record according to the default ruby `#Array.sort`
* Removes fields who's values it considers to either be `nil?` or `empty?`

## Configuration
```xml
<filter **>
  @type record_sort
</filter>
```

## Rationale
AWS Athena and Glue prefer sorted JSON in S3 that has truthy values for all keys.
