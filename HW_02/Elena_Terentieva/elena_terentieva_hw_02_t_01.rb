# Calculating the angle betwing
# the hours and the minutes hands at 3:15
# As 3/12 = 15/60, so we need to find only
# the angle that the hours hand moved by
# in 15 minutes

hours_hand_step_per_minute = 5.0 / 60
minutes_hand_angle = 15.0 / 60
angle_betwing_hands = minutes_hand_angle * hours_hand_step_per_minute

puts "The angle betwing the hours and
the minutes hands at 3:15 is
#{(angle_betwing_hands * 360).round(2)} grad or
#{(angle_betwing_hands * 2 * 3.14).round(2)} rad"
