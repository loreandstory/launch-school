family = {
  uncles: ["bob","gary"],
  siblings: ["travis","caitlin"],
  spouse: ["Nariman"],
  parents: ["chuck","karen"]
}

immediate_family = family.select {|key, value| key == :spouse || key == :siblings || key == :parents}

types = immediate_family.keys.map {|key| key.to_s}
names = immediate_family.values.flatten

p types
p names