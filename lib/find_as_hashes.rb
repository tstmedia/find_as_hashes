require "find_as_hashes/version"
require 'active_record'

module FindAsHashes
  def all_as_hashes
    # TODO figure out a less hacky way than where(nil) of retrieveing existing relation stack without modifying it
    relation_stack = where(nil)
    connection.select_all(relation_stack.joins(relation_stack.includes_values).to_sql)
  end

  def first_as_hash
    relation_stack = limit(1)
    connection.select_one(relation_stack.joins(relation_stack.includes_values).to_sql)
  end
end

ActiveRecord::Base.extend FindAsHashes
