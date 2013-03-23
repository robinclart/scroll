module Scroll
  class InsertRecord
    def initialize(record, position, records)
      @record, @position, @records = record, position, records
    end

    def run!
      records = @records - [@record]
      records.insert(@position.to_i, @record)
      records.each_with_index do |record,position|
        record.position = position
        record.save if record.position_changed?
      end
    end
  end
end
