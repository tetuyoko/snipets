#!/usr/bin/env ruby

# 採用に必要な人数に対し、応募書類数を計算する
def calc_resume(resume)
  coeff_thru_resume = 0.25
  coeff_thru_1st_session = 0.5
  coeff_thru_2nd_session = 0.7
  coeff_thru_3rd_session = 0.3
  
  output = resume * coeff_thru_resume * coeff_thru_1st_session * coeff_thru_2nd_session * coeff_thru_3rd_session
  puts output
end

p "output for 2"

calc_resume 77
