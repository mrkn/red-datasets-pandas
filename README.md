# Red Datasets Pandas

## Description

Red Datasets Pandas adds Pandas::DataFrame object export feature to Red Datasets.

Red Datasets Pandas adds `#to_pandas` method to each dataset and its table in Red Datasets. You can get data as Pandas::DataFrame class object.

## Install

```
% gem install red-datasets-pandas
```

## Usage

Here is an example to export penguins data as Pandas::DataFrame objects by `Datasets::Dataset#to_pandas` and `Datasets::Table#to_narray`:

```
require "datasets-numo-narray"

penguins = Datasets::Penguins.new
puts iris.to_pandas(:flipper_length_mm,
                    :body_mass_g,
                    :species)

penguins_table = penguins.to_table
puts iris_table.to_pandas(:flipper_length_mm,
                          :bill_depth_mm,
                          :sex,
                          :year)
```

## License

The MIT license. See `LICENSE.txt` for details.
