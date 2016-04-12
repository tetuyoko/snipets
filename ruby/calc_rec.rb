#!/usr/bin/env ruby

# 採用に必要な人数に対し、応募書類数を計算する
def calc_resume(resume)
  coeff_thru_resume = 0.25
  coeff_thru_1st_session = 0.4
  coeff_thru_2nd_session = 1 #0.7
  coeff_thru_3rd_session = 0.3
  coeff_jitairitu = 0.8

  output = resume *
           coeff_thru_resume *
           coeff_thru_1st_session *
           coeff_thru_2nd_session *
           coeff_thru_3rd_session *
           coeff_jitairitu

  puts output
end

p "output for 2"

calc_resume 1000
