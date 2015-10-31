
class Anagram (str : String) {
  val lcStr = str toLowerCase
  val sortedStr  = lcStr sorted
  def matches( strs : Seq[String] ) : Seq[String] = {
    strs.filter(_.toLowerCase() != lcStr).filter(_.toLowerCase.sorted == sortedStr)
  }
}

