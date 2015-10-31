object Hamming {
  def compute (str1 : String, str2 : String, acc : Int = 0) : Int = {
    val ind = findMismatchHelper(str1, str2)
    if ( ind == -1 ) (acc) else 
      compute(str1.substring(ind), str2.substring(ind), acc + 1)
  }

  def findMismatchHelper (str1 : String, str2 : String) : Int = 
    if( str1 == str2 ) (-1) else 
      findMismatch( str1, str2 )
    

  def findMismatch (str1 : String, str2 : String, acc : Int = 0) : Int =
    if( str1.charAt(acc) != str2.charAt(acc) ) (acc) else
      try {
        findMismatch( str1, str2, acc + 1 )
      } catch {
        case e: Exception => throw new IllegalArgumentException( "BLARG! DEZE NUTS DON'T MATCH!" )
      }
}
