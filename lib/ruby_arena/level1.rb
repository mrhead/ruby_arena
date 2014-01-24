class Level1 < Ai
  def tick(events)
    set_radar_view_angle(5)
    turn_gun(4)
    fire if events[:scanned_robots].any?
  end
end
