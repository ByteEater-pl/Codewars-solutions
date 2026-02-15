object ListParser:
  def parse(nodes: String): Node =
    nodes
    .split(" -> ")
    .init
    .map(_.toInt)
    .foldRight(null)(Node)
