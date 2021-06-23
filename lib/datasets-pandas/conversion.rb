require "pandas"

module DatasetsPandas
  module DatasetConversion
    def to_pandas(*keys)
      if keys.empty?
        Pandas::DataFrame.new(data: self.map {|record| record.to_h })
      else
        records = self.map {|record| keys.map {|k| record[k] } }
        Pandas::DataFrame.new(data: records, columns: keys)
      end
    end
  end

  module TableConversion
    def to_pandas(*keys)
      data = if keys.empty?
               self.to_h
             else
               keys.map {|k|
                 [ k, self[k] ]
               }.to_h
             end
      Pandas::DataFrame.new(data: data)
    end
  end
end
