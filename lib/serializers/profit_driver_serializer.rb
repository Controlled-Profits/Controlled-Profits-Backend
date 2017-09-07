class ProfitDriverSerializer
  def self.serialize(obj_array, args = {})
    if obj_array.empty? then return Array.new.to_json end
    
    result_data = {
      type: "profit_drivers_data",
      profit_drivers: {},
      entry_date: obj_array[0].entry_date #All should have same entry date
    }

    obj_array.each do |obj|
      result_data[:profit_drivers][obj.name] = {
        percent: obj.percent,
        var_cost: obj.var_cost,
        fixed_cost: obj.fixed_cost
      }
    end

    result = {
      data: result_data
    }

    return result.to_json
  end
end