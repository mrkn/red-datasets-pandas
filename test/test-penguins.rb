class PenguinsTest < Test::Unit::TestCase
  def setup
    @dataset = Datasets::Penguins.new
    @table = @dataset.to_table
  end

  sub_test_case("Dataset") do
    test("no keys") do
      dataframe = @dataset.to_pandas
      assert_equal([
                     [344, 8],
                     ["Adelie", "Torgersen", 39.1, 18.7, 181, 3750, "male", 2007]
                   ],
                   [
                     dataframe.shape.to_a,
                     dataframe.iloc[0].to_a
                   ])
    end

    test("keys") do
      dataframe = @dataset.to_pandas(:species,
                                     :flipper_length_mm,
                                     :body_mass_g,
                                     :year)
      assert_equal([
                     [344, 4],
                     ["species", "flipper_length_mm", "body_mass_g", "year"],
                     ["Adelie", 181, 3750, 2007]
                   ],
                   [
                     dataframe.shape.to_a,
                     dataframe.columns.to_a,
                     dataframe.iloc[0].to_a
                   ])
    end
  end

  sub_test_case("Table") do
    test("no keys") do
      dataframe = @table.to_pandas
      assert_equal([
                     [344, 8],
                     ["Adelie", "Torgersen", 39.1, 18.7, 181, 3750, "male", 2007]
                   ],
                   [
                     dataframe.shape.to_a,
                     dataframe.iloc[0].to_a
                   ])
    end

    test("keys") do
      dataframe = @table.to_pandas(:species,
                                   :flipper_length_mm,
                                   :body_mass_g,
                                   :year)
      assert_equal([
                     [344, 4],
                     ["species", "flipper_length_mm", "body_mass_g", "year"],
                     ["Adelie", 181, 3750, 2007]
                   ],
                   [
                     dataframe.shape.to_a,
                     dataframe.columns.to_a,
                     dataframe.iloc[0].to_a
                   ])
    end
  end
end
