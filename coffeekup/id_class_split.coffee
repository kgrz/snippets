string1 = ".class1.class2#id"
string2 = "#id.class1.class2"
string3 = "class1.class2"
string4 = "#id1#id2.class1.class2"
string5 = ".class1.class2#id1#id2"
string6 = ".class1.class2.#id"

splitter = (string) ->
  classes = new Array
  for i in string.split '.'
    if '#' in i
      [klass, id] = i.split '#'
      id = id.replace '#', ''
      classes.push klass unless klass is ''
    else
      classes.push i unless i is ''
  return "classes: #{classes}, id: #{id}"


console.log(splitter(string1))
  #returns classes: class1, class2, id: id
console.log(splitter(string2))
  #returns classes: class1, class2, id: id
console.log(splitter(string3))
  #returns classes: class1, class2, id: undefined
console.log(splitter(string4))
  #returns classes: class1, class2, id: id1
console.log(splitter(string5))
  #returns classes: class1, class2, id: id1
console.log(splitter(string6))
  #returns classes: class1, class2, id: id
