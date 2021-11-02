object Bus:
  def number(busStops: List[(Int, Int)]) =
    busStops.unzip match
      case (i, o) => i.sum - o.sum
