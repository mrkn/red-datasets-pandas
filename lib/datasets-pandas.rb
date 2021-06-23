require "datasets"
require "datasets-pandas/version"
require "datasets-pandas/conversion"

module Datasets
  class Dataset
    include DatasetsPandas::DatasetConversion
  end

  class Table
    include DatasetsPandas::TableConversion
  end
end
