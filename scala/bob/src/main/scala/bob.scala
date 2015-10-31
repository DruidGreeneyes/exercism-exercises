class Bob {
  def hey(str : String) =
    if (str == str.toUpperCase) ("Whoa, chill out!")
    else if (str.endsWith("?")) ("Sure.")
    else if (str.endsWith(".")) ("Whatever.")
    else                        ("Fine, be that way!")
}
