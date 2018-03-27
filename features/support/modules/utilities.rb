module Utilities

  def change_date no_of_days
    new_date = Time.now + 60 * 60 * 24 * no_of_days
    new_date.strftime("%m/%d/%Y")
  end

  def get_day_details no_of_days
    new_date = Time.now + 60 * 60 * 24 * no_of_days
    new_date.strftime"%a, %b %d"
  end



  def verify_both_are_equal? actual_search_results, expected_search_results
    if actual_search_results.include? expected_search_results
      p "#{actual_search_results} is same as #{expected_search_results}"
    else
      fail "#{actual_search_results} is NOT same as #{expected_search_results}"
    end
  end

end
