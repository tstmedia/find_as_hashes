require "find_as_hashes/version"

module FindAsHashes
  def all_as_hashes
    # TODO figure out a less hacky way of retrieveing existing relation stack and not modifying it than where(nil)
    connection.select_all(where(nil).to_sql)
  end

  def first_as_hash
    connection.select_one(limit(1).to_sql)
  end
end

ActiveRecord::Base.extend FindAsHashes
